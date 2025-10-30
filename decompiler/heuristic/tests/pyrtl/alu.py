import pyrtl

"""
ALU:
====

rs1: source register 1
rs2: source register 2
 rd: destination register
 op: opcode

ADD: (op == 1)
rs1 + rs2 --> rd

SUBTRACT: (op == 2)
rs1 - rs2 --> rd

BITWISE AND: (op == 3)
rs1 & rs2 --> rd

NOP: (op == 0)
no operation

"""


def alu(val_width, addr_width):
    # instruction input
    # format: [ rs1, rs2, rd, op ]
    instruction = pyrtl.Input((3 * addr_width) + 2, 'instruction')

    # register file
    rf = pyrtl.MemBlock(
        bitwidth=val_width,
        addrwidth=addr_width,
        name='reg_file',
        max_read_ports=2,
        max_write_ports=1)
    
    # decode the instruction
    rs1, rs2, rd, op = pyrtl.helperfuncs.chop(instruction,
                                              addr_width,  # rs1
                                              addr_width,  # rs2
                                              addr_width,  # rd
                                              2)           # op
    # for debug
    pyrtl.probe(rs1, 'rs1')
    pyrtl.probe(rs2, 'rs2')
    pyrtl.probe(rd, 'rd')
    pyrtl.probe(op, 'op')
    
    # read from reg file
    rs1val = pyrtl.WireVector(val_width, 'rs1val')
    rs2val = pyrtl.WireVector(val_width, 'rs2val')
    rs1val <<= rf[rs1]
    rs2val <<= rf[rs2]
    
    # do the operation
    alu_result = pyrtl.WireVector(val_width, 'alu_result')

    with pyrtl.conditional_assignment:
        with op == 1:  # ADD
            alu_result |= rs1val + rs2val
        with op == 2:  # SUBTRACT
            alu_result |= rs1val - rs2val
        with op == 3:  # BITWISE AND
            alu_result |= rs1val & rs2val

    # write back to reg file
    write_enable = pyrtl.WireVector(1, 'write_enable')
    write_enable <<= (op != 0)
    
    rf[rd] <<= pyrtl.MemBlock.EnabledWrite(alu_result, enable=write_enable)

    pyrtl.probe(alu_result, 'alu_result_o')
    pyrtl.probe(write_enable, 'write_enable_o')

    return rf


# ---------------------

if __name__=="__main__":

    rf = alu(4, 2)
    pyrtl.synthesize()

    with open('alu.v', 'w') as f:
        pyrtl.output_to_verilog(f, add_reset=False)
