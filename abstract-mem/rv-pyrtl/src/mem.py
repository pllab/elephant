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
    # inst_mem = pyrtl.MemBlock(
    #     bitwidth=32, addrwidth=32, name="inst_mem", asynchronous=True
    # )

    # The addresses in instruction memory are word-addressable, while the addresses produced by
    # alu operations with the immediates, pcs, etc. are byte-addressable, so we need to shift
    # the address given by two to the right to get the word address
    inst = pyrtl.WireVector(bitwidth=32, name="inst")
    # inst <<= inst_mem[pyrtl.shift_right_logical(pc, 2)]

    inst_mem = AbstractMem(
            width=32,
            height=(2 ** 32),
            name="inst_mem",
            read_ports=[AbstractMem.ReadPort(pyrtl.shift_right_logical(pc, 2),
                                             inst,
                                             pyrtl.Const(1,bitwidth=1))],
            write_port=None,
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
    addr = add_wire(addr, bitwidth=32, name="mem_addr")
    write_data = add_wire(write_data, bitwidth=32, name="mem_write_data")
    read = add_wire(read, bitwidth=1, name="mem_read")
    write = add_wire(write, bitwidth=1, name="mem_write")
    mask_mode = add_wire(mask_mode, bitwidth=2, name="mem_mask_mode")
    sign_ext = add_wire(sign_ext, bitwidth=1, name="mem_sign_ext")

    data_mem = pyrtl.MemBlock(
        bitwidth=32, addrwidth=32, name="data_mem", asynchronous=True
    )

    real_addr = pyrtl.shift_right_arithmetic(addr, 2)
    offset = addr[0:2]  # lower 2 bits determine if its byte 0, 1, 2, or 3 of word
    read_data = data_mem[real_addr]

    # Store: write the particular byte/halfword/word to memory and maintain
    # the other bytes (in the class of byte/halfword) already present
    to_write = pyrtl.WireVector(len(write_data))
    with pyrtl.conditional_assignment:
        with mask_mode == MaskMode.BYTE:
            with offset == 0:
                to_write |= pyrtl.concat(read_data[8:32], write_data[0:8])
            with offset == 1:
                to_write |= pyrtl.concat(
                    read_data[16:32], write_data[0:8], read_data[0:8]
                )
            with offset == 2:
                to_write |= pyrtl.concat(
                    read_data[24:32], write_data[0:8], read_data[0:16]
                )
            with pyrtl.otherwise:
                to_write |= pyrtl.concat(write_data[0:8], read_data[0:24])
        with mask_mode == MaskMode.SHORT:
            with offset == 0:
                to_write |= pyrtl.concat(read_data[16:32], write_data[0:16])
            with offset == 1:  # illegal non-aligned write
                to_write |= pyrtl.concat(
                    read_data[24:32], write_data[0:16], read_data[0:8]
                )
            with pyrtl.otherwise:
                to_write |= pyrtl.concat(write_data[0:16], read_data[0:16])
        with pyrtl.otherwise:
            to_write |= write_data

    data_mem[real_addr] <<= pyrtl.MemBlock.EnabledWrite(to_write, write)

    # Load
    read_data_ext = pyrtl.WireVector(len(read_data), name="mem_read_data")
    with pyrtl.conditional_assignment:
        with mask_mode == MaskMode.BYTE:
            read_data_shift = pyrtl.shift_right_logical(
                read_data, pyrtl.concat(offset, pyrtl.Const(0, bitwidth=3))
            )[0:8]
            read_data_ext |= pyrtl.select(
                sign_ext,
                read_data_shift.sign_extended(len(read_data)),
                read_data_shift.zero_extended(len(read_data)),
            )
        with mask_mode == MaskMode.SHORT:
            read_data_shift = pyrtl.shift_right_logical(
                read_data, pyrtl.concat(offset, pyrtl.Const(0, bitwidth=3))
            )[0:16]
            read_data_ext |= pyrtl.select(
                sign_ext,
                read_data_shift.sign_extended(len(read_data)),
                read_data_shift.zero_extended(len(read_data)),
            )
        with pyrtl.otherwise:  # whole word, and sign-extending is meaningless
            read_data_ext |= read_data

    return add_wire(read_data_ext, name="READ_DATA_EXT")
