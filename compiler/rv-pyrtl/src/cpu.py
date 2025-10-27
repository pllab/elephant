import pyrtl
from enum import IntEnum

from .alu import alu
from .control import control, Opcode, RegWriteSrc, JumpTarget
from .decode import insert_nop, decode_inst, get_immediate
from .mem import inst_memory, data_memory
from .rf import reg_file
from .util import add_register, add_wire


def cpu(control=control):
    pc = pyrtl.wire.Register(bitwidth=32, name="pc")  # program counter
    pc_plus_4 = add_wire(pc + 4, len(pc))  # program counter plus four

    # fetch inst and decode
    inst_mem, inst = inst_memory(pc=pc)
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = decode_inst(
        inst, nop=None
    )

    # define control block
    (
        cont_exception,  # (1) thrown during syscall (stop updating pc)
        cont_imm_type,  # (3) type of instruction (R, I, S, etc.)
        cont_jump,  # (1) unconditional jump is taken
        cont_target,  # (1) jump to immediate or alu_out
        cont_branch,  # (1) conditional branch is taken
        cont_branch_inv,  # (1) branch is taken if alu_out != 0
        cont_reg_write,  # (1) register rd is updated
        cont_reg_write_src,  # (1) write alu_out or pc+4 to rd
        cont_mem_write,  # (1) write to memory
        cont_mem_read,  # (1) read from memory
        cont_alu_imm,  # (1) alu_in2 from register or immediate
        cont_alu_pc,  # (1) alu_in1 from register or pc
        cont_alu_op,  # (4) alu operation to use
        cont_mask_mode,  # (2) whether to r/w byte, short, or word
        cont_mem_sign_ext,  # (1) zero extend read_data
    ) = control(op=inst_op, fn3=inst_fn3, fn7=inst_fn7)

    # parse immediate
    inst_imm = get_immediate(inst, cont_imm_type)

    # register file
    reg_write_data = pyrtl.WireVector(bitwidth=32)
    rs1_val, rs2_val = reg_file(
        rs1=inst_rs1,
        rs2=inst_rs2,
        rd=inst_rd,
        write_data=reg_write_data,
        write=cont_reg_write | cont_mem_read,  # if read memory, always write
    )

    # alu block
    alu_out = alu(
        op=cont_alu_op,
        in1=pyrtl.mux(cont_alu_pc, rs1_val, pc),
        in2=pyrtl.mux(cont_alu_imm, rs2_val, inst_imm),
    )

    # data memory
    read_data = data_memory(
        addr=alu_out,
        write_data=rs2_val,
        read=cont_mem_read,
        write=cont_mem_write,
        mask_mode=cont_mask_mode,
        sign_ext=cont_mem_sign_ext,
    )

    # write to register file
    reg_write_data <<= pyrtl.mux(
        cont_mem_read,
        pyrtl.enum_mux(
            cont_reg_write_src, {RegWriteSrc.ALU: alu_out, RegWriteSrc.PC: pc_plus_4}
        ),
        read_data,
    )

    # update pc
    trap = add_wire(cont_exception, bitwidth=1, name="trap")
    taken = add_wire(
        cont_jump | (cont_branch & ((alu_out == 0) ^ cont_branch_inv)), name="taken"
    )
    target = pyrtl.enum_mux(
        cont_target, {JumpTarget.IMM: pc + inst_imm, JumpTarget.ALU: alu_out}
    )
    pc.next <<= pyrtl.mux(trap, pyrtl.mux(taken, pc_plus_4, target), pc)

    return inst_mem  # return ref to instruction memory unit


