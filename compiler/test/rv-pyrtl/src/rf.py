import pyrtl

from .util import add_wire
import sys
sys.path.append('...')
from AbstractMem import AbstractMem


def reg_file(rs1, rs2, rd, write_data, write):
    """Register file IOs:

    :param rs1: the number of the register to read
    :param rs2: the number of the register to read
    :param rd: the number of the register to write
    :param write_data: the data to write into R[rd]
    :param reg_write: write enable; if true, write the rd register
    :return rs1_val: the data in register number rs1 (R[rs1])
    :return rs2_val: the data in register number rs2 (R[rs2])

    Basic operation:
    - rs1_val = R[rs1]
    - rs2_val = R[rs2]
    - if (reg_write) R[rd] = write_data
    """

    # PyRTL defaults to all memories having value 0. By disallowing
    # writing to the zero register with the condition in the EnabledWrite below,
    # the zero register is essentially hardwired to zero.

    # Read async, write sync
    # NOTE: When async=False, PyRTL complains about the read-addresses not being ready,
    # since it doesn't know at this point that they're Inputs or Registers

    rs1_val = pyrtl.WireVector(bitwidth=32, name="rf_rs1_val")
    rs2_val = pyrtl.WireVector(bitwidth=32, name="rf_rs2_val")

    rf = AbstractMem(
            width=32,
            height=32,
            name="rf",
            read_ports=[AbstractMem.ReadPort(rs1, rs1_val, pyrtl.Const(1, bitwidth=1)),
                        AbstractMem.ReadPort(rs2, rs2_val, pyrtl.Const(1, bitwidth=1))],
            write_port=AbstractMem.WritePort(rd, write_data, (write & (rd != 0))),
            asynchronous=True,
            )
    rf.to_pyrtl(pyrtl.working_block())

    return rs1_val, rs2_val
