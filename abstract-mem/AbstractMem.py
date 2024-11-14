import pyrtl
from collections import namedtuple
from math import log2
from dataclasses import dataclass
from typing import Any
from functools import reduce

class AbstractMem:

    @dataclass
    class Mask:
        mask: pyrtl.WireVector = None
        granularity: int = 1
        offset: bool = False
        sign: Any = None

    @dataclass
    class ReadPort:
        addr: pyrtl.WireVector = None
        data: pyrtl.WireVector = None
        en: Any = None
        mask: 'Mask' = None

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
                 write_ports=[],
                 rw_fwd=False,
                 latch_last_read=False,
                 asynchronous=False,
                 ):
        self.width = width
        self.height = height
        self.name = name
        self.read_ports = read_ports
        self.write_ports = write_ports
        self.rw_fwd = rw_fwd
        self.latch_last_read = latch_last_read
        self.asynchronous=asynchronous

        if self.latch_last_read and len(self.read_ports) > 1:
            raise Exception("Error, cannot set latch_last_read with more than 1 read port")

    def to_bsg_mem(self, clock_name, reset_name):
        # TODO: This isn't right. bsg_mem has a 2rw.
        # Need to detect if it is 2rw.

        shared_rw = False
        if len(self.read_ports) == 1 and len(self.write_ports) == 1:
            if self.read_ports[0].addr.name == self.write_ports[0].addr.name:
                shared_rw = True
        elif len(self.read_ports) == 2 and len(self.write_ports) == 2:
            if (self.read_ports[0].addr.name == self.write_ports[0].addr.name) and (self.read_ports[1].addr.name == self.write_ports[1].addr.name):
                shared_rw = True

        if not shared_rw and len(self.write_ports) > 1:
            raise Exception("Error, bsg_mem does not support more than 1 write port")

        r = str(len(self.read_ports))
        w = '' if shared_rw else '1'

        mask_name = dict()
        for write_port in self.write_ports:
            if write_port.mask is not None:
                if write_port.mask.granularity == 1:
                    if '_mask_write_bit' in mask_name:
                        mask_name['_mask_write_bit'].append('b')
                    else:
                        mask_name['_mask_write_bit'] = ['a']
                elif write_port.mask.granularity == 8:
                    if '_mask_write_byte' in mask_name:
                        mask_name['_mask_write_byte'].append('b')
                    else:
                        mask_name['_mask_write_byte'] = ['a']

        if len(mask_name) > 1:
            raise Exception("Error, conflicting mask settings.")
        if len(mask_name) == 0:
            mask_name = ""
            mask_str = ""
        else:
            mask_name, mask_ids = mask_name.popitem()
            if len(mask_ids) == 1:
                mask_str = f"   ,.w_mask_i({write_port.mask.mask.name})\n"
            elif len(mask_ids) == 2:
                mask_str  = f"   ,.a_mask_i({write_port.mask.mask.name})\n"
                mask_str += f"   ,.b_mask_i({write_port.mask.mask.name})\n"
            else:
                mask_str = ""

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

        if shared_rw and len(self.write_ports) == 1:
            write_str = (f"   ,.data_i({self.write_ports[0].data.name})\n" +
                         f"   ,.addr_i({self.write_ports[0].addr.name})\n" +
                         f"   ,.v_i({self.read_ports[0].en.name})\n" +
                         f"   ,.w_i({self.write_ports[0].en.name})\n" +
                         f"   ,.data_o({self.read_ports[0].data.name})\n"
                         )
        elif shared_rw and len(self.write_ports) == 2:
            write_str = (f"   ,.a_data_i({self.write_ports[0].data.name})\n" +
                         f"   ,.a_addr_i({self.write_ports[0].addr.name})\n" +
                         f"   ,.a_v_i({self.read_ports[0].en.name})\n" +
                         f"   ,.a_w_i({self.write_ports[0].en.name})\n" +
                         f"   ,.a_data_o({self.read_ports[0].data.name})\n"
                         )
            write_str += (f"  ,.b_data_i({self.write_ports[1].data.name})\n" +
                         f"   ,.b_addr_i({self.write_ports[1].addr.name})\n" +
                         f"   ,.b_v_i({self.read_ports[1].en.name})\n" +
                         f"   ,.b_w_i({self.write_ports[1].en.name})\n" +
                         f"   ,.b_data_o({self.read_ports[1].data.name})\n"
                         )
        else:
            write_str = (f"   ,.w_v_i({self.write_ports[0].en.name})\n" +
                         f"   ,.w_addr_i({self.write_ports[0].addr.name})\n" +
                         f"   ,.w_data_i({self.write_ports[0].data.name})\n\n")


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
                             #max_read_ports=len(self.read_ports),
                             max_write_ports=len(self.write_ports),
                             asynchronous=self.asynchronous,
                             block=block,
                             )

        def clz(x):
            def f(accum, x):
                found, count = accum
                is_zero = x == 0
                to_add = ~found & is_zero
                count = count + to_add
                return (found | ~is_zero, count)
            xs = pyrtl.mux(1, x[::-1], x)
            return reduce(f, xs, (pyrtl.as_wires(False), 0))[1]

        def count_ones(w):
            return reduce(pyrtl.corecircuits._basic_add, w, pyrtl.Const(0, len(w)))

        # Write Port
        for write_port in self.write_ports:
            if not isinstance(write_port, AbstractMem.WritePort):
                raise Exception(f"Error, invalid write port: {write_port}")

            w_addr, w_data, w_en, w_mask = write_port.addr,\
                                           write_port.data,\
                                           write_port.en,\
                                           write_port.mask

            if w_mask is not None:
                og_data = mem[w_addr]

                if w_mask.offset == False:
                    mask_data = pyrtl.concat_list(
                            [pyrtl.select(w_en & w_mask.mask[i], w_data[i], og_data[i])
                             for i in range(self.width)])
                elif w_mask.offset == True:
                    num_0s = clz(w_mask.mask)
                    data_shifted = pyrtl.WireVector(self.width)
                    data_shifted <<= pyrtl.shift_left_logical(w_data, num_0s)
                    mask_data = pyrtl.concat_list(
                            [pyrtl.select(w_en & w_mask.mask[i], data_shifted[i], og_data[i])
                             for i in range(self.width)])

            final_data = w_data if w_mask is None else mask_data
            if w_en is None:
                mem[w_addr] <<= final_data
            else:
                mem[w_addr] <<= pyrtl.MemBlock.EnabledWrite(final_data, enable=w_en)

        # Read Ports
        for read_port in self.read_ports:
            if not isinstance(read_port, AbstractMem.ReadPort):
                raise Exception(f"Error, invalid read port: {read_port}")

            addr, data, en, mask = read_port.addr, read_port.data, read_port.en, read_port.mask

            if en is None:
                en = pyrtl.Const(1, bitwidth=1)

            if self.asynchronous:
                addr_r = pyrtl.WireVector(addrwidth)
            else:
                addr_r = pyrtl.Register(addrwidth)

            if self.asynchronous:
                with pyrtl.conditional_assignment:
                    with en:
                        addr_r |= addr
            else:
                with pyrtl.conditional_assignment:
                    with en:
                        addr_r.next |= addr

            if self.rw_fwd:
                rdata = pyrtl.select(addr_r == w_addr,
                                     w_data,
                                     mem[addr_r])
            else:
                rdata = mem[addr_r]

            if mask is not None:
                r_mask = mask.mask
                r_sign = mask.sign
                num_1s = count_ones(r_mask)
                num_0s = clz(r_mask)
                readdata_sext = pyrtl.WireVector(self.width)
                with pyrtl.conditional_assignment:
                    with num_1s == 8:
                        readdata_n = pyrtl.shift_right_logical(rdata, num_0s)[0:8]
                        readdata_sext |= pyrtl.select(
                            r_sign,
                            readdata_n.sign_extended(self.width),
                            readdata_n.zero_extended(self.width),
                        )
                    with num_1s == 16:
                        readdata_n = pyrtl.shift_right_logical(rdata, num_0s)[0:16]
                        readdata_sext |= pyrtl.select(
                            r_sign,
                            readdata_n.sign_extended(self.width),
                            readdata_n.zero_extended(self.width),
                        )
                    with pyrtl.otherwise:  # whole word, and sign-extending is meaningless
                        readdata_sext |= rdata

            final_rdata = rdata if mask is None else readdata_sext

            if self.latch_last_read:
                llr_en = pyrtl.Register(1)
                llr_data = pyrtl.Register(self.width)

                llr_en.next <<= en
                llr_data.next <<= pyrtl.select(llr_en, final_rdata, llr_data)

                data <<= llr_data
            else:
                data <<= final_rdata

    def to_synthesizable_bram(self):
        #modulename, type, height_define, heightlog2_define, width_define):
        modulename = self.name
        height_define = self.height
        heightlog2_define = int(log2(self.height))
        width_define = self.width

        if len(self.write_ports) > 1:
            raise Exception("Error: Synthesizable BRAM does not support more than one write port.")

        write_port = self.write_ports[0]

        shared_rw = False
        if len(self.read_ports) == 1:
            if self.read_ports[0].addr.name == write_port.addr.name:

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

    def to_openram_sram(self,
                         tech_name = "scn4m_subm",
                         supply_voltages = [5.0],
                         temperatures = [40],
                         route_supplies = "side"
                         ):
        if len(self.write_ports) == 1:
            shared_rw = len(self.read_ports) == 1 \
                        and self.read_ports[0].addr.name == self.write_ports[0].addr.name
        else:
            shared_rw = False

        # 1rw
        num_rw = 1 if shared_rw else 0
        # Nr1w
        num_read = 0 if shared_rw else len(self.read_ports)
        num_write = 0 if (shared_rw or (len(self.write_ports) == 0)) else 1

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

    def to_vivado_bram_tcl(self):
        """Generate Vivado TCL script for memory configuration based on AbstractMem properties."""
    
        # Validate ports
        has_read = self.read_ports is not None and len(self.read_ports) > 0
        has_write = self.write_ports is not None and len(self.write_ports) > 0
    
        # Determine memory type based on ports
        if not has_read and not has_write:
            raise ValueError("Memory must have at least one port")
        elif not has_write:
            mem_type = "Single_Port_ROM"
        elif not has_read:
            raise ValueError("Write-only memory not supported in Vivado BRAM")
        elif len(self.read_ports) == 1:
            if self.read_ports[0].addr.name == self.write_ports[0].addr.name:
                mem_type = "Single_Port_RAM"
            else:
                mem_type = "Simple_Dual_Port_RAM"
        elif len(self.read_ports) == 2:
            mem_type = "True_Dual_Port_RAM"
        else:
            raise ValueError(f"Unsupported port configuration: {len(self.read_ports)} read ports and {1 if has_write else 0} write ports")
    
        # Basic configuration that's always needed
        config_dict = [
            f'    CONFIG.Component_Name {{{self.name}}} \\',
            f'    CONFIG.Memory_Type {{{mem_type}}} \\',
            '    CONFIG.Enable_32bit_Address {false} \\',
            '    CONFIG.Algorithm {Minimum_Area} \\',
            '    CONFIG.Primitive {8kx2} \\',
            '    CONFIG.Assume_Synchronous_Clk {true} \\'
        ]
    
        # Port A configuration (write port for dual-port, read/write for single-port)
        if has_write:
            config_dict.extend([
                f'    CONFIG.Write_Width_A {{{self.width}}} \\',
                f'    CONFIG.Write_Depth_A {{{self.height}}} \\',
                '    CONFIG.Enable_A {Always_Enabled} \\',
                '    CONFIG.Register_PortA_Output_of_Memory_Primitives {false} \\'
            ])
    
            # Add byte write enable if width is multiple of 8
            if self.width % 8 == 0:
                config_dict.extend([
                    '    CONFIG.Use_Byte_Write_Enable {true} \\',
                    f'    CONFIG.Byte_Size {8} \\'
                ])
            else:
                config_dict.extend([
                    '    CONFIG.Use_Byte_Write_Enable {false} \\'
                ])
    
        # Port B configuration (read port for dual-port)
        if mem_type in ["Simple_Dual_Port_RAM", "True_Dual_Port_RAM"]:
            config_dict.extend([
                f'    CONFIG.Read_Width_B {{{self.width}}} \\',
                '    CONFIG.Enable_B {Always_Enabled} \\',
                '    CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \\',
                '    CONFIG.Port_B_Clock {100} \\',
                '    CONFIG.Port_B_Enable_Rate {100} \\'
            ])
            if mem_type == "True_Dual_Port_RAM":
                config_dict.extend([
                    f'    CONFIG.Write_Width_B {{{self.width}}} \\'
                ])
    
        # Start TCL script
        tcl = [
            "# Create the IP directory and set the current directory",
            "set proj_dir $::env(PWD)",
            "set ip_dir ${proj_dir}/ip",
            "file mkdir ${ip_dir}",
            "cd ${ip_dir}",
            "create_project bram_test . -part xc7a35ticsg324-1L",
            "",
            "# Create the Block Memory Generator",
            f'create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name {self.name}',
            "",
            "# Configure the core",
            f'set_property -dict [list \\',
            *config_dict,
            f'] [get_ips {self.name}]',
            "",
            "# Generate the IP",
            f'generate_target all [get_ips {self.name}]',
            "",
            "# Run synthesis",
            f'synth_design -top {self.name}'
        ]
    
        return '\n'.join(tcl)

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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr1, rdata1, pyrtl.Const(1,bitwidth=1)),
                        AbstractMem.ReadPort(raddr2, rdata2, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, sum, w_en)],
            )
    mem.to_pyrtl(pyrtl.working_block())
    
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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr1, rdata1, pyrtl.Const(1,bitwidth=1)),
                        AbstractMem.ReadPort(raddr2, rdata2, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, sum, w_en)],
            rw_fwd=True,
            )
    mem.to_pyrtl(pyrtl.working_block())

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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(addr, rdata, ~w_en)],
            write_ports=[AbstractMem.WritePort(addr, inc, w_en)],
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
            write_ports=[AbstractMem.WritePort(addr, inc, w_en,
                                             AbstractMem.Mask(mask, 1, False))],
            )
    mem.to_pyrtl(pyrtl.working_block())

    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_bsg_mem('clk_i', 'reset_i'))