def cpu_two_stage(control=control):
    ########################################################################
    ##  FETCH (IF)                                                        ##
    ########################################################################

    pc = pyrtl.wire.Register(bitwidth=32, name="pc")  # program counter
    pc_plus_4 = add_wire(pc + 4, len(pc))  # program counter plus four

    # fetch inst and decode
    inst_mem, inst = inst_memory(pc=pc)
    hazard = pyrtl.WireVector(bitwidth=1, name="hazard")
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = decode_inst(inst, hazard)

    # define control block
    (
        cont_exception,  # (1) thrown during syscall (stop updating pc)
        cont_imm_type,  # (3) type of instruction (R, I, S, etc.)
        cont_jump,  # (1) unconditional jump is taken
        cont_target,  # (1) jump to immediate or alu_out
        cont_branch,  # (1) conditional branch is taken
        cont_branch_inv,  # (1) branch is taken if alu_out != 0
        cont_reg_write,  # (1) register rd is updated
        cont_reg_write_src,  # (1) write alu_out or pc+4 to rd
        cont_mem_write,  # (1) write to memory
        cont_mem_read,  # (1) read from memory
        cont_alu_imm,  # (1) alu_in2 from register or immediate
        cont_alu_pc,  # (1) alu_in1 from register or pc
        cont_alu_op,  # (4) alu operation to use
        cont_mask_mode,  # (2) whether to r/w byte, short, or word
        cont_mem_sign_ext,  # (1) zero extend read_data
    ) = control(op=inst_op, fn3=inst_fn3, fn7=inst_fn7)

    # parse immediate
    inst_imm = get_immediate(inst, cont_imm_type)

    # set next pc value
    trap = add_wire(cont_exception, bitwidth=1, name="trap")
    next_pc = pyrtl.WireVector(bitwidth=32, name="next_pc")
    branch_pred = cont_jump & (cont_target == JumpTarget.IMM)
    pc.next <<= pyrtl.mux(
        trap,
        pyrtl.mux(hazard, pyrtl.mux(branch_pred, pc_plus_4, pc + inst_imm), next_pc),
        pc,
    )

    # register file
    rd = pyrtl.WireVector(bitwidth=5)
    reg_write_data = pyrtl.WireVector(bitwidth=32)
    reg_write = pyrtl.WireVector(bitwidth=1)
    rs1_val, rs2_val = reg_file(
        rs1=inst_rs1,
        rs2=inst_rs2,
        rd=rd,
        write_data=reg_write_data,
        write=reg_write,  # if read memory, always write
    )

    # forwarding
    rs1_val = pyrtl.mux(
        reg_write & (inst_rs1 == rd) & (inst_rs1 != 0), rs1_val, reg_write_data
    )
    rs2_val = pyrtl.mux(
        reg_write & (inst_rs2 == rd) & (inst_rs2 != 0), rs2_val, reg_write_data
    )

    # create pipeline registers
    pc = add_register(pc, name="ex_pc")
    rs1_val = add_register(rs1_val, name="ex_rs1_val")
    rs2_val = add_register(rs2_val, name="ex_rs2_val")
    inst_imm = add_register(inst_imm, name="ex_inst_imm")
    inst_rd = add_register(inst_rd, name="ex_inst_rd")
    pc_plus_4 = add_register(pc_plus_4, name="ex_pc_plus_4")
    cont_jump = add_register(cont_jump, name="ex_cont_jump")
    cont_target = add_register(cont_target, name="ex_cont_target")
    cont_branch = add_register(cont_branch, name="ex_cont_branch")
    cont_branch_inv = add_register(cont_branch_inv, name="ex_cont_branch_inv")
    cont_reg_write = add_register(cont_reg_write, name="ex_cont_reg_write")
    cont_reg_write_src = add_register(cont_reg_write_src, name="ex_cont_reg_write_src")
    cont_mem_write = add_register(cont_mem_write, name="ex_cont_mem_write")
    cont_mem_read = add_register(cont_mem_read, name="ex_cont_mem_read")
    cont_alu_imm = add_register(cont_alu_imm, name="ex_cont_alu_imm")
    cont_alu_pc = add_register(cont_alu_pc, name="ex_cont_alu_pc")
    cont_alu_op = add_register(cont_alu_op, name="ex_cont_alu_op")
    cont_mask_mode = add_register(cont_mask_mode, name="ex_cont_mask_mode")
    cont_mem_sign_ext = add_register(cont_mem_sign_ext, name="ex_cont_mem_sign_ext")
    branch_pred = add_register(branch_pred, name="ex_branch_pred")

    ########################################################################
    ##  EXECUTE (EX)                                                      ##
    ########################################################################

    # alu block
    alu_out = alu(
        op=cont_alu_op,
        in1=pyrtl.mux(cont_alu_pc, rs1_val, pc),
        in2=pyrtl.mux(cont_alu_imm, rs2_val, inst_imm),
    )

    # calculate branch target
    branch_taken = cont_jump | (cont_branch & ((alu_out == 0) ^ cont_branch_inv))
    branch_target = pyrtl.enum_mux(
        cont_target, {JumpTarget.IMM: pc + inst_imm, JumpTarget.ALU: alu_out}
    )
    next_pc <<= pyrtl.mux(branch_taken, pc_plus_4, branch_target)
    hazard <<= branch_pred ^ branch_taken

    # data memory
    read_data = data_memory(
        addr=alu_out,
        write_data=rs2_val,
        read=cont_mem_read,
        write=cont_mem_write,
        mask_mode=cont_mask_mode,
        sign_ext=cont_mem_sign_ext,
    )

    # write to register file
    rd <<= inst_rd
    reg_write <<= cont_reg_write | cont_mem_read
    reg_write_data <<= pyrtl.mux(
        cont_mem_read,
        pyrtl.enum_mux(
            cont_reg_write_src, {RegWriteSrc.ALU: alu_out, RegWriteSrc.PC: pc_plus_4}
        ),
        read_data,
    )

    return inst_mem  # return ref to instruction memory unit


