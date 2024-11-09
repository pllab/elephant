import pyrtl
from collections import namedtuple
from math import log2
from dataclasses import dataclass
from typing import Any

class AbstractMem:

    @dataclass
    class ReadPort:
        addr: pyrtl.WireVector = None
        data: pyrtl.WireVector = None
        en: Any = None

    @dataclass
    class Mask:
        # TODO: change granularity to be a power of 2
        bit: bool = True
        mask: pyrtl.WireVector = None

    @dataclass
    class WritePort:
        addr: pyrtl.WireVector = None
        data: pyrtl.WireVector = None
        en: Any = None
        mask: 'Mask' = None

    def __init__(self, 
                 width,
                 height,
                 name='',
                 read_ports=[],
                 write_port=None,
                 rw_fwd=False,
                 latch_last_read=False,
                 ):
        self.width = width
        self.height = height
        self.name = name
        self.read_ports = read_ports
        self.write_port = write_port
        self.rw_fwd = rw_fwd
        self.latch_last_read = latch_last_read

        if self.latch_last_read and len(self.read_ports) > 1:
            raise Exception("Error, cannot set latch_last_read with more than 1 read port")

    def to_bsg_mem(self, clock_name, reset_name):
        shared_rw = False
        if len(self.read_ports) == 1:
            if self.read_ports[0].addr.name == self.write_port.addr.name:
                shared_rw = True

        r = str(len(self.read_ports))
        w = '' if shared_rw else '1'

        mask_name = ''
        if self.write_port.mask is not None:
            if self.write_port.mask.bit:
                mask_name = 'mask_write_bit'
            else:
                mask_name = 'mask_write_byte'

        parameters_list = [f".width_p({self.width})",
                           f".els_p({self.height})"]

        if len(self.read_ports) == 1:
            p = '1' if self.latch_last_read else '0'
            parameters_list.append(f".latch_last_read_p({p})")

        if not shared_rw:
            rw_fwd_p = "1" if self.rw_fwd else "0"
            parameters_list.append(f".read_write_same_addr_p({rw_fwd_p})")

        parameters = "#(" + ", ".join(parameters_list) + ")\n"

        module_name = f"bsg_msm_{r}r{w}w_sync{mask_name}\n"

        if shared_rw:
            write_str = (f"   ,.data_i({self.write_port.data.name})\n" +
                         f"   ,.addr_i({self.write_port.addr.name})\n" +
                         f"   ,.v_i({self.read_ports[0].en.name})\n" +
                         f"   ,.w_i({self.write_port.en.name})\n" +
                         f"   ,.data_o({self.read_ports[0].data.name})\n"
                         )
        else:
            write_str = (f"   ,.w_v_i({self.write_port.en.name})\n" +
                         f"   ,.w_addr_i({self.write_port.addr.name})\n" +
                         f"   ,.w_data_i({self.write_port.data.name})\n\n")

        if mask_name != '':
            mask_str = f"   ,.w_mask_i({self.write_port.mask.mask.name})\n"
        else:
            mask_str = ""

        read_str = ""
        if not shared_rw:
            for i in range(len(self.read_ports)):
                read_port = self.read_ports[i]
                i_str = "" if len(self.read_ports)==1 else str(i)
                read_str += (f"   ,.r{i_str}_v_i({read_port.en.name})\n" +
                             f"   ,.r{i_str}_addr_i({read_port.addr.name})\n" +
                             f"   ,.r{i_str}_data_o({read_port.data.name})\n\n")

        ports = (f"  (.clk_i({clock_name})\n" +
                 f"   ,.reset_i({reset_name})\n\n" +
                 write_str +
                 read_str +
                 mask_str +
                 "  );\n")

        return module_name + parameters + f" {self.name}\n" + ports
        

    def to_pyrtl(self, block):
        addrwidth = int(log2(self.height))
        mem = pyrtl.MemBlock(bitwidth=self.width,
                             addrwidth=addrwidth,
                             name=self.name,
                             # max_read_ports=len(self.read_ports),
                             max_write_ports=1,
                             asynchronous=False,
                             block=block,
                             )

        # Write Port
        if not isinstance(self.write_port, AbstractMem.WritePort):
            raise Exception(f"Error, invalid write port: {write_port}")

        w_addr, w_data, w_en, w_mask = self.write_port.addr, self.write_port.data,\
                                       self.write_port.en, self.write_port.mask

        if w_mask is not None:
            og_data = mem[w_addr]
            if w_mask.bit:
                w_data = pyrtl.concat_list(
                        [pyrtl.select(w_en & w_mask.mask[i], w_data[i], og_data[i])
                         for i in range(self.width)])
            # TODO: Finish byte mask
            # else:
            #     mask_width = self.width >> 3
            #     w_data = 

        if w_en is None:
            mem[w_addr] <<= w_data
        else:
            mem[w_addr] <<= pyrtl.MemBlock.EnabledWrite(w_data, enable=w_en)

        # Read Ports
        for read_port in self.read_ports:
            if not isinstance(read_port, AbstractMem.ReadPort):
                raise Exception(f"Error, invalid read port: {read_port}")

            addr, data, en = read_port.addr, read_port.data, read_port.en

            if en is None:
                en = pyrtl.Const(1, bitwidth=1)

            addr_r = pyrtl.Register(addrwidth)
            with pyrtl.conditional_assignment:
                with en:
                    addr_r.next |= addr

            if self.rw_fwd:
                rdata = pyrtl.select(addr_r == w_addr,
                                     w_data,
                                     mem[addr_r])
            else:
                rdata = mem[addr_r]

            if self.latch_last_read:
                llr_en = pyrtl.Register(1)
                llr_data = pyrtl.Register(self.width)

                llr_en.next <<= en
                llr_data.next <<= pyrtl.select(llr_en, rdata, llr_data)

                data <<= llr_data
            else:
                data <<= rdata

    def to_synthesizable_bram(self):
        #modulename, type, height_define, heightlog2_define, width_define):
        modulename = self.name
        height_define = self.height
        heightlog2_define = int(log2(self.height))
        width_define = self.width

        shared_rw = False
        if len(self.read_ports) == 1:
            if self.read_ports[0].addr.name == self.write_port.addr.name:
                shared_rw = True

        r = str(len(self.read_ports))
        w = '' if shared_rw else '1'
        type = f"{r}r{w}w"

        if type == "1rw":
            t = '''
    bram_1rw_wrapper #(
       .NAME          (""             ),
       .DEPTH         (%s),
       .ADDR_WIDTH    (%s),
       .BITMASK_WIDTH (%s),
       .DATA_WIDTH    (%s)
    )   %s (
       .MEMCLK        (MEMCLK     ),
       .RESET_N        (RESET_N     ),
       .CE            (CE         ),
       .A             (A          ),
       .RDWEN         (RDWEN      ),
       .BW            (BW         ),
       .DIN           (DIN        ),
       .DOUT          (DOUT_bram       )
    );
           ''' % (height_define, heightlog2_define, width_define, width_define, modulename)
    
        elif type == "1r1w":
            t = '''
    bram_1r1w_wrapper #(
       .NAME          (""             ),
       .DEPTH         (%s),
       .ADDR_WIDTH    (%s),
       .BITMASK_WIDTH (%s),
       .DATA_WIDTH    (%s)
    )   %s (
       .MEMCLK        (MEMCLK     ),
       .RESET_N        (RESET_N     ),
       .CEA        (CEA     ),
       .AA        (AA     ),
       .AB        (AB     ),
       .RDWENA        (RDWENA     ),
       .CEB        (CEB     ),
       .RDWENB        (RDWENB     ),
       .BWA        (BWA     ),
       .DINA        (DINA     ),
       .DOUTA        (DOUTA_bram     ),
       .BWB        (BWB     ),
       .DINB        (DINB     ),
       .DOUTB        (DOUTB_bram     )
    );
           ''' % (height_define, heightlog2_define, width_define, width_define, modulename)
    
        else:
            assert(0) # unimplemented
    
        return t

    def to_open_ram_sram(self,
                         tech_name = "scn4m_subm",
                         supply_voltages = [5.0],
                         temperatures = [40],
                         route_supplies = "side"
                         ):
        if (self.write_port is not None):
            shared_rw = len(self.read_ports) == 1 \
                        and self.read_ports[0].addr.name == self.write_port.addr.name
        else:
            shared_rw = False

        # 1rw
        num_rw = 1 if shared_rw else 0
        # Nr1w
        num_read = 0 if shared_rw else len(self.read_ports)
        num_write = 0 if (shared_rw or (self.write_port is None)) else 1

        s = f"""
word_size = {self.width}
num_words = {self.height}

num_rw_ports = {num_rw}
num_r_ports = {num_read}
num_w_ports = {num_write}

tech_name = "{tech_name}"
nominal_corner_only = False
process_corners = ["TT"]
supply_voltages = {supply_voltages}
temperatures = {temperatures}

route_supplies = "{route_supplies}"
check_lvsdrc = True

output_name = "sram_{{0}}rw{{1}}r{{2}}w_{{3}}_{{4}}_{{5}}".format(num_rw_ports,
                                                      num_r_ports,
                                                      num_w_ports,
                                                      word_size,
                                                      num_words,
                                                      tech_name)
output_path = "macro/{{}}".format(output_name)
"""
        return s

    def to_tcl(self):

        s = '''
# Create the IP directory and set the current directory
set proj_dir $::env(PWD)
set ip_dir ${proj_dir}/ip
file mkdir ${ip_dir}
cd ${ip_dir}
create_project bram_test . -part xc7a35ticsg324-1L

# Create the Block Memory Generator
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name bram_64x8_1rw


# Configure the core
set_property -dict [list \
    CONFIG.Component_Name {bram_64x8_1rw} \
    CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
    CONFIG.Write_Width_A {64} \
    CONFIG.Write_Depth_A {8} \
    CONFIG.Read_Width_A {64} \
    CONFIG.Write_Width_B {64} \
    CONFIG.Read_Width_B {64} \
    CONFIG.Enable_32bit_Address {false} \
    CONFIG.Use_Byte_Write_Enable {false} \
    CONFIG.Byte_Size {9} \
    CONFIG.Algorithm {Minimum_Area} \
    CONFIG.Primitive {8kx2} \
    CONFIG.Assume_Synchronous_Clk {true} \
    CONFIG.Enable_A {Always_Enabled} \
    CONFIG.Enable_B {Always_Enabled} \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \
    CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
    CONFIG.Port_B_Clock {100} \
    CONFIG.Port_B_Enable_Rate {100} \
] [get_ips bram_64x8_1rw]

# Generate the IP
generate_target all [get_ips bram_64x8_1rw]

synth_design -top bram_64x8_1rw
'''
        return s