def test_2rw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 2rw")

    addr_width = 2
    val_width = 2
    
    a_addr = pyrtl.Input(addr_width, 'a_addr')
    b_addr = pyrtl.Input(addr_width, 'b_addr')
    a_en = pyrtl.Input(1, 'a_en')
    b_en = pyrtl.Input(1, 'b_en')

    a_data_i = pyrtl.Input(val_width, 'a_data_i')
    b_data_i = pyrtl.Input(val_width, 'b_data_i')

    a_data = pyrtl.WireVector(val_width, 'a_data')
    b_data = pyrtl.WireVector(val_width, 'b_data')

    mem = AbstractMem(
            width=val_width,
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(a_addr, a_data, ~a_en),
                        AbstractMem.ReadPort(b_addr, b_data, ~b_en)],
            write_ports=[AbstractMem.WritePort(a_addr, a_data_i, a_en),
                         AbstractMem.WritePort(b_addr, b_data_i, b_en)],
            )
    mem.to_pyrtl(pyrtl.working_block())

    a_data_o = pyrtl.Output(val_width, 'a_data_o')
    b_data_o = pyrtl.Output(val_width, 'b_data_o')
    a_data_o <<= a_data
    b_data_o <<= b_data

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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
            )
    mem.to_pyrtl(pyrtl.working_block())
    
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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
            )
    mem.to_pyrtl(pyrtl.working_block())

    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_openram_sram())

def test_1r1w_vivado_bram():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w Vivado BRAM")

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
            height=(2 ** addr_width),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddr, rdata, pyrtl.Const(1,bitwidth=1))],
            write_ports=[AbstractMem.WritePort(waddr, inc, w_en)],
            )
    mem.to_pyrtl(pyrtl.working_block())
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_vivado_bram_tcl())

if __name__ == '__main__':

    test_1r1w()

    test_1r1w_llr()

    test_1r1w_rw()

    test_2r1w()

    test_2r1w_rw()

    test_1rw()

    test_1rw_bit_mask()

    test_2rw()

    test_1r1w_bram()

    test_1r1w_openram_sram()

    test_1r1w_vivado_bram()