def cpu_three_stage(control=control):
    """The three-stage model is based off the ibex processor."""

    ########################################################################
    ##  FETCH (IF)                                                        ##
    ########################################################################

    # update program counter
    pc = pyrtl.Register(bitwidth=32, name="pc")  # program counter
    pc_plus_4 = add_wire(pc + 4, len(pc))  # program counter plus four

    trap = pyrtl.Register(bitwidth=1, name="trap")  # trap register
    trap_pc = pyrtl.Register(bitwidth=32, name="trap_pc")  # trap pc
    branch_taken = pyrtl.WireVector(bitwidth=1)
    branch_target = pyrtl.WireVector(bitwidth=32)

    with pyrtl.conditional_assignment:
        with trap:
            pc.next |= trap_pc
        with branch_taken:
            pc.next |= branch_target
        with pyrtl.otherwise:
            pc.next |= pc_plus_4

    # fetch instruction
    inst_mem, inst = inst_memory(pc=pc)

    # create pipeline registers
    pc = add_register(pc, name="id_pc")
    pc_plus_4 = add_register(pc_plus_4, name="id_pc_plus_4")
    inst = add_register(inst, name="id_inst")
    cont_hazard = add_register(branch_taken, name="id_cont_hazard")

    ########################################################################
    ##  DECODE (ID)                                                       ##
    ########################################################################

    # decode instruction
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = decode_inst(inst)

    # if stalling insert nop
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = insert_nop(
        inst_fn7,
        inst_rs2,
        inst_rs1,
        inst_fn3,
        inst_rd,
        inst_op,
        cont_hazard | trap,
    )

    # define control block
    (
        cont_exception,  # (1) thrown during syscall (stop updating pc)
        cont_imm_type,  # (3) type of instruction (R, I, S, etc.)
        cont_jump,  # (1) unconditional jump is taken
        cont_target,  # (1) jump to immediate or alu_out
        cont_branch,  # (1) conditional branch is taken
        cont_branch_inv,  # (1) branch is taken if alu_out != 0
        cont_reg_write,  # (1) register rd is updated
        cont_reg_write_src,  # (1) write alu_out or pc+4 to rd
        cont_mem_write,  # (1) write to memory
        cont_mem_read,  # (1) read from memory
        cont_alu_imm,  # (1) alu_in2 from register or immediate
        cont_alu_pc,  # (1) alu_in1 from register or pc
        cont_alu_op,  # (4) alu operation to use
        cont_mask_mode,  # (2) whether to r/w byte, short, or word
        cont_mem_sign_ext,  # (1) zero extend read_data
    ) = control(op=inst_op, fn3=inst_fn3, fn7=inst_fn7)

    # handle system call
    trap.next <<= trap | cont_exception
    trap_pc.next <<= pyrtl.mux(trap, pc, trap_pc)

    # parse immediate
    inst_imm = get_immediate(inst, cont_imm_type)

    # register file
    wb_rd = pyrtl.WireVector(bitwidth=5)
    reg_write_data = pyrtl.WireVector(bitwidth=32)
    reg_write = pyrtl.WireVector(bitwidth=1)
    rs1_val, rs2_val = reg_file(
        rs1=inst_rs1,
        rs2=inst_rs2,
        rd=wb_rd,
        write_data=reg_write_data,
        write=reg_write,  # if read memory, always write
    )

    # forward in case of data hazard
    rs1_val = pyrtl.mux((wb_rd != 0) & (wb_rd == inst_rs1), rs1_val, reg_write_data)
    rs2_val = pyrtl.mux((wb_rd != 0) & (wb_rd == inst_rs2), rs2_val, reg_write_data)

    # alu block
    alu_out = alu(
        op=cont_alu_op,
        in1=pyrtl.mux(cont_alu_pc, rs1_val, pc),
        in2=pyrtl.mux(cont_alu_imm, rs2_val, inst_imm),
    )

    # calculate branch target
    branch_taken <<= cont_jump | (cont_branch & ((alu_out == 0) ^ cont_branch_inv))
    branch_target <<= pyrtl.enum_mux(
        cont_target, {JumpTarget.IMM: pc + inst_imm, JumpTarget.ALU: alu_out}
    )

    # data memory
    read_data = data_memory(
        addr=alu_out,
        write_data=rs2_val,
        read=cont_mem_read,
        write=cont_mem_write,
        mask_mode=cont_mask_mode,
        sign_ext=cont_mem_sign_ext,
    )

    # create pipeline registers
    pc = add_register(pc, name="wb_pc")
    alu_out = add_register(alu_out, name="wb_alu_out")
    cont_reg_write = add_register(cont_reg_write, name="wb_cont_reg_write")
    cont_reg_write_src = add_register(cont_reg_write_src, name="wb_cont_reg_write_src")
    cont_mem_read = add_register(cont_mem_read, name="wb_cont_mem_read")
    inst_rd = add_register(inst_rd, name="wb_inst_rd")
    pc_plus_4 = add_register(pc_plus_4, name="wb_pc_plus_4")
    read_data = add_register(read_data, name="wb_read_data")

    ########################################################################
    ##  WRITE BACK (WB)                                                   ##
    ########################################################################

    # write to register file
    wb_rd <<= pyrtl.mux(cont_reg_write, pyrtl.Const(0, bitwidth=5), inst_rd)
    reg_write <<= cont_reg_write | cont_mem_read
    reg_write_data <<= pyrtl.mux(
        cont_mem_read,
        pyrtl.enum_mux(
            cont_reg_write_src, {RegWriteSrc.ALU: alu_out, RegWriteSrc.PC: pc_plus_4}
        ),
        read_data,
    )

    return inst_mem  # return ref to instruction memory unit


