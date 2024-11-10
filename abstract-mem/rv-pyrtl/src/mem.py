import pyrtl

from .control import MaskMode
from .util import add_wire

import sys
sys.path.append('..')
from AbstractMem import AbstractMem

def inst_memory(pc):
    """Instruction memory IOs:

    :param pc: the program counter
    :return inst_mem: a reference to the memory block
    :return inst: the fetched instruction (inst_mem[pc])
    """
    # The addresses in instruction memory are word-addressable, while the addresses produced by
    # alu operations with the immediates, pcs, etc. are byte-addressable, so we need to shift
    # the address given by two to the right to get the word address
    inst = pyrtl.WireVector(bitwidth=32, name="inst")
    inst_mem = AbstractMem(
            width=32,
            height=(2 ** 32),
            name="inst_mem",
            read_ports=[AbstractMem.ReadPort(pyrtl.shift_right_logical(pc, 2),
                                             inst,
                                             pyrtl.Const(1,bitwidth=1))],
            asynchronous=True,
            )
    inst_mem.to_pyrtl(pyrtl.working_block())
    return inst_mem, inst


def data_memory(addr, write_data, read, write, mask_mode, sign_ext):
    """The data memory

    :param addr: memory address to access
    :param write_data: data to write to addr
    :param mem_read: control signal for reading
    :param mem_write: control signal for writing
    :param mask_mode: inst[12:14] (i.e. lower two bits of fn3)
        0x10 means word (see lw/sw), 0x00 and 0x01 are byte, halfword respectively
    :param sign_ext: inst[14] (i.e. upper bit of funct3)
        1 means its lb/lh, 0 means its lbu/lhu

    :return: data read from addr
    """

    real_addr = pyrtl.shift_right_arithmetic(addr, 2)
    offset = addr[0:2]  # lower 2 bits determine if its byte 0, 1, 2, or 3 of word
    read_data = pyrtl.WireVector(32)
    mask_val = pyrtl.WireVector(32)

    # TODO: Move this into control logic
    with pyrtl.conditional_assignment:
        with mask_mode == MaskMode.BYTE:
            with offset == 0:
                mask_val |= pyrtl.Const("32'hff")
            with offset == 1:
                mask_val |= pyrtl.Const("32'hff00")
            with offset == 2:
                mask_val |= pyrtl.Const("32'hff0000")
            with pyrtl.otherwise:
                mask_val |= pyrtl.Const("32'hff000000")
        with mask_mode == MaskMode.SHORT:
            with offset == 0:
                mask_val |= pyrtl.Const("32'hffff")
            with pyrtl.otherwise:
                mask_val |= pyrtl.Const("32'hffff0000")
        with pyrtl.otherwise:
            mask_val |= pyrtl.Const("32'hffffffff")
    
    r_mask = AbstractMem.Mask(mask_val, 8, True, sign_ext)
    w_mask = AbstractMem.Mask(mask_val, 8, True)
    data_mem = AbstractMem(
            width=32,
            height=(2 ** 32),
            name="data_mem",
            read_ports=[AbstractMem.ReadPort(real_addr, read_data, read, r_mask)],
            write_port=AbstractMem.WritePort(real_addr, write_data, write, w_mask),
            asynchronous=True,
            )
    data_mem.to_pyrtl(pyrtl.working_block())

    return read_data

