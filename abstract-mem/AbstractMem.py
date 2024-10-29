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
                 raw_fwd=False,
                 latch_last_read=False,
                 ):
        self.width = width
        self.height = height
        self.name = name
        self.read_ports = read_ports
        self.write_port = write_port
        self.raw_fwd = raw_fwd
        self.latch_last_read = latch_last_read

        if self.latch_last_read and len(self.read_ports) > 1:
            raise Exception("Error, cannot set latch_last_read with more than 1 read port")

    # TODO
    def to_tcl(self):
        return ""

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
            raw_fwd_p = "1" if self.raw_fwd else "0"
            parameters_list.append(f".read_write_same_addr_p({raw_fwd_p})")

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

            if self.raw_fwd:
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

def test_1r1w_raw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w raw")
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
            raw_fwd=True,
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

def test_2r1w_raw():
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 2r1w raw")

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
            raw_fwd=True,
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


if __name__ == '__main__':

    test_1r1w()

    test_1r1w_llr()

    test_1r1w_raw()

    test_2r1w()

    test_2r1w_raw()

    test_1rw()

    test_1rw_bit_mask()