def cpu_five_stage(control=control):
    ########################################################################
    ##  FETCH (IF)                                                        ##
    ########################################################################

    pc = pyrtl.wire.Register(bitwidth=32, name="pc")  # program counter
    pc_plus_4 = add_wire(pc + 4, len(pc))  # program counter plus four

    # set next pc value
    trap = pyrtl.WireVector(bitwidth=1, name="trap")
    last_pc = pyrtl.WireVector(bitwidth=32, name="last_pc")
    branch_taken = pyrtl.WireVector(bitwidth=1, name="branch_taken")
    branch_target = pyrtl.WireVector(bitwidth=32, name="branch_target")
    jump_taken = pyrtl.WireVector(bitwidth=1, name="jump_taken")
    jump_target = pyrtl.WireVector(bitwidth=32, name="jump_target")
    data_hazard = pyrtl.WireVector(bitwidth=1, name="data_hazard")
    with pyrtl.conditional_assignment:
        with trap:
            pc.next |= last_pc
        with branch_taken:
            pc.next |= branch_target
        with data_hazard:
            pc.next |= pc
        with jump_taken:
            pc.next |= jump_target
        with pyrtl.otherwise:
            pc.next |= pc_plus_4

    # fetch instruction
    inst_mem, inst = inst_memory(pc=pc)
    last_inst = pyrtl.WireVector(bitwidth=32)
    real_inst = pyrtl.WireVector(bitwidth=32)
    with pyrtl.conditional_assignment:
        with data_hazard | trap:
            real_inst |= last_inst
        with jump_taken | branch_taken:
            real_inst |= Opcode.REG  # nop
        with pyrtl.otherwise:
            real_inst |= inst

    # create pipeline registers
    inst = add_register(real_inst, name="id_inst")
    pc = add_register(pc, name="id_pc")
    pc_plus_4 = add_register(pc_plus_4, name="id_pc_plus_4")

    ########################################################################
    ##  DECODE (ID)                                                       ##
    ########################################################################

    # for handling data hazards
    last_inst <<= inst

    # decode instruction
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = decode_inst(inst)

    # detect data hazards
    ex_rd = pyrtl.WireVector(bitwidth=5, name="ex_rd")
    ex_mem_read = pyrtl.WireVector(bitwidth=1)
    data_hazard <<= ex_mem_read & ((inst_rs1 == ex_rd) | (inst_rs2 == ex_rd))
    inst_fn7, inst_rs2, inst_rs1, inst_fn3, inst_rd, inst_op = insert_nop(
        fn7=inst_fn7,
        rs2=inst_rs2,
        rs1=inst_rs1,
        fn3=inst_fn3,
        rd=inst_rd,
        op=inst_op,
        nop=data_hazard
        | branch_taken,  # not sure if this is allowed but it seems to work
    )

    # define control block
    (
        cont_exception,  # (1) thrown during syscall (stop updating pc)
        cont_imm_type,  # (3) type of instruction (R, I, S, etc.)
        cont_jump,  # (1) unconditional jump is taken
        cont_target,  # (1) jump to immediate or alu_out
        cont_branch,  # (1) conditional branch is taken
        cont_branch_inv,  # (1) branch is taken if alu_out != 0
        cont_reg_write,  # (1) register rd is updated
        cont_reg_write_src,  # (1) write alu_out or pc+4 to rd
        cont_mem_write,  # (1) write to memory
        cont_mem_read,  # (1) read from memory
        cont_alu_imm,  # (1) alu_in2 from register or immediate
        cont_alu_pc,  # (1) alu_in1 from register or pc
        cont_alu_op,  # (4) alu operation to use
        cont_mask_mode,  # (2) whether to r/w byte, short, or word
        cont_mem_sign_ext,  # (1) zero extend read_data
    ) = control(op=inst_op, fn3=inst_fn3, fn7=inst_fn7)

    # parse immediate
    inst_imm = get_immediate(inst, cont_imm_type)

    # execute immediate jumps
    jump_taken <<= cont_jump & (cont_target == JumpTarget.IMM)
    jump_target <<= pc + inst_imm

    # handle exception instruction
    last_pc <<= pc
    trap <<= cont_exception

    # register file
    dm_rd = pyrtl.WireVector(bitwidth=5, name="dm_rd")
    wb_rd = pyrtl.WireVector(bitwidth=5, name="wb_rd")
    dm_reg_write_data = pyrtl.WireVector(bitwidth=32)
    wb_reg_write_data = pyrtl.WireVector(bitwidth=32)
    dm_reg_write = pyrtl.WireVector(bitwidth=1)
    wb_reg_write = pyrtl.WireVector(bitwidth=1)
    rs1_val, rs2_val = reg_file(
        rs1=inst_rs1,
        rs2=inst_rs2,
        rd=wb_rd,
        write_data=wb_reg_write_data,
        write=wb_reg_write,
    )

    # forward wb to rs1
    rs1_val = pyrtl.mux(
        wb_reg_write & (inst_rs1 == wb_rd) & (inst_rs1 != 0),
        rs1_val,
        wb_reg_write_data,
    )

    # forward wb to rs2
    rs2_val = pyrtl.mux(
        wb_reg_write & (inst_rs2 == wb_rd) & (inst_rs2 != 0),
        rs2_val,
        wb_reg_write_data,
    )

    # create pipeline registers
    cont_jump = add_register(cont_jump, name="ex_cont_jump")
    cont_target = add_register(cont_target, name="ex_cont_target")
    cont_branch = add_register(cont_branch, name="ex_cont_branch")
    cont_branch_inv = add_register(cont_branch_inv, name="ex_cont_branch_inv")
    cont_reg_write = add_register(cont_reg_write, name="ex_cont_reg_write")
    cont_reg_write_src = add_register(cont_reg_write_src, name="ex_cont_reg_write_src")
    cont_mem_write = add_register(cont_mem_write, name="ex_cont_mem_write")
    cont_mem_read = add_register(cont_mem_read, name="ex_cont_mem_read")
    cont_alu_imm = add_register(cont_alu_imm, name="ex_cont_alu_imm")
    cont_alu_pc = add_register(cont_alu_pc, name="ex_cont_alu_pc")
    cont_alu_op = add_register(cont_alu_op, name="ex_cont_alu_op")
    cont_mask_mode = add_register(cont_mask_mode, name="ex_cont_mask_mode")
    cont_mem_sign_ext = add_register(cont_mem_sign_ext, name="ex_cont_mem_sign_ext")
    inst_imm = add_register(inst_imm, name="ex_inst_imm")
    inst_rd = add_register(inst_rd, name="ex_inst_rd")
    inst_rs1 = add_register(inst_rs1, name="ex_inst_rs1")
    inst_rs2 = add_register(inst_rs2, name="ex_inst_rs2")
    jump_taken = add_register(jump_taken)
    jump_target = add_register(jump_target)
    pc = add_register(pc, name="ex_pc")
    pc_plus_4 = add_register(pc_plus_4, name="ex_pc_plus_4")
    rs1_val = add_register(rs1_val, name="ex_rs1_val")
    rs2_val = add_register(rs2_val, name="ex_rs2_val")

    ########################################################################
    ##  EXECUTE (EX)                                                      ##
    ########################################################################

    # for detecting data hazards
    ex_rd <<= inst_rd
    ex_mem_read <<= cont_mem_read

    # forward wb to rs1
    rs1_val = pyrtl.mux(
        wb_reg_write & (inst_rs1 == wb_rd) & (inst_rs1 != 0),
        rs1_val,
        wb_reg_write_data,
    )

    # forward wb to rs2
    rs2_val = pyrtl.mux(
        wb_reg_write & (inst_rs2 == wb_rd) & (inst_rs2 != 0),
        rs2_val,
        wb_reg_write_data,
    )

    # forward dm to rs1
    rs1_val = pyrtl.mux(
        dm_reg_write & (inst_rs1 == dm_rd) & (inst_rs1 != 0),
        rs1_val,
        dm_reg_write_data,
    )

    # forward dm to rs2
    rs2_val = pyrtl.mux(
        dm_reg_write & (inst_rs2 == dm_rd) & (inst_rs2 != 0),
        rs2_val,
        dm_reg_write_data,
    )

    # alu block
    alu_out = alu(
        op=cont_alu_op,
        in1=pyrtl.mux(cont_alu_pc, rs1_val, pc),
        in2=pyrtl.mux(cont_alu_imm, rs2_val, inst_imm),
    )

    # calculate branch target
    branch_taken <<= (cont_jump & ~jump_taken) | (
        cont_branch & ((alu_out == 0) ^ cont_branch_inv)
    )
    branch_target <<= pyrtl.enum_mux(
        cont_target, {JumpTarget.IMM: jump_target, JumpTarget.ALU: alu_out}
    )

    # create pipeline registers
    alu_out = add_register(alu_out, name="dm_alu_out")
    cont_reg_write = add_register(cont_reg_write, name="dm_cont_reg_write")
    cont_reg_write_src = add_register(cont_reg_write_src, name="dm_cont_reg_write_src")
    cont_mem_write = add_register(cont_mem_write, name="dm_cont_mem_write")
    cont_mem_read = add_register(cont_mem_read, name="dm_cont_mem_read")
    cont_mask_mode = add_register(cont_mask_mode, name="dm_cont_mask_mode")
    cont_mem_sign_ext = add_register(cont_mem_sign_ext, name="dm_cont_mem_sign_ext")
    inst_rd = add_register(inst_rd, name="dm_inst_rd")
    pc_plus_4 = add_register(pc_plus_4, name="dm_pc_plus_4")
    rs2_val = add_register(rs2_val, name="dm_rs2_val")

    ########################################################################
    ##  DATA (DM)                                                         ##
    ########################################################################

    # write to register file (for forwarding)
    dm_rd <<= inst_rd
    dm_reg_write_data <<= pyrtl.enum_mux(
        cont_reg_write_src, {RegWriteSrc.ALU: alu_out, RegWriteSrc.PC: pc_plus_4}
    )
    dm_reg_write <<= cont_reg_write | cont_mem_read

    # data memory
    read_data = data_memory(
        addr=alu_out,
        write_data=rs2_val,
        read=cont_mem_read,
        write=cont_mem_write,
        mask_mode=cont_mask_mode,
        sign_ext=cont_mem_sign_ext,
    )

    # create pipeline registers
    alu_out = add_register(alu_out, name="wb_alu_out")
    cont_reg_write = add_register(cont_reg_write, name="wb_cont_reg_write")
    cont_reg_write_src = add_register(cont_reg_write_src, name="wb_cont_reg_write_src")
    cont_mem_read = add_register(cont_mem_read, name="wb_cont_mem_read")
    dm_reg_write = add_register(dm_reg_write)
    dm_reg_write_data = add_register(dm_reg_write_data)
    inst_rd = add_register(inst_rd, name="wb_inst_rd")
    pc_plus_4 = add_register(pc_plus_4, name="wb_pc_plus_4")
    read_data = add_register(read_data, name="wb_read_data")

    ########################################################################
    ##  WRITEBACK (WB)                                                    ##
    ########################################################################

    # write to register file
    wb_rd <<= inst_rd
    wb_reg_write_data <<= pyrtl.mux(cont_mem_read, dm_reg_write_data, read_data)
    wb_reg_write <<= dm_reg_write


def pipelined_cpu(num_stages=1, control=control):
    if num_stages == 1:
        return cpu(control)
    elif num_stages == 2:
        return cpu_two_stage(control)
    elif num_stages == 3:
        return cpu_three_stage(control)
    elif num_stages == 5:
        return cpu_five_stage(control)
    else:
        raise ValueError("invalid number of pipeline stages")