def test_1r1w():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w")

    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr = pyrtl.Input(addr_width, 'raddr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.WireVector(val_width, 'inc')
    inc <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, inc, w_en),
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=1,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_1r1w_llr():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w llr")

    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr = pyrtl.Input(addr_width, 'raddr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.WireVector(val_width, 'inc')
    inc <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, inc, w_en),
            latch_last_read=True,
            )
    mem.to_pyrtl(pyrtl.working_block())
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_1r1w_rw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w rw")
    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr = pyrtl.Input(addr_width, 'raddr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.Register(val_width, 'inc')
    inc.next <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, inc, w_en),
            rw_fwd=True,
            )
    mem.to_pyrtl(pyrtl.working_block())
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_2r1w():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 2r1w")

    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr1 = pyrtl.Input(addr_width, 'raddr1')
    raddr2 = pyrtl.Input(addr_width, 'raddr2')
    w_en = pyrtl.Input(1, 'w_en')

    rdata1 = pyrtl.WireVector(val_width, 'rdata1')
    rdata2 = pyrtl.WireVector(val_width, 'rdata2')
    sum = pyrtl.WireVector(val_width, 'sum')
    sum <<= rdata1 + rdata2

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr1, rdata1, pyrtl.Const(1,bitwidth=1)),
                        AbstractMem.ReadPort(raddr2, rdata2, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, sum, w_en),
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=2,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= sum

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_2r1w_rw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 2r1w rw")

    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr1 = pyrtl.Input(addr_width, 'raddr1')
    raddr2 = pyrtl.Input(addr_width, 'raddr2')
    w_en = pyrtl.Input(1, 'w_en')

    rdata1 = pyrtl.WireVector(val_width, 'rdata1')
    rdata2 = pyrtl.WireVector(val_width, 'rdata2')
    sum = pyrtl.Register(val_width, 'sum')
    sum.next <<= rdata1 + rdata2

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr1, rdata1, pyrtl.Const(1,bitwidth=1)),
                        AbstractMem.ReadPort(raddr2, rdata2, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, sum, w_en),
            rw_fwd=True,
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=2,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= sum

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_1rw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1rw")

    addr_width = 2
    val_width = 2
    
    addr = pyrtl.Input(addr_width, 'addr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.Register(val_width, 'inc')
    inc.next <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(addr, rdata, ~w_en)],
            write_port=AbstractMem.WritePort(addr, inc, w_en),
            )
    mem.to_pyrtl(pyrtl.working_block())

    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_1rw_bit_mask():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1rw bit mask")

    addr_width = 2
    val_width = 2
    
    addr = pyrtl.Input(addr_width, 'addr')
    w_en = pyrtl.Input(1, 'w_en')

    mask = pyrtl.Input(val_width, 'mask')

    rdata = pyrtl.WireVector(val_width, 'rdata')

    inc = pyrtl.Register(val_width, 'inc')
    inc.next <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(addr, rdata, ~w_en)],
            write_port=AbstractMem.WritePort(addr, inc, w_en, AbstractMem.Mask(True, mask)),
            )
    mem.to_pyrtl(pyrtl.working_block())

    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_1r1w_bram():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w synthesizable bram")

    addr_width = 2
    val_width = 2
    
    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr = pyrtl.Input(addr_width, 'raddr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.WireVector(val_width, 'inc')
    inc <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, inc, w_en),
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=1,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_synthesizable_bram())

def test_1r1w_openram_sram():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w OpenRAM SRAM")

    # OpenRAM scn4m requires minimum height of 16 rows
    addr_width = 4
    val_width = 16

    waddr = pyrtl.Input(addr_width, 'waddr')
    raddr = pyrtl.Input(addr_width, 'raddr')
    w_en = pyrtl.Input(1, 'w_en')

    rdata = pyrtl.WireVector(val_width, 'rdata')
    inc = pyrtl.WireVector(val_width, 'inc')
    inc <<= rdata + 1

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_port=AbstractMem.WritePort(waddr, inc, w_en),
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=1,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)

    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_openram_sram())

if __name__ == '__main__':

    test_1r1w()

    test_1r1w_llr()

    test_1r1w_rw()

    test_2r1w()

    test_2r1w_rw()

    test_1rw()

    test_1rw_bit_mask()

    test_1r1w_bram()

    test_1r1w_openram_sram()
