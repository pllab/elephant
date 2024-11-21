// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:03 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/pico.pickle.elabed.v
// Design      : picorv32
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* BARREL_SHIFTER = "1'b0" *) (* CATCH_ILLINSN = "1'b1" *) (* CATCH_MISALIGN = "1'b1" *) 
(* COMPRESSED_ISA = "1'b0" *) (* ENABLE_COUNTERS = "1'b1" *) (* ENABLE_COUNTERS64 = "1'b1" *) 
(* ENABLE_DIV = "1'b1" *) (* ENABLE_FAST_MUL = "1'b0" *) (* ENABLE_IRQ = "1'b0" *) 
(* ENABLE_IRQ_QREGS = "1'b1" *) (* ENABLE_IRQ_TIMER = "1'b1" *) (* ENABLE_MUL = "1'b1" *) 
(* ENABLE_PCPI = "1'b0" *) (* ENABLE_REGS_16_31 = "1'b1" *) (* ENABLE_REGS_DUALPORT = "1'b1" *) 
(* ENABLE_TRACE = "1'b0" *) (* LATCHED_IRQ = "-1" *) (* LATCHED_MEM_RDATA = "1'b0" *) 
(* MASKED_IRQ = "0" *) (* PROGADDR_IRQ = "16" *) (* PROGADDR_RESET = "1073741824" *) 
(* REGS_INIT_ZERO = "1'b0" *) (* STACKADDR = "-1" *) (* TRACE_ADDR = "36'b001000000000000000000000000000000000" *) 
(* TRACE_BRANCH = "36'b000100000000000000000000000000000000" *) (* TRACE_IRQ = "36'b100000000000000000000000000000000000" *) (* TWO_CYCLE_ALU = "1'b0" *) 
(* TWO_CYCLE_COMPARE = "1'b0" *) (* TWO_STAGE_SHIFT = "1'b1" *) (* WITH_PCPI = "1'b1" *) 
(* XLNX_LINE_COL = "2667" *) (* cpu_state_amo = "9'b000000001" *) (* cpu_state_exec = "9'b000010000" *) 
(* cpu_state_fetch = "9'b010000000" *) (* cpu_state_ld_rs1 = "9'b001000000" *) (* cpu_state_ld_rs2 = "9'b000100000" *) 
(* cpu_state_ldmem = "9'b000000010" *) (* cpu_state_shift = "9'b000001000" *) (* cpu_state_stmem = "9'b000000100" *) 
(* cpu_state_trap = "9'b100000000" *) (* irq_buserror = "2" *) (* irq_ebreak = "1" *) 
(* irq_timer = "0" *) (* irqregs_offset = "32" *) (* regfile_size = "32" *) 
(* regindex_bits = "5" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module picorv32
   (clk,
    reset_l,
    trap,
    mem_valid,
    mem_instr,
    mem_ready,
    mem_addr,
    mem_wdata,
    mem_wstrb,
    mem_amo_op,
    mem_rdata,
    pico_int,
    mem_la_read,
    mem_la_write,
    mem_la_addr,
    mem_la_wdata,
    mem_la_wstrb,
    mem_la_amo_op,
    pcpi_valid,
    pcpi_insn,
    pcpi_rs1,
    pcpi_rs2,
    pcpi_wr,
    pcpi_rd,
    pcpi_wait,
    pcpi_ready,
    irq,
    eoi,
    trace_valid,
    trace_data);
  input clk;
  input reset_l;
  output trap;
  output mem_valid;
  output mem_instr;
  input mem_ready;
  output [31:0]mem_addr;
  output [31:0]mem_wdata;
  output [3:0]mem_wstrb;
  output [3:0]mem_amo_op;
  input [31:0]mem_rdata;
  input pico_int;
  output mem_la_read;
  output mem_la_write;
  output [31:0]mem_la_addr;
  output [31:0]mem_la_wdata;
  output [3:0]mem_la_wstrb;
  output [3:0]mem_la_amo_op;
  output pcpi_valid;
  output [31:0]pcpi_insn;
  output [31:0]pcpi_rs1;
  output [31:0]pcpi_rs2;
  input pcpi_wr;
  input [31:0]pcpi_rd;
  input pcpi_wait;
  input pcpi_ready;
  input [31:0]irq;
  output [31:0]eoi;
  output trace_valid;
  output [35:0]trace_data;

  wire \<const0> ;
  wire \<const1> ;
  wire RTL_ADD_n_0;
  wire RTL_ADD_n_1;
  wire RTL_ADD_n_10;
  wire RTL_ADD_n_11;
  wire RTL_ADD_n_12;
  wire RTL_ADD_n_13;
  wire RTL_ADD_n_14;
  wire RTL_ADD_n_15;
  wire RTL_ADD_n_16;
  wire RTL_ADD_n_17;
  wire RTL_ADD_n_18;
  wire RTL_ADD_n_19;
  wire RTL_ADD_n_2;
  wire RTL_ADD_n_20;
  wire RTL_ADD_n_21;
  wire RTL_ADD_n_22;
  wire RTL_ADD_n_23;
  wire RTL_ADD_n_24;
  wire RTL_ADD_n_25;
  wire RTL_ADD_n_26;
  wire RTL_ADD_n_27;
  wire RTL_ADD_n_28;
  wire RTL_ADD_n_29;
  wire RTL_ADD_n_3;
  wire RTL_ADD_n_30;
  wire RTL_ADD_n_31;
  wire RTL_ADD_n_4;
  wire RTL_ADD_n_5;
  wire RTL_ADD_n_6;
  wire RTL_ADD_n_7;
  wire RTL_ADD_n_8;
  wire RTL_ADD_n_9;
  wire RTL_MUX__0_n_0;
  wire RTL_MUX__0_n_1;
  wire RTL_MUX__0_n_2;
  wire RTL_MUX__0_n_3;
  wire RTL_MUX_n_0;
  wire [31:0]alu_add_sub;
  wire alu_eq;
  wire alu_lts;
  wire alu_ltu;
  wire [31:0]alu_out;
  wire alu_out_0;
  wire alu_out_00;
  wire alu_out_00_i__1_n_0;
  wire alu_out_00_i__2_n_0;
  wire [31:0]alu_out_q;
  wire [31:0]alu_out_q1;
  wire alu_out_q1_i__1_n_0;
  wire alu_out_q1_i__1_n_1;
  wire alu_out_q1_i__1_n_10;
  wire alu_out_q1_i__1_n_11;
  wire alu_out_q1_i__1_n_12;
  wire alu_out_q1_i__1_n_13;
  wire alu_out_q1_i__1_n_14;
  wire alu_out_q1_i__1_n_15;
  wire alu_out_q1_i__1_n_16;
  wire alu_out_q1_i__1_n_17;
  wire alu_out_q1_i__1_n_18;
  wire alu_out_q1_i__1_n_19;
  wire alu_out_q1_i__1_n_2;
  wire alu_out_q1_i__1_n_20;
  wire alu_out_q1_i__1_n_21;
  wire alu_out_q1_i__1_n_22;
  wire alu_out_q1_i__1_n_23;
  wire alu_out_q1_i__1_n_24;
  wire alu_out_q1_i__1_n_25;
  wire alu_out_q1_i__1_n_26;
  wire alu_out_q1_i__1_n_27;
  wire alu_out_q1_i__1_n_28;
  wire alu_out_q1_i__1_n_29;
  wire alu_out_q1_i__1_n_3;
  wire alu_out_q1_i__1_n_30;
  wire alu_out_q1_i__1_n_31;
  wire alu_out_q1_i__1_n_4;
  wire alu_out_q1_i__1_n_5;
  wire alu_out_q1_i__1_n_6;
  wire alu_out_q1_i__1_n_7;
  wire alu_out_q1_i__1_n_8;
  wire alu_out_q1_i__1_n_9;
  wire alu_out_q1_i__2_n_0;
  wire alu_out_q1_i__2_n_1;
  wire alu_out_q1_i__2_n_10;
  wire alu_out_q1_i__2_n_11;
  wire alu_out_q1_i__2_n_12;
  wire alu_out_q1_i__2_n_13;
  wire alu_out_q1_i__2_n_14;
  wire alu_out_q1_i__2_n_15;
  wire alu_out_q1_i__2_n_16;
  wire alu_out_q1_i__2_n_17;
  wire alu_out_q1_i__2_n_18;
  wire alu_out_q1_i__2_n_19;
  wire alu_out_q1_i__2_n_2;
  wire alu_out_q1_i__2_n_20;
  wire alu_out_q1_i__2_n_21;
  wire alu_out_q1_i__2_n_22;
  wire alu_out_q1_i__2_n_23;
  wire alu_out_q1_i__2_n_24;
  wire alu_out_q1_i__2_n_25;
  wire alu_out_q1_i__2_n_26;
  wire alu_out_q1_i__2_n_27;
  wire alu_out_q1_i__2_n_28;
  wire alu_out_q1_i__2_n_29;
  wire alu_out_q1_i__2_n_3;
  wire alu_out_q1_i__2_n_30;
  wire alu_out_q1_i__2_n_31;
  wire alu_out_q1_i__2_n_4;
  wire alu_out_q1_i__2_n_5;
  wire alu_out_q1_i__2_n_6;
  wire alu_out_q1_i__2_n_7;
  wire alu_out_q1_i__2_n_8;
  wire alu_out_q1_i__2_n_9;
  wire alu_out_q2;
  wire alu_out_q2_i__0_n_0;
  wire alu_out_q2_i__0_n_1;
  wire alu_out_q2_i__0_n_10;
  wire alu_out_q2_i__0_n_11;
  wire alu_out_q2_i__0_n_12;
  wire alu_out_q2_i__0_n_13;
  wire alu_out_q2_i__0_n_14;
  wire alu_out_q2_i__0_n_15;
  wire alu_out_q2_i__0_n_16;
  wire alu_out_q2_i__0_n_17;
  wire alu_out_q2_i__0_n_18;
  wire alu_out_q2_i__0_n_19;
  wire alu_out_q2_i__0_n_2;
  wire alu_out_q2_i__0_n_20;
  wire alu_out_q2_i__0_n_21;
  wire alu_out_q2_i__0_n_22;
  wire alu_out_q2_i__0_n_23;
  wire alu_out_q2_i__0_n_24;
  wire alu_out_q2_i__0_n_25;
  wire alu_out_q2_i__0_n_26;
  wire alu_out_q2_i__0_n_27;
  wire alu_out_q2_i__0_n_28;
  wire alu_out_q2_i__0_n_29;
  wire alu_out_q2_i__0_n_3;
  wire alu_out_q2_i__0_n_30;
  wire alu_out_q2_i__0_n_31;
  wire alu_out_q2_i__0_n_4;
  wire alu_out_q2_i__0_n_5;
  wire alu_out_q2_i__0_n_6;
  wire alu_out_q2_i__0_n_7;
  wire alu_out_q2_i__0_n_8;
  wire alu_out_q2_i__0_n_9;
  wire alu_out_q2_i__2_n_0;
  wire alu_out_q2_i__3_n_0;
  wire alu_out_q2_i_n_0;
  wire alu_out_q2_i_n_1;
  wire alu_out_q2_i_n_10;
  wire alu_out_q2_i_n_11;
  wire alu_out_q2_i_n_12;
  wire alu_out_q2_i_n_13;
  wire alu_out_q2_i_n_14;
  wire alu_out_q2_i_n_15;
  wire alu_out_q2_i_n_16;
  wire alu_out_q2_i_n_17;
  wire alu_out_q2_i_n_18;
  wire alu_out_q2_i_n_19;
  wire alu_out_q2_i_n_2;
  wire alu_out_q2_i_n_20;
  wire alu_out_q2_i_n_21;
  wire alu_out_q2_i_n_22;
  wire alu_out_q2_i_n_23;
  wire alu_out_q2_i_n_24;
  wire alu_out_q2_i_n_25;
  wire alu_out_q2_i_n_26;
  wire alu_out_q2_i_n_27;
  wire alu_out_q2_i_n_28;
  wire alu_out_q2_i_n_29;
  wire alu_out_q2_i_n_3;
  wire alu_out_q2_i_n_30;
  wire alu_out_q2_i_n_31;
  wire alu_out_q2_i_n_4;
  wire alu_out_q2_i_n_5;
  wire alu_out_q2_i_n_6;
  wire alu_out_q2_i_n_7;
  wire alu_out_q2_i_n_8;
  wire alu_out_q2_i_n_9;
  wire clk;
  wire compressed_instr;
  wire count_cycle0;
  wire count_cycle0_i_n_0;
  wire count_cycle0_i_n_1;
  wire count_cycle0_i_n_10;
  wire count_cycle0_i_n_11;
  wire count_cycle0_i_n_12;
  wire count_cycle0_i_n_13;
  wire count_cycle0_i_n_14;
  wire count_cycle0_i_n_15;
  wire count_cycle0_i_n_16;
  wire count_cycle0_i_n_17;
  wire count_cycle0_i_n_18;
  wire count_cycle0_i_n_19;
  wire count_cycle0_i_n_2;
  wire count_cycle0_i_n_20;
  wire count_cycle0_i_n_21;
  wire count_cycle0_i_n_22;
  wire count_cycle0_i_n_23;
  wire count_cycle0_i_n_24;
  wire count_cycle0_i_n_25;
  wire count_cycle0_i_n_26;
  wire count_cycle0_i_n_27;
  wire count_cycle0_i_n_28;
  wire count_cycle0_i_n_29;
  wire count_cycle0_i_n_3;
  wire count_cycle0_i_n_30;
  wire count_cycle0_i_n_31;
  wire count_cycle0_i_n_32;
  wire count_cycle0_i_n_33;
  wire count_cycle0_i_n_34;
  wire count_cycle0_i_n_35;
  wire count_cycle0_i_n_36;
  wire count_cycle0_i_n_37;
  wire count_cycle0_i_n_38;
  wire count_cycle0_i_n_39;
  wire count_cycle0_i_n_4;
  wire count_cycle0_i_n_40;
  wire count_cycle0_i_n_41;
  wire count_cycle0_i_n_42;
  wire count_cycle0_i_n_43;
  wire count_cycle0_i_n_44;
  wire count_cycle0_i_n_45;
  wire count_cycle0_i_n_46;
  wire count_cycle0_i_n_47;
  wire count_cycle0_i_n_48;
  wire count_cycle0_i_n_49;
  wire count_cycle0_i_n_5;
  wire count_cycle0_i_n_50;
  wire count_cycle0_i_n_51;
  wire count_cycle0_i_n_52;
  wire count_cycle0_i_n_53;
  wire count_cycle0_i_n_54;
  wire count_cycle0_i_n_55;
  wire count_cycle0_i_n_56;
  wire count_cycle0_i_n_57;
  wire count_cycle0_i_n_58;
  wire count_cycle0_i_n_59;
  wire count_cycle0_i_n_6;
  wire count_cycle0_i_n_60;
  wire count_cycle0_i_n_61;
  wire count_cycle0_i_n_62;
  wire count_cycle0_i_n_63;
  wire count_cycle0_i_n_7;
  wire count_cycle0_i_n_8;
  wire count_cycle0_i_n_9;
  wire count_cycle_reg_n_32;
  wire count_cycle_reg_n_33;
  wire count_cycle_reg_n_34;
  wire count_cycle_reg_n_35;
  wire count_cycle_reg_n_36;
  wire count_cycle_reg_n_37;
  wire count_cycle_reg_n_38;
  wire count_cycle_reg_n_39;
  wire count_cycle_reg_n_40;
  wire count_cycle_reg_n_41;
  wire count_cycle_reg_n_42;
  wire count_cycle_reg_n_43;
  wire count_cycle_reg_n_44;
  wire count_cycle_reg_n_45;
  wire count_cycle_reg_n_46;
  wire count_cycle_reg_n_47;
  wire count_cycle_reg_n_48;
  wire count_cycle_reg_n_49;
  wire count_cycle_reg_n_50;
  wire count_cycle_reg_n_51;
  wire count_cycle_reg_n_52;
  wire count_cycle_reg_n_53;
  wire count_cycle_reg_n_54;
  wire count_cycle_reg_n_55;
  wire count_cycle_reg_n_56;
  wire count_cycle_reg_n_57;
  wire count_cycle_reg_n_58;
  wire count_cycle_reg_n_59;
  wire count_cycle_reg_n_60;
  wire count_cycle_reg_n_61;
  wire count_cycle_reg_n_62;
  wire count_cycle_reg_n_63;
  wire [63:0]count_instr;
  wire [63:0]count_instr0;
  wire count_instr__0;
  wire count_instr_i__0_n_0;
  wire [9:0]cpu_state;
  wire cpu_state0;
  wire cpu_state0_i__1_n_0;
  wire cpu_state0_i_n_0;
  wire cpu_state0_i_n_1;
  wire cpu_state0_i_n_2;
  wire cpu_state0_i_n_3;
  wire cpu_state0_i_n_4;
  wire cpu_state0_i_n_5;
  wire cpu_state0_i_n_6;
  wire cpu_state0_i_n_7;
  wire cpu_state0_i_n_8;
  wire cpu_state0_i_n_9;
  wire cpu_state0_out;
  wire cpu_state1;
  wire cpu_state1_i__0_n_0;
  wire cpu_state1_i__1_n_0;
  wire cpu_state1_i__3_n_0;
  wire cpu_state1_i_n_0;
  wire [9:0]cpu_state1_out;
  wire cpu_state2;
  wire cpu_state2_i__0_n_0;
  wire cpu_state2_i__2_n_0;
  wire cpu_state2_i__3_n_0;
  wire cpu_state2_i_n_0;
  wire cpu_state6_out;
  wire [9:0]cpu_state__0;
  wire cpu_state_i__0_n_0;
  wire cpu_state_i__0_n_1;
  wire cpu_state_i__0_n_2;
  wire cpu_state_i__0_n_3;
  wire cpu_state_i__0_n_4;
  wire cpu_state_i__10_n_0;
  wire cpu_state_i__13_n_0;
  wire cpu_state_i__14_n_0;
  wire cpu_state_i__15_n_0;
  wire cpu_state_i__1_n_0;
  wire cpu_state_i__1_n_1;
  wire cpu_state_i__1_n_2;
  wire cpu_state_i__1_n_3;
  wire cpu_state_i__1_n_4;
  wire cpu_state_i__1_n_5;
  wire cpu_state_i__1_n_6;
  wire cpu_state_i__1_n_7;
  wire cpu_state_i__1_n_8;
  wire cpu_state_i__1_n_9;
  wire cpu_state_i__4_n_0;
  wire cpu_state_i__5_n_0;
  wire cpu_state_i__6_n_0;
  wire cpu_state_i__7_n_0;
  wire cpu_state_i__8_n_0;
  wire cpu_state_i__9_n_0;
  wire cpu_state_i_n_0;
  wire cpu_state_i_n_1;
  wire cpu_state_i_n_2;
  wire cpu_state_i_n_3;
  wire cpu_state_i_n_4;
  wire cpu_state_i_n_5;
  wire cpu_state_i_n_6;
  wire cpu_state_i_n_7;
  wire cpu_state_i_n_8;
  wire cpu_state_i_n_9;
  wire [31:0]cpuregs_rs2;
  wire [31:0]cpuregs_wrdata;
  wire cpuregs_write;
  wire [31:0]current_pc;
  wire [31:0]decoded_imm;
  wire [31:0]decoded_imm0;
  wire decoded_imm1;
  wire decoded_imm1_i__0_n_0;
  wire [31:0]decoded_imm__0;
  wire [31:0]decoded_imm_uj;
  wire [4:0]decoded_rd;
  wire [4:0]decoded_rs1;
  wire [4:0]decoded_rs2;
  wire decoder_pseudo_trigger;
  wire decoder_pseudo_trigger__0;
  wire decoder_pseudo_trigger_i__1_n_0;
  wire decoder_pseudo_trigger_i_n_0;
  wire decoder_trigger;
  wire decoder_trigger1;
  wire decoder_trigger1_i_n_0;
  wire decoder_trigger2_i_n_0;
  wire decoder_trigger__0;
  wire decoder_trigger_i__0_n_0;
  wire decoder_trigger_i__1_n_0;
  wire decoder_trigger_i__2_n_0;
  wire decoder_trigger_i__3_n_0;
  wire decoder_trigger_i_n_0;
  wire [31:0]eoi;
  wire eoi_i_n_0;
  wire instr_add;
  wire instr_add0;
  wire instr_add1_i_n_0;
  wire instr_add__0;
  wire instr_addi;
  wire instr_addi0;
  wire instr_addi__0;
  wire [3:0]instr_amo_op;
  wire instr_amo_op_i__0_n_0;
  wire instr_amo_op_i__1_n_0;
  wire instr_amo_op_i__2_n_0;
  wire instr_and;
  wire instr_and0;
  wire instr_and1;
  wire instr_and__0;
  wire instr_andi;
  wire instr_andi0;
  wire instr_andi__0;
  wire instr_auipc;
  wire instr_auipc0;
  wire instr_beq;
  wire instr_beq0;
  wire instr_beq1_i_n_0;
  wire instr_beq__0;
  wire instr_bge;
  wire instr_bge0;
  wire instr_bge1_i_n_0;
  wire instr_bge__0;
  wire instr_bgeu;
  wire instr_bgeu0;
  wire instr_bgeu1_i_n_0;
  wire instr_bgeu__0;
  wire instr_blt;
  wire instr_blt0;
  wire instr_blt1_i_n_0;
  wire instr_blt__0;
  wire instr_bltu;
  wire instr_bltu0;
  wire instr_bltu1_i_n_0;
  wire instr_bltu__0;
  wire instr_bne;
  wire instr_bne0;
  wire instr_bne__0;
  wire instr_ecall_ebreak;
  wire instr_ecall_ebreak0;
  wire instr_ecall_ebreak1;
  wire instr_ecall_ebreak1_i__0_n_0;
  wire instr_ecall_ebreak2;
  wire instr_getq;
  wire instr_jal;
  wire instr_jal0;
  wire instr_jalr;
  wire instr_jalr0;
  wire instr_jalr1;
  wire instr_jalr1_i__0_n_0;
  wire instr_lb;
  wire instr_lb0;
  wire instr_lbu;
  wire instr_lbu0;
  wire instr_lh;
  wire instr_lh0;
  wire instr_lhu;
  wire instr_lhu0;
  wire instr_lui;
  wire instr_lui0;
  wire instr_lui0_i__0_n_0;
  wire instr_lw;
  wire instr_lw0;
  wire instr_lw1_i_n_0;
  wire instr_maskirq;
  wire instr_or;
  wire instr_or0;
  wire instr_or1;
  wire instr_or__0;
  wire instr_ori;
  wire instr_ori0;
  wire instr_ori__0;
  wire instr_rdcycle;
  wire instr_rdcycle0;
  wire instr_rdcycle1;
  wire instr_rdcycle1_i__0_n_0;
  wire instr_rdcycle2;
  wire instr_rdcycle2_i__1_n_0;
  wire instr_rdcycle2_i_n_0;
  wire instr_rdcycleh;
  wire instr_rdcycleh0;
  wire instr_rdcycleh1;
  wire instr_rdcycleh1_i__0_n_0;
  wire instr_rdcycleh2;
  wire instr_rdcycleh2_i__0_n_0;
  wire instr_rdinstr;
  wire instr_rdinstr0;
  wire instr_rdinstr1;
  wire instr_rdinstrh;
  wire instr_rdinstrh0;
  wire instr_rdinstrh1;
  wire instr_retirq;
  wire instr_sb;
  wire instr_sb0;
  wire instr_setq;
  wire instr_sh;
  wire instr_sh0;
  wire instr_sll;
  wire instr_sll0;
  wire instr_sll1;
  wire instr_sll__0;
  wire instr_slli;
  wire instr_slli0;
  wire instr_slli1;
  wire instr_slt;
  wire instr_slt0;
  wire instr_slt1;
  wire instr_slt__0;
  wire instr_slti;
  wire instr_slti0;
  wire instr_slti__0;
  wire instr_sltiu;
  wire instr_sltiu0;
  wire instr_sltiu1_i_n_0;
  wire instr_sltiu__0;
  wire instr_sltu;
  wire instr_sltu0;
  wire instr_sltu1;
  wire instr_sltu__0;
  wire instr_sra;
  wire instr_sra0;
  wire instr_sra__0;
  wire instr_srai;
  wire instr_srai0;
  wire instr_srai1_i_n_0;
  wire instr_srl;
  wire instr_srl0;
  wire instr_srl1_i_n_0;
  wire instr_srl__0;
  wire instr_srli;
  wire instr_srli0;
  wire instr_srli1_i_n_0;
  wire instr_sub;
  wire instr_sub0;
  wire instr_sub__0;
  wire instr_sw;
  wire instr_sw0;
  wire instr_timer;
  wire instr_trap;
  wire instr_trap0;
  wire instr_waitirq;
  wire instr_xor;
  wire instr_xor0;
  wire instr_xor1;
  wire instr_xor__0;
  wire instr_xori;
  wire instr_xori0;
  wire instr_xori__0;
  wire is_alu_reg_imm;
  wire is_alu_reg_imm0;
  wire is_alu_reg_reg;
  wire is_alu_reg_reg0;
  wire is_amo;
  wire is_amo0;
  wire is_beq_bne_blt_bge_bltu_bgeu;
  wire is_beq_bne_blt_bge_bltu_bgeu0;
  wire is_beq_bne_blt_bge_bltu_bgeu__0;
  wire is_compare;
  wire is_compare0;
  wire is_compare__0;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi0;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi1;
  wire is_jalr_addi_slti_sltiu_xori_ori_andi2;
  wire is_lb_lh_lw_lbu_lhu;
  wire is_lb_lh_lw_lbu_lhu0;
  wire is_lbu_lhu_lw;
  wire is_lbu_lhu_lw0;
  wire is_lui_auipc_jal;
  wire is_lui_auipc_jal0;
  wire is_lui_auipc_jal_jalr_addi_add_sub;
  wire is_lui_auipc_jal_jalr_addi_add_sub0;
  wire is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0;
  wire is_lui_auipc_jal_jalr_addi_add_sub1;
  wire is_rdcycle_rdcycleh_rdinstr_rdinstrh;
  wire is_sb_sh_sw;
  wire is_sb_sh_sw0;
  wire is_sll_srl_sra;
  wire is_sll_srl_sra0;
  wire is_slli_srli_srai;
  wire is_slli_srli_srai0;
  wire is_slli_srli_srai1_i_n_0;
  wire is_slti_blt_slt;
  wire is_slti_blt_slt0;
  wire is_sltiu_bltu_sltu;
  wire is_sltiu_bltu_sltu0;
  wire latched_branch;
  wire latched_branch__0;
  wire latched_branch_i__0_n_0;
  wire latched_branch_i__2_n_0;
  wire latched_branch_i__3_n_0;
  wire latched_branch_i_n_0;
  wire latched_compr;
  wire latched_compr__0;
  wire latched_compr_i_n_0;
  wire latched_is_lb;
  wire latched_is_lb__0;
  wire latched_is_lb_i__0_n_0;
  wire latched_is_lb_i__1_n_0;
  wire latched_is_lb_i__2_n_0;
  wire latched_is_lb_i__3_n_0;
  wire latched_is_lh;
  wire latched_is_lh__0;
  wire latched_is_lh_i__0_n_0;
  wire latched_is_lh_i__1_n_0;
  wire latched_is_lh_i__2_n_0;
  wire latched_is_lh_i__3_n_0;
  wire latched_is_lu;
  wire latched_is_lu__0;
  wire latched_is_lu_i__0_n_0;
  wire latched_is_lu_i__1_n_0;
  wire latched_is_lu_i__2_n_0;
  wire latched_is_lu_i__3_n_0;
  wire [4:0]latched_rd;
  wire [4:0]latched_rd__0;
  wire latched_rd_i__0_n_0;
  wire latched_rd_i__1_n_0;
  wire latched_stalu;
  wire latched_stalu__0;
  wire latched_stalu_i__0_n_0;
  wire latched_stalu_i__1_n_0;
  wire latched_stalu_i__2_n_0;
  wire latched_store;
  wire latched_store0;
  wire latched_store0_i__0_n_0;
  wire latched_store1_out;
  wire latched_store__0;
  wire latched_store_i__1_n_0;
  wire latched_store_i__2_n_0;
  wire latched_store_i__3_n_0;
  wire [31:0]mem_addr;
  wire mem_addr0;
  wire mem_addr_i_n_0;
  wire [3:0]mem_amo_op;
  wire mem_amo_op_i_n_0;
  wire mem_do_prefetch;
  wire mem_do_prefetch0;
  wire mem_do_prefetch1;
  wire mem_do_prefetch1_i__0_n_0;
  wire mem_do_prefetch__0;
  wire mem_do_prefetch_i__0_n_0;
  wire mem_do_prefetch_i__1_n_0;
  wire mem_do_prefetch_i_n_0;
  wire mem_do_rdata;
  wire mem_do_rdata__0;
  wire mem_do_rinst;
  wire mem_do_rinst0;
  wire mem_do_rinst0_i__0_n_0;
  wire mem_do_rinst0_i__2_n_0;
  wire mem_do_rinst0_i_n_0;
  wire mem_do_rinst0_out;
  wire mem_do_rinst1;
  wire mem_do_rinst1_i__0_n_0;
  wire mem_do_rinst1_out;
  wire mem_do_rinst__0;
  wire mem_do_rinst_i__0_n_0;
  wire mem_do_rinst_i__3_n_0;
  wire mem_do_rinst_i__4_n_0;
  wire mem_do_rinst_i__5_n_0;
  wire mem_do_rinst_i__6_n_0;
  wire mem_do_rinst_i_n_0;
  wire mem_do_wdata;
  wire mem_do_wdata__0;
  wire mem_done;
  wire mem_done0;
  wire mem_done1;
  wire mem_done1_i__0_n_0;
  wire mem_done2;
  wire mem_done2_i__0_n_0;
  wire mem_done2_i__1_n_0;
  wire mem_done3;
  wire mem_instr;
  wire mem_instr_i__0_n_0;
  wire mem_instr_i__1_n_0;
  wire mem_instr_i__2_n_0;
  wire mem_instr_i_n_0;
  wire [31:0]mem_la_addr;
  wire mem_la_addr1;
  wire [3:0]mem_la_amo_op;
  wire mem_la_read;
  wire mem_la_read0;
  wire [31:0]mem_la_wdata;
  wire mem_la_write;
  wire mem_la_write0;
  wire mem_la_write1_i_n_0;
  wire [3:0]mem_la_wstrb;
  wire [3:0]mem_la_wstrb0;
  wire mem_la_wstrb0_i_n_0;
  wire mem_la_wstrb0_i_n_1;
  wire mem_la_wstrb0_i_n_2;
  wire mem_la_wstrb0_i_n_3;
  wire [31:0]mem_rdata;
  wire [31:0]mem_rdata_q;
  wire mem_rdata_q0_i_n_0;
  wire mem_rdata_q0_i_n_1;
  wire mem_rdata_q0_i_n_10;
  wire mem_rdata_q0_i_n_11;
  wire mem_rdata_q0_i_n_12;
  wire mem_rdata_q0_i_n_13;
  wire mem_rdata_q0_i_n_14;
  wire mem_rdata_q0_i_n_15;
  wire mem_rdata_q0_i_n_16;
  wire mem_rdata_q0_i_n_17;
  wire mem_rdata_q0_i_n_18;
  wire mem_rdata_q0_i_n_19;
  wire mem_rdata_q0_i_n_2;
  wire mem_rdata_q0_i_n_20;
  wire mem_rdata_q0_i_n_21;
  wire mem_rdata_q0_i_n_22;
  wire mem_rdata_q0_i_n_23;
  wire mem_rdata_q0_i_n_24;
  wire mem_rdata_q0_i_n_3;
  wire mem_rdata_q0_i_n_4;
  wire mem_rdata_q0_i_n_5;
  wire mem_rdata_q0_i_n_6;
  wire mem_rdata_q0_i_n_7;
  wire mem_rdata_q0_i_n_8;
  wire mem_rdata_q0_i_n_9;
  wire [31:0]mem_rdata_word;
  wire mem_rdata_word_i__0_n_0;
  wire mem_rdata_word_i__0_n_1;
  wire mem_rdata_word_i__0_n_10;
  wire mem_rdata_word_i__0_n_11;
  wire mem_rdata_word_i__0_n_12;
  wire mem_rdata_word_i__0_n_13;
  wire mem_rdata_word_i__0_n_14;
  wire mem_rdata_word_i__0_n_15;
  wire mem_rdata_word_i__0_n_16;
  wire mem_rdata_word_i__0_n_17;
  wire mem_rdata_word_i__0_n_18;
  wire mem_rdata_word_i__0_n_19;
  wire mem_rdata_word_i__0_n_2;
  wire mem_rdata_word_i__0_n_20;
  wire mem_rdata_word_i__0_n_21;
  wire mem_rdata_word_i__0_n_22;
  wire mem_rdata_word_i__0_n_23;
  wire mem_rdata_word_i__0_n_24;
  wire mem_rdata_word_i__0_n_25;
  wire mem_rdata_word_i__0_n_26;
  wire mem_rdata_word_i__0_n_27;
  wire mem_rdata_word_i__0_n_28;
  wire mem_rdata_word_i__0_n_29;
  wire mem_rdata_word_i__0_n_3;
  wire mem_rdata_word_i__0_n_30;
  wire mem_rdata_word_i__0_n_31;
  wire mem_rdata_word_i__0_n_4;
  wire mem_rdata_word_i__0_n_5;
  wire mem_rdata_word_i__0_n_6;
  wire mem_rdata_word_i__0_n_7;
  wire mem_rdata_word_i__0_n_8;
  wire mem_rdata_word_i__0_n_9;
  wire mem_rdata_word_i_n_0;
  wire mem_rdata_word_i_n_1;
  wire mem_rdata_word_i_n_10;
  wire mem_rdata_word_i_n_11;
  wire mem_rdata_word_i_n_12;
  wire mem_rdata_word_i_n_13;
  wire mem_rdata_word_i_n_14;
  wire mem_rdata_word_i_n_15;
  wire mem_rdata_word_i_n_16;
  wire mem_rdata_word_i_n_17;
  wire mem_rdata_word_i_n_18;
  wire mem_rdata_word_i_n_19;
  wire mem_rdata_word_i_n_2;
  wire mem_rdata_word_i_n_20;
  wire mem_rdata_word_i_n_21;
  wire mem_rdata_word_i_n_22;
  wire mem_rdata_word_i_n_23;
  wire mem_rdata_word_i_n_24;
  wire mem_rdata_word_i_n_25;
  wire mem_rdata_word_i_n_26;
  wire mem_rdata_word_i_n_27;
  wire mem_rdata_word_i_n_28;
  wire mem_rdata_word_i_n_29;
  wire mem_rdata_word_i_n_3;
  wire mem_rdata_word_i_n_30;
  wire mem_rdata_word_i_n_31;
  wire mem_rdata_word_i_n_4;
  wire mem_rdata_word_i_n_5;
  wire mem_rdata_word_i_n_6;
  wire mem_rdata_word_i_n_7;
  wire mem_rdata_word_i_n_8;
  wire mem_rdata_word_i_n_9;
  wire mem_ready;
  wire [1:0]mem_state;
  wire mem_state0;
  wire mem_state0_i_n_0;
  wire mem_state0_i_n_1;
  wire [1:0]mem_state0_out;
  wire mem_state1;
  wire mem_state1_out;
  wire mem_state2_i__0_n_0;
  wire mem_state2_i_n_0;
  wire [1:0]mem_state__0;
  wire mem_state_i__2_n_0;
  wire mem_state_i__4_n_0;
  wire mem_state_i__5_n_0;
  wire mem_state_i__6_n_0;
  wire mem_state_i_n_0;
  wire mem_state_i_n_1;
  wire mem_valid;
  wire mem_valid0;
  wire mem_valid_i__0_n_0;
  wire mem_valid_i__1_n_0;
  wire mem_valid_i__2_n_0;
  wire mem_valid_i__3_n_0;
  wire mem_valid_i__4_n_0;
  wire mem_valid_i__5_n_0;
  wire mem_valid_i_n_0;
  wire [31:0]mem_wdata;
  wire mem_wdata_i_n_0;
  wire [1:0]mem_wordsize;
  wire mem_wordsize0_out;
  wire mem_wordsize1;
  wire mem_wordsize1_i__0_n_0;
  wire [1:0]mem_wordsize2_out;
  wire [1:0]mem_wordsize__0;
  wire mem_wordsize_i__0_n_0;
  wire mem_wordsize_i__0_n_1;
  wire mem_wordsize_i__2_n_0;
  wire mem_wordsize_i__3_n_0;
  wire mem_wordsize_i__4_n_0;
  wire mem_wordsize_i__5_n_0;
  wire mem_wordsize_i__6_n_0;
  wire mem_wordsize_i__7_n_0;
  wire mem_wordsize_i__8_n_0;
  wire [3:0]mem_wstrb;
  wire [3:0]mem_wstrb0;
  wire mem_wstrb_i__0_n_0;
  wire mem_wstrb_i__0_n_1;
  wire mem_wstrb_i__0_n_2;
  wire mem_wstrb_i__0_n_3;
  wire mem_wstrb_i__1_n_0;
  wire mem_wstrb_i__2_n_0;
  wire mem_wstrb_i__3_n_0;
  wire mem_wstrb_i_n_0;
  wire mem_wstrb_i_n_1;
  wire mem_wstrb_i_n_2;
  wire mem_wstrb_i_n_3;
  wire mem_xfer;
  wire [31:2]next_pc;
  wire [31:0]next_pc0;
  wire next_pc1;
  wire [6:0]p_0_in;
  wire p_0_out;
  wire [31:0]p_1_in;
  wire p_1_out;
  wire p_2_in;
  wire p_3_in;
  wire [2:0]p_4_out;
  wire [31:0]pcpi_div_rd;
  wire pcpi_div_ready;
  wire pcpi_div_wait;
  wire pcpi_div_wr;
  wire [31:0]pcpi_insn;
  wire [31:0]pcpi_int_rd;
  wire pcpi_int_ready;
  wire pcpi_int_wait;
  wire pcpi_int_wr;
  wire [31:0]pcpi_mul_rd;
  wire pcpi_mul_ready;
  wire pcpi_mul_wait;
  wire pcpi_mul_wr;
  wire [31:0]pcpi_rs1;
  wire [31:0]pcpi_rs2;
  wire pcpi_timeout;
  wire pcpi_timeout0;
  wire pcpi_timeout__0;
  wire [3:0]pcpi_timeout_counter;
  wire pcpi_timeout_counter0;
  wire pcpi_timeout_counter0_i_n_0;
  wire pcpi_timeout_counter0_i_n_1;
  wire pcpi_timeout_counter0_i_n_2;
  wire pcpi_timeout_counter0_i_n_3;
  wire pcpi_timeout_counter1;
  wire pcpi_timeout_counter2;
  wire pcpi_timeout_counter2_i__0_n_0;
  wire pcpi_timeout_counter__0;
  wire pcpi_valid;
  wire pcpi_valid0;
  wire pcpi_valid1;
  wire pcpi_valid_i__0_n_0;
  wire pcpi_valid_i__1_n_0;
  wire pcpi_valid_i__2_n_0;
  wire pcpi_valid_i__3_n_0;
  wire pcpi_valid_i_n_0;
  wire pico_int;
  wire [31:0]reg_next_pc;
  wire [31:0]reg_next_pc0;
  wire reg_next_pc0_i__0_n_0;
  wire reg_next_pc0_i__0_n_1;
  wire reg_next_pc0_i__0_n_10;
  wire reg_next_pc0_i__0_n_11;
  wire reg_next_pc0_i__0_n_12;
  wire reg_next_pc0_i__0_n_13;
  wire reg_next_pc0_i__0_n_14;
  wire reg_next_pc0_i__0_n_15;
  wire reg_next_pc0_i__0_n_16;
  wire reg_next_pc0_i__0_n_17;
  wire reg_next_pc0_i__0_n_18;
  wire reg_next_pc0_i__0_n_19;
  wire reg_next_pc0_i__0_n_2;
  wire reg_next_pc0_i__0_n_20;
  wire reg_next_pc0_i__0_n_21;
  wire reg_next_pc0_i__0_n_22;
  wire reg_next_pc0_i__0_n_23;
  wire reg_next_pc0_i__0_n_24;
  wire reg_next_pc0_i__0_n_25;
  wire reg_next_pc0_i__0_n_26;
  wire reg_next_pc0_i__0_n_27;
  wire reg_next_pc0_i__0_n_28;
  wire reg_next_pc0_i__0_n_29;
  wire reg_next_pc0_i__0_n_3;
  wire reg_next_pc0_i__0_n_30;
  wire reg_next_pc0_i__0_n_31;
  wire reg_next_pc0_i__0_n_4;
  wire reg_next_pc0_i__0_n_5;
  wire reg_next_pc0_i__0_n_6;
  wire reg_next_pc0_i__0_n_7;
  wire reg_next_pc0_i__0_n_8;
  wire reg_next_pc0_i__0_n_9;
  wire [3:0]reg_next_pc1;
  wire [31:0]reg_next_pc__0;
  wire reg_next_pc_i__1_n_0;
  wire reg_next_pc_i__2_n_0;
  wire reg_next_pc_i_n_0;
  wire reg_next_pc_i_n_1;
  wire reg_next_pc_i_n_10;
  wire reg_next_pc_i_n_11;
  wire reg_next_pc_i_n_12;
  wire reg_next_pc_i_n_13;
  wire reg_next_pc_i_n_14;
  wire reg_next_pc_i_n_15;
  wire reg_next_pc_i_n_16;
  wire reg_next_pc_i_n_17;
  wire reg_next_pc_i_n_18;
  wire reg_next_pc_i_n_19;
  wire reg_next_pc_i_n_2;
  wire reg_next_pc_i_n_20;
  wire reg_next_pc_i_n_21;
  wire reg_next_pc_i_n_22;
  wire reg_next_pc_i_n_23;
  wire reg_next_pc_i_n_24;
  wire reg_next_pc_i_n_25;
  wire reg_next_pc_i_n_26;
  wire reg_next_pc_i_n_27;
  wire reg_next_pc_i_n_28;
  wire reg_next_pc_i_n_29;
  wire reg_next_pc_i_n_3;
  wire reg_next_pc_i_n_30;
  wire reg_next_pc_i_n_31;
  wire reg_next_pc_i_n_4;
  wire reg_next_pc_i_n_5;
  wire reg_next_pc_i_n_6;
  wire reg_next_pc_i_n_7;
  wire reg_next_pc_i_n_8;
  wire reg_next_pc_i_n_9;
  wire [31:0]reg_op1;
  wire [31:0]reg_op10;
  wire reg_op10_i__0_n_0;
  wire reg_op10_i__0_n_1;
  wire reg_op10_i__0_n_10;
  wire reg_op10_i__0_n_11;
  wire reg_op10_i__0_n_12;
  wire reg_op10_i__0_n_13;
  wire reg_op10_i__0_n_14;
  wire reg_op10_i__0_n_15;
  wire reg_op10_i__0_n_16;
  wire reg_op10_i__0_n_17;
  wire reg_op10_i__0_n_18;
  wire reg_op10_i__0_n_19;
  wire reg_op10_i__0_n_2;
  wire reg_op10_i__0_n_20;
  wire reg_op10_i__0_n_21;
  wire reg_op10_i__0_n_22;
  wire reg_op10_i__0_n_23;
  wire reg_op10_i__0_n_24;
  wire reg_op10_i__0_n_25;
  wire reg_op10_i__0_n_26;
  wire reg_op10_i__0_n_27;
  wire reg_op10_i__0_n_28;
  wire reg_op10_i__0_n_29;
  wire reg_op10_i__0_n_3;
  wire reg_op10_i__0_n_30;
  wire reg_op10_i__0_n_31;
  wire reg_op10_i__0_n_4;
  wire reg_op10_i__0_n_5;
  wire reg_op10_i__0_n_6;
  wire reg_op10_i__0_n_7;
  wire reg_op10_i__0_n_8;
  wire reg_op10_i__0_n_9;
  wire reg_op10_i__1_n_0;
  wire reg_op10_i__1_n_1;
  wire reg_op10_i__1_n_10;
  wire reg_op10_i__1_n_11;
  wire reg_op10_i__1_n_12;
  wire reg_op10_i__1_n_13;
  wire reg_op10_i__1_n_14;
  wire reg_op10_i__1_n_15;
  wire reg_op10_i__1_n_16;
  wire reg_op10_i__1_n_17;
  wire reg_op10_i__1_n_18;
  wire reg_op10_i__1_n_19;
  wire reg_op10_i__1_n_2;
  wire reg_op10_i__1_n_20;
  wire reg_op10_i__1_n_21;
  wire reg_op10_i__1_n_22;
  wire reg_op10_i__1_n_23;
  wire reg_op10_i__1_n_24;
  wire reg_op10_i__1_n_25;
  wire reg_op10_i__1_n_26;
  wire reg_op10_i__1_n_27;
  wire reg_op10_i__1_n_28;
  wire reg_op10_i__1_n_29;
  wire reg_op10_i__1_n_3;
  wire reg_op10_i__1_n_30;
  wire reg_op10_i__1_n_31;
  wire reg_op10_i__1_n_4;
  wire reg_op10_i__1_n_5;
  wire reg_op10_i__1_n_6;
  wire reg_op10_i__1_n_7;
  wire reg_op10_i__1_n_8;
  wire reg_op10_i__1_n_9;
  wire reg_op10_i__2_n_0;
  wire reg_op10_i__2_n_1;
  wire reg_op10_i__2_n_10;
  wire reg_op10_i__2_n_11;
  wire reg_op10_i__2_n_12;
  wire reg_op10_i__2_n_13;
  wire reg_op10_i__2_n_14;
  wire reg_op10_i__2_n_15;
  wire reg_op10_i__2_n_16;
  wire reg_op10_i__2_n_17;
  wire reg_op10_i__2_n_18;
  wire reg_op10_i__2_n_19;
  wire reg_op10_i__2_n_2;
  wire reg_op10_i__2_n_20;
  wire reg_op10_i__2_n_21;
  wire reg_op10_i__2_n_22;
  wire reg_op10_i__2_n_23;
  wire reg_op10_i__2_n_24;
  wire reg_op10_i__2_n_25;
  wire reg_op10_i__2_n_26;
  wire reg_op10_i__2_n_27;
  wire reg_op10_i__2_n_28;
  wire reg_op10_i__2_n_29;
  wire reg_op10_i__2_n_3;
  wire reg_op10_i__2_n_30;
  wire reg_op10_i__2_n_31;
  wire reg_op10_i__2_n_4;
  wire reg_op10_i__2_n_5;
  wire reg_op10_i__2_n_6;
  wire reg_op10_i__2_n_7;
  wire reg_op10_i__2_n_8;
  wire reg_op10_i__2_n_9;
  wire reg_op10_i__3_n_0;
  wire reg_op10_i__3_n_1;
  wire reg_op10_i__3_n_10;
  wire reg_op10_i__3_n_11;
  wire reg_op10_i__3_n_12;
  wire reg_op10_i__3_n_13;
  wire reg_op10_i__3_n_14;
  wire reg_op10_i__3_n_15;
  wire reg_op10_i__3_n_16;
  wire reg_op10_i__3_n_17;
  wire reg_op10_i__3_n_18;
  wire reg_op10_i__3_n_19;
  wire reg_op10_i__3_n_2;
  wire reg_op10_i__3_n_20;
  wire reg_op10_i__3_n_21;
  wire reg_op10_i__3_n_22;
  wire reg_op10_i__3_n_23;
  wire reg_op10_i__3_n_24;
  wire reg_op10_i__3_n_25;
  wire reg_op10_i__3_n_26;
  wire reg_op10_i__3_n_27;
  wire reg_op10_i__3_n_28;
  wire reg_op10_i__3_n_29;
  wire reg_op10_i__3_n_3;
  wire reg_op10_i__3_n_30;
  wire reg_op10_i__3_n_31;
  wire reg_op10_i__3_n_4;
  wire reg_op10_i__3_n_5;
  wire reg_op10_i__3_n_6;
  wire reg_op10_i__3_n_7;
  wire reg_op10_i__3_n_8;
  wire reg_op10_i__3_n_9;
  wire reg_op10_i__4_n_0;
  wire reg_op10_i__4_n_1;
  wire reg_op10_i__4_n_10;
  wire reg_op10_i__4_n_11;
  wire reg_op10_i__4_n_12;
  wire reg_op10_i__4_n_13;
  wire reg_op10_i__4_n_14;
  wire reg_op10_i__4_n_15;
  wire reg_op10_i__4_n_16;
  wire reg_op10_i__4_n_17;
  wire reg_op10_i__4_n_18;
  wire reg_op10_i__4_n_19;
  wire reg_op10_i__4_n_2;
  wire reg_op10_i__4_n_20;
  wire reg_op10_i__4_n_21;
  wire reg_op10_i__4_n_22;
  wire reg_op10_i__4_n_23;
  wire reg_op10_i__4_n_24;
  wire reg_op10_i__4_n_25;
  wire reg_op10_i__4_n_26;
  wire reg_op10_i__4_n_27;
  wire reg_op10_i__4_n_28;
  wire reg_op10_i__4_n_29;
  wire reg_op10_i__4_n_3;
  wire reg_op10_i__4_n_30;
  wire reg_op10_i__4_n_31;
  wire reg_op10_i__4_n_4;
  wire reg_op10_i__4_n_5;
  wire reg_op10_i__4_n_6;
  wire reg_op10_i__4_n_7;
  wire reg_op10_i__4_n_8;
  wire reg_op10_i__4_n_9;
  wire reg_op10_i__5_n_0;
  wire reg_op10_i__5_n_1;
  wire reg_op10_i__5_n_10;
  wire reg_op10_i__5_n_11;
  wire reg_op10_i__5_n_12;
  wire reg_op10_i__5_n_13;
  wire reg_op10_i__5_n_14;
  wire reg_op10_i__5_n_15;
  wire reg_op10_i__5_n_16;
  wire reg_op10_i__5_n_17;
  wire reg_op10_i__5_n_18;
  wire reg_op10_i__5_n_19;
  wire reg_op10_i__5_n_2;
  wire reg_op10_i__5_n_20;
  wire reg_op10_i__5_n_21;
  wire reg_op10_i__5_n_22;
  wire reg_op10_i__5_n_23;
  wire reg_op10_i__5_n_24;
  wire reg_op10_i__5_n_25;
  wire reg_op10_i__5_n_26;
  wire reg_op10_i__5_n_27;
  wire reg_op10_i__5_n_28;
  wire reg_op10_i__5_n_29;
  wire reg_op10_i__5_n_3;
  wire reg_op10_i__5_n_30;
  wire reg_op10_i__5_n_31;
  wire reg_op10_i__5_n_4;
  wire reg_op10_i__5_n_5;
  wire reg_op10_i__5_n_6;
  wire reg_op10_i__5_n_7;
  wire reg_op10_i__5_n_8;
  wire reg_op10_i__5_n_9;
  wire reg_op10_out;
  wire reg_op11;
  wire reg_op11_i__0_n_0;
  wire reg_op11_i__0_n_1;
  wire reg_op11_i__0_n_10;
  wire reg_op11_i__0_n_11;
  wire reg_op11_i__0_n_12;
  wire reg_op11_i__0_n_13;
  wire reg_op11_i__0_n_14;
  wire reg_op11_i__0_n_15;
  wire reg_op11_i__0_n_16;
  wire reg_op11_i__0_n_17;
  wire reg_op11_i__0_n_18;
  wire reg_op11_i__0_n_19;
  wire reg_op11_i__0_n_2;
  wire reg_op11_i__0_n_20;
  wire reg_op11_i__0_n_21;
  wire reg_op11_i__0_n_22;
  wire reg_op11_i__0_n_23;
  wire reg_op11_i__0_n_24;
  wire reg_op11_i__0_n_25;
  wire reg_op11_i__0_n_26;
  wire reg_op11_i__0_n_27;
  wire reg_op11_i__0_n_28;
  wire reg_op11_i__0_n_29;
  wire reg_op11_i__0_n_3;
  wire reg_op11_i__0_n_30;
  wire reg_op11_i__0_n_31;
  wire reg_op11_i__0_n_4;
  wire reg_op11_i__0_n_5;
  wire reg_op11_i__0_n_6;
  wire reg_op11_i__0_n_7;
  wire reg_op11_i__0_n_8;
  wire reg_op11_i__0_n_9;
  wire reg_op11_i__2_n_0;
  wire reg_op11_i__3_n_0;
  wire reg_op11_i_n_0;
  wire reg_op11_i_n_1;
  wire reg_op11_i_n_10;
  wire reg_op11_i_n_11;
  wire reg_op11_i_n_12;
  wire reg_op11_i_n_13;
  wire reg_op11_i_n_14;
  wire reg_op11_i_n_15;
  wire reg_op11_i_n_16;
  wire reg_op11_i_n_17;
  wire reg_op11_i_n_18;
  wire reg_op11_i_n_19;
  wire reg_op11_i_n_2;
  wire reg_op11_i_n_20;
  wire reg_op11_i_n_21;
  wire reg_op11_i_n_22;
  wire reg_op11_i_n_23;
  wire reg_op11_i_n_24;
  wire reg_op11_i_n_25;
  wire reg_op11_i_n_26;
  wire reg_op11_i_n_27;
  wire reg_op11_i_n_28;
  wire reg_op11_i_n_29;
  wire reg_op11_i_n_3;
  wire reg_op11_i_n_30;
  wire reg_op11_i_n_31;
  wire reg_op11_i_n_4;
  wire reg_op11_i_n_5;
  wire reg_op11_i_n_6;
  wire reg_op11_i_n_7;
  wire reg_op11_i_n_8;
  wire reg_op11_i_n_9;
  wire [31:0]reg_op11_out;
  wire [31:0]reg_op12;
  wire reg_op13;
  wire [31:0]reg_op13_out;
  wire reg_op1_i__0_n_0;
  wire reg_op1_i__0_n_1;
  wire reg_op1_i__0_n_10;
  wire reg_op1_i__0_n_11;
  wire reg_op1_i__0_n_12;
  wire reg_op1_i__0_n_13;
  wire reg_op1_i__0_n_14;
  wire reg_op1_i__0_n_15;
  wire reg_op1_i__0_n_16;
  wire reg_op1_i__0_n_17;
  wire reg_op1_i__0_n_18;
  wire reg_op1_i__0_n_19;
  wire reg_op1_i__0_n_2;
  wire reg_op1_i__0_n_20;
  wire reg_op1_i__0_n_21;
  wire reg_op1_i__0_n_22;
  wire reg_op1_i__0_n_23;
  wire reg_op1_i__0_n_24;
  wire reg_op1_i__0_n_25;
  wire reg_op1_i__0_n_26;
  wire reg_op1_i__0_n_27;
  wire reg_op1_i__0_n_28;
  wire reg_op1_i__0_n_29;
  wire reg_op1_i__0_n_3;
  wire reg_op1_i__0_n_30;
  wire reg_op1_i__0_n_31;
  wire reg_op1_i__0_n_4;
  wire reg_op1_i__0_n_5;
  wire reg_op1_i__0_n_6;
  wire reg_op1_i__0_n_7;
  wire reg_op1_i__0_n_8;
  wire reg_op1_i__0_n_9;
  wire reg_op1_i__3_n_0;
  wire reg_op1_i__4_n_0;
  wire reg_op1_i__5_n_0;
  wire reg_op1_i__6_n_0;
  wire reg_op1_i__7_n_0;
  wire reg_op1_i__8_n_0;
  wire reg_op1_i_n_0;
  wire reg_op1_i_n_1;
  wire reg_op1_i_n_10;
  wire reg_op1_i_n_11;
  wire reg_op1_i_n_12;
  wire reg_op1_i_n_13;
  wire reg_op1_i_n_14;
  wire reg_op1_i_n_15;
  wire reg_op1_i_n_16;
  wire reg_op1_i_n_17;
  wire reg_op1_i_n_18;
  wire reg_op1_i_n_19;
  wire reg_op1_i_n_2;
  wire reg_op1_i_n_20;
  wire reg_op1_i_n_21;
  wire reg_op1_i_n_22;
  wire reg_op1_i_n_23;
  wire reg_op1_i_n_24;
  wire reg_op1_i_n_25;
  wire reg_op1_i_n_26;
  wire reg_op1_i_n_27;
  wire reg_op1_i_n_28;
  wire reg_op1_i_n_29;
  wire reg_op1_i_n_3;
  wire reg_op1_i_n_30;
  wire reg_op1_i_n_31;
  wire reg_op1_i_n_4;
  wire reg_op1_i_n_5;
  wire reg_op1_i_n_6;
  wire reg_op1_i_n_7;
  wire reg_op1_i_n_8;
  wire reg_op1_i_n_9;
  wire [31:0]reg_op2;
  wire reg_op20_i_n_0;
  wire reg_op20_i_n_1;
  wire reg_op20_i_n_10;
  wire reg_op20_i_n_11;
  wire reg_op20_i_n_12;
  wire reg_op20_i_n_13;
  wire reg_op20_i_n_14;
  wire reg_op20_i_n_15;
  wire reg_op20_i_n_16;
  wire reg_op20_i_n_17;
  wire reg_op20_i_n_18;
  wire reg_op20_i_n_19;
  wire reg_op20_i_n_2;
  wire reg_op20_i_n_20;
  wire reg_op20_i_n_21;
  wire reg_op20_i_n_22;
  wire reg_op20_i_n_23;
  wire reg_op20_i_n_24;
  wire reg_op20_i_n_25;
  wire reg_op20_i_n_26;
  wire reg_op20_i_n_27;
  wire reg_op20_i_n_28;
  wire reg_op20_i_n_29;
  wire reg_op20_i_n_3;
  wire reg_op20_i_n_30;
  wire reg_op20_i_n_31;
  wire reg_op20_i_n_4;
  wire reg_op20_i_n_5;
  wire reg_op20_i_n_6;
  wire reg_op20_i_n_7;
  wire reg_op20_i_n_8;
  wire reg_op20_i_n_9;
  wire reg_op2_i__0_n_0;
  wire reg_op2_i__1_n_0;
  wire [31:0]reg_out;
  wire [31:0]reg_out0;
  wire reg_out0_i_n_0;
  wire reg_out0_i_n_1;
  wire reg_out0_i_n_10;
  wire reg_out0_i_n_11;
  wire reg_out0_i_n_12;
  wire reg_out0_i_n_13;
  wire reg_out0_i_n_14;
  wire reg_out0_i_n_15;
  wire reg_out0_i_n_16;
  wire reg_out0_i_n_17;
  wire reg_out0_i_n_18;
  wire reg_out0_i_n_19;
  wire reg_out0_i_n_2;
  wire reg_out0_i_n_20;
  wire reg_out0_i_n_21;
  wire reg_out0_i_n_22;
  wire reg_out0_i_n_23;
  wire reg_out0_i_n_24;
  wire reg_out0_i_n_25;
  wire reg_out0_i_n_26;
  wire reg_out0_i_n_27;
  wire reg_out0_i_n_28;
  wire reg_out0_i_n_29;
  wire reg_out0_i_n_3;
  wire reg_out0_i_n_30;
  wire reg_out0_i_n_31;
  wire reg_out0_i_n_4;
  wire reg_out0_i_n_5;
  wire reg_out0_i_n_6;
  wire reg_out0_i_n_7;
  wire reg_out0_i_n_8;
  wire reg_out0_i_n_9;
  wire [31:0]reg_out1_out;
  wire [31:0]reg_out__0;
  wire reg_out_i_n_0;
  wire reg_out_i_n_1;
  wire reg_out_i_n_10;
  wire reg_out_i_n_11;
  wire reg_out_i_n_12;
  wire reg_out_i_n_13;
  wire reg_out_i_n_14;
  wire reg_out_i_n_15;
  wire reg_out_i_n_16;
  wire reg_out_i_n_17;
  wire reg_out_i_n_18;
  wire reg_out_i_n_19;
  wire reg_out_i_n_2;
  wire reg_out_i_n_20;
  wire reg_out_i_n_21;
  wire reg_out_i_n_22;
  wire reg_out_i_n_23;
  wire reg_out_i_n_24;
  wire reg_out_i_n_25;
  wire reg_out_i_n_26;
  wire reg_out_i_n_27;
  wire reg_out_i_n_28;
  wire reg_out_i_n_29;
  wire reg_out_i_n_3;
  wire reg_out_i_n_30;
  wire reg_out_i_n_31;
  wire reg_out_i_n_4;
  wire reg_out_i_n_5;
  wire reg_out_i_n_6;
  wire reg_out_i_n_7;
  wire reg_out_i_n_8;
  wire reg_out_i_n_9;
  wire [31:0]reg_pc;
  wire reg_pc1_i_n_0;
  wire reg_pc1_i_n_1;
  wire reg_pc1_i_n_10;
  wire reg_pc1_i_n_11;
  wire reg_pc1_i_n_12;
  wire reg_pc1_i_n_13;
  wire reg_pc1_i_n_14;
  wire reg_pc1_i_n_15;
  wire reg_pc1_i_n_16;
  wire reg_pc1_i_n_17;
  wire reg_pc1_i_n_18;
  wire reg_pc1_i_n_19;
  wire reg_pc1_i_n_2;
  wire reg_pc1_i_n_20;
  wire reg_pc1_i_n_21;
  wire reg_pc1_i_n_22;
  wire reg_pc1_i_n_23;
  wire reg_pc1_i_n_24;
  wire reg_pc1_i_n_25;
  wire reg_pc1_i_n_26;
  wire reg_pc1_i_n_27;
  wire reg_pc1_i_n_28;
  wire reg_pc1_i_n_29;
  wire reg_pc1_i_n_3;
  wire reg_pc1_i_n_30;
  wire reg_pc1_i_n_31;
  wire reg_pc1_i_n_4;
  wire reg_pc1_i_n_5;
  wire reg_pc1_i_n_6;
  wire reg_pc1_i_n_7;
  wire reg_pc1_i_n_8;
  wire reg_pc1_i_n_9;
  wire reg_pc2;
  wire reg_pc2_i__0_n_0;
  wire reg_pc2_i__0_n_1;
  wire reg_pc2_i__0_n_10;
  wire reg_pc2_i__0_n_11;
  wire reg_pc2_i__0_n_12;
  wire reg_pc2_i__0_n_13;
  wire reg_pc2_i__0_n_14;
  wire reg_pc2_i__0_n_15;
  wire reg_pc2_i__0_n_16;
  wire reg_pc2_i__0_n_17;
  wire reg_pc2_i__0_n_18;
  wire reg_pc2_i__0_n_19;
  wire reg_pc2_i__0_n_2;
  wire reg_pc2_i__0_n_20;
  wire reg_pc2_i__0_n_21;
  wire reg_pc2_i__0_n_22;
  wire reg_pc2_i__0_n_23;
  wire reg_pc2_i__0_n_24;
  wire reg_pc2_i__0_n_25;
  wire reg_pc2_i__0_n_26;
  wire reg_pc2_i__0_n_27;
  wire reg_pc2_i__0_n_28;
  wire reg_pc2_i__0_n_29;
  wire reg_pc2_i__0_n_3;
  wire reg_pc2_i__0_n_30;
  wire reg_pc2_i__0_n_31;
  wire reg_pc2_i__0_n_4;
  wire reg_pc2_i__0_n_5;
  wire reg_pc2_i__0_n_6;
  wire reg_pc2_i__0_n_7;
  wire reg_pc2_i__0_n_8;
  wire reg_pc2_i__0_n_9;
  wire reg_pc3;
  wire reg_pc3_i__0_n_0;
  wire reg_pc3_i__0_n_1;
  wire reg_pc3_i__0_n_10;
  wire reg_pc3_i__0_n_11;
  wire reg_pc3_i__0_n_12;
  wire reg_pc3_i__0_n_13;
  wire reg_pc3_i__0_n_14;
  wire reg_pc3_i__0_n_15;
  wire reg_pc3_i__0_n_16;
  wire reg_pc3_i__0_n_17;
  wire reg_pc3_i__0_n_18;
  wire reg_pc3_i__0_n_19;
  wire reg_pc3_i__0_n_2;
  wire reg_pc3_i__0_n_20;
  wire reg_pc3_i__0_n_21;
  wire reg_pc3_i__0_n_22;
  wire reg_pc3_i__0_n_23;
  wire reg_pc3_i__0_n_24;
  wire reg_pc3_i__0_n_25;
  wire reg_pc3_i__0_n_26;
  wire reg_pc3_i__0_n_27;
  wire reg_pc3_i__0_n_28;
  wire reg_pc3_i__0_n_29;
  wire reg_pc3_i__0_n_3;
  wire reg_pc3_i__0_n_30;
  wire reg_pc3_i__0_n_31;
  wire reg_pc3_i__0_n_4;
  wire reg_pc3_i__0_n_5;
  wire reg_pc3_i__0_n_6;
  wire reg_pc3_i__0_n_7;
  wire reg_pc3_i__0_n_8;
  wire reg_pc3_i__0_n_9;
  wire reg_pc__0;
  wire reg_pc_i__0_n_0;
  wire [4:0]reg_sh;
  wire [4:0]reg_sh0;
  wire reg_sh0_i__1_n_0;
  wire reg_sh0_i__1_n_1;
  wire reg_sh0_i__1_n_2;
  wire reg_sh0_i__1_n_3;
  wire reg_sh0_i__1_n_4;
  wire reg_sh0_i_n_0;
  wire reg_sh0_i_n_1;
  wire reg_sh0_i_n_2;
  wire reg_sh0_i_n_3;
  wire reg_sh0_i_n_4;
  wire [4:0]reg_sh0_out;
  wire reg_sh1;
  wire [31:0]reg_sh2;
  wire reg_sh2_i_n_0;
  wire reg_sh3;
  wire reg_sh3_i__0_n_0;
  wire [4:0]reg_sh__0;
  wire reset_l;
  wire resetn;
  wire resetn0;
  wire resetn1;
  wire resetn__0;
  wire set_mem_do_rdata;
  wire set_mem_do_rdata_i__0_n_0;
  wire set_mem_do_rdata_i__2_n_0;
  wire set_mem_do_rdata_i_n_0;
  wire set_mem_do_rinst;
  wire set_mem_do_rinst_i__0_n_0;
  wire set_mem_do_rinst_i_n_0;
  wire set_mem_do_wdata;
  wire set_mem_do_wdata_i__0_n_0;
  wire set_mem_do_wdata_i__2_n_0;
  wire set_mem_do_wdata_i_n_0;
  wire [35:0]trace_data;
  wire trace_valid;
  wire trap;
  wire trap_i__0_n_0;
  wire trap_i_n_0;
  wire [31:0]NLW_next_pc_i_O_UNCONNECTED;

  GND GND
       (.G(\<const0> ));
  (* XLNX_LINE_COL = "1450240" *) 
  (* map_to_module = "705" *) 
  RTL_ADD36 RTL_ADD
       (.I0(reg_pc),
        .I1({RTL_MUX__0_n_0,RTL_MUX__0_n_1,RTL_MUX__0_n_2,RTL_MUX__0_n_3}),
        .O({RTL_ADD_n_0,RTL_ADD_n_1,RTL_ADD_n_2,RTL_ADD_n_3,RTL_ADD_n_4,RTL_ADD_n_5,RTL_ADD_n_6,RTL_ADD_n_7,RTL_ADD_n_8,RTL_ADD_n_9,RTL_ADD_n_10,RTL_ADD_n_11,RTL_ADD_n_12,RTL_ADD_n_13,RTL_ADD_n_14,RTL_ADD_n_15,RTL_ADD_n_16,RTL_ADD_n_17,RTL_ADD_n_18,RTL_ADD_n_19,RTL_ADD_n_20,RTL_ADD_n_21,RTL_ADD_n_22,RTL_ADD_n_23,RTL_ADD_n_24,RTL_ADD_n_25,RTL_ADD_n_26,RTL_ADD_n_27,RTL_ADD_n_28,RTL_ADD_n_29,RTL_ADD_n_30,RTL_ADD_n_31}));
  (* XLNX_LINE_COL = "399360" *) 
  (* map_to_module = "547" *) 
  RTL_AND1 RTL_AND
       (.I0(resetn),
        .I1(cpuregs_write),
        .O(p_0_out));
  (* XLNX_LINE_COL = "402944" *) 
  (* map_to_module = "546" *) 
  RTL_AND31 RTL_AND__0
       (.I0(p_0_out),
        .I1(latched_rd),
        .O(p_1_out));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "291" *) 
  RTL_MUX152 RTL_MUX
       (.I0(\<const1> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .O(RTL_MUX_n_0),
        .S0(latched_branch),
        .S1(reg_pc2));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "2037760" *) 
  (* map_to_module = "288" *) 
  RTL_MUX146 RTL_MUX__0
       (.I0({\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const0> }),
        .O({RTL_MUX__0_n_0,RTL_MUX__0_n_1,RTL_MUX__0_n_2,RTL_MUX__0_n_3}),
        .S(latched_compr));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "287" *) 
  RTL_MUX121 RTL_MUX__1
       (.I0({RTL_ADD_n_0,RTL_ADD_n_1,RTL_ADD_n_2,RTL_ADD_n_3,RTL_ADD_n_4,RTL_ADD_n_5,RTL_ADD_n_6,RTL_ADD_n_7,RTL_ADD_n_8,RTL_ADD_n_9,RTL_ADD_n_10,RTL_ADD_n_11,RTL_ADD_n_12,RTL_ADD_n_13,RTL_ADD_n_14,RTL_ADD_n_15,RTL_ADD_n_16,RTL_ADD_n_17,RTL_ADD_n_18,RTL_ADD_n_19,RTL_ADD_n_20,RTL_ADD_n_21,RTL_ADD_n_22,RTL_ADD_n_23,RTL_ADD_n_24,RTL_ADD_n_25,RTL_ADD_n_26,RTL_ADD_n_27,RTL_ADD_n_28,RTL_ADD_n_29,RTL_ADD_n_30,RTL_ADD_n_31}),
        .I1({reg_pc3_i__0_n_0,reg_pc3_i__0_n_1,reg_pc3_i__0_n_2,reg_pc3_i__0_n_3,reg_pc3_i__0_n_4,reg_pc3_i__0_n_5,reg_pc3_i__0_n_6,reg_pc3_i__0_n_7,reg_pc3_i__0_n_8,reg_pc3_i__0_n_9,reg_pc3_i__0_n_10,reg_pc3_i__0_n_11,reg_pc3_i__0_n_12,reg_pc3_i__0_n_13,reg_pc3_i__0_n_14,reg_pc3_i__0_n_15,reg_pc3_i__0_n_16,reg_pc3_i__0_n_17,reg_pc3_i__0_n_18,reg_pc3_i__0_n_19,reg_pc3_i__0_n_20,reg_pc3_i__0_n_21,reg_pc3_i__0_n_22,reg_pc3_i__0_n_23,reg_pc3_i__0_n_24,reg_pc3_i__0_n_25,reg_pc3_i__0_n_26,reg_pc3_i__0_n_27,reg_pc3_i__0_n_28,reg_pc3_i__0_n_29,reg_pc3_i__0_n_30,reg_pc3_i__0_n_31}),
        .O(cpuregs_wrdata),
        .S0(latched_branch),
        .S1(reg_pc2));
  VCC VCC
       (.P(\<const1> ));
  (* XLNX_LINE_COL = "791296" *) 
  (* map_to_module = "711" *) 
  RTL_EQ40 alu_out_00_i
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O(alu_eq));
  (* XLNX_LINE_COL = "1050624" *) 
  (* map_to_module = "370" *) 
  RTL_INV0 alu_out_00_i__0
       (.I0(alu_eq),
        .O(alu_out_00));
  (* XLNX_LINE_COL = "1050880" *) 
  (* map_to_module = "371" *) 
  RTL_INV0 alu_out_00_i__1
       (.I0(alu_lts),
        .O(alu_out_00_i__1_n_0));
  (* XLNX_LINE_COL = "1050880" *) 
  (* map_to_module = "372" *) 
  RTL_INV0 alu_out_00_i__2
       (.I0(alu_ltu),
        .O(alu_out_00_i__2_n_0));
  (* XLNX_LINE_COL = "861184" *) 
  (* map_to_module = "712" *) 
  RTL_LT alu_out_01_i
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O(alu_lts));
  (* XLNX_LINE_COL = "856576" *) 
  (* map_to_module = "713" *) 
  RTL_LT alu_out_01_i__0
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O(alu_ltu));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1" *) 
  (* XLNX_LINE_COL = "133134" *) 
  (* map_to_module = "369" *) 
  RTL_MUX151 alu_out_0_i
       (.I0(alu_eq),
        .I1(alu_out_00),
        .I2(alu_out_00_i__1_n_0),
        .I3(alu_out_00_i__2_n_0),
        .I4(alu_lts),
        .I5(alu_ltu),
        .O(alu_out_0),
        .S0(instr_beq),
        .S1(instr_bne),
        .S2(instr_bge),
        .S3(instr_bgeu),
        .S4(is_slti_blt_slt),
        .S5(is_sltiu_bltu_sltu));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "365" *) 
  RTL_MUX126 alu_out_q0_i
       (.I0(alu_add_sub),
        .I1(alu_out_0),
        .I2(alu_out_q1),
        .I3({alu_out_q1_i__1_n_0,alu_out_q1_i__1_n_1,alu_out_q1_i__1_n_2,alu_out_q1_i__1_n_3,alu_out_q1_i__1_n_4,alu_out_q1_i__1_n_5,alu_out_q1_i__1_n_6,alu_out_q1_i__1_n_7,alu_out_q1_i__1_n_8,alu_out_q1_i__1_n_9,alu_out_q1_i__1_n_10,alu_out_q1_i__1_n_11,alu_out_q1_i__1_n_12,alu_out_q1_i__1_n_13,alu_out_q1_i__1_n_14,alu_out_q1_i__1_n_15,alu_out_q1_i__1_n_16,alu_out_q1_i__1_n_17,alu_out_q1_i__1_n_18,alu_out_q1_i__1_n_19,alu_out_q1_i__1_n_20,alu_out_q1_i__1_n_21,alu_out_q1_i__1_n_22,alu_out_q1_i__1_n_23,alu_out_q1_i__1_n_24,alu_out_q1_i__1_n_25,alu_out_q1_i__1_n_26,alu_out_q1_i__1_n_27,alu_out_q1_i__1_n_28,alu_out_q1_i__1_n_29,alu_out_q1_i__1_n_30,alu_out_q1_i__1_n_31}),
        .I4({alu_out_q1_i__2_n_0,alu_out_q1_i__2_n_1,alu_out_q1_i__2_n_2,alu_out_q1_i__2_n_3,alu_out_q1_i__2_n_4,alu_out_q1_i__2_n_5,alu_out_q1_i__2_n_6,alu_out_q1_i__2_n_7,alu_out_q1_i__2_n_8,alu_out_q1_i__2_n_9,alu_out_q1_i__2_n_10,alu_out_q1_i__2_n_11,alu_out_q1_i__2_n_12,alu_out_q1_i__2_n_13,alu_out_q1_i__2_n_14,alu_out_q1_i__2_n_15,alu_out_q1_i__2_n_16,alu_out_q1_i__2_n_17,alu_out_q1_i__2_n_18,alu_out_q1_i__2_n_19,alu_out_q1_i__2_n_20,alu_out_q1_i__2_n_21,alu_out_q1_i__2_n_22,alu_out_q1_i__2_n_23,alu_out_q1_i__2_n_24,alu_out_q1_i__2_n_25,alu_out_q1_i__2_n_26,alu_out_q1_i__2_n_27,alu_out_q1_i__2_n_28,alu_out_q1_i__2_n_29,alu_out_q1_i__2_n_30,alu_out_q1_i__2_n_31}),
        .O(alu_out),
        .S0(is_lui_auipc_jal_jalr_addi_add_sub),
        .S1(is_compare),
        .S2(alu_out_q2),
        .S3(alu_out_q2_i__2_n_0),
        .S4(alu_out_q2_i__3_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1126912" *) 
  (* map_to_module = "368" *) 
  RTL_MUX18 alu_out_q1_i
       (.I0({alu_out_q2_i_n_0,alu_out_q2_i_n_1,alu_out_q2_i_n_2,alu_out_q2_i_n_3,alu_out_q2_i_n_4,alu_out_q2_i_n_5,alu_out_q2_i_n_6,alu_out_q2_i_n_7,alu_out_q2_i_n_8,alu_out_q2_i_n_9,alu_out_q2_i_n_10,alu_out_q2_i_n_11,alu_out_q2_i_n_12,alu_out_q2_i_n_13,alu_out_q2_i_n_14,alu_out_q2_i_n_15,alu_out_q2_i_n_16,alu_out_q2_i_n_17,alu_out_q2_i_n_18,alu_out_q2_i_n_19,alu_out_q2_i_n_20,alu_out_q2_i_n_21,alu_out_q2_i_n_22,alu_out_q2_i_n_23,alu_out_q2_i_n_24,alu_out_q2_i_n_25,alu_out_q2_i_n_26,alu_out_q2_i_n_27,alu_out_q2_i_n_28,alu_out_q2_i_n_29,alu_out_q2_i_n_30,alu_out_q2_i_n_31}),
        .I1({alu_out_q2_i__0_n_0,alu_out_q2_i__0_n_1,alu_out_q2_i__0_n_2,alu_out_q2_i__0_n_3,alu_out_q2_i__0_n_4,alu_out_q2_i__0_n_5,alu_out_q2_i__0_n_6,alu_out_q2_i__0_n_7,alu_out_q2_i__0_n_8,alu_out_q2_i__0_n_9,alu_out_q2_i__0_n_10,alu_out_q2_i__0_n_11,alu_out_q2_i__0_n_12,alu_out_q2_i__0_n_13,alu_out_q2_i__0_n_14,alu_out_q2_i__0_n_15,alu_out_q2_i__0_n_16,alu_out_q2_i__0_n_17,alu_out_q2_i__0_n_18,alu_out_q2_i__0_n_19,alu_out_q2_i__0_n_20,alu_out_q2_i__0_n_21,alu_out_q2_i__0_n_22,alu_out_q2_i__0_n_23,alu_out_q2_i__0_n_24,alu_out_q2_i__0_n_25,alu_out_q2_i__0_n_26,alu_out_q2_i__0_n_27,alu_out_q2_i__0_n_28,alu_out_q2_i__0_n_29,alu_out_q2_i__0_n_30,alu_out_q2_i__0_n_31}),
        .O(alu_add_sub),
        .S(instr_sub));
  (* XLNX_LINE_COL = "922112" *) 
  (* map_to_module = "680" *) 
  RTL_XOR alu_out_q1_i__0
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O(alu_out_q1));
  (* XLNX_LINE_COL = "922112" *) 
  (* map_to_module = "367" *) 
  RTL_OR2 alu_out_q1_i__1
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O({alu_out_q1_i__1_n_0,alu_out_q1_i__1_n_1,alu_out_q1_i__1_n_2,alu_out_q1_i__1_n_3,alu_out_q1_i__1_n_4,alu_out_q1_i__1_n_5,alu_out_q1_i__1_n_6,alu_out_q1_i__1_n_7,alu_out_q1_i__1_n_8,alu_out_q1_i__1_n_9,alu_out_q1_i__1_n_10,alu_out_q1_i__1_n_11,alu_out_q1_i__1_n_12,alu_out_q1_i__1_n_13,alu_out_q1_i__1_n_14,alu_out_q1_i__1_n_15,alu_out_q1_i__1_n_16,alu_out_q1_i__1_n_17,alu_out_q1_i__1_n_18,alu_out_q1_i__1_n_19,alu_out_q1_i__1_n_20,alu_out_q1_i__1_n_21,alu_out_q1_i__1_n_22,alu_out_q1_i__1_n_23,alu_out_q1_i__1_n_24,alu_out_q1_i__1_n_25,alu_out_q1_i__1_n_26,alu_out_q1_i__1_n_27,alu_out_q1_i__1_n_28,alu_out_q1_i__1_n_29,alu_out_q1_i__1_n_30,alu_out_q1_i__1_n_31}));
  (* XLNX_LINE_COL = "922112" *) 
  (* map_to_module = "366" *) 
  RTL_AND17 alu_out_q1_i__2
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O({alu_out_q1_i__2_n_0,alu_out_q1_i__2_n_1,alu_out_q1_i__2_n_2,alu_out_q1_i__2_n_3,alu_out_q1_i__2_n_4,alu_out_q1_i__2_n_5,alu_out_q1_i__2_n_6,alu_out_q1_i__2_n_7,alu_out_q1_i__2_n_8,alu_out_q1_i__2_n_9,alu_out_q1_i__2_n_10,alu_out_q1_i__2_n_11,alu_out_q1_i__2_n_12,alu_out_q1_i__2_n_13,alu_out_q1_i__2_n_14,alu_out_q1_i__2_n_15,alu_out_q1_i__2_n_16,alu_out_q1_i__2_n_17,alu_out_q1_i__2_n_18,alu_out_q1_i__2_n_19,alu_out_q1_i__2_n_20,alu_out_q1_i__2_n_21,alu_out_q1_i__2_n_22,alu_out_q1_i__2_n_23,alu_out_q1_i__2_n_24,alu_out_q1_i__2_n_25,alu_out_q1_i__2_n_26,alu_out_q1_i__2_n_27,alu_out_q1_i__2_n_28,alu_out_q1_i__2_n_29,alu_out_q1_i__2_n_30,alu_out_q1_i__2_n_31}));
  (* XLNX_LINE_COL = "1905152" *) 
  (* map_to_module = "709" *) 
  RTL_SUB0 alu_out_q2_i
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O({alu_out_q2_i_n_0,alu_out_q2_i_n_1,alu_out_q2_i_n_2,alu_out_q2_i_n_3,alu_out_q2_i_n_4,alu_out_q2_i_n_5,alu_out_q2_i_n_6,alu_out_q2_i_n_7,alu_out_q2_i_n_8,alu_out_q2_i_n_9,alu_out_q2_i_n_10,alu_out_q2_i_n_11,alu_out_q2_i_n_12,alu_out_q2_i_n_13,alu_out_q2_i_n_14,alu_out_q2_i_n_15,alu_out_q2_i_n_16,alu_out_q2_i_n_17,alu_out_q2_i_n_18,alu_out_q2_i_n_19,alu_out_q2_i_n_20,alu_out_q2_i_n_21,alu_out_q2_i_n_22,alu_out_q2_i_n_23,alu_out_q2_i_n_24,alu_out_q2_i_n_25,alu_out_q2_i_n_26,alu_out_q2_i_n_27,alu_out_q2_i_n_28,alu_out_q2_i_n_29,alu_out_q2_i_n_30,alu_out_q2_i_n_31}));
  (* XLNX_LINE_COL = "3215872" *) 
  (* map_to_module = "710" *) 
  RTL_ADD33 alu_out_q2_i__0
       (.I0(pcpi_rs1),
        .I1(pcpi_rs2),
        .O({alu_out_q2_i__0_n_0,alu_out_q2_i__0_n_1,alu_out_q2_i__0_n_2,alu_out_q2_i__0_n_3,alu_out_q2_i__0_n_4,alu_out_q2_i__0_n_5,alu_out_q2_i__0_n_6,alu_out_q2_i__0_n_7,alu_out_q2_i__0_n_8,alu_out_q2_i__0_n_9,alu_out_q2_i__0_n_10,alu_out_q2_i__0_n_11,alu_out_q2_i__0_n_12,alu_out_q2_i__0_n_13,alu_out_q2_i__0_n_14,alu_out_q2_i__0_n_15,alu_out_q2_i__0_n_16,alu_out_q2_i__0_n_17,alu_out_q2_i__0_n_18,alu_out_q2_i__0_n_19,alu_out_q2_i__0_n_20,alu_out_q2_i__0_n_21,alu_out_q2_i__0_n_22,alu_out_q2_i__0_n_23,alu_out_q2_i__0_n_24,alu_out_q2_i__0_n_25,alu_out_q2_i__0_n_26,alu_out_q2_i__0_n_27,alu_out_q2_i__0_n_28,alu_out_q2_i__0_n_29,alu_out_q2_i__0_n_30,alu_out_q2_i__0_n_31}));
  (* XLNX_LINE_COL = "202752" *) 
  (* map_to_module = "677" *) 
  RTL_OR0 alu_out_q2_i__1
       (.I0(instr_xori),
        .I1(instr_xor),
        .O(alu_out_q2));
  (* XLNX_LINE_COL = "202240" *) 
  (* map_to_module = "678" *) 
  RTL_OR0 alu_out_q2_i__2
       (.I0(instr_ori),
        .I1(instr_or),
        .O(alu_out_q2_i__2_n_0));
  (* XLNX_LINE_COL = "202752" *) 
  (* map_to_module = "679" *) 
  RTL_OR0 alu_out_q2_i__3
       (.I0(instr_andi),
        .I1(instr_and),
        .O(alu_out_q2_i__3_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[0] 
       (.C(clk),
        .D(alu_out[0]),
        .Q(alu_out_q[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[10] 
       (.C(clk),
        .D(alu_out[10]),
        .Q(alu_out_q[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[11] 
       (.C(clk),
        .D(alu_out[11]),
        .Q(alu_out_q[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[12] 
       (.C(clk),
        .D(alu_out[12]),
        .Q(alu_out_q[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[13] 
       (.C(clk),
        .D(alu_out[13]),
        .Q(alu_out_q[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[14] 
       (.C(clk),
        .D(alu_out[14]),
        .Q(alu_out_q[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[15] 
       (.C(clk),
        .D(alu_out[15]),
        .Q(alu_out_q[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[16] 
       (.C(clk),
        .D(alu_out[16]),
        .Q(alu_out_q[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[17] 
       (.C(clk),
        .D(alu_out[17]),
        .Q(alu_out_q[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[18] 
       (.C(clk),
        .D(alu_out[18]),
        .Q(alu_out_q[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[19] 
       (.C(clk),
        .D(alu_out[19]),
        .Q(alu_out_q[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[1] 
       (.C(clk),
        .D(alu_out[1]),
        .Q(alu_out_q[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[20] 
       (.C(clk),
        .D(alu_out[20]),
        .Q(alu_out_q[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[21] 
       (.C(clk),
        .D(alu_out[21]),
        .Q(alu_out_q[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[22] 
       (.C(clk),
        .D(alu_out[22]),
        .Q(alu_out_q[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[23] 
       (.C(clk),
        .D(alu_out[23]),
        .Q(alu_out_q[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[24] 
       (.C(clk),
        .D(alu_out[24]),
        .Q(alu_out_q[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[25] 
       (.C(clk),
        .D(alu_out[25]),
        .Q(alu_out_q[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[26] 
       (.C(clk),
        .D(alu_out[26]),
        .Q(alu_out_q[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[27] 
       (.C(clk),
        .D(alu_out[27]),
        .Q(alu_out_q[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[28] 
       (.C(clk),
        .D(alu_out[28]),
        .Q(alu_out_q[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[29] 
       (.C(clk),
        .D(alu_out[29]),
        .Q(alu_out_q[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[2] 
       (.C(clk),
        .D(alu_out[2]),
        .Q(alu_out_q[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[30] 
       (.C(clk),
        .D(alu_out[30]),
        .Q(alu_out_q[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[31] 
       (.C(clk),
        .D(alu_out[31]),
        .Q(alu_out_q[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[3] 
       (.C(clk),
        .D(alu_out[3]),
        .Q(alu_out_q[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[4] 
       (.C(clk),
        .D(alu_out[4]),
        .Q(alu_out_q[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[5] 
       (.C(clk),
        .D(alu_out[5]),
        .Q(alu_out_q[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[6] 
       (.C(clk),
        .D(alu_out[6]),
        .Q(alu_out_q[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[7] 
       (.C(clk),
        .D(alu_out[7]),
        .Q(alu_out_q[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[8] 
       (.C(clk),
        .D(alu_out[8]),
        .Q(alu_out_q[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133632" *) 
  (* map_to_module = "253" *) 
  RTL_REG__BREG_5 \alu_out_q_reg[9] 
       (.C(clk),
        .D(alu_out[9]),
        .Q(alu_out_q[9]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200960" *) 
  (* map_to_module = "201" *) 
  RTL_REG_SYNC__BREG_13 compressed_instr_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(compressed_instr),
        .RST(instr_lui0_i__0_n_0));
  (* XLNX_LINE_COL = "1773568" *) 
  (* map_to_module = "715" *) 
  RTL_ADD34 count_cycle0_i
       (.I0({p_1_in,count_cycle_reg_n_32,count_cycle_reg_n_33,count_cycle_reg_n_34,count_cycle_reg_n_35,count_cycle_reg_n_36,count_cycle_reg_n_37,count_cycle_reg_n_38,count_cycle_reg_n_39,count_cycle_reg_n_40,count_cycle_reg_n_41,count_cycle_reg_n_42,count_cycle_reg_n_43,count_cycle_reg_n_44,count_cycle_reg_n_45,count_cycle_reg_n_46,count_cycle_reg_n_47,count_cycle_reg_n_48,count_cycle_reg_n_49,count_cycle_reg_n_50,count_cycle_reg_n_51,count_cycle_reg_n_52,count_cycle_reg_n_53,count_cycle_reg_n_54,count_cycle_reg_n_55,count_cycle_reg_n_56,count_cycle_reg_n_57,count_cycle_reg_n_58,count_cycle_reg_n_59,count_cycle_reg_n_60,count_cycle_reg_n_61,count_cycle_reg_n_62,count_cycle_reg_n_63}),
        .I1(\<const1> ),
        .O({count_cycle0_i_n_0,count_cycle0_i_n_1,count_cycle0_i_n_2,count_cycle0_i_n_3,count_cycle0_i_n_4,count_cycle0_i_n_5,count_cycle0_i_n_6,count_cycle0_i_n_7,count_cycle0_i_n_8,count_cycle0_i_n_9,count_cycle0_i_n_10,count_cycle0_i_n_11,count_cycle0_i_n_12,count_cycle0_i_n_13,count_cycle0_i_n_14,count_cycle0_i_n_15,count_cycle0_i_n_16,count_cycle0_i_n_17,count_cycle0_i_n_18,count_cycle0_i_n_19,count_cycle0_i_n_20,count_cycle0_i_n_21,count_cycle0_i_n_22,count_cycle0_i_n_23,count_cycle0_i_n_24,count_cycle0_i_n_25,count_cycle0_i_n_26,count_cycle0_i_n_27,count_cycle0_i_n_28,count_cycle0_i_n_29,count_cycle0_i_n_30,count_cycle0_i_n_31,count_cycle0_i_n_32,count_cycle0_i_n_33,count_cycle0_i_n_34,count_cycle0_i_n_35,count_cycle0_i_n_36,count_cycle0_i_n_37,count_cycle0_i_n_38,count_cycle0_i_n_39,count_cycle0_i_n_40,count_cycle0_i_n_41,count_cycle0_i_n_42,count_cycle0_i_n_43,count_cycle0_i_n_44,count_cycle0_i_n_45,count_cycle0_i_n_46,count_cycle0_i_n_47,count_cycle0_i_n_48,count_cycle0_i_n_49,count_cycle0_i_n_50,count_cycle0_i_n_51,count_cycle0_i_n_52,count_cycle0_i_n_53,count_cycle0_i_n_54,count_cycle0_i_n_55,count_cycle0_i_n_56,count_cycle0_i_n_57,count_cycle0_i_n_58,count_cycle0_i_n_59,count_cycle0_i_n_60,count_cycle0_i_n_61,count_cycle0_i_n_62,count_cycle0_i_n_63}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1187072" *) 
  (* map_to_module = "375" *) 
  RTL_MUX2 count_cycle0_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(count_cycle0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[0] 
       (.C(clk),
        .D(count_cycle0_i_n_63),
        .Q(count_cycle_reg_n_63),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[10] 
       (.C(clk),
        .D(count_cycle0_i_n_53),
        .Q(count_cycle_reg_n_53),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[11] 
       (.C(clk),
        .D(count_cycle0_i_n_52),
        .Q(count_cycle_reg_n_52),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[12] 
       (.C(clk),
        .D(count_cycle0_i_n_51),
        .Q(count_cycle_reg_n_51),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[13] 
       (.C(clk),
        .D(count_cycle0_i_n_50),
        .Q(count_cycle_reg_n_50),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[14] 
       (.C(clk),
        .D(count_cycle0_i_n_49),
        .Q(count_cycle_reg_n_49),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[15] 
       (.C(clk),
        .D(count_cycle0_i_n_48),
        .Q(count_cycle_reg_n_48),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[16] 
       (.C(clk),
        .D(count_cycle0_i_n_47),
        .Q(count_cycle_reg_n_47),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[17] 
       (.C(clk),
        .D(count_cycle0_i_n_46),
        .Q(count_cycle_reg_n_46),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[18] 
       (.C(clk),
        .D(count_cycle0_i_n_45),
        .Q(count_cycle_reg_n_45),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[19] 
       (.C(clk),
        .D(count_cycle0_i_n_44),
        .Q(count_cycle_reg_n_44),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[1] 
       (.C(clk),
        .D(count_cycle0_i_n_62),
        .Q(count_cycle_reg_n_62),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[20] 
       (.C(clk),
        .D(count_cycle0_i_n_43),
        .Q(count_cycle_reg_n_43),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[21] 
       (.C(clk),
        .D(count_cycle0_i_n_42),
        .Q(count_cycle_reg_n_42),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[22] 
       (.C(clk),
        .D(count_cycle0_i_n_41),
        .Q(count_cycle_reg_n_41),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[23] 
       (.C(clk),
        .D(count_cycle0_i_n_40),
        .Q(count_cycle_reg_n_40),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[24] 
       (.C(clk),
        .D(count_cycle0_i_n_39),
        .Q(count_cycle_reg_n_39),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[25] 
       (.C(clk),
        .D(count_cycle0_i_n_38),
        .Q(count_cycle_reg_n_38),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[26] 
       (.C(clk),
        .D(count_cycle0_i_n_37),
        .Q(count_cycle_reg_n_37),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[27] 
       (.C(clk),
        .D(count_cycle0_i_n_36),
        .Q(count_cycle_reg_n_36),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[28] 
       (.C(clk),
        .D(count_cycle0_i_n_35),
        .Q(count_cycle_reg_n_35),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[29] 
       (.C(clk),
        .D(count_cycle0_i_n_34),
        .Q(count_cycle_reg_n_34),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[2] 
       (.C(clk),
        .D(count_cycle0_i_n_61),
        .Q(count_cycle_reg_n_61),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[30] 
       (.C(clk),
        .D(count_cycle0_i_n_33),
        .Q(count_cycle_reg_n_33),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[31] 
       (.C(clk),
        .D(count_cycle0_i_n_32),
        .Q(count_cycle_reg_n_32),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[32] 
       (.C(clk),
        .D(count_cycle0_i_n_31),
        .Q(p_1_in[0]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[33] 
       (.C(clk),
        .D(count_cycle0_i_n_30),
        .Q(p_1_in[1]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[34] 
       (.C(clk),
        .D(count_cycle0_i_n_29),
        .Q(p_1_in[2]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[35] 
       (.C(clk),
        .D(count_cycle0_i_n_28),
        .Q(p_1_in[3]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[36] 
       (.C(clk),
        .D(count_cycle0_i_n_27),
        .Q(p_1_in[4]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[37] 
       (.C(clk),
        .D(count_cycle0_i_n_26),
        .Q(p_1_in[5]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[38] 
       (.C(clk),
        .D(count_cycle0_i_n_25),
        .Q(p_1_in[6]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[39] 
       (.C(clk),
        .D(count_cycle0_i_n_24),
        .Q(p_1_in[7]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[3] 
       (.C(clk),
        .D(count_cycle0_i_n_60),
        .Q(count_cycle_reg_n_60),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[40] 
       (.C(clk),
        .D(count_cycle0_i_n_23),
        .Q(p_1_in[8]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[41] 
       (.C(clk),
        .D(count_cycle0_i_n_22),
        .Q(p_1_in[9]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[42] 
       (.C(clk),
        .D(count_cycle0_i_n_21),
        .Q(p_1_in[10]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[43] 
       (.C(clk),
        .D(count_cycle0_i_n_20),
        .Q(p_1_in[11]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[44] 
       (.C(clk),
        .D(count_cycle0_i_n_19),
        .Q(p_1_in[12]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[45] 
       (.C(clk),
        .D(count_cycle0_i_n_18),
        .Q(p_1_in[13]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[46] 
       (.C(clk),
        .D(count_cycle0_i_n_17),
        .Q(p_1_in[14]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[47] 
       (.C(clk),
        .D(count_cycle0_i_n_16),
        .Q(p_1_in[15]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[48] 
       (.C(clk),
        .D(count_cycle0_i_n_15),
        .Q(p_1_in[16]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[49] 
       (.C(clk),
        .D(count_cycle0_i_n_14),
        .Q(p_1_in[17]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[4] 
       (.C(clk),
        .D(count_cycle0_i_n_59),
        .Q(count_cycle_reg_n_59),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[50] 
       (.C(clk),
        .D(count_cycle0_i_n_13),
        .Q(p_1_in[18]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[51] 
       (.C(clk),
        .D(count_cycle0_i_n_12),
        .Q(p_1_in[19]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[52] 
       (.C(clk),
        .D(count_cycle0_i_n_11),
        .Q(p_1_in[20]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[53] 
       (.C(clk),
        .D(count_cycle0_i_n_10),
        .Q(p_1_in[21]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[54] 
       (.C(clk),
        .D(count_cycle0_i_n_9),
        .Q(p_1_in[22]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[55] 
       (.C(clk),
        .D(count_cycle0_i_n_8),
        .Q(p_1_in[23]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[56] 
       (.C(clk),
        .D(count_cycle0_i_n_7),
        .Q(p_1_in[24]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[57] 
       (.C(clk),
        .D(count_cycle0_i_n_6),
        .Q(p_1_in[25]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[58] 
       (.C(clk),
        .D(count_cycle0_i_n_5),
        .Q(p_1_in[26]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[59] 
       (.C(clk),
        .D(count_cycle0_i_n_4),
        .Q(p_1_in[27]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[5] 
       (.C(clk),
        .D(count_cycle0_i_n_58),
        .Q(count_cycle_reg_n_58),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[60] 
       (.C(clk),
        .D(count_cycle0_i_n_3),
        .Q(p_1_in[28]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[61] 
       (.C(clk),
        .D(count_cycle0_i_n_2),
        .Q(p_1_in[29]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[62] 
       (.C(clk),
        .D(count_cycle0_i_n_1),
        .Q(p_1_in[30]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[63] 
       (.C(clk),
        .D(count_cycle0_i_n_0),
        .Q(p_1_in[31]),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[6] 
       (.C(clk),
        .D(count_cycle0_i_n_57),
        .Q(count_cycle_reg_n_57),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[7] 
       (.C(clk),
        .D(count_cycle0_i_n_56),
        .Q(count_cycle_reg_n_56),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[8] 
       (.C(clk),
        .D(count_cycle0_i_n_55),
        .Q(count_cycle_reg_n_55),
        .RST(count_cycle0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "256" *) 
  RTL_REG_SYNC__BREG_1 \count_cycle_reg[9] 
       (.C(clk),
        .D(count_cycle0_i_n_54),
        .Q(count_cycle_reg_n_54),
        .RST(count_cycle0));
  (* XLNX_LINE_COL = "1380352" *) 
  (* map_to_module = "718" *) 
  RTL_ADD34 count_instr0_i
       (.I0(count_instr),
        .I1(\<const1> ),
        .O(count_instr0));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "394" *) 
  RTL_MUX254 count_instr_i
       (.I0(\<const0> ),
        .I1(decoder_trigger),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(count_instr__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "395" *) 
  RTL_MUX2 count_instr_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(count_instr_i__0_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[0] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[0]),
        .Q(count_instr[0]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[10] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[10]),
        .Q(count_instr[10]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[11] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[11]),
        .Q(count_instr[11]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[12] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[12]),
        .Q(count_instr[12]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[13] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[13]),
        .Q(count_instr[13]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[14] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[14]),
        .Q(count_instr[14]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[15] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[15]),
        .Q(count_instr[15]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[16] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[16]),
        .Q(count_instr[16]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[17] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[17]),
        .Q(count_instr[17]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[18] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[18]),
        .Q(count_instr[18]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[19] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[19]),
        .Q(count_instr[19]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[1] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[1]),
        .Q(count_instr[1]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[20] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[20]),
        .Q(count_instr[20]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[21] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[21]),
        .Q(count_instr[21]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[22] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[22]),
        .Q(count_instr[22]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[23] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[23]),
        .Q(count_instr[23]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[24] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[24]),
        .Q(count_instr[24]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[25] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[25]),
        .Q(count_instr[25]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[26] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[26]),
        .Q(count_instr[26]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[27] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[27]),
        .Q(count_instr[27]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[28] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[28]),
        .Q(count_instr[28]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[29] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[29]),
        .Q(count_instr[29]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[2] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[2]),
        .Q(count_instr[2]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[30] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[30]),
        .Q(count_instr[30]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[31] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[31]),
        .Q(count_instr[31]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[32] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[32]),
        .Q(count_instr[32]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[33] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[33]),
        .Q(count_instr[33]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[34] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[34]),
        .Q(count_instr[34]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[35] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[35]),
        .Q(count_instr[35]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[36] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[36]),
        .Q(count_instr[36]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[37] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[37]),
        .Q(count_instr[37]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[38] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[38]),
        .Q(count_instr[38]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[39] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[39]),
        .Q(count_instr[39]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[3] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[3]),
        .Q(count_instr[3]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[40] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[40]),
        .Q(count_instr[40]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[41] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[41]),
        .Q(count_instr[41]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[42] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[42]),
        .Q(count_instr[42]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[43] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[43]),
        .Q(count_instr[43]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[44] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[44]),
        .Q(count_instr[44]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[45] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[45]),
        .Q(count_instr[45]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[46] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[46]),
        .Q(count_instr[46]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[47] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[47]),
        .Q(count_instr[47]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[48] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[48]),
        .Q(count_instr[48]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[49] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[49]),
        .Q(count_instr[49]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[4] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[4]),
        .Q(count_instr[4]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[50] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[50]),
        .Q(count_instr[50]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[51] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[51]),
        .Q(count_instr[51]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[52] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[52]),
        .Q(count_instr[52]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[53] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[53]),
        .Q(count_instr[53]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[54] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[54]),
        .Q(count_instr[54]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[55] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[55]),
        .Q(count_instr[55]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[56] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[56]),
        .Q(count_instr[56]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[57] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[57]),
        .Q(count_instr[57]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[58] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[58]),
        .Q(count_instr[58]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[59] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[59]),
        .Q(count_instr[59]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[5] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[5]),
        .Q(count_instr[5]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[60] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[60]),
        .Q(count_instr[60]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[61] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[61]),
        .Q(count_instr[61]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[62] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[62]),
        .Q(count_instr[62]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[63] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[63]),
        .Q(count_instr[63]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[6] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[6]),
        .Q(count_instr[6]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[7] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[7]),
        .Q(count_instr[7]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[8] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[8]),
        .Q(count_instr[8]),
        .RST(count_instr_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265216" *) 
  (* map_to_module = "263" *) 
  RTL_REG_SYNC__BREG_13 \count_instr_reg[9] 
       (.C(clk),
        .CE(count_instr__0),
        .D(count_instr0[9]),
        .Q(count_instr[9]),
        .RST(count_instr_i__0_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "437" *) 
  RTL_MUX189 cpu_state0_i
       (.I0({cpu_state_i_n_0,cpu_state_i_n_1,cpu_state_i_n_2,cpu_state_i_n_3,cpu_state_i_n_4,cpu_state_i_n_5,cpu_state_i_n_6,cpu_state_i_n_7,cpu_state_i_n_8,cpu_state_i_n_9}),
        .I1({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .I4({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> }),
        .I5({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I6({cpu_state_i__0_n_0,cpu_state_i__0_n_1,cpu_state_i__0_n_2,cpu_state_i__0_n_3,cpu_state_i__0_n_4}),
        .O({cpu_state0_i_n_0,cpu_state0_i_n_1,cpu_state0_i_n_2,cpu_state0_i_n_3,cpu_state0_i_n_4,cpu_state0_i_n_5,cpu_state0_i_n_6,cpu_state0_i_n_7,cpu_state0_i_n_8,cpu_state0_i_n_9}),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "444" *) 
  RTL_MUX155 cpu_state0_i__0
       (.I0(cpu_state_i__6_n_0),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .I6(\<const1> ),
        .O(cpu_state0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "468736" *) 
  (* map_to_module = "458" *) 
  RTL_AND1 cpu_state0_i__1
       (.I0(cpu_state1_i_n_0),
        .I1(cpu_state1_i__0_n_0),
        .O(cpu_state0_i__1_n_0));
  (* XLNX_LINE_COL = "463360" *) 
  (* map_to_module = "459" *) 
  RTL_EQ4 cpu_state1_i
       (.I0(mem_wordsize),
        .I1({\<const0> ,\<const0> }),
        .O(cpu_state1_i_n_0));
  (* XLNX_LINE_COL = "1839616" *) 
  (* map_to_module = "460" *) 
  RTL_NEQ0 cpu_state1_i__0
       (.I0(pcpi_rs1[1:0]),
        .I1({\<const0> ,\<const0> }),
        .O(cpu_state1_i__0_n_0));
  (* XLNX_LINE_COL = "468224" *) 
  (* map_to_module = "461" *) 
  RTL_AND1 cpu_state1_i__1
       (.I0(cpu_state2_i_n_0),
        .I1(cpu_state2_i__0_n_0),
        .O(cpu_state1_i__1_n_0));
  (* XLNX_LINE_COL = "408320" *) 
  (* map_to_module = "454" *) 
  RTL_AND1 cpu_state1_i__2
       (.I0(resetn),
        .I1(cpu_state2),
        .O(cpu_state1));
  (* XLNX_LINE_COL = "415744" *) 
  (* map_to_module = "456" *) 
  RTL_AND1 cpu_state1_i__3
       (.I0(cpu_state2_i__2_n_0),
        .I1(cpu_state2_i__3_n_0),
        .O(cpu_state1_i__3_n_0));
  (* XLNX_LINE_COL = "463360" *) 
  (* map_to_module = "462" *) 
  RTL_EQ4 cpu_state2_i
       (.I0(mem_wordsize),
        .I1({\<const0> ,\<const1> }),
        .O(cpu_state2_i_n_0));
  (* XLNX_LINE_COL = "1839104" *) 
  (* map_to_module = "463" *) 
  RTL_NEQ cpu_state2_i__0
       (.I0(pcpi_rs1[0]),
        .I1(\<const0> ),
        .O(cpu_state2_i__0_n_0));
  (* XLNX_LINE_COL = "2236160" *) 
  (* map_to_module = "455" *) 
  RTL_OR0 cpu_state2_i__1
       (.I0(mem_do_rdata),
        .I1(mem_do_wdata),
        .O(cpu_state2));
  (* XLNX_LINE_COL = "403712" *) 
  (* map_to_module = "457" *) 
  RTL_AND1 cpu_state2_i__2
       (.I0(resetn),
        .I1(mem_do_rinst),
        .O(cpu_state2_i__2_n_0));
  (* XLNX_LINE_COL = "5246208" *) 
  (* map_to_module = "693" *) 
  RTL_REDUCTION_OR0 cpu_state2_i__3
       (.I0(reg_pc[1:0]),
        .O(cpu_state2_i__3_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "525327" *) 
  (* map_to_module = "440" *) 
  RTL_MUX192 cpu_state_i
       (.I0({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpu_state_i_n_0,cpu_state_i_n_1,cpu_state_i_n_2,cpu_state_i_n_3,cpu_state_i_n_4,cpu_state_i_n_5,cpu_state_i_n_6,cpu_state_i_n_7,cpu_state_i_n_8,cpu_state_i_n_9}),
        .S(pcpi_int_ready));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "460821" *) 
  (* map_to_module = "438" *) 
  RTL_MUX190 cpu_state_i__0
       (.I0({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> }),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .I2({\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> }),
        .I3({\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpu_state_i__0_n_0,cpu_state_i__0_n_1,cpu_state_i__0_n_2,cpu_state_i__0_n_3,cpu_state_i__0_n_4}),
        .S0(is_sb_sh_sw),
        .S1(is_amo),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "439" *) 
  RTL_MUX191 cpu_state_i__1
       (.I0({cpu_state_i_n_0,cpu_state_i_n_1,cpu_state_i_n_2,cpu_state_i_n_3,cpu_state_i_n_4,cpu_state_i_n_5,cpu_state_i_n_6,cpu_state_i_n_7,cpu_state_i_n_8,cpu_state_i_n_9}),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> }),
        .I2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> }),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({cpu_state_i__1_n_0,cpu_state_i__1_n_1,cpu_state_i__1_n_2,cpu_state_i__1_n_3,cpu_state_i__1_n_4,cpu_state_i__1_n_5,cpu_state_i__1_n_6,cpu_state_i__1_n_7,cpu_state_i__1_n_8,cpu_state_i__1_n_9}),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "450" *) 
  RTL_MUX2 cpu_state_i__10
       (.I0(decoder_trigger1_i_n_0),
        .I1(\<const0> ),
        .O(cpu_state_i__10_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "442" *) 
  RTL_MUX254 cpu_state_i__11
       (.I0(\<const0> ),
        .I1(cpu_state_i__5_n_0),
        .I2(cpu_state0),
        .I3(cpu_state_i__7_n_0),
        .I4(cpu_state_i__8_n_0),
        .I5(cpu_state_i__9_n_0),
        .I6(cpu_state_i__10_n_0),
        .I7(cpu_state_i__10_n_0),
        .I8(cpu_state_i__10_n_0),
        .O(cpu_state6_out),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "441" *) 
  RTL_MUX2 cpu_state_i__12
       (.I0(\<const1> ),
        .I1(cpu_state6_out),
        .O(cpu_state0_out),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "197638" *) 
  (* map_to_module = "453" *) 
  RTL_MUX2 cpu_state_i__13
       (.I0(\<const1> ),
        .I1(cpu_state0_i__1_n_0),
        .O(cpu_state_i__13_n_0),
        .S(cpu_state1_i__1_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132111" *) 
  (* map_to_module = "452" *) 
  RTL_MUX2 cpu_state_i__14
       (.I0(cpu_state_i__13_n_0),
        .I1(\<const0> ),
        .O(cpu_state_i__14_n_0),
        .S(cpu_state1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132102" *) 
  (* map_to_module = "451" *) 
  RTL_MUX2 cpu_state_i__15
       (.I0(\<const1> ),
        .I1(cpu_state_i__14_n_0),
        .O(cpu_state_i__15_n_0),
        .S(cpu_state1_i__3_n_0));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0001000000,I2:S=10'b0000100000,I3:S=10'b0000010000,I4:S=10'b0000001000,I5:S=10'b0000000100,I6:S=10'b0000000001,I7:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "436" *) 
  RTL_MUX188 cpu_state_i__2
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1({cpu_state0_i_n_0,cpu_state0_i_n_1,cpu_state0_i_n_2,cpu_state0_i_n_3,cpu_state0_i_n_4,cpu_state0_i_n_5,cpu_state0_i_n_6,cpu_state0_i_n_7,cpu_state0_i_n_8,cpu_state0_i_n_9}),
        .I2({cpu_state_i__1_n_0,cpu_state_i__1_n_1,cpu_state_i__1_n_2,cpu_state_i__1_n_3,cpu_state_i__1_n_4,cpu_state_i__1_n_5,cpu_state_i__1_n_6,cpu_state_i__1_n_7,cpu_state_i__1_n_8,cpu_state_i__1_n_9}),
        .I3({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I4({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I5({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I6({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I7({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(cpu_state__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "435" *) 
  RTL_MUX192 cpu_state_i__3
       (.I0({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1(cpu_state__0),
        .O(cpu_state1_out),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328712" *) 
  (* map_to_module = "446" *) 
  RTL_MUX2 cpu_state_i__4
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(cpu_state_i__4_n_0),
        .S(instr_jal));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263187" *) 
  (* map_to_module = "445" *) 
  RTL_MUX2 cpu_state_i__5
       (.I0(cpu_state_i__4_n_0),
        .I1(\<const0> ),
        .O(cpu_state_i__5_n_0),
        .S(decoder_trigger));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "525327" *) 
  (* map_to_module = "447" *) 
  RTL_MUX2 cpu_state_i__6
       (.I0(\<const1> ),
        .I1(pcpi_valid1),
        .O(cpu_state_i__6_n_0),
        .S(pcpi_int_ready));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "443" *) 
  RTL_MUX156 cpu_state_i__7
       (.I0(cpu_state_i__6_n_0),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .O(cpu_state_i__7_n_0),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "448" *) 
  RTL_MUX2 cpu_state_i__8
       (.I0(mem_done),
        .I1(\<const1> ),
        .O(cpu_state_i__8_n_0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b1" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "449" *) 
  RTL_ROM18 cpu_state_i__9
       (.A(reg_sh),
        .O(cpu_state_i__9_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[0] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[0]),
        .Q(cpu_state[0]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[1] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[1]),
        .Q(cpu_state[1]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[2] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[2]),
        .Q(cpu_state[2]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[3] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[3]),
        .Q(cpu_state[3]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[4] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[4]),
        .Q(cpu_state[4]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[5] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[5]),
        .Q(cpu_state[5]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[6] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[6]),
        .Q(cpu_state[6]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[7] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[7]),
        .Q(cpu_state[7]),
        .RST(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[8] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[8]),
        .Q(cpu_state[8]),
        .SET(cpu_state_i__15_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1772032" *) 
  (* map_to_module = "272" *) 
  RTL_REG_SYNC__BREG_22 \cpu_state_reg[9] 
       (.C(clk),
        .CE(cpu_state0_out),
        .D(cpu_state1_out[9]),
        .Q(cpu_state[9]),
        .RST(cpu_state_i__15_n_0));
  (* XLNX_LINE_COL = "201728" *) 
  (* map_to_module = "169" *) 
  RTL_RAM cpuregs_reg
       (.RA1(decoded_rs1),
        .RA2(decoded_rs2),
        .RO1(reg_op12),
        .RO2(reg_sh2),
        .WA3(latched_rd),
        .WCLK(clk),
        .WD3(cpuregs_wrdata),
        .WE3(p_1_out));
  (* SEL_VAL = "I0:S=10'b0010000000,I1:S=default" *) 
  (* XLNX_LINE_COL = "132116" *) 
  (* map_to_module = "290" *) 
  RTL_MUX161 cpuregs_write_i
       (.I0(RTL_MUX_n_0),
        .I1(\<const0> ),
        .O(cpuregs_write),
        .S(cpu_state));
  (* XLNX_LINE_COL = "1317120" *) 
  (* map_to_module = "669" *) 
  RTL_LSHIFT4 decoded_imm0_i
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata_q[31:12]}),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> }),
        .I2(\<const1> ),
        .O(decoded_imm0));
  (* XLNX_LINE_COL = "268800" *) 
  (* map_to_module = "667" *) 
  RTL_REDUCTION_OR0 decoded_imm1_i
       (.I0({instr_lui,instr_auipc}),
        .O(decoded_imm1));
  (* XLNX_LINE_COL = "275200" *) 
  (* map_to_module = "668" *) 
  RTL_REDUCTION_OR2 decoded_imm1_i__0
       (.I0({instr_jalr,is_lb_lh_lw_lbu_lhu,is_alu_reg_imm}),
        .O(decoded_imm1_i__0_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:default" *) 
  (* XLNX_LINE_COL = "198670" *) 
  (* map_to_module = "350" *) 
  RTL_MUX112 decoded_imm_i
       (.I0(decoded_imm_uj),
        .I1(decoded_imm0),
        .I2({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31:20]}),
        .I3({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[7],mem_rdata_q[30:25],mem_rdata_q[11:8],\<const0> }),
        .I4({mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31],mem_rdata_q[31:25],mem_rdata_q[11:7]}),
        .I5({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(decoded_imm__0),
        .S0(instr_jal),
        .S1(decoded_imm1),
        .S2(decoded_imm1_i__0_n_0),
        .S3(is_beq_bne_blt_bge_bltu_bgeu),
        .S4(is_sb_sh_sw));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[0] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[0]),
        .Q(decoded_imm[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[10] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[10]),
        .Q(decoded_imm[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[11] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[11]),
        .Q(decoded_imm[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[12] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[12]),
        .Q(decoded_imm[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[13] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[13]),
        .Q(decoded_imm[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[14] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[14]),
        .Q(decoded_imm[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[15] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[15]),
        .Q(decoded_imm[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[16] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[16]),
        .Q(decoded_imm[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[17] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[17]),
        .Q(decoded_imm[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[18] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[18]),
        .Q(decoded_imm[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[19] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[19]),
        .Q(decoded_imm[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[1] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[1]),
        .Q(decoded_imm[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[20] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[20]),
        .Q(decoded_imm[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[21] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[21]),
        .Q(decoded_imm[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[22] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[22]),
        .Q(decoded_imm[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[23] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[23]),
        .Q(decoded_imm[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[24] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[24]),
        .Q(decoded_imm[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[25] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[25]),
        .Q(decoded_imm[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[26] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[26]),
        .Q(decoded_imm[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[27] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[27]),
        .Q(decoded_imm[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[28] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[28]),
        .Q(decoded_imm[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[29] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[29]),
        .Q(decoded_imm[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[2] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[2]),
        .Q(decoded_imm[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[30] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[30]),
        .Q(decoded_imm[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[31] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[31]),
        .Q(decoded_imm[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[3] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[3]),
        .Q(decoded_imm[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[4] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[4]),
        .Q(decoded_imm[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[5] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[5]),
        .Q(decoded_imm[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[6] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[6]),
        .Q(decoded_imm[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[7] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[7]),
        .Q(decoded_imm[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[8] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[8]),
        .Q(decoded_imm[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "330752" *) 
  (* map_to_module = "249" *) 
  RTL_REG__BREG_11 \decoded_imm_reg[9] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(decoded_imm__0[9]),
        .Q(decoded_imm[9]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[0] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(\<const0> ),
        .Q(decoded_imm_uj[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[10] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_1),
        .Q(decoded_imm_uj[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[11] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_11),
        .Q(decoded_imm_uj[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[12] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_19),
        .Q(decoded_imm_uj[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[13] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_18),
        .Q(decoded_imm_uj[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[14] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_17),
        .Q(decoded_imm_uj[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[15] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_16),
        .Q(decoded_imm_uj[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[16] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_15),
        .Q(decoded_imm_uj[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[17] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_14),
        .Q(decoded_imm_uj[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[18] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_13),
        .Q(decoded_imm_uj[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[19] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_12),
        .Q(decoded_imm_uj[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[1] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_10),
        .Q(decoded_imm_uj[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[20] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[21] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[22] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[23] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[24] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[25] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[26] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[27] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[28] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[29] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[2] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_9),
        .Q(decoded_imm_uj[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[30] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[31] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_0),
        .Q(decoded_imm_uj[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[3] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_8),
        .Q(decoded_imm_uj[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[4] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_7),
        .Q(decoded_imm_uj[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[5] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_6),
        .Q(decoded_imm_uj[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[6] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_5),
        .Q(decoded_imm_uj[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[7] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_4),
        .Q(decoded_imm_uj[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[8] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_3),
        .Q(decoded_imm_uj[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "333312" *) 
  (* map_to_module = "197" *) 
  RTL_REG__BREG_11 \decoded_imm_uj_reg[9] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_2),
        .Q(decoded_imm_uj[9]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "198" *) 
  RTL_REG__BREG_11 \decoded_rd_reg[0] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_24),
        .Q(decoded_rd[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "198" *) 
  RTL_REG__BREG_11 \decoded_rd_reg[1] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_23),
        .Q(decoded_rd[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "198" *) 
  RTL_REG__BREG_11 \decoded_rd_reg[2] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_22),
        .Q(decoded_rd[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "198" *) 
  RTL_REG__BREG_11 \decoded_rd_reg[3] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_21),
        .Q(decoded_rd[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "198" *) 
  RTL_REG__BREG_11 \decoded_rd_reg[4] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_20),
        .Q(decoded_rd[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "199" *) 
  RTL_REG__BREG_11 \decoded_rs1_reg[0] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_16),
        .Q(decoded_rs1[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "199" *) 
  RTL_REG__BREG_11 \decoded_rs1_reg[1] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_15),
        .Q(decoded_rs1[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "199" *) 
  RTL_REG__BREG_11 \decoded_rs1_reg[2] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_14),
        .Q(decoded_rs1[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "199" *) 
  RTL_REG__BREG_11 \decoded_rs1_reg[3] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_13),
        .Q(decoded_rs1[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "199" *) 
  RTL_REG__BREG_11 \decoded_rs1_reg[4] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_12),
        .Q(decoded_rs1[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "200" *) 
  RTL_REG__BREG_11 \decoded_rs2_reg[0] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_11),
        .Q(decoded_rs2[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "200" *) 
  RTL_REG__BREG_11 \decoded_rs2_reg[1] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_10),
        .Q(decoded_rs2[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "200" *) 
  RTL_REG__BREG_11 \decoded_rs2_reg[2] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_9),
        .Q(decoded_rs2[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "200" *) 
  RTL_REG__BREG_11 \decoded_rs2_reg[3] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_8),
        .Q(decoded_rs2[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "200" *) 
  RTL_REG__BREG_11 \decoded_rs2_reg[4] 
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(mem_rdata_q0_i_n_7),
        .Q(decoded_rs2[4]));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "383" *) 
  RTL_MUX2 decoder_pseudo_trigger_i
       (.I0(decoder_trigger1_i_n_0),
        .I1(\<const0> ),
        .O(decoder_pseudo_trigger_i_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "382" *) 
  RTL_MUX254 decoder_pseudo_trigger_i__0
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(decoder_pseudo_trigger_i_n_0),
        .I7(decoder_pseudo_trigger_i_n_0),
        .I8(decoder_pseudo_trigger_i_n_0),
        .O(decoder_pseudo_trigger__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "384" *) 
  RTL_MUX2 decoder_pseudo_trigger_i__1
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(decoder_pseudo_trigger_i__1_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "136960" *) 
  (* map_to_module = "258" *) 
  RTL_REG_SYNC__BREG_1 decoder_pseudo_trigger_reg
       (.C(clk),
        .D(decoder_pseudo_trigger__0),
        .Q(decoder_pseudo_trigger),
        .RST(decoder_pseudo_trigger_i__1_n_0));
  (* XLNX_LINE_COL = "597248" *) 
  (* map_to_module = "689" *) 
  RTL_AND1 decoder_trigger1_i
       (.I0(decoder_trigger2_i_n_0),
        .I1(mem_done),
        .O(decoder_trigger1_i_n_0));
  (* XLNX_LINE_COL = "531712" *) 
  (* map_to_module = "687" *) 
  RTL_OR0 decoder_trigger1_i__0
       (.I0(decoder_trigger2_i_n_0),
        .I1(mem_done),
        .O(decoder_trigger1));
  (* XLNX_LINE_COL = "528640" *) 
  (* map_to_module = "688" *) 
  RTL_INV0 decoder_trigger2_i
       (.I0(mem_do_prefetch),
        .O(decoder_trigger2_i_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328707" *) 
  (* map_to_module = "379" *) 
  RTL_MUX2 decoder_trigger_i
       (.I0(\<const0> ),
        .I1(instr_lui0_i__0_n_0),
        .O(decoder_trigger_i_n_0),
        .S(alu_out_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "378" *) 
  RTL_MUX2 decoder_trigger_i__0
       (.I0(decoder_trigger_i_n_0),
        .I1(instr_lui0_i__0_n_0),
        .O(decoder_trigger_i__0_n_0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328708" *) 
  (* map_to_module = "381" *) 
  RTL_MUX2 decoder_trigger_i__1
       (.I0(\<const1> ),
        .I1(instr_lui0_i__0_n_0),
        .O(decoder_trigger_i__1_n_0),
        .S(decoder_trigger1_i_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "380" *) 
  RTL_MUX2 decoder_trigger_i__2
       (.I0(decoder_trigger_i__1_n_0),
        .I1(instr_lui0_i__0_n_0),
        .O(decoder_trigger_i__2_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "377" *) 
  RTL_MUX254 decoder_trigger_i__3
       (.I0(instr_lui0_i__0_n_0),
        .I1(instr_lui0_i__0_n_0),
        .I2(instr_lui0_i__0_n_0),
        .I3(instr_lui0_i__0_n_0),
        .I4(decoder_trigger_i__0_n_0),
        .I5(instr_lui0_i__0_n_0),
        .I6(decoder_trigger_i__2_n_0),
        .I7(decoder_trigger_i__2_n_0),
        .I8(decoder_trigger_i__2_n_0),
        .O(decoder_trigger_i__3_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "376" *) 
  RTL_MUX2 decoder_trigger_i__4
       (.I0(instr_lui0_i__0_n_0),
        .I1(decoder_trigger_i__3_n_0),
        .O(decoder_trigger__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3870720" *) 
  (* map_to_module = "257" *) 
  RTL_REG__BREG_5 decoder_trigger_reg
       (.C(clk),
        .D(decoder_trigger__0),
        .Q(decoder_trigger));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133888" *) 
  (* map_to_module = "259" *) 
  RTL_REG__BREG_5 do_waitirq_reg
       (.C(clk),
        .D(\<const0> ),
        .Q(trace_valid));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "434" *) 
  RTL_MUX2 eoi_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(eoi_i_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[0] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[0]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[10] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[10]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[11] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[11]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[12] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[12]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[13] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[13]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[14] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[14]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[15] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[15]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[16] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[16]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[17] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[17]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[18] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[18]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[19] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[19]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[1] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[1]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[20] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[20]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[21] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[21]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[22] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[22]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[23] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[23]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[24] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[24]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[25] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[25]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[26] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[26]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[27] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[27]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[28] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[28]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[29] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[29]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[2] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[2]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[30] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[30]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[31] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[31]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[3] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[3]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[4] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[4]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[5] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[5]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[6] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[6]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[7] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[7]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[8] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[8]),
        .RST(eoi_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "271" *) 
  RTL_REG_SYNC__BREG_140 \eoi_reg[9] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(eoi[9]),
        .RST(eoi_i_n_0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "621" *) 
  RTL_AND1 instr_add0_i
       (.I0(instr_add1_i_n_0),
        .I1(p_2_in),
        .O(instr_add0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "622" *) 
  RTL_AND1 instr_add1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_beq1_i_n_0),
        .O(instr_add1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "340" *) 
  RTL_MUX2 instr_add_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_add__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "6621696" *) 
  (* map_to_module = "227" *) 
  RTL_REG_SYNC__BREG_13 instr_add_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_add0),
        .Q(instr_add),
        .RST(instr_add__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "607" *) 
  RTL_AND1 instr_addi0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_beq1_i_n_0),
        .O(instr_addi0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "334" *) 
  RTL_MUX2 instr_addi_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_addi__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5835520" *) 
  (* map_to_module = "218" *) 
  RTL_REG_SYNC__BREG_13 instr_addi_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_addi0),
        .Q(instr_addi),
        .RST(instr_addi__0));
  (* INIT_VAL = "INIT_DEFAULT:4'bxxxx,INIT_1:4'b0011,INIT_0:4'b0100,INIT_4:4'b0111,INIT_12:4'b0101,INIT_8:4'b0110,INIT_16:4'b1010,INIT_20:4'b1000,INIT_24:4'b1011,INIT_28:4'b1001" *) 
  (* XLNX_LINE_COL = "1050655" *) 
  (* map_to_module = "330" *) 
  RTL_ROM9 instr_amo_op_i
       (.A(mem_rdata_q[31:27]),
        .O(instr_amo_op));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "787492" *) 
  (* map_to_module = "333" *) 
  RTL_MUX2 instr_amo_op_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_amo_op_i__0_n_0),
        .S(is_amo));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132224" *) 
  (* map_to_module = "332" *) 
  RTL_MUX2 instr_amo_op_i__1
       (.I0(instr_amo_op_i__0_n_0),
        .I1(\<const0> ),
        .O(instr_amo_op_i__1_n_0),
        .S(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "331" *) 
  RTL_MUX2 instr_amo_op_i__2
       (.I0(\<const1> ),
        .I1(instr_amo_op_i__1_n_0),
        .O(instr_amo_op_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1576192" *) 
  (* map_to_module = "217" *) 
  RTL_REG_SYNC__BREG_13 \instr_amo_op_reg[0] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_amo_op[0]),
        .Q(mem_la_amo_op[0]),
        .RST(instr_amo_op_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1576192" *) 
  (* map_to_module = "217" *) 
  RTL_REG_SYNC__BREG_13 \instr_amo_op_reg[1] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_amo_op[1]),
        .Q(mem_la_amo_op[1]),
        .RST(instr_amo_op_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1576192" *) 
  (* map_to_module = "217" *) 
  RTL_REG_SYNC__BREG_13 \instr_amo_op_reg[2] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_amo_op[2]),
        .Q(mem_la_amo_op[2]),
        .RST(instr_amo_op_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1576192" *) 
  (* map_to_module = "217" *) 
  RTL_REG_SYNC__BREG_13 \instr_amo_op_reg[3] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_amo_op[3]),
        .Q(mem_la_amo_op[3]),
        .RST(instr_amo_op_i__2_n_0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "637" *) 
  RTL_AND1 instr_and0_i
       (.I0(instr_and1),
        .I1(p_2_in),
        .O(instr_and0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "638" *) 
  RTL_AND1 instr_and1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_bgeu1_i_n_0),
        .O(instr_and1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "349" *) 
  RTL_MUX2 instr_and_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_and__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "236" *) 
  RTL_REG_SYNC__BREG_13 instr_and_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_and0),
        .Q(instr_and),
        .RST(instr_and__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "613" *) 
  RTL_AND1 instr_andi0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_bgeu1_i_n_0),
        .O(instr_andi0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "339" *) 
  RTL_MUX2 instr_andi_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_andi__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "223" *) 
  RTL_REG_SYNC__BREG_13 instr_andi_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_andi0),
        .Q(instr_andi),
        .RST(instr_andi__0));
  (* XLNX_LINE_COL = "1320192" *) 
  (* map_to_module = "575" *) 
  RTL_EQ instr_auipc0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const1> ,\<const1> }),
        .O(instr_auipc0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2296832" *) 
  (* map_to_module = "186" *) 
  RTL_REG__BREG_11 instr_auipc_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(instr_auipc0),
        .Q(instr_auipc));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "586" *) 
  RTL_AND1 instr_beq0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(instr_beq1_i_n_0),
        .O(instr_beq0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "587" *) 
  RTL_EQ12 instr_beq1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const0> ,\<const0> ,\<const0> }),
        .O(instr_beq1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "324" *) 
  RTL_MUX2 instr_beq_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_beq__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "203" *) 
  RTL_REG_SYNC__BREG_13 instr_beq_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_beq0),
        .Q(instr_beq),
        .RST(instr_beq__0));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "592" *) 
  RTL_AND1 instr_bge0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(instr_bge1_i_n_0),
        .O(instr_bge0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "593" *) 
  RTL_EQ12 instr_bge1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const1> ,\<const0> ,\<const1> }),
        .O(instr_bge1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "327" *) 
  RTL_MUX2 instr_bge_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_bge__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "206" *) 
  RTL_REG_SYNC__BREG_13 instr_bge_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_bge0),
        .Q(instr_bge),
        .RST(instr_bge__0));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "596" *) 
  RTL_AND1 instr_bgeu0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(instr_bgeu1_i_n_0),
        .O(instr_bgeu0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "597" *) 
  RTL_EQ12 instr_bgeu1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const1> ,\<const1> ,\<const1> }),
        .O(instr_bgeu1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "329" *) 
  RTL_MUX2 instr_bgeu_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_bgeu__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "208" *) 
  RTL_REG_SYNC__BREG_13 instr_bgeu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_bgeu0),
        .Q(instr_bgeu),
        .RST(instr_bgeu__0));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "590" *) 
  RTL_AND1 instr_blt0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(instr_blt1_i_n_0),
        .O(instr_blt0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "591" *) 
  RTL_EQ12 instr_blt1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const1> ,\<const0> ,\<const0> }),
        .O(instr_blt1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "326" *) 
  RTL_MUX2 instr_blt_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_blt__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2296320" *) 
  (* map_to_module = "205" *) 
  RTL_REG_SYNC__BREG_13 instr_blt_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_blt0),
        .Q(instr_blt),
        .RST(instr_blt__0));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "594" *) 
  RTL_AND1 instr_bltu0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(instr_bltu1_i_n_0),
        .O(instr_bltu0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "595" *) 
  RTL_EQ12 instr_bltu1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const1> ,\<const1> ,\<const0> }),
        .O(instr_bltu1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "328" *) 
  RTL_MUX2 instr_bltu_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_bltu__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2558720" *) 
  (* map_to_module = "207" *) 
  RTL_REG_SYNC__BREG_13 instr_bltu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_bltu0),
        .Q(instr_bltu),
        .RST(instr_bltu__0));
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "588" *) 
  RTL_AND1 instr_bne0_i
       (.I0(is_beq_bne_blt_bge_bltu_bgeu),
        .I1(p_3_in),
        .O(instr_bne0));
  (* XLNX_LINE_COL = "3284224" *) 
  (* map_to_module = "589" *) 
  RTL_EQ12 instr_bne1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const0> ,\<const0> ,\<const1> }),
        .O(p_3_in));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "325" *) 
  RTL_MUX2 instr_bne_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_bne__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "204" *) 
  RTL_REG_SYNC__BREG_13 instr_bne_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_bne0),
        .Q(instr_bne),
        .RST(instr_bne__0));
  (* XLNX_LINE_COL = "1723904" *) 
  (* map_to_module = "654" *) 
  RTL_AND1 instr_ecall_ebreak0_i
       (.I0(instr_ecall_ebreak1),
        .I1(instr_ecall_ebreak1_i__0_n_0),
        .O(instr_ecall_ebreak0));
  (* XLNX_LINE_COL = "1783296" *) 
  (* map_to_module = "655" *) 
  RTL_AND1 instr_ecall_ebreak1_i
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_ecall_ebreak2),
        .O(instr_ecall_ebreak1));
  (* XLNX_LINE_COL = "5509888" *) 
  (* map_to_module = "657" *) 
  RTL_EQ37 instr_ecall_ebreak1_i__0
       (.I0(mem_rdata_q[19:7]),
        .I1(\<const0> ),
        .O(instr_ecall_ebreak1_i__0_n_0));
  (* XLNX_LINE_COL = "4002816" *) 
  (* map_to_module = "656" *) 
  RTL_EQ36 instr_ecall_ebreak2_i
       (.I0(mem_rdata_q[31:21]),
        .I1(\<const0> ),
        .O(instr_ecall_ebreak2));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "201472" *) 
  (* map_to_module = "241" *) 
  RTL_REG__BREG_11 instr_ecall_ebreak_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_ecall_ebreak0),
        .Q(instr_ecall_ebreak));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "242" *) 
  RTL_REG_SYNC__BREG_13 instr_getq_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_getq),
        .RST(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* XLNX_LINE_COL = "1320192" *) 
  (* map_to_module = "576" *) 
  RTL_EQ instr_jal0_i
       (.I0(p_0_in),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .O(instr_jal0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3148288" *) 
  (* map_to_module = "187" *) 
  RTL_REG__BREG_11 instr_jal_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(instr_jal0),
        .Q(instr_jal));
  (* XLNX_LINE_COL = "1329920" *) 
  (* map_to_module = "577" *) 
  RTL_AND1 instr_jalr0_i
       (.I0(instr_jalr1),
        .I1(instr_jalr1_i__0_n_0),
        .O(instr_jalr0));
  (* XLNX_LINE_COL = "1320192" *) 
  (* map_to_module = "578" *) 
  RTL_EQ instr_jalr1_i
       (.I0(p_0_in),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> ,\<const1> }),
        .O(instr_jalr1));
  (* XLNX_LINE_COL = "3941120" *) 
  (* map_to_module = "579" *) 
  RTL_EQ12 instr_jalr1_i__0
       (.I0({mem_rdata_q0_i_n_17,mem_rdata_q0_i_n_18,mem_rdata_q0_i_n_19}),
        .I1({\<const0> ,\<const0> ,\<const0> }),
        .O(instr_jalr1_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5049088" *) 
  (* map_to_module = "188" *) 
  RTL_REG__BREG_11 instr_jalr_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(instr_jalr0),
        .Q(instr_jalr));
  (* XLNX_LINE_COL = "1192960" *) 
  (* map_to_module = "598" *) 
  RTL_AND1 instr_lb0_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(instr_beq1_i_n_0),
        .O(instr_lb0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "209" *) 
  RTL_REG__BREG_11 instr_lb_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_lb0),
        .Q(instr_lb));
  (* XLNX_LINE_COL = "1192960" *) 
  (* map_to_module = "602" *) 
  RTL_AND1 instr_lbu0_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(instr_blt1_i_n_0),
        .O(instr_lbu0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1378816" *) 
  (* map_to_module = "212" *) 
  RTL_REG__BREG_11 instr_lbu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_lbu0),
        .Q(instr_lbu));
  (* XLNX_LINE_COL = "1192960" *) 
  (* map_to_module = "599" *) 
  RTL_AND1 instr_lh0_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(p_3_in),
        .O(instr_lh0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "210" *) 
  RTL_REG__BREG_11 instr_lh_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_lh0),
        .Q(instr_lh));
  (* XLNX_LINE_COL = "1192960" *) 
  (* map_to_module = "603" *) 
  RTL_AND1 instr_lhu0_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(instr_bge1_i_n_0),
        .O(instr_lhu0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2099712" *) 
  (* map_to_module = "213" *) 
  RTL_REG__BREG_11 instr_lhu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_lhu0),
        .Q(instr_lhu));
  (* XLNX_LINE_COL = "1320192" *) 
  (* map_to_module = "565" *) 
  RTL_EQ instr_lui0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const1> ,\<const1> ,\<const0> ,\<const1> ,\<const1> ,\<const1> }),
        .O(instr_lui0));
  (* XLNX_LINE_COL = "399616" *) 
  (* map_to_module = "566" *) 
  RTL_AND1 instr_lui0_i__0
       (.I0(mem_do_rinst),
        .I1(mem_done),
        .O(instr_lui0_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1575424" *) 
  (* map_to_module = "185" *) 
  RTL_REG__BREG_11 instr_lui_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(instr_lui0),
        .Q(instr_lui));
  (* XLNX_LINE_COL = "1192960" *) 
  (* map_to_module = "600" *) 
  RTL_AND1 instr_lw0_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(instr_lw1_i_n_0),
        .O(instr_lw0));
  (* XLNX_LINE_COL = "2694400" *) 
  (* map_to_module = "601" *) 
  RTL_EQ12 instr_lw1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const0> ,\<const1> ,\<const0> }),
        .O(instr_lw1_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2820352" *) 
  (* map_to_module = "211" *) 
  RTL_REG__BREG_11 instr_lw_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_lw0),
        .Q(instr_lw));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "244" *) 
  RTL_REG_SYNC__BREG_13 instr_maskirq_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_maskirq),
        .RST(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "635" *) 
  RTL_AND1 instr_or0_i
       (.I0(instr_or1),
        .I1(p_2_in),
        .O(instr_or0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "636" *) 
  RTL_AND1 instr_or1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_bltu1_i_n_0),
        .O(instr_or1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "348" *) 
  RTL_MUX2 instr_or_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_or__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "235" *) 
  RTL_REG_SYNC__BREG_13 instr_or_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_or0),
        .Q(instr_or),
        .RST(instr_or__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "612" *) 
  RTL_AND1 instr_ori0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_bltu1_i_n_0),
        .O(instr_ori0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "338" *) 
  RTL_MUX2 instr_ori_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_ori__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "222" *) 
  RTL_REG_SYNC__BREG_13 instr_ori_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_ori0),
        .Q(instr_ori),
        .RST(instr_ori__0));
  (* XLNX_LINE_COL = "1397505" *) 
  (* map_to_module = "639" *) 
  RTL_OR0 instr_rdcycle0_i
       (.I0(instr_rdcycle1),
        .I1(instr_rdcycle1_i__0_n_0),
        .O(instr_rdcycle0));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "640" *) 
  RTL_AND1 instr_rdcycle1_i
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdcycle2),
        .O(instr_rdcycle1));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "641" *) 
  RTL_AND1 instr_rdcycle1_i__0
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdcycle2_i__1_n_0),
        .O(instr_rdcycle1_i__0_n_0));
  (* XLNX_LINE_COL = "1515264" *) 
  (* map_to_module = "644" *) 
  RTL_EQ instr_rdcycle2_i
       (.I0(mem_rdata_q[6:0]),
        .I1({\<const1> ,\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(instr_rdcycle2_i_n_0));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "642" *) 
  RTL_EQ35 instr_rdcycle2_i__0
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdcycle2));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "643" *) 
  RTL_EQ35 instr_rdcycle2_i__1
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdcycle2_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "237" *) 
  RTL_REG__BREG_11 instr_rdcycle_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_rdcycle0),
        .Q(instr_rdcycle));
  (* XLNX_LINE_COL = "1397505" *) 
  (* map_to_module = "645" *) 
  RTL_OR0 instr_rdcycleh0_i
       (.I0(instr_rdcycleh1),
        .I1(instr_rdcycleh1_i__0_n_0),
        .O(instr_rdcycleh0));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "646" *) 
  RTL_AND1 instr_rdcycleh1_i
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdcycleh2),
        .O(instr_rdcycleh1));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "647" *) 
  RTL_AND1 instr_rdcycleh1_i__0
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdcycleh2_i__0_n_0),
        .O(instr_rdcycleh1_i__0_n_0));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "648" *) 
  RTL_EQ35 instr_rdcycleh2_i
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdcycleh2));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "649" *) 
  RTL_EQ35 instr_rdcycleh2_i__0
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdcycleh2_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "238" *) 
  RTL_REG__BREG_11 instr_rdcycleh_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_rdcycleh0),
        .Q(instr_rdcycleh));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "650" *) 
  RTL_AND1 instr_rdinstr0_i
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdinstr1),
        .O(instr_rdinstr0));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "651" *) 
  RTL_EQ35 instr_rdinstr1_i
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdinstr1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "239" *) 
  RTL_REG__BREG_11 instr_rdinstr_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_rdinstr0),
        .Q(instr_rdinstr));
  (* XLNX_LINE_COL = "1462528" *) 
  (* map_to_module = "652" *) 
  RTL_AND1 instr_rdinstrh0_i
       (.I0(instr_rdcycle2_i_n_0),
        .I1(instr_rdinstrh1),
        .O(instr_rdinstrh0));
  (* XLNX_LINE_COL = "3747072" *) 
  (* map_to_module = "653" *) 
  RTL_EQ35 instr_rdinstrh1_i
       (.I0(mem_rdata_q[31:12]),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .O(instr_rdinstrh1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "240" *) 
  RTL_REG__BREG_11 instr_rdinstrh_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_rdinstrh0),
        .Q(instr_rdinstrh));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "189" *) 
  RTL_REG_SYNC__BREG_13 instr_retirq_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_retirq),
        .RST(instr_lui0_i__0_n_0));
  (* XLNX_LINE_COL = "1190912" *) 
  (* map_to_module = "604" *) 
  RTL_AND1 instr_sb0_i
       (.I0(is_sb_sh_sw),
        .I1(instr_beq1_i_n_0),
        .O(instr_sb0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "214" *) 
  RTL_REG__BREG_11 instr_sb_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sb0),
        .Q(instr_sb));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "243" *) 
  RTL_REG_SYNC__BREG_13 instr_setq_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_setq),
        .RST(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* XLNX_LINE_COL = "1190912" *) 
  (* map_to_module = "605" *) 
  RTL_AND1 instr_sh0_i
       (.I0(is_sb_sh_sw),
        .I1(p_3_in),
        .O(instr_sh0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "215" *) 
  RTL_REG__BREG_11 instr_sh_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sh0),
        .Q(instr_sh));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "624" *) 
  RTL_AND1 instr_sll0_i
       (.I0(instr_sll1),
        .I1(p_2_in),
        .O(instr_sll0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "625" *) 
  RTL_AND1 instr_sll1_i
       (.I0(is_alu_reg_reg),
        .I1(p_3_in),
        .O(instr_sll1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "342" *) 
  RTL_MUX2 instr_sll_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_sll__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "229" *) 
  RTL_REG_SYNC__BREG_13 instr_sll_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sll0),
        .Q(instr_sll),
        .RST(instr_sll__0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "614" *) 
  RTL_AND1 instr_slli0_i
       (.I0(instr_slli1),
        .I1(p_2_in),
        .O(instr_slli0));
  (* XLNX_LINE_COL = "4464896" *) 
  (* map_to_module = "616" *) 
  RTL_EQ instr_slli1_i
       (.I0(mem_rdata_q[31:25]),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(p_2_in));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "615" *) 
  RTL_AND1 instr_slli1_i__0
       (.I0(is_alu_reg_imm),
        .I1(p_3_in),
        .O(instr_slli1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "224" *) 
  RTL_REG__BREG_11 instr_slli_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_slli0),
        .Q(instr_slli));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "626" *) 
  RTL_AND1 instr_slt0_i
       (.I0(instr_slt1),
        .I1(p_2_in),
        .O(instr_slt0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "627" *) 
  RTL_AND1 instr_slt1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_lw1_i_n_0),
        .O(instr_slt1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "343" *) 
  RTL_MUX2 instr_slt_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_slt__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3017216" *) 
  (* map_to_module = "230" *) 
  RTL_REG_SYNC__BREG_13 instr_slt_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_slt0),
        .Q(instr_slt),
        .RST(instr_slt__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "608" *) 
  RTL_AND1 instr_slti0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_lw1_i_n_0),
        .O(instr_slti0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "335" *) 
  RTL_MUX2 instr_slti_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_slti__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1510144" *) 
  (* map_to_module = "219" *) 
  RTL_REG_SYNC__BREG_13 instr_slti_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_slti0),
        .Q(instr_slti),
        .RST(instr_slti__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "609" *) 
  RTL_AND1 instr_sltiu0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_sltiu1_i_n_0),
        .O(instr_sltiu0));
  (* XLNX_LINE_COL = "2366720" *) 
  (* map_to_module = "610" *) 
  RTL_EQ12 instr_sltiu1_i
       (.I0(mem_rdata_q[14:12]),
        .I1({\<const0> ,\<const1> ,\<const1> }),
        .O(instr_sltiu1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "336" *) 
  RTL_MUX2 instr_sltiu_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_sltiu__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1707008" *) 
  (* map_to_module = "220" *) 
  RTL_REG_SYNC__BREG_13 instr_sltiu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sltiu0),
        .Q(instr_sltiu),
        .RST(instr_sltiu__0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "628" *) 
  RTL_AND1 instr_sltu0_i
       (.I0(instr_sltu1),
        .I1(p_2_in),
        .O(instr_sltu0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "629" *) 
  RTL_AND1 instr_sltu1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_sltiu1_i_n_0),
        .O(instr_sltu1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "344" *) 
  RTL_MUX2 instr_sltu_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_sltu__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3345152" *) 
  (* map_to_module = "231" *) 
  RTL_REG_SYNC__BREG_13 instr_sltu_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sltu0),
        .Q(instr_sltu),
        .RST(instr_sltu__0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "634" *) 
  RTL_AND1 instr_sra0_i
       (.I0(instr_srl1_i_n_0),
        .I1(instr_srai1_i_n_0),
        .O(instr_sra0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "347" *) 
  RTL_MUX2 instr_sra_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_sra__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "234" *) 
  RTL_REG_SYNC__BREG_13 instr_sra_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sra0),
        .Q(instr_sra),
        .RST(instr_sra__0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "619" *) 
  RTL_AND1 instr_srai0_i
       (.I0(instr_srli1_i_n_0),
        .I1(instr_srai1_i_n_0),
        .O(instr_srai0));
  (* XLNX_LINE_COL = "4464896" *) 
  (* map_to_module = "620" *) 
  RTL_EQ instr_srai1_i
       (.I0(mem_rdata_q[31:25]),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(instr_srai1_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "226" *) 
  RTL_REG__BREG_11 instr_srai_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_srai0),
        .Q(instr_srai));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "632" *) 
  RTL_AND1 instr_srl0_i
       (.I0(instr_srl1_i_n_0),
        .I1(p_2_in),
        .O(instr_srl0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "633" *) 
  RTL_AND1 instr_srl1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_bge1_i_n_0),
        .O(instr_srl1_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "346" *) 
  RTL_MUX2 instr_srl_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_srl__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "233" *) 
  RTL_REG_SYNC__BREG_13 instr_srl_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_srl0),
        .Q(instr_srl),
        .RST(instr_srl__0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "617" *) 
  RTL_AND1 instr_srli0_i
       (.I0(instr_srli1_i_n_0),
        .I1(p_2_in),
        .O(instr_srli0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "618" *) 
  RTL_AND1 instr_srli1_i
       (.I0(is_alu_reg_imm),
        .I1(instr_bge1_i_n_0),
        .O(instr_srli1_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "225" *) 
  RTL_REG__BREG_11 instr_srli_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_srli0),
        .Q(instr_srli));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "623" *) 
  RTL_AND1 instr_sub0_i
       (.I0(instr_add1_i_n_0),
        .I1(instr_srai1_i_n_0),
        .O(instr_sub0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "341" *) 
  RTL_MUX2 instr_sub_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_sub__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "7342592" *) 
  (* map_to_module = "228" *) 
  RTL_REG_SYNC__BREG_13 instr_sub_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sub0),
        .Q(instr_sub),
        .RST(instr_sub__0));
  (* XLNX_LINE_COL = "1190912" *) 
  (* map_to_module = "606" *) 
  RTL_AND1 instr_sw0_i
       (.I0(is_sb_sh_sw),
        .I1(instr_lw1_i_n_0),
        .O(instr_sw0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "216" *) 
  RTL_REG__BREG_11 instr_sw_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_sw0),
        .Q(instr_sw));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "245" *) 
  RTL_REG_SYNC__BREG_13 instr_timer_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_timer),
        .RST(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* XLNX_LINE_COL = "5508608" *) 
  (* map_to_module = "671" *) 
  RTL_REDUCTION_OR instr_trap0_i
       (.I0(mem_la_amo_op),
        .O(instr_trap0));
  (* XLNX_LINE_COL = "3485190" *) 
  (* map_to_module = "670" *) 
  RTL_EQ38 instr_trap_i
       (.I0({instr_lui,instr_auipc,instr_jal,instr_jalr,instr_beq,instr_bne,instr_blt,instr_bge,instr_bltu,instr_bgeu,instr_lb,instr_lh,instr_lw,instr_lbu,instr_lhu,instr_sb,instr_sh,instr_sw,instr_addi,instr_slti,instr_sltiu,instr_xori,instr_ori,instr_andi,instr_slli,instr_srli,instr_srai,instr_add,instr_sub,instr_sll,instr_slt,instr_sltu,instr_xor,instr_srl,instr_sra,instr_or,instr_and,instr_rdcycle,instr_rdcycleh,instr_rdinstr,instr_rdinstrh,instr_getq,instr_setq,instr_retirq,instr_maskirq,instr_waitirq,instr_timer,instr_trap0}),
        .I1(\<const0> ),
        .O(instr_trap));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "190" *) 
  RTL_REG_SYNC__BREG_13 instr_waitirq_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(instr_waitirq),
        .RST(instr_lui0_i__0_n_0));
  (* XLNX_LINE_COL = "1200896" *) 
  (* map_to_module = "630" *) 
  RTL_AND1 instr_xor0_i
       (.I0(instr_xor1),
        .I1(p_2_in),
        .O(instr_xor0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "631" *) 
  RTL_AND1 instr_xor1_i
       (.I0(is_alu_reg_reg),
        .I1(instr_blt1_i_n_0),
        .O(instr_xor1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "345" *) 
  RTL_MUX2 instr_xor_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_xor__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199168" *) 
  (* map_to_module = "232" *) 
  RTL_REG_SYNC__BREG_13 instr_xor_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_xor0),
        .Q(instr_xor),
        .RST(instr_xor__0));
  (* XLNX_LINE_COL = "1191680" *) 
  (* map_to_module = "611" *) 
  RTL_AND1 instr_xori0_i
       (.I0(is_alu_reg_imm),
        .I1(instr_blt1_i_n_0),
        .O(instr_xori0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "337" *) 
  RTL_MUX2 instr_xori_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(instr_xori__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "221" *) 
  RTL_REG_SYNC__BREG_13 instr_xori_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(instr_xori0),
        .Q(instr_xori),
        .RST(instr_xori__0));
  (* XLNX_LINE_COL = "2303232" *) 
  (* map_to_module = "583" *) 
  RTL_EQ is_alu_reg_imm0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(is_alu_reg_imm0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "194" *) 
  RTL_REG__BREG_11 is_alu_reg_imm_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_alu_reg_imm0),
        .Q(is_alu_reg_imm));
  (* XLNX_LINE_COL = "2303232" *) 
  (* map_to_module = "584" *) 
  RTL_EQ is_alu_reg_reg0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(is_alu_reg_reg0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "195" *) 
  RTL_REG__BREG_11 is_alu_reg_reg_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_alu_reg_reg0),
        .Q(is_alu_reg_reg));
  (* XLNX_LINE_COL = "2893056" *) 
  (* map_to_module = "585" *) 
  RTL_EQ is_amo0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .O(is_amo0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "788224" *) 
  (* map_to_module = "196" *) 
  RTL_REG__BREG_11 is_amo_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_amo0),
        .Q(is_amo));
  (* XLNX_LINE_COL = "2303232" *) 
  (* map_to_module = "580" *) 
  RTL_EQ is_beq_bne_blt_bge_bltu_bgeu0_i
       (.I0(p_0_in),
        .I1({\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(is_beq_bne_blt_bge_bltu_bgeu0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "323" *) 
  RTL_MUX2 is_beq_bne_blt_bge_bltu_bgeu_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(is_beq_bne_blt_bge_bltu_bgeu__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1187072" *) 
  (* map_to_module = "191" *) 
  RTL_REG_SYNC__BREG_13 is_beq_bne_blt_bge_bltu_bgeu_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_beq_bne_blt_bge_bltu_bgeu0),
        .Q(is_beq_bne_blt_bge_bltu_bgeu),
        .RST(is_beq_bne_blt_bge_bltu_bgeu__0));
  (* XLNX_LINE_COL = "1069056" *) 
  (* map_to_module = "564" *) 
  RTL_REDUCTION_OR18 is_compare0_i
       (.I0({is_beq_bne_blt_bge_bltu_bgeu,instr_slti,instr_slt,instr_sltiu,instr_sltu}),
        .O(is_compare0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "322" *) 
  RTL_MUX2 is_compare_i
       (.I0(\<const1> ),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .O(is_compare__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133888" *) 
  (* map_to_module = "184" *) 
  RTL_REG_SYNC__BREG_1 is_compare_reg
       (.C(clk),
        .D(is_compare0),
        .Q(is_compare),
        .RST(is_compare__0));
  (* XLNX_LINE_COL = "2883591" *) 
  (* map_to_module = "663" *) 
  RTL_OR0 is_jalr_addi_slti_sltiu_xori_ori_andi0_i
       (.I0(instr_jalr),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi1),
        .O(is_jalr_addi_slti_sltiu_xori_ori_andi0));
  (* XLNX_LINE_COL = "3801095" *) 
  (* map_to_module = "664" *) 
  RTL_AND1 is_jalr_addi_slti_sltiu_xori_ori_andi1_i
       (.I0(is_alu_reg_imm),
        .I1(is_jalr_addi_slti_sltiu_xori_ori_andi2),
        .O(is_jalr_addi_slti_sltiu_xori_ori_andi1));
  (* XLNX_LINE_COL = "4980743" *) 
  (* map_to_module = "665" *) 
  RTL_REDUCTION_OR13 is_jalr_addi_slti_sltiu_xori_ori_andi2_i
       (.I0({instr_beq1_i_n_0,instr_lw1_i_n_0,instr_sltiu1_i_n_0,instr_blt1_i_n_0,instr_bltu1_i_n_0,instr_bgeu1_i_n_0}),
        .O(is_jalr_addi_slti_sltiu_xori_ori_andi2));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "206336" *) 
  (* map_to_module = "247" *) 
  RTL_REG__BREG_11 is_jalr_addi_slti_sltiu_xori_ori_andi_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(is_jalr_addi_slti_sltiu_xori_ori_andi0),
        .Q(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "2303232" *) 
  (* map_to_module = "581" *) 
  RTL_EQ is_lb_lh_lw_lbu_lhu0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(is_lb_lh_lw_lbu_lhu0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "201728" *) 
  (* map_to_module = "192" *) 
  RTL_REG__BREG_11 is_lb_lh_lw_lbu_lhu_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_lb_lh_lw_lbu_lhu0),
        .Q(is_lb_lh_lw_lbu_lhu));
  (* XLNX_LINE_COL = "1253888" *) 
  (* map_to_module = "563" *) 
  RTL_REDUCTION_OR2 is_lbu_lhu_lw0_i
       (.I0({instr_lbu,instr_lhu,instr_lw}),
        .O(is_lbu_lhu_lw0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "134656" *) 
  (* map_to_module = "183" *) 
  RTL_REG__BREG_5 is_lbu_lhu_lw_reg
       (.C(clk),
        .D(is_lbu_lhu_lw0),
        .Q(is_lbu_lhu_lw));
  (* XLNX_LINE_COL = "1451264" *) 
  (* map_to_module = "557" *) 
  RTL_REDUCTION_OR2 is_lui_auipc_jal0_i
       (.I0({instr_lui,instr_auipc,instr_jal}),
        .O(is_lui_auipc_jal0));
  (* XLNX_LINE_COL = "404224" *) 
  (* map_to_module = "559" *) 
  RTL_AND1 is_lui_auipc_jal_jalr_addi_add_sub0_i
       (.I0(decoder_trigger),
        .I1(is_lui_auipc_jal_jalr_addi_add_sub1),
        .O(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* XLNX_LINE_COL = "2642688" *) 
  (* map_to_module = "558" *) 
  RTL_REDUCTION_OR6 is_lui_auipc_jal_jalr_addi_add_sub0_i__0
       (.I0({instr_lui,instr_auipc,instr_jal,instr_jalr,instr_addi,instr_add,instr_sub}),
        .O(is_lui_auipc_jal_jalr_addi_add_sub0));
  (* XLNX_LINE_COL = "1644544" *) 
  (* map_to_module = "560" *) 
  RTL_INV0 is_lui_auipc_jal_jalr_addi_add_sub1_i
       (.I0(decoder_pseudo_trigger),
        .O(is_lui_auipc_jal_jalr_addi_add_sub1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "140032" *) 
  (* map_to_module = "180" *) 
  RTL_REG_SYNC__BREG_1 is_lui_auipc_jal_jalr_addi_add_sub_reg
       (.C(clk),
        .D(is_lui_auipc_jal_jalr_addi_add_sub0),
        .Q(is_lui_auipc_jal_jalr_addi_add_sub),
        .RST(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "135424" *) 
  (* map_to_module = "179" *) 
  RTL_REG__BREG_5 is_lui_auipc_jal_reg
       (.C(clk),
        .D(is_lui_auipc_jal0),
        .Q(is_lui_auipc_jal));
  (* XLNX_LINE_COL = "3096576" *) 
  (* map_to_module = "672" *) 
  RTL_REDUCTION_OR is_rdcycle_rdcycleh_rdinstr_rdinstrh_i
       (.I0({instr_rdcycle,instr_rdcycleh,instr_rdinstr,instr_rdinstrh}),
        .O(is_rdcycle_rdcycleh_rdinstr_rdinstrh));
  (* XLNX_LINE_COL = "2303232" *) 
  (* map_to_module = "582" *) 
  RTL_EQ is_sb_sh_sw0_i
       (.I0(p_0_in),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(is_sb_sh_sw0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "193" *) 
  RTL_REG__BREG_11 is_sb_sh_sw_reg
       (.C(clk),
        .CE(instr_lui0_i__0_n_0),
        .D(is_sb_sh_sw0),
        .Q(is_sb_sh_sw));
  (* XLNX_LINE_COL = "1376260" *) 
  (* map_to_module = "666" *) 
  RTL_AND1 is_sll_srl_sra0_i
       (.I0(is_alu_reg_reg),
        .I1(is_slli_srli_srai1_i_n_0),
        .O(is_sll_srl_sra0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "248" *) 
  RTL_REG__BREG_11 is_sll_srl_sra_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(is_sll_srl_sra0),
        .Q(is_sll_srl_sra));
  (* XLNX_LINE_COL = "1572868" *) 
  (* map_to_module = "658" *) 
  RTL_AND1 is_slli_srli_srai0_i
       (.I0(is_alu_reg_imm),
        .I1(is_slli_srli_srai1_i_n_0),
        .O(is_slli_srli_srai0));
  (* XLNX_LINE_COL = "2752516" *) 
  (* map_to_module = "659" *) 
  RTL_REDUCTION_OR2 is_slli_srli_srai1_i
       (.I0(p_4_out),
        .O(is_slli_srli_srai1_i_n_0));
  (* XLNX_LINE_COL = "278784" *) 
  (* map_to_module = "662" *) 
  RTL_AND1 is_slli_srli_srai2_i
       (.I0(instr_bge1_i_n_0),
        .I1(instr_srai1_i_n_0),
        .O(p_4_out[0]));
  (* XLNX_LINE_COL = "278784" *) 
  (* map_to_module = "661" *) 
  RTL_AND1 is_slli_srli_srai2_i__0
       (.I0(instr_bge1_i_n_0),
        .I1(p_2_in),
        .O(p_4_out[1]));
  (* XLNX_LINE_COL = "278784" *) 
  (* map_to_module = "660" *) 
  RTL_AND1 is_slli_srli_srai2_i__1
       (.I0(p_3_in),
        .I1(p_2_in),
        .O(p_4_out[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "201216" *) 
  (* map_to_module = "246" *) 
  RTL_REG__BREG_11 is_slli_srli_srai_reg
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(is_slli_srli_srai0),
        .Q(is_slli_srli_srai));
  (* XLNX_LINE_COL = "1385472" *) 
  (* map_to_module = "561" *) 
  RTL_REDUCTION_OR2 is_slti_blt_slt0_i
       (.I0({instr_slti,instr_blt,instr_slt}),
        .O(is_slti_blt_slt0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "135168" *) 
  (* map_to_module = "181" *) 
  RTL_REG__BREG_5 is_slti_blt_slt_reg
       (.C(clk),
        .D(is_slti_blt_slt0),
        .Q(is_slti_blt_slt));
  (* XLNX_LINE_COL = "1582848" *) 
  (* map_to_module = "562" *) 
  RTL_REDUCTION_OR2 is_sltiu_bltu_sltu0_i
       (.I0({instr_sltiu,instr_bltu,instr_sltu}),
        .O(is_sltiu_bltu_sltu0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "135936" *) 
  (* map_to_module = "182" *) 
  RTL_REG__BREG_5 is_sltiu_bltu_sltu_reg
       (.C(clk),
        .D(is_sltiu_bltu_sltu0),
        .Q(is_sltiu_bltu_sltu));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263187" *) 
  (* map_to_module = "409" *) 
  RTL_MUX2 latched_branch_i
       (.I0(instr_jal),
        .I1(\<const0> ),
        .O(latched_branch_i_n_0),
        .S(decoder_trigger));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "410" *) 
  RTL_MUX2 latched_branch_i__0
       (.I0(alu_out_0),
        .I1(instr_jalr),
        .O(latched_branch_i__0_n_0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000010000" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "408" *) 
  RTL_MUX161 latched_branch_i__1
       (.I0(latched_branch_i_n_0),
        .I1(latched_branch_i__0_n_0),
        .O(latched_branch__0),
        .S(cpu_state));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b0,INIT_128:1'b1,INIT_64:1'b0,INIT_32:1'b0,INIT_16:1'b1,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "411" *) 
  RTL_ROM14 latched_branch_i__2
       (.A(cpu_state),
        .O(latched_branch_i__2_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "412" *) 
  RTL_MUX2 latched_branch_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_branch_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200448" *) 
  (* map_to_module = "266" *) 
  RTL_REG_SYNC__BREG_13 latched_branch_reg
       (.C(clk),
        .CE(latched_branch_i__2_n_0),
        .D(latched_branch__0),
        .Q(latched_branch),
        .RST(latched_branch_i__3_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b0,INIT_128:1'b1,INIT_64:1'b0,INIT_32:1'b0,INIT_16:1'b0,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "496" *) 
  RTL_ROM14 latched_compr_i
       (.A(cpu_state),
        .O(latched_compr_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "495" *) 
  RTL_MUX2 latched_compr_i__0
       (.I0(\<const0> ),
        .I1(latched_compr_i_n_0),
        .O(latched_compr__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265728" *) 
  (* map_to_module = "276" *) 
  RTL_REG__BREG_11 latched_compr_reg
       (.C(clk),
        .CE(latched_compr__0),
        .D(compressed_instr),
        .Q(latched_compr));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "423" *) 
  RTL_MUX161 latched_is_lb_i
       (.I0(\<const0> ),
        .I1(instr_lb),
        .O(latched_is_lb__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "426" *) 
  RTL_MUX2 latched_is_lb_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lb_i__0_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "425" *) 
  RTL_MUX2 latched_is_lb_i__1
       (.I0(latched_is_lb_i__0_n_0),
        .I1(\<const0> ),
        .O(latched_is_lb_i__1_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "424" *) 
  RTL_MUX254 latched_is_lb_i__2
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(latched_is_lb_i__1_n_0),
        .O(latched_is_lb_i__2_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "427" *) 
  RTL_MUX2 latched_is_lb_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lb_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "269" *) 
  RTL_REG_SYNC__BREG_13 latched_is_lb_reg
       (.C(clk),
        .CE(latched_is_lb_i__2_n_0),
        .D(latched_is_lb__0),
        .Q(latched_is_lb),
        .RST(latched_is_lb_i__3_n_0));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "418" *) 
  RTL_MUX161 latched_is_lh_i
       (.I0(\<const0> ),
        .I1(instr_lh),
        .O(latched_is_lh__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "421" *) 
  RTL_MUX2 latched_is_lh_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lh_i__0_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "420" *) 
  RTL_MUX2 latched_is_lh_i__1
       (.I0(latched_is_lh_i__0_n_0),
        .I1(\<const0> ),
        .O(latched_is_lh_i__1_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "419" *) 
  RTL_MUX254 latched_is_lh_i__2
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(latched_is_lh_i__1_n_0),
        .O(latched_is_lh_i__2_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "422" *) 
  RTL_MUX2 latched_is_lh_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lh_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "268" *) 
  RTL_REG_SYNC__BREG_13 latched_is_lh_reg
       (.C(clk),
        .CE(latched_is_lh_i__2_n_0),
        .D(latched_is_lh__0),
        .Q(latched_is_lh),
        .RST(latched_is_lh_i__3_n_0));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "413" *) 
  RTL_MUX161 latched_is_lu_i
       (.I0(\<const0> ),
        .I1(is_lbu_lhu_lw),
        .O(latched_is_lu__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "416" *) 
  RTL_MUX2 latched_is_lu_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lu_i__0_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "415" *) 
  RTL_MUX2 latched_is_lu_i__1
       (.I0(latched_is_lu_i__0_n_0),
        .I1(\<const0> ),
        .O(latched_is_lu_i__1_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "414" *) 
  RTL_MUX254 latched_is_lu_i__2
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(latched_is_lu_i__1_n_0),
        .O(latched_is_lu_i__2_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "417" *) 
  RTL_MUX2 latched_is_lu_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_is_lu_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "267" *) 
  RTL_REG_SYNC__BREG_13 latched_is_lu_reg
       (.C(clk),
        .CE(latched_is_lu_i__2_n_0),
        .D(latched_is_lu__0),
        .Q(latched_is_lu),
        .RST(latched_is_lu_i__3_n_0));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000010000" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "492" *) 
  RTL_MUX229 latched_rd_i
       (.I0(decoded_rd),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(latched_rd__0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "494" *) 
  RTL_MUX254 latched_rd_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(is_beq_bne_blt_bge_bltu_bgeu),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(latched_rd_i__0_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "493" *) 
  RTL_MUX2 latched_rd_i__1
       (.I0(\<const0> ),
        .I1(latched_rd_i__0_n_0),
        .O(latched_rd_i__1_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264960" *) 
  (* map_to_module = "275" *) 
  RTL_REG__BREG_11 \latched_rd_reg[0] 
       (.C(clk),
        .CE(latched_rd_i__1_n_0),
        .D(latched_rd__0[0]),
        .Q(latched_rd[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264960" *) 
  (* map_to_module = "275" *) 
  RTL_REG__BREG_11 \latched_rd_reg[1] 
       (.C(clk),
        .CE(latched_rd_i__1_n_0),
        .D(latched_rd__0[1]),
        .Q(latched_rd[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264960" *) 
  (* map_to_module = "275" *) 
  RTL_REG__BREG_11 \latched_rd_reg[2] 
       (.C(clk),
        .CE(latched_rd_i__1_n_0),
        .D(latched_rd__0[2]),
        .Q(latched_rd[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264960" *) 
  (* map_to_module = "275" *) 
  RTL_REG__BREG_11 \latched_rd_reg[3] 
       (.C(clk),
        .CE(latched_rd_i__1_n_0),
        .D(latched_rd__0[3]),
        .Q(latched_rd[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264960" *) 
  (* map_to_module = "275" *) 
  RTL_REG__BREG_11 \latched_rd_reg[4] 
       (.C(clk),
        .CE(latched_rd_i__1_n_0),
        .D(latched_rd__0[4]),
        .Q(latched_rd[4]));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'bx,INIT_128:1'b0,INIT_64:1'bx,INIT_32:1'bx,INIT_16:1'b1,INIT_8:1'bx,INIT_4:1'bx,INIT_1:1'bx,INIT_2:1'bx" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "404" *) 
  RTL_ROM14 latched_stalu_i
       (.A(cpu_state),
        .O(latched_stalu__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "406" *) 
  RTL_MUX2 latched_stalu_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(latched_stalu_i__0_n_0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "405" *) 
  RTL_MUX254 latched_stalu_i__1
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(latched_stalu_i__0_n_0),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(latched_stalu_i__1_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "407" *) 
  RTL_MUX2 latched_stalu_i__2
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_stalu_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "265" *) 
  RTL_REG_SYNC__BREG_13 latched_stalu_reg
       (.C(clk),
        .CE(latched_stalu_i__1_n_0),
        .D(latched_stalu__0),
        .Q(latched_stalu),
        .RST(latched_stalu_i__2_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "397" *) 
  RTL_MUX151 latched_store0_i
       (.I0(pcpi_int_wr),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .O(latched_store0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "401" *) 
  RTL_MUX155 latched_store0_i__0
       (.I0(pcpi_int_ready),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .O(latched_store0_i__0_n_0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "1273344" *) 
  (* map_to_module = "691" *) 
  RTL_REDUCTION_OR2 latched_store1_i
       (.I0({\<const0> ,pcpi_mul_ready,pcpi_div_ready}),
        .O(pcpi_int_ready));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "398" *) 
  RTL_MUX152 latched_store1_i__0
       (.I0(pcpi_mul_wr),
        .I1(pcpi_div_wr),
        .I2(\<const0> ),
        .O(pcpi_int_wr),
        .S0(pcpi_mul_ready),
        .S1(pcpi_div_ready));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "399" *) 
  RTL_MUX2 latched_store_i
       (.I0(alu_out_0),
        .I1(\<const1> ),
        .O(latched_store__0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0001000000,I2:S=10'b0000100000,I3:S=10'b0000010000,I4:S=10'b0000001000,I5:S=10'b0000000001,I6:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "396" *) 
  RTL_MUX150 latched_store_i__0
       (.I0(\<const0> ),
        .I1(latched_store0),
        .I2(pcpi_int_wr),
        .I3(latched_store__0),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .I6(\<const1> ),
        .O(latched_store1_out),
        .S(cpu_state));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "402" *) 
  RTL_MUX156 latched_store_i__1
       (.I0(pcpi_int_ready),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .O(latched_store_i__1_n_0),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "400" *) 
  RTL_MUX254 latched_store_i__2
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(latched_store0_i__0_n_0),
        .I3(latched_store_i__1_n_0),
        .I4(\<const1> ),
        .I5(\<const1> ),
        .I6(\<const0> ),
        .I7(\<const1> ),
        .I8(\<const1> ),
        .O(latched_store_i__2_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "403" *) 
  RTL_MUX2 latched_store_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(latched_store_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "200192" *) 
  (* map_to_module = "264" *) 
  RTL_REG_SYNC__BREG_13 latched_store_reg
       (.C(clk),
        .CE(latched_store_i__2_n_0),
        .D(latched_store1_out),
        .Q(latched_store),
        .RST(latched_store_i__3_n_0));
  (* XLNX_LINE_COL = "465920" *) 
  (* map_to_module = "555" *) 
  RTL_OR0 mem_addr0_i
       (.I0(mem_la_read),
        .I1(mem_la_write),
        .O(mem_addr0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "310" *) 
  RTL_MUX2 mem_addr_i
       (.I0(\<const0> ),
        .I1(mem_addr0),
        .O(mem_addr_i_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[0] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[0]),
        .Q(mem_addr[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[10] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[10]),
        .Q(mem_addr[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[11] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[11]),
        .Q(mem_addr[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[12] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[12]),
        .Q(mem_addr[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[13] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[13]),
        .Q(mem_addr[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[14] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[14]),
        .Q(mem_addr[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[15] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[15]),
        .Q(mem_addr[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[16] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[16]),
        .Q(mem_addr[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[17] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[17]),
        .Q(mem_addr[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[18] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[18]),
        .Q(mem_addr[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[19] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[19]),
        .Q(mem_addr[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[1] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[1]),
        .Q(mem_addr[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[20] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[20]),
        .Q(mem_addr[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[21] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[21]),
        .Q(mem_addr[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[22] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[22]),
        .Q(mem_addr[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[23] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[23]),
        .Q(mem_addr[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[24] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[24]),
        .Q(mem_addr[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[25] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[25]),
        .Q(mem_addr[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[26] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[26]),
        .Q(mem_addr[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[27] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[27]),
        .Q(mem_addr[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[28] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[28]),
        .Q(mem_addr[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[29] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[29]),
        .Q(mem_addr[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[2] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[2]),
        .Q(mem_addr[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[30] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[30]),
        .Q(mem_addr[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[31] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[31]),
        .Q(mem_addr[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[3] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[3]),
        .Q(mem_addr[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[4] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[4]),
        .Q(mem_addr[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[5] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[5]),
        .Q(mem_addr[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[6] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[6]),
        .Q(mem_addr[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[7] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[7]),
        .Q(mem_addr[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[8] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[8]),
        .Q(mem_addr[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1902848" *) 
  (* map_to_module = "174" *) 
  RTL_REG__BREG_11 \mem_addr_reg[9] 
       (.C(clk),
        .CE(mem_addr_i_n_0),
        .D(mem_la_addr[9]),
        .Q(mem_addr[9]));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132175" *) 
  (* map_to_module = "317" *) 
  RTL_MUX2 mem_amo_op_i
       (.I0(\<const0> ),
        .I1(mem_la_write),
        .O(mem_amo_op_i_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1051392" *) 
  (* map_to_module = "177" *) 
  RTL_REG__BREG_11 \mem_amo_op_reg[0] 
       (.C(clk),
        .CE(mem_amo_op_i_n_0),
        .D(mem_la_amo_op[0]),
        .Q(mem_amo_op[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1051392" *) 
  (* map_to_module = "177" *) 
  RTL_REG__BREG_11 \mem_amo_op_reg[1] 
       (.C(clk),
        .CE(mem_amo_op_i_n_0),
        .D(mem_la_amo_op[1]),
        .Q(mem_amo_op[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1051392" *) 
  (* map_to_module = "177" *) 
  RTL_REG__BREG_11 \mem_amo_op_reg[2] 
       (.C(clk),
        .CE(mem_amo_op_i_n_0),
        .D(mem_la_amo_op[2]),
        .Q(mem_amo_op[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1051392" *) 
  (* map_to_module = "177" *) 
  RTL_REG__BREG_11 \mem_amo_op_reg[3] 
       (.C(clk),
        .CE(mem_amo_op_i_n_0),
        .D(mem_la_amo_op[3]),
        .Q(mem_amo_op[3]));
  (* XLNX_LINE_COL = "1645824" *) 
  (* map_to_module = "697" *) 
  RTL_AND1 mem_do_prefetch0_i
       (.I0(mem_do_prefetch1),
        .I1(mem_do_prefetch1_i__0_n_0),
        .O(mem_do_prefetch0));
  (* XLNX_LINE_COL = "1641472" *) 
  (* map_to_module = "698" *) 
  RTL_INV0 mem_do_prefetch1_i
       (.I0(instr_jalr),
        .O(mem_do_prefetch1));
  (* XLNX_LINE_COL = "2625024" *) 
  (* map_to_module = "699" *) 
  RTL_INV0 mem_do_prefetch1_i__0
       (.I0(instr_retirq),
        .O(mem_do_prefetch1_i__0_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328712" *) 
  (* map_to_module = "500" *) 
  RTL_MUX2 mem_do_prefetch_i
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(mem_do_prefetch_i_n_0),
        .S(instr_jal));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263187" *) 
  (* map_to_module = "499" *) 
  RTL_MUX2 mem_do_prefetch_i__0
       (.I0(mem_do_prefetch_i_n_0),
        .I1(\<const0> ),
        .O(mem_do_prefetch_i__0_n_0),
        .S(decoder_trigger));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "498" *) 
  RTL_MUX254 mem_do_prefetch_i__1
       (.I0(\<const0> ),
        .I1(mem_do_prefetch_i__0_n_0),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(mem_do_prefetch_i__1_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "497" *) 
  RTL_MUX2 mem_do_prefetch_i__2
       (.I0(\<const0> ),
        .I1(mem_do_prefetch_i__1_n_0),
        .O(mem_do_prefetch__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "397312" *) 
  (* map_to_module = "277" *) 
  RTL_REG_SYNC__BREG_13 mem_do_prefetch_reg
       (.C(clk),
        .CE(mem_do_prefetch__0),
        .D(mem_do_prefetch0),
        .Q(mem_do_prefetch),
        .RST(mem_do_rinst0_i_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "136193" *) 
  (* map_to_module = "529" *) 
  RTL_MUX2 mem_do_rdata_i
       (.I0(\<const1> ),
        .I1(mem_do_rinst0_i_n_0),
        .O(mem_do_rdata__0),
        .S(set_mem_do_rdata_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "658688" *) 
  (* map_to_module = "280" *) 
  RTL_REG__BREG_11 mem_do_rdata_reg
       (.C(clk),
        .CE(mem_do_rdata__0),
        .D(set_mem_do_rdata_i__2_n_0),
        .Q(mem_do_rdata));
  (* XLNX_LINE_COL = "398336" *) 
  (* map_to_module = "694" *) 
  RTL_OR0 mem_do_rinst0_i
       (.I0(mem_state2_i_n_0),
        .I1(mem_done),
        .O(mem_do_rinst0_i_n_0));
  (* XLNX_LINE_COL = "1318912" *) 
  (* map_to_module = "469" *) 
  RTL_AND1 mem_do_rinst0_i__0
       (.I0(mem_do_rinst1),
        .I1(mem_do_rinst1_i__0_n_0),
        .O(mem_do_rinst0_i__0_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "466" *) 
  RTL_MUX155 mem_do_rinst0_i__1
       (.I0(pcpi_int_ready),
        .I1(\<const0> ),
        .I2(mem_do_prefetch),
        .I3(\<const1> ),
        .I4(\<const0> ),
        .I5(mem_do_prefetch),
        .I6(mem_do_rinst_i__0_n_0),
        .O(mem_do_rinst0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "474" *) 
  RTL_MUX155 mem_do_rinst0_i__2
       (.I0(pcpi_int_ready),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const1> ),
        .I4(\<const0> ),
        .I5(\<const1> ),
        .I6(mem_do_rinst_i__3_n_0),
        .O(mem_do_rinst0_i__2_n_0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "1315072" *) 
  (* map_to_module = "470" *) 
  RTL_INV0 mem_do_rinst1_i
       (.I0(decoder_trigger),
        .O(mem_do_rinst1));
  (* XLNX_LINE_COL = "2624512" *) 
  (* map_to_module = "471" *) 
  RTL_INV0 mem_do_rinst1_i__0
       (.I0(trace_valid),
        .O(mem_do_rinst1_i__0_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263187" *) 
  (* map_to_module = "468" *) 
  RTL_MUX2 mem_do_rinst_i
       (.I0(instr_jal),
        .I1(mem_do_rinst0_i__0_n_0),
        .O(mem_do_rinst_i_n_0),
        .S(decoder_trigger));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "460821" *) 
  (* map_to_module = "467" *) 
  RTL_MUX156 mem_do_rinst_i__0
       (.I0(\<const1> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(mem_do_prefetch),
        .O(mem_do_rinst_i__0_n_0),
        .S0(is_sb_sh_sw),
        .S1(is_amo),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "465" *) 
  RTL_MUX156 mem_do_rinst_i__1
       (.I0(pcpi_int_ready),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(mem_do_prefetch),
        .O(mem_do_rinst__0),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0001000000,I2:S=10'b0000100000,I3:S=10'b0000001000" *) 
  (* XLNX_LINE_COL = "1379584" *) 
  (* map_to_module = "464" *) 
  RTL_MUX205 mem_do_rinst_i__2
       (.I0(mem_do_rinst_i_n_0),
        .I1(mem_do_rinst0),
        .I2(mem_do_rinst__0),
        .I3(mem_do_prefetch),
        .O(mem_do_rinst1_out),
        .S(cpu_state));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "460821" *) 
  (* map_to_module = "475" *) 
  RTL_MUX156 mem_do_rinst_i__3
       (.I0(\<const1> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const1> ),
        .O(mem_do_rinst_i__3_n_0),
        .S0(is_sb_sh_sw),
        .S1(is_amo),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "476" *) 
  RTL_MUX156 mem_do_rinst_i__4
       (.I0(pcpi_int_ready),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const1> ),
        .O(mem_do_rinst_i__4_n_0),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b1" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "477" *) 
  RTL_ROM18 mem_do_rinst_i__5
       (.A(reg_sh),
        .O(mem_do_rinst_i__5_n_0));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "1379584" *) 
  (* map_to_module = "473" *) 
  RTL_MUX254 mem_do_rinst_i__6
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(mem_do_rinst0_i__2_n_0),
        .I3(mem_do_rinst_i__4_n_0),
        .I4(\<const0> ),
        .I5(mem_do_rinst_i__5_n_0),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(mem_do_rinst_i__6_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "472" *) 
  RTL_MUX2 mem_do_rinst_i__7
       (.I0(\<const0> ),
        .I1(mem_do_rinst_i__6_n_0),
        .O(mem_do_rinst0_out),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1379584" *) 
  (* map_to_module = "273" *) 
  RTL_REG_SYNC__BREG_22 mem_do_rinst_reg
       (.C(clk),
        .CE(mem_do_rinst0_out),
        .D(mem_do_rinst1_out),
        .Q(mem_do_rinst),
        .RST(mem_do_rinst0_i_n_0),
        .SET(set_mem_do_rinst));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "136193" *) 
  (* map_to_module = "534" *) 
  RTL_MUX2 mem_do_wdata_i
       (.I0(\<const1> ),
        .I1(mem_do_rinst0_i_n_0),
        .O(mem_do_wdata__0),
        .S(set_mem_do_wdata_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "658688" *) 
  (* map_to_module = "281" *) 
  RTL_REG__BREG_11 mem_do_wdata_reg
       (.C(clk),
        .CE(mem_do_wdata__0),
        .D(set_mem_do_wdata_i__2_n_0),
        .Q(mem_do_wdata));
  (* XLNX_LINE_COL = "1797376" *) 
  (* map_to_module = "568" *) 
  RTL_OR0 mem_done0_i
       (.I0(mem_done1),
        .I1(mem_done1_i__0_n_0),
        .O(mem_done0));
  (* XLNX_LINE_COL = "1854208" *) 
  (* map_to_module = "569" *) 
  RTL_AND1 mem_done1_i
       (.I0(mem_done2),
        .I1(mem_done2_i__0_n_0),
        .O(mem_done1));
  (* XLNX_LINE_COL = "6954240" *) 
  (* map_to_module = "572" *) 
  RTL_AND1 mem_done1_i__0
       (.I0(mem_done2_i__1_n_0),
        .I1(mem_do_rinst),
        .O(mem_done1_i__0_n_0));
  (* XLNX_LINE_COL = "1906432" *) 
  (* map_to_module = "570" *) 
  RTL_AND1 mem_done2_i
       (.I0(mem_xfer),
        .I1(mem_done3),
        .O(mem_done2));
  (* XLNX_LINE_COL = "3616512" *) 
  (* map_to_module = "571" *) 
  RTL_OR0 mem_done2_i__0
       (.I0(mem_state2_i__0_n_0),
        .I1(mem_do_wdata),
        .O(mem_done2_i__0_n_0));
  (* XLNX_LINE_COL = "7015168" *) 
  (* map_to_module = "574" *) 
  RTL_REDUCTION_AND mem_done2_i__1
       (.I0(mem_state),
        .O(mem_done2_i__1_n_0));
  (* XLNX_LINE_COL = "2689792" *) 
  (* map_to_module = "573" *) 
  RTL_REDUCTION_OR0 mem_done3_i
       (.I0(mem_state),
        .O(mem_done3));
  (* XLNX_LINE_COL = "1144576" *) 
  (* map_to_module = "567" *) 
  RTL_AND1 mem_done_i
       (.I0(resetn),
        .I1(mem_done0),
        .O(mem_done));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "318" *) 
  RTL_MUX2 mem_instr_i
       (.I0(\<const0> ),
        .I1(mem_la_addr1),
        .O(mem_instr_i_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "321" *) 
  RTL_MUX2 mem_instr_i__0
       (.I0(\<const1> ),
        .I1(mem_state0),
        .O(mem_instr_i__0_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "1444352" *) 
  (* map_to_module = "320" *) 
  RTL_MUX63 mem_instr_i__1
       (.I0(mem_instr_i__0_n_0),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .O(mem_instr_i__1_n_0),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1444352" *) 
  (* map_to_module = "319" *) 
  RTL_MUX2 mem_instr_i__2
       (.I0(\<const0> ),
        .I1(mem_instr_i__1_n_0),
        .O(mem_instr_i__2_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1444352" *) 
  (* map_to_module = "178" *) 
  RTL_REG__BREG_11 mem_instr_reg
       (.C(clk),
        .CE(mem_instr_i__2_n_0),
        .D(mem_instr_i_n_0),
        .Q(mem_instr));
  (* XLNX_LINE_COL = "5578752" *) 
  (* map_to_module = "539" *) 
  RTL_OR0 mem_la_addr1_i
       (.I0(mem_do_rinst),
        .I1(mem_do_prefetch),
        .O(mem_la_addr1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1467136" *) 
  (* map_to_module = "282" *) 
  RTL_MUX18 mem_la_addr_i
       (.I0({next_pc,\<const0> ,\<const0> }),
        .I1(pcpi_rs1),
        .O(mem_la_addr),
        .S(mem_la_addr1));
  (* XLNX_LINE_COL = "2188800" *) 
  (* map_to_module = "536" *) 
  RTL_AND1 mem_la_read0_i
       (.I0(mem_la_write1_i_n_0),
        .I1(mem_state0),
        .O(mem_la_read0));
  (* XLNX_LINE_COL = "1473281" *) 
  (* map_to_module = "535" *) 
  RTL_AND1 mem_la_read_i
       (.I0(resetn),
        .I1(mem_la_read0),
        .O(mem_la_read));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10" *) 
  (* XLNX_LINE_COL = "133145" *) 
  (* map_to_module = "284" *) 
  RTL_MUX123 mem_la_wdata_i
       (.I0(pcpi_rs2),
        .I1({pcpi_rs2[15:0],pcpi_rs2[15:0]}),
        .I2({pcpi_rs2[7:0],pcpi_rs2[7:0],pcpi_rs2[7:0],pcpi_rs2[7:0]}),
        .O(mem_la_wdata),
        .S(mem_wordsize));
  (* XLNX_LINE_COL = "1512704" *) 
  (* map_to_module = "541" *) 
  RTL_AND1 mem_la_write0_i
       (.I0(resetn),
        .I1(mem_la_write1_i_n_0),
        .O(mem_la_write0));
  (* XLNX_LINE_COL = "2165504" *) 
  (* map_to_module = "537" *) 
  RTL_EQ6 mem_la_write1_i
       (.I0(mem_state),
        .I1(\<const0> ),
        .O(mem_la_write1_i_n_0));
  (* XLNX_LINE_COL = "1516800" *) 
  (* map_to_module = "540" *) 
  RTL_AND1 mem_la_write_i
       (.I0(mem_la_write0),
        .I1(mem_do_wdata),
        .O(mem_la_write));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1253120" *) 
  (* map_to_module = "286" *) 
  RTL_MUX146 mem_la_wstrb0_i
       (.I0({\<const1> ,\<const1> ,\<const0> ,\<const0> }),
        .I1({\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O({mem_la_wstrb0_i_n_0,mem_la_wstrb0_i_n_1,mem_la_wstrb0_i_n_2,mem_la_wstrb0_i_n_3}),
        .S(pcpi_rs1[1]));
  (* XLNX_LINE_COL = "1251328" *) 
  (* map_to_module = "704" *) 
  RTL_LSHIFT5 mem_la_wstrb0_i__0
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .I1(pcpi_rs1[1:0]),
        .I2(\<const1> ),
        .O(mem_la_wstrb0));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10" *) 
  (* XLNX_LINE_COL = "133145" *) 
  (* map_to_module = "285" *) 
  RTL_MUX50 mem_la_wstrb_i
       (.I0({\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .I1({mem_la_wstrb0_i_n_0,mem_la_wstrb0_i_n_1,mem_la_wstrb0_i_n_2,mem_la_wstrb0_i_n_3}),
        .I2(mem_la_wstrb0),
        .O(mem_la_wstrb),
        .S(mem_wordsize));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "2505216" *) 
  (* map_to_module = "293" *) 
  RTL_MUX18 mem_rdata_q0_i
       (.I0(mem_rdata),
        .I1(mem_rdata_q),
        .O({mem_rdata_q0_i_n_0,mem_rdata_q0_i_n_1,mem_rdata_q0_i_n_2,mem_rdata_q0_i_n_3,mem_rdata_q0_i_n_4,mem_rdata_q0_i_n_5,mem_rdata_q0_i_n_6,mem_rdata_q0_i_n_7,mem_rdata_q0_i_n_8,mem_rdata_q0_i_n_9,mem_rdata_q0_i_n_10,mem_rdata_q0_i_n_11,mem_rdata_q0_i_n_12,mem_rdata_q0_i_n_13,mem_rdata_q0_i_n_14,mem_rdata_q0_i_n_15,mem_rdata_q0_i_n_16,mem_rdata_q0_i_n_17,mem_rdata_q0_i_n_18,mem_rdata_q0_i_n_19,mem_rdata_q0_i_n_20,mem_rdata_q0_i_n_21,mem_rdata_q0_i_n_22,mem_rdata_q0_i_n_23,mem_rdata_q0_i_n_24,p_0_in}),
        .S(mem_xfer));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[0] 
       (.C(clk),
        .D(p_0_in[0]),
        .Q(mem_rdata_q[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[10] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_21),
        .Q(mem_rdata_q[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[11] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_20),
        .Q(mem_rdata_q[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[12] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_19),
        .Q(mem_rdata_q[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[13] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_18),
        .Q(mem_rdata_q[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[14] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_17),
        .Q(mem_rdata_q[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[15] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_16),
        .Q(mem_rdata_q[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[16] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_15),
        .Q(mem_rdata_q[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[17] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_14),
        .Q(mem_rdata_q[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[18] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_13),
        .Q(mem_rdata_q[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[19] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_12),
        .Q(mem_rdata_q[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[1] 
       (.C(clk),
        .D(p_0_in[1]),
        .Q(mem_rdata_q[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[20] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_11),
        .Q(mem_rdata_q[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[21] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_10),
        .Q(mem_rdata_q[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[22] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_9),
        .Q(mem_rdata_q[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[23] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_8),
        .Q(mem_rdata_q[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[24] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_7),
        .Q(mem_rdata_q[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[25] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_6),
        .Q(mem_rdata_q[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[26] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_5),
        .Q(mem_rdata_q[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[27] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_4),
        .Q(mem_rdata_q[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[28] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_3),
        .Q(mem_rdata_q[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[29] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_2),
        .Q(mem_rdata_q[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[2] 
       (.C(clk),
        .D(p_0_in[2]),
        .Q(mem_rdata_q[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[30] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_1),
        .Q(mem_rdata_q[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[31] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_0),
        .Q(mem_rdata_q[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[3] 
       (.C(clk),
        .D(p_0_in[3]),
        .Q(mem_rdata_q[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[4] 
       (.C(clk),
        .D(p_0_in[4]),
        .Q(mem_rdata_q[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[5] 
       (.C(clk),
        .D(p_0_in[5]),
        .Q(mem_rdata_q[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[6] 
       (.C(clk),
        .D(p_0_in[6]),
        .Q(mem_rdata_q[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[7] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_24),
        .Q(mem_rdata_q[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[8] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_23),
        .Q(mem_rdata_q[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5508096" *) 
  (* map_to_module = "171" *) 
  RTL_REG__BREG_5 \mem_rdata_q_reg[9] 
       (.C(clk),
        .D(mem_rdata_q0_i_n_22),
        .Q(mem_rdata_q[9]));
  (* SEL_VAL = "I0:S=1'b0,I1:S=1'b1" *) 
  (* XLNX_LINE_COL = "264195" *) 
  (* map_to_module = "363" *) 
  RTL_MUX18 mem_rdata_word_i
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[15:0]}),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[31:16]}),
        .O({mem_rdata_word_i_n_0,mem_rdata_word_i_n_1,mem_rdata_word_i_n_2,mem_rdata_word_i_n_3,mem_rdata_word_i_n_4,mem_rdata_word_i_n_5,mem_rdata_word_i_n_6,mem_rdata_word_i_n_7,mem_rdata_word_i_n_8,mem_rdata_word_i_n_9,mem_rdata_word_i_n_10,mem_rdata_word_i_n_11,mem_rdata_word_i_n_12,mem_rdata_word_i_n_13,mem_rdata_word_i_n_14,mem_rdata_word_i_n_15,mem_rdata_word_i_n_16,mem_rdata_word_i_n_17,mem_rdata_word_i_n_18,mem_rdata_word_i_n_19,mem_rdata_word_i_n_20,mem_rdata_word_i_n_21,mem_rdata_word_i_n_22,mem_rdata_word_i_n_23,mem_rdata_word_i_n_24,mem_rdata_word_i_n_25,mem_rdata_word_i_n_26,mem_rdata_word_i_n_27,mem_rdata_word_i_n_28,mem_rdata_word_i_n_29,mem_rdata_word_i_n_30,mem_rdata_word_i_n_31}),
        .S(pcpi_rs1[1]));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "264197" *) 
  (* map_to_module = "364" *) 
  RTL_MUX125 mem_rdata_word_i__0
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[7:0]}),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[15:8]}),
        .I2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[23:16]}),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,mem_rdata[31:24]}),
        .O({mem_rdata_word_i__0_n_0,mem_rdata_word_i__0_n_1,mem_rdata_word_i__0_n_2,mem_rdata_word_i__0_n_3,mem_rdata_word_i__0_n_4,mem_rdata_word_i__0_n_5,mem_rdata_word_i__0_n_6,mem_rdata_word_i__0_n_7,mem_rdata_word_i__0_n_8,mem_rdata_word_i__0_n_9,mem_rdata_word_i__0_n_10,mem_rdata_word_i__0_n_11,mem_rdata_word_i__0_n_12,mem_rdata_word_i__0_n_13,mem_rdata_word_i__0_n_14,mem_rdata_word_i__0_n_15,mem_rdata_word_i__0_n_16,mem_rdata_word_i__0_n_17,mem_rdata_word_i__0_n_18,mem_rdata_word_i__0_n_19,mem_rdata_word_i__0_n_20,mem_rdata_word_i__0_n_21,mem_rdata_word_i__0_n_22,mem_rdata_word_i__0_n_23,mem_rdata_word_i__0_n_24,mem_rdata_word_i__0_n_25,mem_rdata_word_i__0_n_26,mem_rdata_word_i__0_n_27,mem_rdata_word_i__0_n_28,mem_rdata_word_i__0_n_29,mem_rdata_word_i__0_n_30,mem_rdata_word_i__0_n_31}),
        .S(pcpi_rs1[1:0]));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10" *) 
  (* XLNX_LINE_COL = "133145" *) 
  (* map_to_module = "362" *) 
  RTL_MUX123 mem_rdata_word_i__1
       (.I0(mem_rdata),
        .I1({mem_rdata_word_i_n_0,mem_rdata_word_i_n_1,mem_rdata_word_i_n_2,mem_rdata_word_i_n_3,mem_rdata_word_i_n_4,mem_rdata_word_i_n_5,mem_rdata_word_i_n_6,mem_rdata_word_i_n_7,mem_rdata_word_i_n_8,mem_rdata_word_i_n_9,mem_rdata_word_i_n_10,mem_rdata_word_i_n_11,mem_rdata_word_i_n_12,mem_rdata_word_i_n_13,mem_rdata_word_i_n_14,mem_rdata_word_i_n_15,mem_rdata_word_i_n_16,mem_rdata_word_i_n_17,mem_rdata_word_i_n_18,mem_rdata_word_i_n_19,mem_rdata_word_i_n_20,mem_rdata_word_i_n_21,mem_rdata_word_i_n_22,mem_rdata_word_i_n_23,mem_rdata_word_i_n_24,mem_rdata_word_i_n_25,mem_rdata_word_i_n_26,mem_rdata_word_i_n_27,mem_rdata_word_i_n_28,mem_rdata_word_i_n_29,mem_rdata_word_i_n_30,mem_rdata_word_i_n_31}),
        .I2({mem_rdata_word_i__0_n_0,mem_rdata_word_i__0_n_1,mem_rdata_word_i__0_n_2,mem_rdata_word_i__0_n_3,mem_rdata_word_i__0_n_4,mem_rdata_word_i__0_n_5,mem_rdata_word_i__0_n_6,mem_rdata_word_i__0_n_7,mem_rdata_word_i__0_n_8,mem_rdata_word_i__0_n_9,mem_rdata_word_i__0_n_10,mem_rdata_word_i__0_n_11,mem_rdata_word_i__0_n_12,mem_rdata_word_i__0_n_13,mem_rdata_word_i__0_n_14,mem_rdata_word_i__0_n_15,mem_rdata_word_i__0_n_16,mem_rdata_word_i__0_n_17,mem_rdata_word_i__0_n_18,mem_rdata_word_i__0_n_19,mem_rdata_word_i__0_n_20,mem_rdata_word_i__0_n_21,mem_rdata_word_i__0_n_22,mem_rdata_word_i__0_n_23,mem_rdata_word_i__0_n_24,mem_rdata_word_i__0_n_25,mem_rdata_word_i__0_n_26,mem_rdata_word_i__0_n_27,mem_rdata_word_i__0_n_28,mem_rdata_word_i__0_n_29,mem_rdata_word_i__0_n_30,mem_rdata_word_i__0_n_31}),
        .O(mem_rdata_word),
        .S(mem_wordsize));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1320192" *) 
  (* map_to_module = "297" *) 
  RTL_MUX60 mem_state0_i
       (.I0({\<const0> ,\<const0> }),
        .I1({\<const1> ,\<const1> }),
        .O({mem_state0_i_n_0,mem_state0_i_n_1}),
        .S(mem_state2_i__0_n_0));
  (* XLNX_LINE_COL = "5517824" *) 
  (* map_to_module = "538" *) 
  RTL_OR0 mem_state0_i__0
       (.I0(mem_la_addr1),
        .I1(mem_do_rdata),
        .O(mem_state0));
  (* XLNX_LINE_COL = "397312" *) 
  (* map_to_module = "552" *) 
  RTL_OR0 mem_state1_i
       (.I0(mem_state2_i_n_0),
        .I1(trap),
        .O(mem_state1));
  (* XLNX_LINE_COL = "395264" *) 
  (* map_to_module = "553" *) 
  RTL_INV0 mem_state2_i
       (.I0(resetn),
        .O(mem_state2_i_n_0));
  (* XLNX_LINE_COL = "3677440" *) 
  (* map_to_module = "551" *) 
  RTL_OR0 mem_state2_i__0
       (.I0(mem_do_rinst),
        .I1(mem_do_rdata),
        .O(mem_state2_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:2'b10,INIT_-1:2'b00" *) 
  (* XLNX_LINE_COL = "1573897" *) 
  (* map_to_module = "296" *) 
  RTL_ROM7 mem_state_i
       (.A(mem_la_addr),
        .O({mem_state_i_n_0,mem_state_i_n_1}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "295" *) 
  RTL_MUX60 mem_state_i__0
       (.I0({mem_state_i_n_0,mem_state_i_n_1}),
        .I1({\<const0> ,\<const1> }),
        .O(mem_state__0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "294" *) 
  RTL_MUX59 mem_state_i__1
       (.I0(mem_state__0),
        .I1({mem_state0_i_n_0,mem_state0_i_n_1}),
        .I2({\<const0> ,\<const0> }),
        .I3({\<const0> ,\<const0> }),
        .O(mem_state0_out),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "300" *) 
  RTL_MUX2 mem_state_i__2
       (.I0(\<const1> ),
        .I1(mem_state0),
        .O(mem_state_i__2_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "299" *) 
  RTL_MUX63 mem_state_i__3
       (.I0(mem_state_i__2_n_0),
        .I1(mem_xfer),
        .I2(mem_xfer),
        .I3(mem_do_rinst),
        .O(mem_state1_out),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132175" *) 
  (* map_to_module = "298" *) 
  RTL_MUX2 mem_state_i__4
       (.I0(\<const0> ),
        .I1(mem_state1_out),
        .O(mem_state_i__4_n_0),
        .S(mem_state1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "302" *) 
  RTL_MUX2 mem_state_i__5
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(mem_state_i__5_n_0),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132175" *) 
  (* map_to_module = "301" *) 
  RTL_MUX2 mem_state_i__6
       (.I0(mem_state_i__5_n_0),
        .I1(\<const0> ),
        .O(mem_state_i__6_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264704" *) 
  (* map_to_module = "172" *) 
  RTL_REG_SYNC__BREG_13 \mem_state_reg[0] 
       (.C(clk),
        .CE(mem_state_i__4_n_0),
        .D(mem_state0_out[0]),
        .Q(mem_state[0]),
        .RST(mem_state_i__6_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264704" *) 
  (* map_to_module = "172" *) 
  RTL_REG_SYNC__BREG_13 \mem_state_reg[1] 
       (.C(clk),
        .CE(mem_state_i__4_n_0),
        .D(mem_state0_out[1]),
        .Q(mem_state[1]),
        .RST(mem_state_i__6_n_0));
  (* XLNX_LINE_COL = "464128" *) 
  (* map_to_module = "554" *) 
  RTL_OR0 mem_valid0_i
       (.I0(mem_state2_i_n_0),
        .I1(mem_ready),
        .O(mem_valid0));
  (* INIT_VAL = "INIT_DEFAULT:1'b1,INIT_-1:1'b0" *) 
  (* XLNX_LINE_COL = "1573897" *) 
  (* map_to_module = "305" *) 
  RTL_ROM8 mem_valid_i
       (.A(mem_la_addr),
        .O(mem_valid_i_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "304" *) 
  RTL_MUX2 mem_valid_i__0
       (.I0(mem_valid_i_n_0),
        .I1(mem_state0),
        .O(mem_valid_i__0_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "303" *) 
  RTL_MUX67 mem_valid_i__1
       (.I0(mem_valid_i__0_n_0),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .O(mem_valid_i__1_n_0),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328715" *) 
  (* map_to_module = "308" *) 
  RTL_MUX2 mem_valid_i__2
       (.I0(\<const1> ),
        .I1(mem_state0),
        .O(mem_valid_i__2_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "307" *) 
  RTL_MUX63 mem_valid_i__3
       (.I0(mem_valid_i__2_n_0),
        .I1(mem_xfer),
        .I2(mem_xfer),
        .I3(\<const0> ),
        .O(mem_valid_i__3_n_0),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132175" *) 
  (* map_to_module = "306" *) 
  RTL_MUX2 mem_valid_i__4
       (.I0(\<const0> ),
        .I1(mem_valid_i__3_n_0),
        .O(mem_valid_i__4_n_0),
        .S(mem_state1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132175" *) 
  (* map_to_module = "309" *) 
  RTL_MUX2 mem_valid_i__5
       (.I0(mem_valid0),
        .I1(\<const0> ),
        .O(mem_valid_i__5_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264704" *) 
  (* map_to_module = "173" *) 
  RTL_REG_SYNC__BREG_13 mem_valid_reg
       (.C(clk),
        .CE(mem_valid_i__4_n_0),
        .D(mem_valid_i__1_n_0),
        .Q(mem_valid),
        .RST(mem_valid_i__5_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "316" *) 
  RTL_MUX2 mem_wdata_i
       (.I0(\<const0> ),
        .I1(mem_la_write),
        .O(mem_wdata_i_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[0] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[0]),
        .Q(mem_wdata[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[10] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[10]),
        .Q(mem_wdata[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[11] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[11]),
        .Q(mem_wdata[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[12] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[12]),
        .Q(mem_wdata[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[13] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[13]),
        .Q(mem_wdata[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[14] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[14]),
        .Q(mem_wdata[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[15] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[15]),
        .Q(mem_wdata[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[16] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[16]),
        .Q(mem_wdata[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[17] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[17]),
        .Q(mem_wdata[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[18] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[18]),
        .Q(mem_wdata[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[19] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[19]),
        .Q(mem_wdata[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[1] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[1]),
        .Q(mem_wdata[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[20] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[20]),
        .Q(mem_wdata[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[21] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[21]),
        .Q(mem_wdata[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[22] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[22]),
        .Q(mem_wdata[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[23] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[23]),
        .Q(mem_wdata[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[24] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[24]),
        .Q(mem_wdata[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[25] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[25]),
        .Q(mem_wdata[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[26] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[26]),
        .Q(mem_wdata[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[27] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[27]),
        .Q(mem_wdata[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[28] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[28]),
        .Q(mem_wdata[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[29] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[29]),
        .Q(mem_wdata[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[2] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[2]),
        .Q(mem_wdata[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[30] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[30]),
        .Q(mem_wdata[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[31] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[31]),
        .Q(mem_wdata[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[3] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[3]),
        .Q(mem_wdata[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[4] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[4]),
        .Q(mem_wdata[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[5] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[5]),
        .Q(mem_wdata[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[6] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[6]),
        .Q(mem_wdata[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[7] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[7]),
        .Q(mem_wdata[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[8] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[8]),
        .Q(mem_wdata[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "176" *) 
  RTL_REG__BREG_11 \mem_wdata_reg[9] 
       (.C(clk),
        .CE(mem_wdata_i_n_0),
        .D(mem_la_wdata[9]),
        .Q(mem_wdata[9]));
  (* XLNX_LINE_COL = "464384" *) 
  (* map_to_module = "695" *) 
  RTL_OR0 mem_wordsize1_i
       (.I0(instr_lb),
        .I1(instr_lbu),
        .O(mem_wordsize1));
  (* XLNX_LINE_COL = "464384" *) 
  (* map_to_module = "696" *) 
  RTL_OR0 mem_wordsize1_i__0
       (.I0(instr_lh),
        .I1(instr_lhu),
        .O(mem_wordsize1_i__0_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1" *) 
  (* XLNX_LINE_COL = "395269" *) 
  (* map_to_module = "482" *) 
  RTL_MUX219 mem_wordsize_i
       (.I0({\<const1> ,\<const0> }),
        .I1({\<const0> ,\<const1> }),
        .I2({\<const0> ,\<const0> }),
        .O(mem_wordsize__0),
        .S0(instr_sb),
        .S1(instr_sh),
        .S2(instr_sw));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1" *) 
  (* XLNX_LINE_COL = "395269" *) 
  (* map_to_module = "483" *) 
  RTL_MUX219 mem_wordsize_i__0
       (.I0({\<const1> ,\<const0> }),
        .I1({\<const0> ,\<const1> }),
        .I2({\<const0> ,\<const0> }),
        .O({mem_wordsize_i__0_n_0,mem_wordsize_i__0_n_1}),
        .S0(mem_wordsize1),
        .S1(mem_wordsize1_i__0_n_0),
        .S2(instr_lw));
  (* SEL_VAL = ",I0:S=10'b0010000000,I1:S=10'b0000000100,I2:S=10'b0000000001,I3:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "481" *) 
  RTL_MUX218 mem_wordsize_i__1
       (.I0({\<const0> ,\<const0> }),
        .I1(mem_wordsize__0),
        .I2({mem_do_wdata,mem_do_wdata}),
        .I3({mem_wordsize_i__0_n_0,mem_wordsize_i__0_n_1}),
        .O(mem_wordsize2_out),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328717" *) 
  (* map_to_module = "491" *) 
  RTL_MUX2 mem_wordsize_i__2
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(mem_wordsize_i__2_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "490" *) 
  RTL_MUX2 mem_wordsize_i__3
       (.I0(mem_wordsize_i__2_n_0),
        .I1(\<const0> ),
        .O(mem_wordsize_i__3_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328717" *) 
  (* map_to_module = "489" *) 
  RTL_MUX2 mem_wordsize_i__4
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(mem_wordsize_i__4_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "488" *) 
  RTL_MUX2 mem_wordsize_i__5
       (.I0(mem_wordsize_i__4_n_0),
        .I1(\<const0> ),
        .O(mem_wordsize_i__5_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "487" *) 
  RTL_MUX2 mem_wordsize_i__6
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(mem_wordsize_i__6_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "486" *) 
  RTL_MUX2 mem_wordsize_i__7
       (.I0(mem_wordsize_i__6_n_0),
        .I1(\<const0> ),
        .O(mem_wordsize_i__7_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "485" *) 
  RTL_MUX254 mem_wordsize_i__8
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(mem_wordsize_i__3_n_0),
        .I7(mem_wordsize_i__5_n_0),
        .I8(mem_wordsize_i__7_n_0),
        .O(mem_wordsize_i__8_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "484" *) 
  RTL_MUX2 mem_wordsize_i__9
       (.I0(\<const0> ),
        .I1(mem_wordsize_i__8_n_0),
        .O(mem_wordsize0_out),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265472" *) 
  (* map_to_module = "274" *) 
  RTL_REG__BREG_11 \mem_wordsize_reg[0] 
       (.C(clk),
        .CE(mem_wordsize0_out),
        .D(mem_wordsize2_out[0]),
        .Q(mem_wordsize[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "265472" *) 
  (* map_to_module = "274" *) 
  RTL_REG__BREG_11 \mem_wordsize_reg[1] 
       (.C(clk),
        .CE(mem_wordsize0_out),
        .D(mem_wordsize2_out[1]),
        .Q(mem_wordsize[1]));
  (* XLNX_LINE_COL = "1122560" *) 
  (* map_to_module = "556" *) 
  RTL_AND35 mem_wstrb0_i
       (.I0(mem_la_wstrb),
        .I1({mem_la_write,mem_la_write,mem_la_write,mem_la_write}),
        .O(mem_wstrb0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328709" *) 
  (* map_to_module = "312" *) 
  RTL_MUX146 mem_wstrb_i
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1(mem_wstrb0),
        .O({mem_wstrb_i_n_0,mem_wstrb_i_n_1,mem_wstrb_i_n_2,mem_wstrb_i_n_3}),
        .S(mem_state0));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "311" *) 
  RTL_MUX74 mem_wstrb_i__0
       (.I0({mem_wstrb_i_n_0,mem_wstrb_i_n_1,mem_wstrb_i_n_2,mem_wstrb_i_n_3}),
        .I1(mem_wstrb0),
        .I2(mem_wstrb0),
        .I3(mem_wstrb0),
        .O({mem_wstrb_i__0_n_0,mem_wstrb_i__0_n_1,mem_wstrb_i__0_n_2,mem_wstrb_i__0_n_3}),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328709" *) 
  (* map_to_module = "315" *) 
  RTL_MUX2 mem_wstrb_i__1
       (.I0(\<const1> ),
        .I1(mem_addr0),
        .O(mem_wstrb_i__1_n_0),
        .S(mem_state0));
  (* SEL_VAL = "I0:S=2'b00,I1:S=2'b01,I2:S=2'b10,I3:S=2'b11" *) 
  (* XLNX_LINE_COL = "198718" *) 
  (* map_to_module = "314" *) 
  RTL_MUX63 mem_wstrb_i__2
       (.I0(mem_wstrb_i__1_n_0),
        .I1(mem_addr0),
        .I2(mem_addr0),
        .I3(mem_addr0),
        .O(mem_wstrb_i__2_n_0),
        .S(mem_state));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "313" *) 
  RTL_MUX2 mem_wstrb_i__3
       (.I0(\<const0> ),
        .I1(mem_wstrb_i__2_n_0),
        .O(mem_wstrb_i__3_n_0),
        .S(mem_state1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "175" *) 
  RTL_REG__BREG_11 \mem_wstrb_reg[0] 
       (.C(clk),
        .CE(mem_wstrb_i__3_n_0),
        .D(mem_wstrb_i__0_n_3),
        .Q(mem_wstrb[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "175" *) 
  RTL_REG__BREG_11 \mem_wstrb_reg[1] 
       (.C(clk),
        .CE(mem_wstrb_i__3_n_0),
        .D(mem_wstrb_i__0_n_2),
        .Q(mem_wstrb[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "175" *) 
  RTL_REG__BREG_11 \mem_wstrb_reg[2] 
       (.C(clk),
        .CE(mem_wstrb_i__3_n_0),
        .D(mem_wstrb_i__0_n_1),
        .Q(mem_wstrb[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1903104" *) 
  (* map_to_module = "175" *) 
  RTL_REG__BREG_11 \mem_wstrb_reg[3] 
       (.C(clk),
        .CE(mem_wstrb_i__3_n_0),
        .D(mem_wstrb_i__0_n_0),
        .Q(mem_wstrb[3]));
  (* XLNX_LINE_COL = "1251584" *) 
  (* map_to_module = "550" *) 
  RTL_AND1 mem_xfer_i
       (.I0(mem_valid),
        .I1(mem_ready),
        .O(mem_xfer));
  (* XLNX_LINE_COL = "3411200" *) 
  (* map_to_module = "543" *) 
  RTL_AND17 next_pc0_i
       (.I0(reg_out),
        .I1({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const0> }),
        .O(next_pc0));
  (* XLNX_LINE_COL = "1187840" *) 
  (* map_to_module = "542" *) 
  RTL_AND1 next_pc1_i
       (.I0(latched_store),
        .I1(latched_branch),
        .O(next_pc1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1195264" *) 
  (* map_to_module = "283" *) 
  RTL_MUX18 next_pc_i
       (.I0(next_pc0),
        .I1(reg_next_pc),
        .O({next_pc,NLW_next_pc_i_O_UNCONNECTED[1:0]}),
        .S(next_pc1));
  (* XLNX_LINE_COL = "1313024" *) 
  picorv32_pcpi_div pcpi_div
       (.clk(clk),
        .pcpi_insn(pcpi_insn),
        .pcpi_rd(pcpi_div_rd),
        .pcpi_ready(pcpi_div_ready),
        .pcpi_rs1(pcpi_rs1),
        .pcpi_rs2(pcpi_rs2),
        .pcpi_valid(pcpi_valid),
        .pcpi_wait(pcpi_div_wait),
        .pcpi_wr(pcpi_div_wr),
        .resetn(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[0] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[0]),
        .Q(pcpi_insn[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[10] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[10]),
        .Q(pcpi_insn[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[11] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[11]),
        .Q(pcpi_insn[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[12] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[12]),
        .Q(pcpi_insn[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[13] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[13]),
        .Q(pcpi_insn[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[14] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[14]),
        .Q(pcpi_insn[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[15] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[15]),
        .Q(pcpi_insn[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[16] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[16]),
        .Q(pcpi_insn[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[17] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[17]),
        .Q(pcpi_insn[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[18] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[18]),
        .Q(pcpi_insn[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[19] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[19]),
        .Q(pcpi_insn[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[1] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[1]),
        .Q(pcpi_insn[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[20] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[20]),
        .Q(pcpi_insn[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[21] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[21]),
        .Q(pcpi_insn[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[22] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[22]),
        .Q(pcpi_insn[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[23] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[23]),
        .Q(pcpi_insn[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[24] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[24]),
        .Q(pcpi_insn[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[25] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[25]),
        .Q(pcpi_insn[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[26] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[26]),
        .Q(pcpi_insn[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[27] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[27]),
        .Q(pcpi_insn[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[28] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[28]),
        .Q(pcpi_insn[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[29] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[29]),
        .Q(pcpi_insn[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[2] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[2]),
        .Q(pcpi_insn[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[30] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[30]),
        .Q(pcpi_insn[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[31] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[31]),
        .Q(pcpi_insn[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[3] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[3]),
        .Q(pcpi_insn[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[4] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[4]),
        .Q(pcpi_insn[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[5] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[5]),
        .Q(pcpi_insn[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[6] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[6]),
        .Q(pcpi_insn[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[7] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[7]),
        .Q(pcpi_insn[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[8] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[8]),
        .Q(pcpi_insn[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985600" *) 
  (* map_to_module = "202" *) 
  RTL_REG__BREG_11 \pcpi_insn_reg[9] 
       (.C(clk),
        .CE(is_lui_auipc_jal_jalr_addi_add_sub0_i_n_0),
        .D(mem_rdata_q[9]),
        .Q(pcpi_insn[9]));
  (* CARRY_CHAIN = "4" *) 
  (* STEPS_AT_ONCE = "1" *) 
  (* XLNX_LINE_COL = "1313024" *) 
  picorv32_pcpi_mul pcpi_mul
       (.clk(clk),
        .pcpi_insn(pcpi_insn),
        .pcpi_rd(pcpi_mul_rd),
        .pcpi_ready(pcpi_mul_ready),
        .pcpi_rs1(pcpi_rs1),
        .pcpi_rs2(pcpi_rs2),
        .pcpi_valid(pcpi_valid),
        .pcpi_wait(pcpi_mul_wait),
        .pcpi_wr(pcpi_mul_wr),
        .resetn(resetn));
  (* XLNX_LINE_COL = "1250816" *) 
  (* map_to_module = "686" *) 
  RTL_EQ39 pcpi_timeout0_i
       (.I0(pcpi_timeout_counter),
        .I1(\<const0> ),
        .O(pcpi_timeout0));
  (* XLNX_LINE_COL = "1906944" *) 
  (* map_to_module = "714" *) 
  RTL_SUB4 pcpi_timeout_counter0_i
       (.I0(pcpi_timeout_counter),
        .I1(\<const1> ),
        .O({pcpi_timeout_counter0_i_n_0,pcpi_timeout_counter0_i_n_1,pcpi_timeout_counter0_i_n_2,pcpi_timeout_counter0_i_n_3}));
  (* XLNX_LINE_COL = "529664" *) 
  (* map_to_module = "681" *) 
  RTL_REDUCTION_OR pcpi_timeout_counter0_i__0
       (.I0(pcpi_timeout_counter),
        .O(pcpi_timeout_counter0));
  (* XLNX_LINE_COL = "468736" *) 
  (* map_to_module = "682" *) 
  RTL_AND1 pcpi_timeout_counter1_i
       (.I0(pcpi_timeout_counter2),
        .I1(pcpi_timeout_counter2_i__0_n_0),
        .O(pcpi_timeout_counter1));
  (* XLNX_LINE_COL = "464128" *) 
  (* map_to_module = "683" *) 
  RTL_AND1 pcpi_timeout_counter2_i
       (.I0(resetn),
        .I1(pcpi_valid),
        .O(pcpi_timeout_counter2));
  (* XLNX_LINE_COL = "2035456" *) 
  (* map_to_module = "684" *) 
  RTL_INV0 pcpi_timeout_counter2_i__0
       (.I0(pcpi_int_wait),
        .O(pcpi_timeout_counter2_i__0_n_0));
  (* XLNX_LINE_COL = "1273088" *) 
  (* map_to_module = "685" *) 
  RTL_REDUCTION_OR2 pcpi_timeout_counter3_i
       (.I0({\<const0> ,pcpi_mul_wait,pcpi_div_wait}),
        .O(pcpi_int_wait));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "204036" *) 
  (* map_to_module = "373" *) 
  RTL_MUX2 pcpi_timeout_counter_i
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(pcpi_timeout_counter__0),
        .S(pcpi_timeout_counter1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "529664" *) 
  (* map_to_module = "254" *) 
  RTL_REG_SYNC__BREG_7 \pcpi_timeout_counter_reg[0] 
       (.C(clk),
        .CE(pcpi_timeout_counter0),
        .D(pcpi_timeout_counter0_i_n_3),
        .Q(pcpi_timeout_counter[0]),
        .SET(pcpi_timeout_counter__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "529664" *) 
  (* map_to_module = "254" *) 
  RTL_REG_SYNC__BREG_7 \pcpi_timeout_counter_reg[1] 
       (.C(clk),
        .CE(pcpi_timeout_counter0),
        .D(pcpi_timeout_counter0_i_n_2),
        .Q(pcpi_timeout_counter[1]),
        .SET(pcpi_timeout_counter__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "529664" *) 
  (* map_to_module = "254" *) 
  RTL_REG_SYNC__BREG_7 \pcpi_timeout_counter_reg[2] 
       (.C(clk),
        .CE(pcpi_timeout_counter0),
        .D(pcpi_timeout_counter0_i_n_1),
        .Q(pcpi_timeout_counter[2]),
        .SET(pcpi_timeout_counter__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "529664" *) 
  (* map_to_module = "254" *) 
  RTL_REG_SYNC__BREG_7 \pcpi_timeout_counter_reg[3] 
       (.C(clk),
        .CE(pcpi_timeout_counter0),
        .D(pcpi_timeout_counter0_i_n_0),
        .Q(pcpi_timeout_counter[3]),
        .SET(pcpi_timeout_counter__0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "374" *) 
  RTL_MUX2 pcpi_timeout_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(pcpi_timeout__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "255" *) 
  RTL_REG_SYNC__BREG_1 pcpi_timeout_reg
       (.C(clk),
        .D(pcpi_timeout0),
        .Q(pcpi_timeout),
        .RST(pcpi_timeout__0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "431" *) 
  RTL_MUX155 pcpi_valid0_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .O(pcpi_valid0),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "1910016" *) 
  (* map_to_module = "692" *) 
  RTL_OR0 pcpi_valid1_i
       (.I0(pcpi_timeout),
        .I1(instr_ecall_ebreak),
        .O(pcpi_valid1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "525320" *) 
  (* map_to_module = "429" *) 
  RTL_MUX2 pcpi_valid_i
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(pcpi_valid_i_n_0),
        .S(pcpi_valid1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "525327" *) 
  (* map_to_module = "428" *) 
  RTL_MUX2 pcpi_valid_i__0
       (.I0(\<const0> ),
        .I1(pcpi_valid_i_n_0),
        .O(pcpi_valid_i__0_n_0),
        .S(pcpi_int_ready));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:default" *) 
  (* XLNX_LINE_COL = "264228" *) 
  (* map_to_module = "432" *) 
  RTL_MUX156 pcpi_valid_i__1
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .O(pcpi_valid_i__1_n_0),
        .S0(instr_trap),
        .S1(is_sb_sh_sw),
        .S2(is_sll_srl_sra));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "430" *) 
  RTL_MUX254 pcpi_valid_i__2
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(pcpi_valid0),
        .I3(pcpi_valid_i__1_n_0),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(pcpi_valid_i__2_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "985856" *) 
  (* map_to_module = "433" *) 
  RTL_MUX2 pcpi_valid_i__3
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(pcpi_valid_i__3_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "985856" *) 
  (* map_to_module = "270" *) 
  RTL_REG_SYNC__BREG_13 pcpi_valid_reg
       (.C(clk),
        .CE(pcpi_valid_i__2_n_0),
        .D(pcpi_valid_i__0_n_0),
        .Q(pcpi_valid),
        .RST(pcpi_valid_i__3_n_0));
  (* XLNX_LINE_COL = "1383424" *) 
  (* map_to_module = "716" *) 
  RTL_ADD33 reg_next_pc0_i
       (.I0(current_pc),
        .I1(decoded_imm_uj),
        .O(reg_next_pc0));
  (* XLNX_LINE_COL = "1320960" *) 
  (* map_to_module = "717" *) 
  RTL_ADD36 reg_next_pc0_i__0
       (.I0(current_pc),
        .I1(reg_next_pc1),
        .O({reg_next_pc0_i__0_n_0,reg_next_pc0_i__0_n_1,reg_next_pc0_i__0_n_2,reg_next_pc0_i__0_n_3,reg_next_pc0_i__0_n_4,reg_next_pc0_i__0_n_5,reg_next_pc0_i__0_n_6,reg_next_pc0_i__0_n_7,reg_next_pc0_i__0_n_8,reg_next_pc0_i__0_n_9,reg_next_pc0_i__0_n_10,reg_next_pc0_i__0_n_11,reg_next_pc0_i__0_n_12,reg_next_pc0_i__0_n_13,reg_next_pc0_i__0_n_14,reg_next_pc0_i__0_n_15,reg_next_pc0_i__0_n_16,reg_next_pc0_i__0_n_17,reg_next_pc0_i__0_n_18,reg_next_pc0_i__0_n_19,reg_next_pc0_i__0_n_20,reg_next_pc0_i__0_n_21,reg_next_pc0_i__0_n_22,reg_next_pc0_i__0_n_23,reg_next_pc0_i__0_n_24,reg_next_pc0_i__0_n_25,reg_next_pc0_i__0_n_26,reg_next_pc0_i__0_n_27,reg_next_pc0_i__0_n_28,reg_next_pc0_i__0_n_29,reg_next_pc0_i__0_n_30,reg_next_pc0_i__0_n_31}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "2169600" *) 
  (* map_to_module = "391" *) 
  RTL_MUX146 reg_next_pc1_i
       (.I0({\<const0> ,\<const0> ,\<const1> ,\<const0> }),
        .I1({\<const0> ,\<const1> ,\<const0> ,\<const0> }),
        .O(reg_next_pc1),
        .S(compressed_instr));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "328712" *) 
  (* map_to_module = "390" *) 
  RTL_MUX18 reg_next_pc_i
       (.I0(reg_next_pc0),
        .I1({reg_next_pc0_i__0_n_0,reg_next_pc0_i__0_n_1,reg_next_pc0_i__0_n_2,reg_next_pc0_i__0_n_3,reg_next_pc0_i__0_n_4,reg_next_pc0_i__0_n_5,reg_next_pc0_i__0_n_6,reg_next_pc0_i__0_n_7,reg_next_pc0_i__0_n_8,reg_next_pc0_i__0_n_9,reg_next_pc0_i__0_n_10,reg_next_pc0_i__0_n_11,reg_next_pc0_i__0_n_12,reg_next_pc0_i__0_n_13,reg_next_pc0_i__0_n_14,reg_next_pc0_i__0_n_15,reg_next_pc0_i__0_n_16,reg_next_pc0_i__0_n_17,reg_next_pc0_i__0_n_18,reg_next_pc0_i__0_n_19,reg_next_pc0_i__0_n_20,reg_next_pc0_i__0_n_21,reg_next_pc0_i__0_n_22,reg_next_pc0_i__0_n_23,reg_next_pc0_i__0_n_24,reg_next_pc0_i__0_n_25,reg_next_pc0_i__0_n_26,reg_next_pc0_i__0_n_27,reg_next_pc0_i__0_n_28,reg_next_pc0_i__0_n_29,reg_next_pc0_i__0_n_30,reg_next_pc0_i__0_n_31}),
        .O({reg_next_pc_i_n_0,reg_next_pc_i_n_1,reg_next_pc_i_n_2,reg_next_pc_i_n_3,reg_next_pc_i_n_4,reg_next_pc_i_n_5,reg_next_pc_i_n_6,reg_next_pc_i_n_7,reg_next_pc_i_n_8,reg_next_pc_i_n_9,reg_next_pc_i_n_10,reg_next_pc_i_n_11,reg_next_pc_i_n_12,reg_next_pc_i_n_13,reg_next_pc_i_n_14,reg_next_pc_i_n_15,reg_next_pc_i_n_16,reg_next_pc_i_n_17,reg_next_pc_i_n_18,reg_next_pc_i_n_19,reg_next_pc_i_n_20,reg_next_pc_i_n_21,reg_next_pc_i_n_22,reg_next_pc_i_n_23,reg_next_pc_i_n_24,reg_next_pc_i_n_25,reg_next_pc_i_n_26,reg_next_pc_i_n_27,reg_next_pc_i_n_28,reg_next_pc_i_n_29,reg_next_pc_i_n_30,reg_next_pc_i_n_31}),
        .S(instr_jal));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263187" *) 
  (* map_to_module = "389" *) 
  RTL_MUX18 reg_next_pc_i__0
       (.I0({reg_next_pc_i_n_0,reg_next_pc_i_n_1,reg_next_pc_i_n_2,reg_next_pc_i_n_3,reg_next_pc_i_n_4,reg_next_pc_i_n_5,reg_next_pc_i_n_6,reg_next_pc_i_n_7,reg_next_pc_i_n_8,reg_next_pc_i_n_9,reg_next_pc_i_n_10,reg_next_pc_i_n_11,reg_next_pc_i_n_12,reg_next_pc_i_n_13,reg_next_pc_i_n_14,reg_next_pc_i_n_15,reg_next_pc_i_n_16,reg_next_pc_i_n_17,reg_next_pc_i_n_18,reg_next_pc_i_n_19,reg_next_pc_i_n_20,reg_next_pc_i_n_21,reg_next_pc_i_n_22,reg_next_pc_i_n_23,reg_next_pc_i_n_24,reg_next_pc_i_n_25,reg_next_pc_i_n_26,reg_next_pc_i_n_27,reg_next_pc_i_n_28,reg_next_pc_i_n_29,reg_next_pc_i_n_30,reg_next_pc_i_n_31}),
        .I1(current_pc),
        .O(reg_next_pc__0),
        .S(decoder_trigger));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b0,INIT_128:1'sb1,INIT_64:1'b0,INIT_32:1'b0,INIT_16:1'b0,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "392" *) 
  RTL_ROM14 reg_next_pc_i__1
       (.A(cpu_state),
        .O(reg_next_pc_i__1_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "393" *) 
  RTL_MUX2 reg_next_pc_i__2
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(reg_next_pc_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[0] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[0]),
        .Q(reg_next_pc[0]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[10] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[10]),
        .Q(reg_next_pc[10]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[11] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[11]),
        .Q(reg_next_pc[11]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[12] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[12]),
        .Q(reg_next_pc[12]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[13] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[13]),
        .Q(reg_next_pc[13]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[14] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[14]),
        .Q(reg_next_pc[14]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[15] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[15]),
        .Q(reg_next_pc[15]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[16] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[16]),
        .Q(reg_next_pc[16]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[17] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[17]),
        .Q(reg_next_pc[17]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[18] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[18]),
        .Q(reg_next_pc[18]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[19] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[19]),
        .Q(reg_next_pc[19]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[1] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[1]),
        .Q(reg_next_pc[1]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[20] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[20]),
        .Q(reg_next_pc[20]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[21] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[21]),
        .Q(reg_next_pc[21]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[22] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[22]),
        .Q(reg_next_pc[22]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[23] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[23]),
        .Q(reg_next_pc[23]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[24] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[24]),
        .Q(reg_next_pc[24]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[25] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[25]),
        .Q(reg_next_pc[25]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[26] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[26]),
        .Q(reg_next_pc[26]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[27] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[27]),
        .Q(reg_next_pc[27]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[28] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[28]),
        .Q(reg_next_pc[28]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[29] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[29]),
        .Q(reg_next_pc[29]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[2] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[2]),
        .Q(reg_next_pc[2]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[30] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[30]),
        .Q(reg_next_pc[30]),
        .SET(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[31] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[31]),
        .Q(reg_next_pc[31]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[3] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[3]),
        .Q(reg_next_pc[3]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[4] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[4]),
        .Q(reg_next_pc[4]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[5] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[5]),
        .Q(reg_next_pc[5]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[6] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[6]),
        .Q(reg_next_pc[6]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[7] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[7]),
        .Q(reg_next_pc[7]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[8] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[8]),
        .Q(reg_next_pc[8]),
        .RST(reg_next_pc_i__2_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "262" *) 
  RTL_REG_SYNC__BREG_22 \reg_next_pc_reg[9] 
       (.C(clk),
        .CE(reg_next_pc_i__1_n_0),
        .D(reg_next_pc__0[9]),
        .Q(reg_next_pc[9]),
        .RST(reg_next_pc_i__2_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "502" *) 
  RTL_MUX251 reg_op10_i
       (.I0({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I2({reg_op11_i__0_n_0,reg_op11_i__0_n_1,reg_op11_i__0_n_2,reg_op11_i__0_n_3,reg_op11_i__0_n_4,reg_op11_i__0_n_5,reg_op11_i__0_n_6,reg_op11_i__0_n_7,reg_op11_i__0_n_8,reg_op11_i__0_n_9,reg_op11_i__0_n_10,reg_op11_i__0_n_11,reg_op11_i__0_n_12,reg_op11_i__0_n_13,reg_op11_i__0_n_14,reg_op11_i__0_n_15,reg_op11_i__0_n_16,reg_op11_i__0_n_17,reg_op11_i__0_n_18,reg_op11_i__0_n_19,reg_op11_i__0_n_20,reg_op11_i__0_n_21,reg_op11_i__0_n_22,reg_op11_i__0_n_23,reg_op11_i__0_n_24,reg_op11_i__0_n_25,reg_op11_i__0_n_26,reg_op11_i__0_n_27,reg_op11_i__0_n_28,reg_op11_i__0_n_29,reg_op11_i__0_n_30,reg_op11_i__0_n_31}),
        .I3({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .I4({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .I5({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .I6({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .O(reg_op1),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "2755840" *) 
  (* map_to_module = "510" *) 
  RTL_LSHIFT2 reg_op10_i__0
       (.I0(pcpi_rs1),
        .I1({\<const1> ,\<const0> ,\<const0> }),
        .I2(\<const1> ),
        .O({reg_op10_i__0_n_0,reg_op10_i__0_n_1,reg_op10_i__0_n_2,reg_op10_i__0_n_3,reg_op10_i__0_n_4,reg_op10_i__0_n_5,reg_op10_i__0_n_6,reg_op10_i__0_n_7,reg_op10_i__0_n_8,reg_op10_i__0_n_9,reg_op10_i__0_n_10,reg_op10_i__0_n_11,reg_op10_i__0_n_12,reg_op10_i__0_n_13,reg_op10_i__0_n_14,reg_op10_i__0_n_15,reg_op10_i__0_n_16,reg_op10_i__0_n_17,reg_op10_i__0_n_18,reg_op10_i__0_n_19,reg_op10_i__0_n_20,reg_op10_i__0_n_21,reg_op10_i__0_n_22,reg_op10_i__0_n_23,reg_op10_i__0_n_24,reg_op10_i__0_n_25,reg_op10_i__0_n_26,reg_op10_i__0_n_27,reg_op10_i__0_n_28,reg_op10_i__0_n_29,reg_op10_i__0_n_30,reg_op10_i__0_n_31}));
  (* XLNX_LINE_COL = "2755840" *) 
  (* map_to_module = "511" *) 
  RTL_RSHIFT3 reg_op10_i__1
       (.I0(pcpi_rs1),
        .I1({\<const1> ,\<const0> ,\<const0> }),
        .I2(\<const1> ),
        .O({reg_op10_i__1_n_0,reg_op10_i__1_n_1,reg_op10_i__1_n_2,reg_op10_i__1_n_3,reg_op10_i__1_n_4,reg_op10_i__1_n_5,reg_op10_i__1_n_6,reg_op10_i__1_n_7,reg_op10_i__1_n_8,reg_op10_i__1_n_9,reg_op10_i__1_n_10,reg_op10_i__1_n_11,reg_op10_i__1_n_12,reg_op10_i__1_n_13,reg_op10_i__1_n_14,reg_op10_i__1_n_15,reg_op10_i__1_n_16,reg_op10_i__1_n_17,reg_op10_i__1_n_18,reg_op10_i__1_n_19,reg_op10_i__1_n_20,reg_op10_i__1_n_21,reg_op10_i__1_n_22,reg_op10_i__1_n_23,reg_op10_i__1_n_24,reg_op10_i__1_n_25,reg_op10_i__1_n_26,reg_op10_i__1_n_27,reg_op10_i__1_n_28,reg_op10_i__1_n_29,reg_op10_i__1_n_30,reg_op10_i__1_n_31}));
  (* XLNX_LINE_COL = "2758400" *) 
  (* map_to_module = "508" *) 
  RTL_ARSHIFT reg_op10_i__2
       (.I0(pcpi_rs1),
        .I1({\<const1> ,\<const0> ,\<const0> }),
        .I2(\<const1> ),
        .O({reg_op10_i__2_n_0,reg_op10_i__2_n_1,reg_op10_i__2_n_2,reg_op10_i__2_n_3,reg_op10_i__2_n_4,reg_op10_i__2_n_5,reg_op10_i__2_n_6,reg_op10_i__2_n_7,reg_op10_i__2_n_8,reg_op10_i__2_n_9,reg_op10_i__2_n_10,reg_op10_i__2_n_11,reg_op10_i__2_n_12,reg_op10_i__2_n_13,reg_op10_i__2_n_14,reg_op10_i__2_n_15,reg_op10_i__2_n_16,reg_op10_i__2_n_17,reg_op10_i__2_n_18,reg_op10_i__2_n_19,reg_op10_i__2_n_20,reg_op10_i__2_n_21,reg_op10_i__2_n_22,reg_op10_i__2_n_23,reg_op10_i__2_n_24,reg_op10_i__2_n_25,reg_op10_i__2_n_26,reg_op10_i__2_n_27,reg_op10_i__2_n_28,reg_op10_i__2_n_29,reg_op10_i__2_n_30,reg_op10_i__2_n_31}));
  (* XLNX_LINE_COL = "2755840" *) 
  (* map_to_module = "512" *) 
  RTL_LSHIFT3 reg_op10_i__3
       (.I0(pcpi_rs1),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O({reg_op10_i__3_n_0,reg_op10_i__3_n_1,reg_op10_i__3_n_2,reg_op10_i__3_n_3,reg_op10_i__3_n_4,reg_op10_i__3_n_5,reg_op10_i__3_n_6,reg_op10_i__3_n_7,reg_op10_i__3_n_8,reg_op10_i__3_n_9,reg_op10_i__3_n_10,reg_op10_i__3_n_11,reg_op10_i__3_n_12,reg_op10_i__3_n_13,reg_op10_i__3_n_14,reg_op10_i__3_n_15,reg_op10_i__3_n_16,reg_op10_i__3_n_17,reg_op10_i__3_n_18,reg_op10_i__3_n_19,reg_op10_i__3_n_20,reg_op10_i__3_n_21,reg_op10_i__3_n_22,reg_op10_i__3_n_23,reg_op10_i__3_n_24,reg_op10_i__3_n_25,reg_op10_i__3_n_26,reg_op10_i__3_n_27,reg_op10_i__3_n_28,reg_op10_i__3_n_29,reg_op10_i__3_n_30,reg_op10_i__3_n_31}));
  (* XLNX_LINE_COL = "2755840" *) 
  (* map_to_module = "513" *) 
  RTL_RSHIFT2 reg_op10_i__4
       (.I0(pcpi_rs1),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O({reg_op10_i__4_n_0,reg_op10_i__4_n_1,reg_op10_i__4_n_2,reg_op10_i__4_n_3,reg_op10_i__4_n_4,reg_op10_i__4_n_5,reg_op10_i__4_n_6,reg_op10_i__4_n_7,reg_op10_i__4_n_8,reg_op10_i__4_n_9,reg_op10_i__4_n_10,reg_op10_i__4_n_11,reg_op10_i__4_n_12,reg_op10_i__4_n_13,reg_op10_i__4_n_14,reg_op10_i__4_n_15,reg_op10_i__4_n_16,reg_op10_i__4_n_17,reg_op10_i__4_n_18,reg_op10_i__4_n_19,reg_op10_i__4_n_20,reg_op10_i__4_n_21,reg_op10_i__4_n_22,reg_op10_i__4_n_23,reg_op10_i__4_n_24,reg_op10_i__4_n_25,reg_op10_i__4_n_26,reg_op10_i__4_n_27,reg_op10_i__4_n_28,reg_op10_i__4_n_29,reg_op10_i__4_n_30,reg_op10_i__4_n_31}));
  (* XLNX_LINE_COL = "2758400" *) 
  (* map_to_module = "509" *) 
  RTL_ARSHIFT0 reg_op10_i__5
       (.I0(pcpi_rs1),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O({reg_op10_i__5_n_0,reg_op10_i__5_n_1,reg_op10_i__5_n_2,reg_op10_i__5_n_3,reg_op10_i__5_n_4,reg_op10_i__5_n_5,reg_op10_i__5_n_6,reg_op10_i__5_n_7,reg_op10_i__5_n_8,reg_op10_i__5_n_9,reg_op10_i__5_n_10,reg_op10_i__5_n_11,reg_op10_i__5_n_12,reg_op10_i__5_n_13,reg_op10_i__5_n_14,reg_op10_i__5_n_15,reg_op10_i__5_n_16,reg_op10_i__5_n_17,reg_op10_i__5_n_18,reg_op10_i__5_n_19,reg_op10_i__5_n_20,reg_op10_i__5_n_21,reg_op10_i__5_n_22,reg_op10_i__5_n_23,reg_op10_i__5_n_24,reg_op10_i__5_n_25,reg_op10_i__5_n_26,reg_op10_i__5_n_27,reg_op10_i__5_n_28,reg_op10_i__5_n_29,reg_op10_i__5_n_30,reg_op10_i__5_n_31}));
  (* XLNX_LINE_COL = "1119744" *) 
  (* map_to_module = "719" *) 
  RTL_ADD33 reg_op10_i__6
       (.I0(pcpi_rs1),
        .I1(decoded_imm),
        .O(reg_op10));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1124096" *) 
  (* map_to_module = "503" *) 
  RTL_MUX18 reg_op11_i
       (.I0(reg_op12),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({reg_op11_i_n_0,reg_op11_i_n_1,reg_op11_i_n_2,reg_op11_i_n_3,reg_op11_i_n_4,reg_op11_i_n_5,reg_op11_i_n_6,reg_op11_i_n_7,reg_op11_i_n_8,reg_op11_i_n_9,reg_op11_i_n_10,reg_op11_i_n_11,reg_op11_i_n_12,reg_op11_i_n_13,reg_op11_i_n_14,reg_op11_i_n_15,reg_op11_i_n_16,reg_op11_i_n_17,reg_op11_i_n_18,reg_op11_i_n_19,reg_op11_i_n_20,reg_op11_i_n_21,reg_op11_i_n_22,reg_op11_i_n_23,reg_op11_i_n_24,reg_op11_i_n_25,reg_op11_i_n_26,reg_op11_i_n_27,reg_op11_i_n_28,reg_op11_i_n_29,reg_op11_i_n_30,reg_op11_i_n_31}),
        .S(reg_op13));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1120000" *) 
  (* map_to_module = "504" *) 
  RTL_MUX18 reg_op11_i__0
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1(reg_pc),
        .O({reg_op11_i__0_n_0,reg_op11_i__0_n_1,reg_op11_i__0_n_2,reg_op11_i__0_n_3,reg_op11_i__0_n_4,reg_op11_i__0_n_5,reg_op11_i__0_n_6,reg_op11_i__0_n_7,reg_op11_i__0_n_8,reg_op11_i__0_n_9,reg_op11_i__0_n_10,reg_op11_i__0_n_11,reg_op11_i__0_n_12,reg_op11_i__0_n_13,reg_op11_i__0_n_14,reg_op11_i__0_n_15,reg_op11_i__0_n_16,reg_op11_i__0_n_17,reg_op11_i__0_n_18,reg_op11_i__0_n_19,reg_op11_i__0_n_20,reg_op11_i__0_n_21,reg_op11_i__0_n_22,reg_op11_i__0_n_23,reg_op11_i__0_n_24,reg_op11_i__0_n_25,reg_op11_i__0_n_26,reg_op11_i__0_n_27,reg_op11_i__0_n_28,reg_op11_i__0_n_29,reg_op11_i__0_n_30,reg_op11_i__0_n_31}),
        .S(instr_lui));
  (* XLNX_LINE_COL = "399360" *) 
  (* map_to_module = "701" *) 
  RTL_OR0 reg_op11_i__1
       (.I0(instr_slli),
        .I1(instr_sll),
        .O(reg_op11));
  (* XLNX_LINE_COL = "399360" *) 
  (* map_to_module = "702" *) 
  RTL_OR0 reg_op11_i__2
       (.I0(instr_srli),
        .I1(instr_srl),
        .O(reg_op11_i__2_n_0));
  (* XLNX_LINE_COL = "399360" *) 
  (* map_to_module = "703" *) 
  RTL_OR0 reg_op11_i__3
       (.I0(instr_srai),
        .I1(instr_sra),
        .O(reg_op11_i__3_n_0));
  (* XLNX_LINE_COL = "1124096" *) 
  (* map_to_module = "700" *) 
  RTL_REDUCTION_OR18 reg_op13_i
       (.I0(decoded_rs1),
        .O(reg_op13));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1" *) 
  (* XLNX_LINE_COL = "329733" *) 
  (* map_to_module = "506" *) 
  RTL_MUX242 reg_op1_i
       (.I0({reg_op10_i__0_n_0,reg_op10_i__0_n_1,reg_op10_i__0_n_2,reg_op10_i__0_n_3,reg_op10_i__0_n_4,reg_op10_i__0_n_5,reg_op10_i__0_n_6,reg_op10_i__0_n_7,reg_op10_i__0_n_8,reg_op10_i__0_n_9,reg_op10_i__0_n_10,reg_op10_i__0_n_11,reg_op10_i__0_n_12,reg_op10_i__0_n_13,reg_op10_i__0_n_14,reg_op10_i__0_n_15,reg_op10_i__0_n_16,reg_op10_i__0_n_17,reg_op10_i__0_n_18,reg_op10_i__0_n_19,reg_op10_i__0_n_20,reg_op10_i__0_n_21,reg_op10_i__0_n_22,reg_op10_i__0_n_23,reg_op10_i__0_n_24,reg_op10_i__0_n_25,reg_op10_i__0_n_26,reg_op10_i__0_n_27,reg_op10_i__0_n_28,reg_op10_i__0_n_29,reg_op10_i__0_n_30,reg_op10_i__0_n_31}),
        .I1({reg_op10_i__1_n_0,reg_op10_i__1_n_1,reg_op10_i__1_n_2,reg_op10_i__1_n_3,reg_op10_i__1_n_4,reg_op10_i__1_n_5,reg_op10_i__1_n_6,reg_op10_i__1_n_7,reg_op10_i__1_n_8,reg_op10_i__1_n_9,reg_op10_i__1_n_10,reg_op10_i__1_n_11,reg_op10_i__1_n_12,reg_op10_i__1_n_13,reg_op10_i__1_n_14,reg_op10_i__1_n_15,reg_op10_i__1_n_16,reg_op10_i__1_n_17,reg_op10_i__1_n_18,reg_op10_i__1_n_19,reg_op10_i__1_n_20,reg_op10_i__1_n_21,reg_op10_i__1_n_22,reg_op10_i__1_n_23,reg_op10_i__1_n_24,reg_op10_i__1_n_25,reg_op10_i__1_n_26,reg_op10_i__1_n_27,reg_op10_i__1_n_28,reg_op10_i__1_n_29,reg_op10_i__1_n_30,reg_op10_i__1_n_31}),
        .I2({reg_op10_i__2_n_0,reg_op10_i__2_n_1,reg_op10_i__2_n_2,reg_op10_i__2_n_3,reg_op10_i__2_n_4,reg_op10_i__2_n_5,reg_op10_i__2_n_6,reg_op10_i__2_n_7,reg_op10_i__2_n_8,reg_op10_i__2_n_9,reg_op10_i__2_n_10,reg_op10_i__2_n_11,reg_op10_i__2_n_12,reg_op10_i__2_n_13,reg_op10_i__2_n_14,reg_op10_i__2_n_15,reg_op10_i__2_n_16,reg_op10_i__2_n_17,reg_op10_i__2_n_18,reg_op10_i__2_n_19,reg_op10_i__2_n_20,reg_op10_i__2_n_21,reg_op10_i__2_n_22,reg_op10_i__2_n_23,reg_op10_i__2_n_24,reg_op10_i__2_n_25,reg_op10_i__2_n_26,reg_op10_i__2_n_27,reg_op10_i__2_n_28,reg_op10_i__2_n_29,reg_op10_i__2_n_30,reg_op10_i__2_n_31}),
        .O({reg_op1_i_n_0,reg_op1_i_n_1,reg_op1_i_n_2,reg_op1_i_n_3,reg_op1_i_n_4,reg_op1_i_n_5,reg_op1_i_n_6,reg_op1_i_n_7,reg_op1_i_n_8,reg_op1_i_n_9,reg_op1_i_n_10,reg_op1_i_n_11,reg_op1_i_n_12,reg_op1_i_n_13,reg_op1_i_n_14,reg_op1_i_n_15,reg_op1_i_n_16,reg_op1_i_n_17,reg_op1_i_n_18,reg_op1_i_n_19,reg_op1_i_n_20,reg_op1_i_n_21,reg_op1_i_n_22,reg_op1_i_n_23,reg_op1_i_n_24,reg_op1_i_n_25,reg_op1_i_n_26,reg_op1_i_n_27,reg_op1_i_n_28,reg_op1_i_n_29,reg_op1_i_n_30,reg_op1_i_n_31}),
        .S0(reg_op11),
        .S1(reg_op11_i__2_n_0),
        .S2(reg_op11_i__3_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1" *) 
  (* XLNX_LINE_COL = "329733" *) 
  (* map_to_module = "507" *) 
  RTL_MUX242 reg_op1_i__0
       (.I0({reg_op10_i__3_n_0,reg_op10_i__3_n_1,reg_op10_i__3_n_2,reg_op10_i__3_n_3,reg_op10_i__3_n_4,reg_op10_i__3_n_5,reg_op10_i__3_n_6,reg_op10_i__3_n_7,reg_op10_i__3_n_8,reg_op10_i__3_n_9,reg_op10_i__3_n_10,reg_op10_i__3_n_11,reg_op10_i__3_n_12,reg_op10_i__3_n_13,reg_op10_i__3_n_14,reg_op10_i__3_n_15,reg_op10_i__3_n_16,reg_op10_i__3_n_17,reg_op10_i__3_n_18,reg_op10_i__3_n_19,reg_op10_i__3_n_20,reg_op10_i__3_n_21,reg_op10_i__3_n_22,reg_op10_i__3_n_23,reg_op10_i__3_n_24,reg_op10_i__3_n_25,reg_op10_i__3_n_26,reg_op10_i__3_n_27,reg_op10_i__3_n_28,reg_op10_i__3_n_29,reg_op10_i__3_n_30,reg_op10_i__3_n_31}),
        .I1({reg_op10_i__4_n_0,reg_op10_i__4_n_1,reg_op10_i__4_n_2,reg_op10_i__4_n_3,reg_op10_i__4_n_4,reg_op10_i__4_n_5,reg_op10_i__4_n_6,reg_op10_i__4_n_7,reg_op10_i__4_n_8,reg_op10_i__4_n_9,reg_op10_i__4_n_10,reg_op10_i__4_n_11,reg_op10_i__4_n_12,reg_op10_i__4_n_13,reg_op10_i__4_n_14,reg_op10_i__4_n_15,reg_op10_i__4_n_16,reg_op10_i__4_n_17,reg_op10_i__4_n_18,reg_op10_i__4_n_19,reg_op10_i__4_n_20,reg_op10_i__4_n_21,reg_op10_i__4_n_22,reg_op10_i__4_n_23,reg_op10_i__4_n_24,reg_op10_i__4_n_25,reg_op10_i__4_n_26,reg_op10_i__4_n_27,reg_op10_i__4_n_28,reg_op10_i__4_n_29,reg_op10_i__4_n_30,reg_op10_i__4_n_31}),
        .I2({reg_op10_i__5_n_0,reg_op10_i__5_n_1,reg_op10_i__5_n_2,reg_op10_i__5_n_3,reg_op10_i__5_n_4,reg_op10_i__5_n_5,reg_op10_i__5_n_6,reg_op10_i__5_n_7,reg_op10_i__5_n_8,reg_op10_i__5_n_9,reg_op10_i__5_n_10,reg_op10_i__5_n_11,reg_op10_i__5_n_12,reg_op10_i__5_n_13,reg_op10_i__5_n_14,reg_op10_i__5_n_15,reg_op10_i__5_n_16,reg_op10_i__5_n_17,reg_op10_i__5_n_18,reg_op10_i__5_n_19,reg_op10_i__5_n_20,reg_op10_i__5_n_21,reg_op10_i__5_n_22,reg_op10_i__5_n_23,reg_op10_i__5_n_24,reg_op10_i__5_n_25,reg_op10_i__5_n_26,reg_op10_i__5_n_27,reg_op10_i__5_n_28,reg_op10_i__5_n_29,reg_op10_i__5_n_30,reg_op10_i__5_n_31}),
        .O({reg_op1_i__0_n_0,reg_op1_i__0_n_1,reg_op1_i__0_n_2,reg_op1_i__0_n_3,reg_op1_i__0_n_4,reg_op1_i__0_n_5,reg_op1_i__0_n_6,reg_op1_i__0_n_7,reg_op1_i__0_n_8,reg_op1_i__0_n_9,reg_op1_i__0_n_10,reg_op1_i__0_n_11,reg_op1_i__0_n_12,reg_op1_i__0_n_13,reg_op1_i__0_n_14,reg_op1_i__0_n_15,reg_op1_i__0_n_16,reg_op1_i__0_n_17,reg_op1_i__0_n_18,reg_op1_i__0_n_19,reg_op1_i__0_n_20,reg_op1_i__0_n_21,reg_op1_i__0_n_22,reg_op1_i__0_n_23,reg_op1_i__0_n_24,reg_op1_i__0_n_25,reg_op1_i__0_n_26,reg_op1_i__0_n_27,reg_op1_i__0_n_28,reg_op1_i__0_n_29,reg_op1_i__0_n_30,reg_op1_i__0_n_31}),
        .S0(reg_op11),
        .S1(reg_op11_i__2_n_0),
        .S2(reg_op11_i__3_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "851984" *) 
  (* map_to_module = "505" *) 
  RTL_MUX18 reg_op1_i__1
       (.I0({reg_op1_i_n_0,reg_op1_i_n_1,reg_op1_i_n_2,reg_op1_i_n_3,reg_op1_i_n_4,reg_op1_i_n_5,reg_op1_i_n_6,reg_op1_i_n_7,reg_op1_i_n_8,reg_op1_i_n_9,reg_op1_i_n_10,reg_op1_i_n_11,reg_op1_i_n_12,reg_op1_i_n_13,reg_op1_i_n_14,reg_op1_i_n_15,reg_op1_i_n_16,reg_op1_i_n_17,reg_op1_i_n_18,reg_op1_i_n_19,reg_op1_i_n_20,reg_op1_i_n_21,reg_op1_i_n_22,reg_op1_i_n_23,reg_op1_i_n_24,reg_op1_i_n_25,reg_op1_i_n_26,reg_op1_i_n_27,reg_op1_i_n_28,reg_op1_i_n_29,reg_op1_i_n_30,reg_op1_i_n_31}),
        .I1({reg_op1_i__0_n_0,reg_op1_i__0_n_1,reg_op1_i__0_n_2,reg_op1_i__0_n_3,reg_op1_i__0_n_4,reg_op1_i__0_n_5,reg_op1_i__0_n_6,reg_op1_i__0_n_7,reg_op1_i__0_n_8,reg_op1_i__0_n_9,reg_op1_i__0_n_10,reg_op1_i__0_n_11,reg_op1_i__0_n_12,reg_op1_i__0_n_13,reg_op1_i__0_n_14,reg_op1_i__0_n_15,reg_op1_i__0_n_16,reg_op1_i__0_n_17,reg_op1_i__0_n_18,reg_op1_i__0_n_19,reg_op1_i__0_n_20,reg_op1_i__0_n_21,reg_op1_i__0_n_22,reg_op1_i__0_n_23,reg_op1_i__0_n_24,reg_op1_i__0_n_25,reg_op1_i__0_n_26,reg_op1_i__0_n_27,reg_op1_i__0_n_28,reg_op1_i__0_n_29,reg_op1_i__0_n_30,reg_op1_i__0_n_31}),
        .O(reg_op13_out),
        .S(reg_sh1));
  (* SEL_VAL = ",I0:S=10'b0001000000,I1:S=10'b0000001000,I2:S=10'b0000000100,I3:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "501" *) 
  RTL_MUX237 reg_op1_i__2
       (.I0(reg_op1),
        .I1(reg_op13_out),
        .I2(reg_op10),
        .I3(reg_op10),
        .O(reg_op11_out),
        .S(cpu_state));
  (* INIT_VAL = "INIT_DEFAULT:1'b1,INIT_0:1'b0" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "520" *) 
  RTL_ROM18 reg_op1_i__3
       (.A(reg_sh),
        .O(reg_op1_i__3_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328717" *) 
  (* map_to_module = "519" *) 
  RTL_MUX2 reg_op1_i__4
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(reg_op1_i__4_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "518" *) 
  RTL_MUX2 reg_op1_i__5
       (.I0(reg_op1_i__4_n_0),
        .I1(\<const0> ),
        .O(reg_op1_i__5_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "517" *) 
  RTL_MUX2 reg_op1_i__6
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(reg_op1_i__6_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "516" *) 
  RTL_MUX2 reg_op1_i__7
       (.I0(reg_op1_i__6_n_0),
        .I1(\<const0> ),
        .O(reg_op1_i__7_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "515" *) 
  RTL_MUX254 reg_op1_i__8
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const1> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(reg_op1_i__3_n_0),
        .I6(reg_op1_i__5_n_0),
        .I7(\<const0> ),
        .I8(reg_op1_i__7_n_0),
        .O(reg_op1_i__8_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "514" *) 
  RTL_MUX2 reg_op1_i__9
       (.I0(\<const0> ),
        .I1(reg_op1_i__8_n_0),
        .O(reg_op10_out),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[0] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[0]),
        .Q(pcpi_rs1[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[10] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[10]),
        .Q(pcpi_rs1[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[11] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[11]),
        .Q(pcpi_rs1[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[12] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[12]),
        .Q(pcpi_rs1[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[13] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[13]),
        .Q(pcpi_rs1[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[14] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[14]),
        .Q(pcpi_rs1[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[15] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[15]),
        .Q(pcpi_rs1[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[16] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[16]),
        .Q(pcpi_rs1[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[17] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[17]),
        .Q(pcpi_rs1[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[18] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[18]),
        .Q(pcpi_rs1[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[19] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[19]),
        .Q(pcpi_rs1[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[1] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[1]),
        .Q(pcpi_rs1[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[20] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[20]),
        .Q(pcpi_rs1[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[21] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[21]),
        .Q(pcpi_rs1[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[22] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[22]),
        .Q(pcpi_rs1[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[23] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[23]),
        .Q(pcpi_rs1[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[24] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[24]),
        .Q(pcpi_rs1[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[25] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[25]),
        .Q(pcpi_rs1[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[26] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[26]),
        .Q(pcpi_rs1[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[27] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[27]),
        .Q(pcpi_rs1[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[28] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[28]),
        .Q(pcpi_rs1[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[29] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[29]),
        .Q(pcpi_rs1[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[2] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[2]),
        .Q(pcpi_rs1[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[30] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[30]),
        .Q(pcpi_rs1[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[31] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[31]),
        .Q(pcpi_rs1[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[3] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[3]),
        .Q(pcpi_rs1[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[4] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[4]),
        .Q(pcpi_rs1[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[5] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[5]),
        .Q(pcpi_rs1[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[6] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[6]),
        .Q(pcpi_rs1[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[7] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[7]),
        .Q(pcpi_rs1[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[8] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[8]),
        .Q(pcpi_rs1[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "278" *) 
  RTL_REG__BREG_11 \reg_op1_reg[9] 
       (.C(clk),
        .CE(reg_op10_out),
        .D(reg_op11_out[9]),
        .Q(pcpi_rs1[9]));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "522" *) 
  RTL_MUX251 reg_op20_i
       (.I0(cpuregs_rs2),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I2(decoded_imm),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I4({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I5(decoded_imm),
        .I6(cpuregs_rs2),
        .O({reg_op20_i_n_0,reg_op20_i_n_1,reg_op20_i_n_2,reg_op20_i_n_3,reg_op20_i_n_4,reg_op20_i_n_5,reg_op20_i_n_6,reg_op20_i_n_7,reg_op20_i_n_8,reg_op20_i_n_9,reg_op20_i_n_10,reg_op20_i_n_11,reg_op20_i_n_12,reg_op20_i_n_13,reg_op20_i_n_14,reg_op20_i_n_15,reg_op20_i_n_16,reg_op20_i_n_17,reg_op20_i_n_18,reg_op20_i_n_19,reg_op20_i_n_20,reg_op20_i_n_21,reg_op20_i_n_22,reg_op20_i_n_23,reg_op20_i_n_24,reg_op20_i_n_25,reg_op20_i_n_26,reg_op20_i_n_27,reg_op20_i_n_28,reg_op20_i_n_29,reg_op20_i_n_30,reg_op20_i_n_31}),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* SEL_VAL = ",I0:S=10'b0001000000,I1:S=10'b0000100000" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "521" *) 
  RTL_MUX250 reg_op2_i
       (.I0({reg_op20_i_n_0,reg_op20_i_n_1,reg_op20_i_n_2,reg_op20_i_n_3,reg_op20_i_n_4,reg_op20_i_n_5,reg_op20_i_n_6,reg_op20_i_n_7,reg_op20_i_n_8,reg_op20_i_n_9,reg_op20_i_n_10,reg_op20_i_n_11,reg_op20_i_n_12,reg_op20_i_n_13,reg_op20_i_n_14,reg_op20_i_n_15,reg_op20_i_n_16,reg_op20_i_n_17,reg_op20_i_n_18,reg_op20_i_n_19,reg_op20_i_n_20,reg_op20_i_n_21,reg_op20_i_n_22,reg_op20_i_n_23,reg_op20_i_n_24,reg_op20_i_n_25,reg_op20_i_n_26,reg_op20_i_n_27,reg_op20_i_n_28,reg_op20_i_n_29,reg_op20_i_n_30,reg_op20_i_n_31}),
        .I1(cpuregs_rs2),
        .O(reg_op2),
        .S(cpu_state));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b0,INIT_128:1'b0,INIT_64:1'b1,INIT_32:1'b1,INIT_16:1'b0,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "524" *) 
  RTL_ROM14 reg_op2_i__0
       (.A(cpu_state),
        .O(reg_op2_i__0_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "523" *) 
  RTL_MUX2 reg_op2_i__1
       (.I0(\<const0> ),
        .I1(reg_op2_i__0_n_0),
        .O(reg_op2_i__1_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[0] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[0]),
        .Q(pcpi_rs2[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[10] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[10]),
        .Q(pcpi_rs2[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[11] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[11]),
        .Q(pcpi_rs2[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[12] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[12]),
        .Q(pcpi_rs2[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[13] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[13]),
        .Q(pcpi_rs2[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[14] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[14]),
        .Q(pcpi_rs2[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[15] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[15]),
        .Q(pcpi_rs2[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[16] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[16]),
        .Q(pcpi_rs2[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[17] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[17]),
        .Q(pcpi_rs2[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[18] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[18]),
        .Q(pcpi_rs2[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[19] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[19]),
        .Q(pcpi_rs2[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[1] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[1]),
        .Q(pcpi_rs2[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[20] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[20]),
        .Q(pcpi_rs2[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[21] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[21]),
        .Q(pcpi_rs2[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[22] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[22]),
        .Q(pcpi_rs2[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[23] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[23]),
        .Q(pcpi_rs2[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[24] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[24]),
        .Q(pcpi_rs2[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[25] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[25]),
        .Q(pcpi_rs2[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[26] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[26]),
        .Q(pcpi_rs2[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[27] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[27]),
        .Q(pcpi_rs2[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[28] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[28]),
        .Q(pcpi_rs2[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[29] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[29]),
        .Q(pcpi_rs2[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[2] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[2]),
        .Q(pcpi_rs2[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[30] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[30]),
        .Q(pcpi_rs2[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[31] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[31]),
        .Q(pcpi_rs2[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[3] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[3]),
        .Q(pcpi_rs2[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[4] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[4]),
        .Q(pcpi_rs2[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[5] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[5]),
        .Q(pcpi_rs2[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[6] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[6]),
        .Q(pcpi_rs2[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[7] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[7]),
        .Q(pcpi_rs2[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[8] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[8]),
        .Q(pcpi_rs2[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "264192" *) 
  (* map_to_module = "279" *) 
  RTL_REG__BREG_11 \reg_op2_reg[9] 
       (.C(clk),
        .CE(reg_op2_i__1_n_0),
        .D(reg_op2[9]),
        .Q(pcpi_rs2[9]));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "359" *) 
  RTL_MUX120 reg_out0_i
       (.I0(pcpi_int_rd),
        .I1({reg_out_i_n_0,reg_out_i_n_1,reg_out_i_n_2,reg_out_i_n_3,reg_out_i_n_4,reg_out_i_n_5,reg_out_i_n_6,reg_out_i_n_7,reg_out_i_n_8,reg_out_i_n_9,reg_out_i_n_10,reg_out_i_n_11,reg_out_i_n_12,reg_out_i_n_13,reg_out_i_n_14,reg_out_i_n_15,reg_out_i_n_16,reg_out_i_n_17,reg_out_i_n_18,reg_out_i_n_19,reg_out_i_n_20,reg_out_i_n_21,reg_out_i_n_22,reg_out_i_n_23,reg_out_i_n_24,reg_out_i_n_25,reg_out_i_n_26,reg_out_i_n_27,reg_out_i_n_28,reg_out_i_n_29,reg_out_i_n_30,reg_out_i_n_31}),
        .I2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I4({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I5({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({reg_out0_i_n_0,reg_out0_i_n_1,reg_out0_i_n_2,reg_out0_i_n_3,reg_out0_i_n_4,reg_out0_i_n_5,reg_out0_i_n_6,reg_out0_i_n_7,reg_out0_i_n_8,reg_out0_i_n_9,reg_out0_i_n_10,reg_out0_i_n_11,reg_out0_i_n_12,reg_out0_i_n_13,reg_out0_i_n_14,reg_out0_i_n_15,reg_out0_i_n_16,reg_out0_i_n_17,reg_out0_i_n_18,reg_out0_i_n_19,reg_out0_i_n_20,reg_out0_i_n_21,reg_out0_i_n_22,reg_out0_i_n_23,reg_out0_i_n_24,reg_out0_i_n_25,reg_out0_i_n_26,reg_out0_i_n_27,reg_out0_i_n_28,reg_out0_i_n_29,reg_out0_i_n_30,reg_out0_i_n_31}),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "988416" *) 
  (* map_to_module = "708" *) 
  RTL_ADD33 reg_out0_i__0
       (.I0(reg_pc),
        .I1(decoded_imm),
        .O(reg_out0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "360" *) 
  RTL_MUX121 reg_out1_i
       (.I0(pcpi_mul_rd),
        .I1(pcpi_div_rd),
        .O(pcpi_int_rd),
        .S0(pcpi_mul_ready),
        .S1(pcpi_div_ready));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1" *) 
  (* XLNX_LINE_COL = "395274" *) 
  (* map_to_module = "361" *) 
  RTL_MUX122 reg_out_i
       (.I0({count_cycle_reg_n_32,count_cycle_reg_n_33,count_cycle_reg_n_34,count_cycle_reg_n_35,count_cycle_reg_n_36,count_cycle_reg_n_37,count_cycle_reg_n_38,count_cycle_reg_n_39,count_cycle_reg_n_40,count_cycle_reg_n_41,count_cycle_reg_n_42,count_cycle_reg_n_43,count_cycle_reg_n_44,count_cycle_reg_n_45,count_cycle_reg_n_46,count_cycle_reg_n_47,count_cycle_reg_n_48,count_cycle_reg_n_49,count_cycle_reg_n_50,count_cycle_reg_n_51,count_cycle_reg_n_52,count_cycle_reg_n_53,count_cycle_reg_n_54,count_cycle_reg_n_55,count_cycle_reg_n_56,count_cycle_reg_n_57,count_cycle_reg_n_58,count_cycle_reg_n_59,count_cycle_reg_n_60,count_cycle_reg_n_61,count_cycle_reg_n_62,count_cycle_reg_n_63}),
        .I1(p_1_in),
        .I2(count_instr[31:0]),
        .I3(count_instr[63:32]),
        .O({reg_out_i_n_0,reg_out_i_n_1,reg_out_i_n_2,reg_out_i_n_3,reg_out_i_n_4,reg_out_i_n_5,reg_out_i_n_6,reg_out_i_n_7,reg_out_i_n_8,reg_out_i_n_9,reg_out_i_n_10,reg_out_i_n_11,reg_out_i_n_12,reg_out_i_n_13,reg_out_i_n_14,reg_out_i_n_15,reg_out_i_n_16,reg_out_i_n_17,reg_out_i_n_18,reg_out_i_n_19,reg_out_i_n_20,reg_out_i_n_21,reg_out_i_n_22,reg_out_i_n_23,reg_out_i_n_24,reg_out_i_n_25,reg_out_i_n_26,reg_out_i_n_27,reg_out_i_n_28,reg_out_i_n_29,reg_out_i_n_30,reg_out_i_n_31}),
        .S0(instr_rdcycle),
        .S1(instr_rdcycleh),
        .S2(instr_rdinstr),
        .S3(instr_rdinstrh));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1" *) 
  (* XLNX_LINE_COL = "395269" *) 
  (* map_to_module = "358" *) 
  RTL_MUX242 reg_out_i__0
       (.I0(mem_rdata_word),
        .I1({mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15],mem_rdata_word[15:0]}),
        .I2({mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7],mem_rdata_word[7:0]}),
        .O(reg_out__0),
        .S0(latched_is_lu),
        .S1(latched_is_lh),
        .S2(latched_is_lb));
  (* SEL_VAL = ",I0:S=10'b0001000000,I1:S=10'b0000100000,I2:S=10'b0000010000,I3:S=10'b0000001000,I4:S=10'b0000000001,I5:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "357" *) 
  RTL_MUX118 reg_out_i__1
       (.I0({reg_out0_i_n_0,reg_out0_i_n_1,reg_out0_i_n_2,reg_out0_i_n_3,reg_out0_i_n_4,reg_out0_i_n_5,reg_out0_i_n_6,reg_out0_i_n_7,reg_out0_i_n_8,reg_out0_i_n_9,reg_out0_i_n_10,reg_out0_i_n_11,reg_out0_i_n_12,reg_out0_i_n_13,reg_out0_i_n_14,reg_out0_i_n_15,reg_out0_i_n_16,reg_out0_i_n_17,reg_out0_i_n_18,reg_out0_i_n_19,reg_out0_i_n_20,reg_out0_i_n_21,reg_out0_i_n_22,reg_out0_i_n_23,reg_out0_i_n_24,reg_out0_i_n_25,reg_out0_i_n_26,reg_out0_i_n_27,reg_out0_i_n_28,reg_out0_i_n_29,reg_out0_i_n_30,reg_out0_i_n_31}),
        .I1(pcpi_int_rd),
        .I2(reg_out0),
        .I3(pcpi_rs1),
        .I4(mem_rdata_word),
        .I5(reg_out__0),
        .O(reg_out1_out),
        .S(cpu_state));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[0] 
       (.C(clk),
        .D(reg_out1_out[0]),
        .Q(reg_out[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[10] 
       (.C(clk),
        .D(reg_out1_out[10]),
        .Q(reg_out[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[11] 
       (.C(clk),
        .D(reg_out1_out[11]),
        .Q(reg_out[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[12] 
       (.C(clk),
        .D(reg_out1_out[12]),
        .Q(reg_out[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[13] 
       (.C(clk),
        .D(reg_out1_out[13]),
        .Q(reg_out[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[14] 
       (.C(clk),
        .D(reg_out1_out[14]),
        .Q(reg_out[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[15] 
       (.C(clk),
        .D(reg_out1_out[15]),
        .Q(reg_out[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[16] 
       (.C(clk),
        .D(reg_out1_out[16]),
        .Q(reg_out[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[17] 
       (.C(clk),
        .D(reg_out1_out[17]),
        .Q(reg_out[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[18] 
       (.C(clk),
        .D(reg_out1_out[18]),
        .Q(reg_out[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[19] 
       (.C(clk),
        .D(reg_out1_out[19]),
        .Q(reg_out[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[1] 
       (.C(clk),
        .D(reg_out1_out[1]),
        .Q(reg_out[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[20] 
       (.C(clk),
        .D(reg_out1_out[20]),
        .Q(reg_out[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[21] 
       (.C(clk),
        .D(reg_out1_out[21]),
        .Q(reg_out[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[22] 
       (.C(clk),
        .D(reg_out1_out[22]),
        .Q(reg_out[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[23] 
       (.C(clk),
        .D(reg_out1_out[23]),
        .Q(reg_out[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[24] 
       (.C(clk),
        .D(reg_out1_out[24]),
        .Q(reg_out[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[25] 
       (.C(clk),
        .D(reg_out1_out[25]),
        .Q(reg_out[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[26] 
       (.C(clk),
        .D(reg_out1_out[26]),
        .Q(reg_out[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[27] 
       (.C(clk),
        .D(reg_out1_out[27]),
        .Q(reg_out[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[28] 
       (.C(clk),
        .D(reg_out1_out[28]),
        .Q(reg_out[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[29] 
       (.C(clk),
        .D(reg_out1_out[29]),
        .Q(reg_out[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[2] 
       (.C(clk),
        .D(reg_out1_out[2]),
        .Q(reg_out[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[30] 
       (.C(clk),
        .D(reg_out1_out[30]),
        .Q(reg_out[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[31] 
       (.C(clk),
        .D(reg_out1_out[31]),
        .Q(reg_out[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[3] 
       (.C(clk),
        .D(reg_out1_out[3]),
        .Q(reg_out[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[4] 
       (.C(clk),
        .D(reg_out1_out[4]),
        .Q(reg_out[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[5] 
       (.C(clk),
        .D(reg_out1_out[5]),
        .Q(reg_out[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[6] 
       (.C(clk),
        .D(reg_out1_out[6]),
        .Q(reg_out[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[7] 
       (.C(clk),
        .D(reg_out1_out[7]),
        .Q(reg_out[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[8] 
       (.C(clk),
        .D(reg_out1_out[8]),
        .Q(reg_out[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "252" *) 
  RTL_REG__BREG_5 \reg_out_reg[9] 
       (.C(clk),
        .D(reg_out1_out[9]),
        .Q(reg_out[9]));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "385" *) 
  RTL_MUX141 reg_pc0_i
       (.I0({reg_pc1_i_n_0,reg_pc1_i_n_1,reg_pc1_i_n_2,reg_pc1_i_n_3,reg_pc1_i_n_4,reg_pc1_i_n_5,reg_pc1_i_n_6,reg_pc1_i_n_7,reg_pc1_i_n_8,reg_pc1_i_n_9,reg_pc1_i_n_10,reg_pc1_i_n_11,reg_pc1_i_n_12,reg_pc1_i_n_13,reg_pc1_i_n_14,reg_pc1_i_n_15,reg_pc1_i_n_16,reg_pc1_i_n_17,reg_pc1_i_n_18,reg_pc1_i_n_19,reg_pc1_i_n_20,reg_pc1_i_n_21,reg_pc1_i_n_22,reg_pc1_i_n_23,reg_pc1_i_n_24,reg_pc1_i_n_25,reg_pc1_i_n_26,reg_pc1_i_n_27,reg_pc1_i_n_28,reg_pc1_i_n_29,reg_pc1_i_n_30,reg_pc1_i_n_31}),
        .I1(reg_next_pc),
        .I2(reg_next_pc),
        .O(current_pc),
        .S0(latched_branch),
        .S1(reg_pc2));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1263872" *) 
  (* map_to_module = "386" *) 
  RTL_MUX18 reg_pc1_i
       (.I0({reg_pc2_i__0_n_0,reg_pc2_i__0_n_1,reg_pc2_i__0_n_2,reg_pc2_i__0_n_3,reg_pc2_i__0_n_4,reg_pc2_i__0_n_5,reg_pc2_i__0_n_6,reg_pc2_i__0_n_7,reg_pc2_i__0_n_8,reg_pc2_i__0_n_9,reg_pc2_i__0_n_10,reg_pc2_i__0_n_11,reg_pc2_i__0_n_12,reg_pc2_i__0_n_13,reg_pc2_i__0_n_14,reg_pc2_i__0_n_15,reg_pc2_i__0_n_16,reg_pc2_i__0_n_17,reg_pc2_i__0_n_18,reg_pc2_i__0_n_19,reg_pc2_i__0_n_20,reg_pc2_i__0_n_21,reg_pc2_i__0_n_22,reg_pc2_i__0_n_23,reg_pc2_i__0_n_24,reg_pc2_i__0_n_25,reg_pc2_i__0_n_26,reg_pc2_i__0_n_27,reg_pc2_i__0_n_28,reg_pc2_i__0_n_29,reg_pc2_i__0_n_30,reg_pc2_i__0_n_31}),
        .I1(reg_next_pc),
        .O({reg_pc1_i_n_0,reg_pc1_i_n_1,reg_pc1_i_n_2,reg_pc1_i_n_3,reg_pc1_i_n_4,reg_pc1_i_n_5,reg_pc1_i_n_6,reg_pc1_i_n_7,reg_pc1_i_n_8,reg_pc1_i_n_9,reg_pc1_i_n_10,reg_pc1_i_n_11,reg_pc1_i_n_12,reg_pc1_i_n_13,reg_pc1_i_n_14,reg_pc1_i_n_15,reg_pc1_i_n_16,reg_pc1_i_n_17,reg_pc1_i_n_18,reg_pc1_i_n_19,reg_pc1_i_n_20,reg_pc1_i_n_21,reg_pc1_i_n_22,reg_pc1_i_n_23,reg_pc1_i_n_24,reg_pc1_i_n_25,reg_pc1_i_n_26,reg_pc1_i_n_27,reg_pc1_i_n_28,reg_pc1_i_n_29,reg_pc1_i_n_30,reg_pc1_i_n_31}),
        .S(latched_store));
  (* XLNX_LINE_COL = "270592" *) 
  (* map_to_module = "544" *) 
  RTL_AND1 reg_pc2_i
       (.I0(latched_store),
        .I1(reg_pc3),
        .O(reg_pc2));
  (* XLNX_LINE_COL = "2304768" *) 
  (* map_to_module = "690" *) 
  RTL_AND17 reg_pc2_i__0
       (.I0({reg_pc3_i__0_n_0,reg_pc3_i__0_n_1,reg_pc3_i__0_n_2,reg_pc3_i__0_n_3,reg_pc3_i__0_n_4,reg_pc3_i__0_n_5,reg_pc3_i__0_n_6,reg_pc3_i__0_n_7,reg_pc3_i__0_n_8,reg_pc3_i__0_n_9,reg_pc3_i__0_n_10,reg_pc3_i__0_n_11,reg_pc3_i__0_n_12,reg_pc3_i__0_n_13,reg_pc3_i__0_n_14,reg_pc3_i__0_n_15,reg_pc3_i__0_n_16,reg_pc3_i__0_n_17,reg_pc3_i__0_n_18,reg_pc3_i__0_n_19,reg_pc3_i__0_n_20,reg_pc3_i__0_n_21,reg_pc3_i__0_n_22,reg_pc3_i__0_n_23,reg_pc3_i__0_n_24,reg_pc3_i__0_n_25,reg_pc3_i__0_n_26,reg_pc3_i__0_n_27,reg_pc3_i__0_n_28,reg_pc3_i__0_n_29,reg_pc3_i__0_n_30,reg_pc3_i__0_n_31}),
        .I1({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const0> }),
        .O({reg_pc2_i__0_n_0,reg_pc2_i__0_n_1,reg_pc2_i__0_n_2,reg_pc2_i__0_n_3,reg_pc2_i__0_n_4,reg_pc2_i__0_n_5,reg_pc2_i__0_n_6,reg_pc2_i__0_n_7,reg_pc2_i__0_n_8,reg_pc2_i__0_n_9,reg_pc2_i__0_n_10,reg_pc2_i__0_n_11,reg_pc2_i__0_n_12,reg_pc2_i__0_n_13,reg_pc2_i__0_n_14,reg_pc2_i__0_n_15,reg_pc2_i__0_n_16,reg_pc2_i__0_n_17,reg_pc2_i__0_n_18,reg_pc2_i__0_n_19,reg_pc2_i__0_n_20,reg_pc2_i__0_n_21,reg_pc2_i__0_n_22,reg_pc2_i__0_n_23,reg_pc2_i__0_n_24,reg_pc2_i__0_n_25,reg_pc2_i__0_n_26,reg_pc2_i__0_n_27,reg_pc2_i__0_n_28,reg_pc2_i__0_n_29,reg_pc2_i__0_n_30,reg_pc2_i__0_n_31}));
  (* XLNX_LINE_COL = "1380352" *) 
  (* map_to_module = "545" *) 
  RTL_INV0 reg_pc3_i
       (.I0(latched_branch),
        .O(reg_pc3));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1451008" *) 
  (* map_to_module = "289" *) 
  RTL_MUX18 reg_pc3_i__0
       (.I0(alu_out_q),
        .I1(reg_out),
        .O({reg_pc3_i__0_n_0,reg_pc3_i__0_n_1,reg_pc3_i__0_n_2,reg_pc3_i__0_n_3,reg_pc3_i__0_n_4,reg_pc3_i__0_n_5,reg_pc3_i__0_n_6,reg_pc3_i__0_n_7,reg_pc3_i__0_n_8,reg_pc3_i__0_n_9,reg_pc3_i__0_n_10,reg_pc3_i__0_n_11,reg_pc3_i__0_n_12,reg_pc3_i__0_n_13,reg_pc3_i__0_n_14,reg_pc3_i__0_n_15,reg_pc3_i__0_n_16,reg_pc3_i__0_n_17,reg_pc3_i__0_n_18,reg_pc3_i__0_n_19,reg_pc3_i__0_n_20,reg_pc3_i__0_n_21,reg_pc3_i__0_n_22,reg_pc3_i__0_n_23,reg_pc3_i__0_n_24,reg_pc3_i__0_n_25,reg_pc3_i__0_n_26,reg_pc3_i__0_n_27,reg_pc3_i__0_n_28,reg_pc3_i__0_n_29,reg_pc3_i__0_n_30,reg_pc3_i__0_n_31}),
        .S(latched_stalu));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b0,INIT_128:1'b1,INIT_64:1'b0,INIT_32:1'b0,INIT_16:1'b0,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "387" *) 
  RTL_ROM14 reg_pc_i
       (.A(cpu_state),
        .O(reg_pc__0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "388" *) 
  RTL_MUX2 reg_pc_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(reg_pc_i__0_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[0] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[0]),
        .Q(reg_pc[0]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[10] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[10]),
        .Q(reg_pc[10]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[11] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[11]),
        .Q(reg_pc[11]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[12] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[12]),
        .Q(reg_pc[12]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[13] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[13]),
        .Q(reg_pc[13]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[14] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[14]),
        .Q(reg_pc[14]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[15] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[15]),
        .Q(reg_pc[15]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[16] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[16]),
        .Q(reg_pc[16]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[17] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[17]),
        .Q(reg_pc[17]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[18] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[18]),
        .Q(reg_pc[18]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[19] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[19]),
        .Q(reg_pc[19]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[1] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[1]),
        .Q(reg_pc[1]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[20] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[20]),
        .Q(reg_pc[20]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[21] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[21]),
        .Q(reg_pc[21]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[22] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[22]),
        .Q(reg_pc[22]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[23] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[23]),
        .Q(reg_pc[23]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[24] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[24]),
        .Q(reg_pc[24]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[25] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[25]),
        .Q(reg_pc[25]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[26] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[26]),
        .Q(reg_pc[26]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[27] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[27]),
        .Q(reg_pc[27]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[28] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[28]),
        .Q(reg_pc[28]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[29] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[29]),
        .Q(reg_pc[29]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[2] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[2]),
        .Q(reg_pc[2]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[30] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[30]),
        .Q(reg_pc[30]),
        .SET(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[31] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[31]),
        .Q(reg_pc[31]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[3] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[3]),
        .Q(reg_pc[3]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[4] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[4]),
        .Q(reg_pc[4]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[5] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[5]),
        .Q(reg_pc[5]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[6] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[6]),
        .Q(reg_pc[6]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[7] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[7]),
        .Q(reg_pc[7]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[8] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[8]),
        .Q(reg_pc[8]),
        .RST(reg_pc_i__0_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198400" *) 
  (* map_to_module = "261" *) 
  RTL_REG_SYNC__BREG_22 \reg_pc_reg[9] 
       (.C(clk),
        .CE(reg_pc__0),
        .D(current_pc[9]),
        .Q(reg_pc[9]),
        .RST(reg_pc_i__0_n_0));
  (* SEL_VAL = "I0:S0=1'b1,I1:S1=1'b1,I2:S2=1'b1,I3:S3=1'b1,I4:S4=1'b1,I5:S5=1'b1,I6:default" *) 
  (* XLNX_LINE_COL = "0" *) 
  (* map_to_module = "354" *) 
  RTL_MUX115 reg_sh0_i
       (.I0(cpuregs_rs2[4:0]),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I2({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I3({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I4(decoded_rs2),
        .I5({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I6(cpuregs_rs2[4:0]),
        .O({reg_sh0_i_n_0,reg_sh0_i_n_1,reg_sh0_i_n_2,reg_sh0_i_n_3,reg_sh0_i_n_4}),
        .S0(instr_trap),
        .S1(is_rdcycle_rdcycleh_rdinstr_rdinstrh),
        .S2(is_lui_auipc_jal),
        .S3(reg_sh2_i_n_0),
        .S4(is_slli_srli_srai),
        .S5(is_jalr_addi_slti_sltiu_xori_ori_andi));
  (* XLNX_LINE_COL = "985856" *) 
  (* map_to_module = "706" *) 
  RTL_SUB1 reg_sh0_i__0
       (.I0(reg_sh),
        .I1({\<const1> ,\<const0> ,\<const0> }),
        .O(reg_sh0));
  (* XLNX_LINE_COL = "985856" *) 
  (* map_to_module = "707" *) 
  RTL_SUB2 reg_sh0_i__1
       (.I0(reg_sh),
        .I1(\<const1> ),
        .O({reg_sh0_i__1_n_0,reg_sh0_i__1_n_1,reg_sh0_i__1_n_2,reg_sh0_i__1_n_3,reg_sh0_i__1_n_4}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1124096" *) 
  (* map_to_module = "355" *) 
  RTL_MUX18 reg_sh1_i
       (.I0(reg_sh2),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(cpuregs_rs2),
        .S(reg_sh3_i__0_n_0));
  (* XLNX_LINE_COL = "2362368" *) 
  (* map_to_module = "676" *) 
  RTL_GEQ reg_sh1_i__0
       (.I0(reg_sh),
        .I1({\<const0> ,\<const0> ,\<const1> ,\<const0> ,\<const0> }),
        .O(reg_sh1));
  (* XLNX_LINE_COL = "336640" *) 
  (* map_to_module = "673" *) 
  RTL_AND1 reg_sh2_i
       (.I0(is_lb_lh_lw_lbu_lhu),
        .I1(reg_sh3),
        .O(reg_sh2_i_n_0));
  (* XLNX_LINE_COL = "1838080" *) 
  (* map_to_module = "674" *) 
  RTL_INV0 reg_sh3_i
       (.I0(instr_trap),
        .O(reg_sh3));
  (* XLNX_LINE_COL = "1124096" *) 
  (* map_to_module = "675" *) 
  RTL_REDUCTION_OR18 reg_sh3_i__0
       (.I0(decoded_rs2),
        .O(reg_sh3_i__0_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "851984" *) 
  (* map_to_module = "356" *) 
  RTL_MUX117 reg_sh_i
       (.I0(reg_sh0),
        .I1({reg_sh0_i__1_n_0,reg_sh0_i__1_n_1,reg_sh0_i__1_n_2,reg_sh0_i__1_n_3,reg_sh0_i__1_n_4}),
        .O(reg_sh__0),
        .S(reg_sh1));
  (* SEL_VAL = ",I0:S=10'b0001000000,I1:S=10'b0000100000,I2:S=10'b0000001000" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "353" *) 
  RTL_MUX114 reg_sh_i__0
       (.I0({reg_sh0_i_n_0,reg_sh0_i_n_1,reg_sh0_i_n_2,reg_sh0_i_n_3,reg_sh0_i_n_4}),
        .I1(cpuregs_rs2[4:0]),
        .I2(reg_sh__0),
        .O(reg_sh0_out),
        .S(cpu_state));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "132864" *) 
  (* map_to_module = "251" *) 
  RTL_REG__BREG_5 \reg_sh_reg[0] 
       (.C(clk),
        .D(reg_sh0_out[0]),
        .Q(reg_sh[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "132864" *) 
  (* map_to_module = "251" *) 
  RTL_REG__BREG_5 \reg_sh_reg[1] 
       (.C(clk),
        .D(reg_sh0_out[1]),
        .Q(reg_sh[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "132864" *) 
  (* map_to_module = "251" *) 
  RTL_REG__BREG_5 \reg_sh_reg[2] 
       (.C(clk),
        .D(reg_sh0_out[2]),
        .Q(reg_sh[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "132864" *) 
  (* map_to_module = "251" *) 
  RTL_REG__BREG_5 \reg_sh_reg[3] 
       (.C(clk),
        .D(reg_sh0_out[3]),
        .Q(reg_sh[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "132864" *) 
  (* map_to_module = "251" *) 
  RTL_REG__BREG_5 \reg_sh_reg[4] 
       (.C(clk),
        .D(reg_sh0_out[4]),
        .Q(reg_sh[4]));
  (* XLNX_LINE_COL = "1125632" *) 
  (* map_to_module = "548" *) 
  RTL_AND1 resetn0_i
       (.I0(mem_la_write),
        .I1(resetn1),
        .O(resetn0));
  (* XLNX_LINE_COL = "2104832" *) 
  (* map_to_module = "549" *) 
  RTL_EQ40 resetn1_i
       (.I0(mem_la_addr),
        .I1({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .O(resetn1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "525320" *) 
  (* map_to_module = "292" *) 
  RTL_MUX2 resetn_i
       (.I0(\<const1> ),
        .I1(resetn0),
        .O(resetn__0),
        .S(reset_l));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "788224" *) 
  (* map_to_module = "170" *) 
  RTL_REG_SYNC__BREG_117 resetn_reg
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(resetn),
        .RST(resetn__0),
        .SET(pico_int));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328720" *) 
  (* map_to_module = "528" *) 
  RTL_MUX2 set_mem_do_rdata_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(set_mem_do_rdata_i_n_0),
        .S(mem_do_rdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "527" *) 
  RTL_MUX2 set_mem_do_rdata_i__0
       (.I0(set_mem_do_rdata_i_n_0),
        .I1(\<const0> ),
        .O(set_mem_do_rdata_i__0_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "526" *) 
  RTL_MUX254 set_mem_do_rdata_i__1
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(set_mem_do_rdata_i__0_n_0),
        .O(set_mem_do_rdata),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "525" *) 
  RTL_MUX2 set_mem_do_rdata_i__2
       (.I0(\<const0> ),
        .I1(set_mem_do_rdata),
        .O(set_mem_do_rdata_i__2_n_0),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263183" *) 
  (* map_to_module = "480" *) 
  RTL_MUX2 set_mem_do_rinst_i
       (.I0(alu_out_0),
        .I1(\<const0> ),
        .O(set_mem_do_rinst_i_n_0),
        .S(is_beq_bne_blt_bge_bltu_bgeu));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "479" *) 
  RTL_MUX254 set_mem_do_rinst_i__0
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(set_mem_do_rinst_i_n_0),
        .I5(\<const0> ),
        .I6(\<const0> ),
        .I7(\<const0> ),
        .I8(\<const0> ),
        .O(set_mem_do_rinst_i__0_n_0),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "478" *) 
  RTL_MUX2 set_mem_do_rinst_i__1
       (.I0(\<const0> ),
        .I1(set_mem_do_rinst_i__0_n_0),
        .O(set_mem_do_rinst),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "328717" *) 
  (* map_to_module = "533" *) 
  RTL_MUX2 set_mem_do_wdata_i
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(set_mem_do_wdata_i_n_0),
        .S(mem_do_wdata));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "263188" *) 
  (* map_to_module = "532" *) 
  RTL_MUX2 set_mem_do_wdata_i__0
       (.I0(set_mem_do_wdata_i_n_0),
        .I1(\<const0> ),
        .O(set_mem_do_wdata_i__0_n_0),
        .S(decoder_trigger1));
  (* SEL_VAL = "I0:S=10'b0100000000,I1:S=10'b0010000000,I2:S=10'b0001000000,I3:S=10'b0000100000,I4:S=10'b0000010000,I5:S=10'b0000001000,I6:S=10'b0000000100,I7:S=10'b0000000001,I8:S=10'b0000000010" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "531" *) 
  RTL_MUX254 set_mem_do_wdata_i__1
       (.I0(\<const0> ),
        .I1(\<const0> ),
        .I2(\<const0> ),
        .I3(\<const0> ),
        .I4(\<const0> ),
        .I5(\<const0> ),
        .I6(set_mem_do_wdata_i__0_n_0),
        .I7(set_mem_do_wdata_i__0_n_0),
        .I8(\<const0> ),
        .O(set_mem_do_wdata),
        .S(cpu_state));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "530" *) 
  RTL_MUX2 set_mem_do_wdata_i__2
       (.I0(\<const0> ),
        .I1(set_mem_do_wdata),
        .O(set_mem_do_wdata_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[0] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[10] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[11] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[12] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[13] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[14] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[15] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[16] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[17] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[18] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[19] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[1] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[20] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[21] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[22] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[23] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[24] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[25] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[26] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[27] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[28] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[29] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[2] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[30] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[31] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[32] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[32]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[33] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[33]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[34] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[34]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[35] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[35]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[3] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[4] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[5] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[6] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[7] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[8] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199424" *) 
  (* map_to_module = "260" *) 
  RTL_REG__BREG_141 \trace_data_reg[9] 
       (.C(clk),
        .CE(\<const0> ),
        .D(\<const0> ),
        .Q(trace_data[9]));
  (* INIT_VAL = "INIT_DEFAULT:1'bx,INIT_256:1'b1,INIT_128:1'b0,INIT_64:1'b0,INIT_32:1'b0,INIT_16:1'b0,INIT_8:1'b0,INIT_4:1'b0,INIT_1:1'b0,INIT_2:1'b0" *) 
  (* XLNX_LINE_COL = "133248" *) 
  (* map_to_module = "351" *) 
  RTL_ROM14 trap_i
       (.A(cpu_state),
        .O(trap_i_n_0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "200961" *) 
  (* map_to_module = "352" *) 
  RTL_MUX2 trap_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(trap_i__0_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1049856" *) 
  (* map_to_module = "250" *) 
  RTL_REG_SYNC__BREG_1 trap_reg
       (.C(clk),
        .D(trap_i_n_0),
        .Q(trap),
        .RST(trap_i__0_n_0));
endmodule

(* XLNX_LINE_COL = "2650" *) 
module picorv32_pcpi_div
   (clk,
    resetn,
    pcpi_valid,
    pcpi_insn,
    pcpi_rs1,
    pcpi_rs2,
    pcpi_wr,
    pcpi_rd,
    pcpi_wait,
    pcpi_ready);
  input clk;
  input resetn;
  input pcpi_valid;
  input [31:0]pcpi_insn;
  input [31:0]pcpi_rs1;
  input [31:0]pcpi_rs2;
  output pcpi_wr;
  output [31:0]pcpi_rd;
  output pcpi_wait;
  output pcpi_ready;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire [31:0]dividend;
  wire [31:0]dividend0;
  wire dividend0_i__1_n_0;
  wire dividend0_i_n_0;
  wire dividend0_i_n_1;
  wire dividend0_i_n_10;
  wire dividend0_i_n_11;
  wire dividend0_i_n_12;
  wire dividend0_i_n_13;
  wire dividend0_i_n_14;
  wire dividend0_i_n_15;
  wire dividend0_i_n_16;
  wire dividend0_i_n_17;
  wire dividend0_i_n_18;
  wire dividend0_i_n_19;
  wire dividend0_i_n_2;
  wire dividend0_i_n_20;
  wire dividend0_i_n_21;
  wire dividend0_i_n_22;
  wire dividend0_i_n_23;
  wire dividend0_i_n_24;
  wire dividend0_i_n_25;
  wire dividend0_i_n_26;
  wire dividend0_i_n_27;
  wire dividend0_i_n_28;
  wire dividend0_i_n_29;
  wire dividend0_i_n_3;
  wire dividend0_i_n_30;
  wire dividend0_i_n_31;
  wire dividend0_i_n_4;
  wire dividend0_i_n_5;
  wire dividend0_i_n_6;
  wire dividend0_i_n_7;
  wire dividend0_i_n_8;
  wire dividend0_i_n_9;
  wire [31:0]dividend1;
  wire dividend2;
  wire [31:0]dividend__0;
  wire dividend_i__0_n_0;
  wire dividend_i__1_n_0;
  wire dividend_i__2_n_0;
  wire [62:0]divisor;
  wire [62:0]divisor0;
  wire divisor0_i__0_n_0;
  wire divisor0_i__0_n_1;
  wire divisor0_i__0_n_10;
  wire divisor0_i__0_n_11;
  wire divisor0_i__0_n_12;
  wire divisor0_i__0_n_13;
  wire divisor0_i__0_n_14;
  wire divisor0_i__0_n_15;
  wire divisor0_i__0_n_16;
  wire divisor0_i__0_n_17;
  wire divisor0_i__0_n_18;
  wire divisor0_i__0_n_19;
  wire divisor0_i__0_n_2;
  wire divisor0_i__0_n_20;
  wire divisor0_i__0_n_21;
  wire divisor0_i__0_n_22;
  wire divisor0_i__0_n_23;
  wire divisor0_i__0_n_24;
  wire divisor0_i__0_n_25;
  wire divisor0_i__0_n_26;
  wire divisor0_i__0_n_27;
  wire divisor0_i__0_n_28;
  wire divisor0_i__0_n_29;
  wire divisor0_i__0_n_3;
  wire divisor0_i__0_n_30;
  wire divisor0_i__0_n_31;
  wire divisor0_i__0_n_32;
  wire divisor0_i__0_n_33;
  wire divisor0_i__0_n_34;
  wire divisor0_i__0_n_35;
  wire divisor0_i__0_n_36;
  wire divisor0_i__0_n_37;
  wire divisor0_i__0_n_38;
  wire divisor0_i__0_n_39;
  wire divisor0_i__0_n_4;
  wire divisor0_i__0_n_40;
  wire divisor0_i__0_n_41;
  wire divisor0_i__0_n_42;
  wire divisor0_i__0_n_43;
  wire divisor0_i__0_n_44;
  wire divisor0_i__0_n_45;
  wire divisor0_i__0_n_46;
  wire divisor0_i__0_n_47;
  wire divisor0_i__0_n_48;
  wire divisor0_i__0_n_49;
  wire divisor0_i__0_n_5;
  wire divisor0_i__0_n_50;
  wire divisor0_i__0_n_51;
  wire divisor0_i__0_n_52;
  wire divisor0_i__0_n_53;
  wire divisor0_i__0_n_54;
  wire divisor0_i__0_n_55;
  wire divisor0_i__0_n_56;
  wire divisor0_i__0_n_57;
  wire divisor0_i__0_n_58;
  wire divisor0_i__0_n_59;
  wire divisor0_i__0_n_6;
  wire divisor0_i__0_n_60;
  wire divisor0_i__0_n_61;
  wire divisor0_i__0_n_62;
  wire divisor0_i__0_n_7;
  wire divisor0_i__0_n_8;
  wire divisor0_i__0_n_9;
  wire [62:0]divisor1;
  wire [62:0]divisor2;
  wire divisor3;
  wire [62:0]divisor__0;
  wire divisor_i__0_n_0;
  wire divisor_i__1_n_0;
  wire divisor_i__2_n_0;
  wire instr_any_div_rem;
  wire instr_div;
  wire instr_div1;
  wire instr_div2;
  wire instr_div2_i__0_n_0;
  wire instr_div3;
  wire instr_div3_i__0_n_0;
  wire instr_div4;
  wire instr_div4_i__0_n_0;
  wire instr_div_i__0_n_0;
  wire instr_divu;
  wire instr_divu_i__0_n_0;
  wire instr_rem;
  wire instr_rem_i__0_n_0;
  wire instr_remu;
  wire instr_remu_i__0_n_0;
  wire outsign;
  wire outsign0;
  wire outsign1;
  wire outsign1_i__0_n_0;
  wire outsign2;
  wire outsign2_i__0_n_0;
  wire outsign3;
  wire outsign__0;
  wire [3:0]p_0_in;
  wire p_1_in;
  wire [31:0]pcpi_insn;
  wire [31:0]pcpi_rd;
  wire pcpi_rd0_i__0_n_0;
  wire pcpi_rd0_i__0_n_1;
  wire pcpi_rd0_i__0_n_10;
  wire pcpi_rd0_i__0_n_11;
  wire pcpi_rd0_i__0_n_12;
  wire pcpi_rd0_i__0_n_13;
  wire pcpi_rd0_i__0_n_14;
  wire pcpi_rd0_i__0_n_15;
  wire pcpi_rd0_i__0_n_16;
  wire pcpi_rd0_i__0_n_17;
  wire pcpi_rd0_i__0_n_18;
  wire pcpi_rd0_i__0_n_19;
  wire pcpi_rd0_i__0_n_2;
  wire pcpi_rd0_i__0_n_20;
  wire pcpi_rd0_i__0_n_21;
  wire pcpi_rd0_i__0_n_22;
  wire pcpi_rd0_i__0_n_23;
  wire pcpi_rd0_i__0_n_24;
  wire pcpi_rd0_i__0_n_25;
  wire pcpi_rd0_i__0_n_26;
  wire pcpi_rd0_i__0_n_27;
  wire pcpi_rd0_i__0_n_28;
  wire pcpi_rd0_i__0_n_29;
  wire pcpi_rd0_i__0_n_3;
  wire pcpi_rd0_i__0_n_30;
  wire pcpi_rd0_i__0_n_31;
  wire pcpi_rd0_i__0_n_4;
  wire pcpi_rd0_i__0_n_5;
  wire pcpi_rd0_i__0_n_6;
  wire pcpi_rd0_i__0_n_7;
  wire pcpi_rd0_i__0_n_8;
  wire pcpi_rd0_i__0_n_9;
  wire pcpi_rd0_i_n_0;
  wire pcpi_rd0_i_n_1;
  wire pcpi_rd0_i_n_10;
  wire pcpi_rd0_i_n_11;
  wire pcpi_rd0_i_n_12;
  wire pcpi_rd0_i_n_13;
  wire pcpi_rd0_i_n_14;
  wire pcpi_rd0_i_n_15;
  wire pcpi_rd0_i_n_16;
  wire pcpi_rd0_i_n_17;
  wire pcpi_rd0_i_n_18;
  wire pcpi_rd0_i_n_19;
  wire pcpi_rd0_i_n_2;
  wire pcpi_rd0_i_n_20;
  wire pcpi_rd0_i_n_21;
  wire pcpi_rd0_i_n_22;
  wire pcpi_rd0_i_n_23;
  wire pcpi_rd0_i_n_24;
  wire pcpi_rd0_i_n_25;
  wire pcpi_rd0_i_n_26;
  wire pcpi_rd0_i_n_27;
  wire pcpi_rd0_i_n_28;
  wire pcpi_rd0_i_n_29;
  wire pcpi_rd0_i_n_3;
  wire pcpi_rd0_i_n_30;
  wire pcpi_rd0_i_n_31;
  wire pcpi_rd0_i_n_4;
  wire pcpi_rd0_i_n_5;
  wire pcpi_rd0_i_n_6;
  wire pcpi_rd0_i_n_7;
  wire pcpi_rd0_i_n_8;
  wire pcpi_rd0_i_n_9;
  wire pcpi_rd1;
  wire pcpi_rd1_i__0_n_0;
  wire pcpi_rd1_i__0_n_1;
  wire pcpi_rd1_i__0_n_10;
  wire pcpi_rd1_i__0_n_11;
  wire pcpi_rd1_i__0_n_12;
  wire pcpi_rd1_i__0_n_13;
  wire pcpi_rd1_i__0_n_14;
  wire pcpi_rd1_i__0_n_15;
  wire pcpi_rd1_i__0_n_16;
  wire pcpi_rd1_i__0_n_17;
  wire pcpi_rd1_i__0_n_18;
  wire pcpi_rd1_i__0_n_19;
  wire pcpi_rd1_i__0_n_2;
  wire pcpi_rd1_i__0_n_20;
  wire pcpi_rd1_i__0_n_21;
  wire pcpi_rd1_i__0_n_22;
  wire pcpi_rd1_i__0_n_23;
  wire pcpi_rd1_i__0_n_24;
  wire pcpi_rd1_i__0_n_25;
  wire pcpi_rd1_i__0_n_26;
  wire pcpi_rd1_i__0_n_27;
  wire pcpi_rd1_i__0_n_28;
  wire pcpi_rd1_i__0_n_29;
  wire pcpi_rd1_i__0_n_3;
  wire pcpi_rd1_i__0_n_30;
  wire pcpi_rd1_i__0_n_31;
  wire pcpi_rd1_i__0_n_4;
  wire pcpi_rd1_i__0_n_5;
  wire pcpi_rd1_i__0_n_6;
  wire pcpi_rd1_i__0_n_7;
  wire pcpi_rd1_i__0_n_8;
  wire pcpi_rd1_i__0_n_9;
  wire pcpi_rd1_i_n_0;
  wire pcpi_rd1_i_n_1;
  wire pcpi_rd1_i_n_10;
  wire pcpi_rd1_i_n_11;
  wire pcpi_rd1_i_n_12;
  wire pcpi_rd1_i_n_13;
  wire pcpi_rd1_i_n_14;
  wire pcpi_rd1_i_n_15;
  wire pcpi_rd1_i_n_16;
  wire pcpi_rd1_i_n_17;
  wire pcpi_rd1_i_n_18;
  wire pcpi_rd1_i_n_19;
  wire pcpi_rd1_i_n_2;
  wire pcpi_rd1_i_n_20;
  wire pcpi_rd1_i_n_21;
  wire pcpi_rd1_i_n_22;
  wire pcpi_rd1_i_n_23;
  wire pcpi_rd1_i_n_24;
  wire pcpi_rd1_i_n_25;
  wire pcpi_rd1_i_n_26;
  wire pcpi_rd1_i_n_27;
  wire pcpi_rd1_i_n_28;
  wire pcpi_rd1_i_n_29;
  wire pcpi_rd1_i_n_3;
  wire pcpi_rd1_i_n_30;
  wire pcpi_rd1_i_n_31;
  wire pcpi_rd1_i_n_4;
  wire pcpi_rd1_i_n_5;
  wire pcpi_rd1_i_n_6;
  wire pcpi_rd1_i_n_7;
  wire pcpi_rd1_i_n_8;
  wire pcpi_rd1_i_n_9;
  wire pcpi_rd_i_n_0;
  wire pcpi_rd_i_n_1;
  wire pcpi_rd_i_n_10;
  wire pcpi_rd_i_n_11;
  wire pcpi_rd_i_n_12;
  wire pcpi_rd_i_n_13;
  wire pcpi_rd_i_n_14;
  wire pcpi_rd_i_n_15;
  wire pcpi_rd_i_n_16;
  wire pcpi_rd_i_n_17;
  wire pcpi_rd_i_n_18;
  wire pcpi_rd_i_n_19;
  wire pcpi_rd_i_n_2;
  wire pcpi_rd_i_n_20;
  wire pcpi_rd_i_n_21;
  wire pcpi_rd_i_n_22;
  wire pcpi_rd_i_n_23;
  wire pcpi_rd_i_n_24;
  wire pcpi_rd_i_n_25;
  wire pcpi_rd_i_n_26;
  wire pcpi_rd_i_n_27;
  wire pcpi_rd_i_n_28;
  wire pcpi_rd_i_n_29;
  wire pcpi_rd_i_n_3;
  wire pcpi_rd_i_n_30;
  wire pcpi_rd_i_n_31;
  wire pcpi_rd_i_n_4;
  wire pcpi_rd_i_n_5;
  wire pcpi_rd_i_n_6;
  wire pcpi_rd_i_n_7;
  wire pcpi_rd_i_n_8;
  wire pcpi_rd_i_n_9;
  wire pcpi_ready;
  wire pcpi_ready0;
  wire pcpi_ready1;
  wire pcpi_ready_i_n_0;
  wire [31:0]pcpi_rs1;
  wire [31:0]pcpi_rs2;
  wire pcpi_valid;
  wire pcpi_wait;
  wire pcpi_wait0;
  wire pcpi_wait_q;
  wire pcpi_wait_q0;
  wire [31:0]quotient;
  wire [31:0]quotient0;
  wire quotient__0;
  wire quotient_i__1_n_0;
  wire quotient_i_n_0;
  wire [31:0]quotient_msk;
  wire [31:0]quotient_msk0;
  wire quotient_msk__0;
  wire quotient_msk_i__1_n_0;
  wire quotient_msk_i_n_0;
  wire resetn;
  wire running;
  wire running__0;
  wire running_i__0_n_0;
  wire start;
  wire start0;

  assign pcpi_wr = pcpi_ready;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "999424" *) 
  (* map_to_module = "119" *) 
  RTL_MUX18 dividend0_i
       (.I0(dividend1),
        .I1(pcpi_rs1),
        .O({dividend0_i_n_0,dividend0_i_n_1,dividend0_i_n_2,dividend0_i_n_3,dividend0_i_n_4,dividend0_i_n_5,dividend0_i_n_6,dividend0_i_n_7,dividend0_i_n_8,dividend0_i_n_9,dividend0_i_n_10,dividend0_i_n_11,dividend0_i_n_12,dividend0_i_n_13,dividend0_i_n_14,dividend0_i_n_15,dividend0_i_n_16,dividend0_i_n_17,dividend0_i_n_18,dividend0_i_n_19,dividend0_i_n_20,dividend0_i_n_21,dividend0_i_n_22,dividend0_i_n_23,dividend0_i_n_24,dividend0_i_n_25,dividend0_i_n_26,dividend0_i_n_27,dividend0_i_n_28,dividend0_i_n_29,dividend0_i_n_30,dividend0_i_n_31}),
        .S(dividend2));
  (* XLNX_LINE_COL = "1053440" *) 
  (* map_to_module = "165" *) 
  RTL_SUB0 dividend0_i__0
       (.I0(dividend),
        .I1(divisor[31:0]),
        .O(dividend0));
  (* XLNX_LINE_COL = "463872" *) 
  (* map_to_module = "166" *) 
  RTL_LEQ dividend0_i__1
       (.I0(divisor),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,dividend}),
        .O(dividend0_i__1_n_0));
  (* XLNX_LINE_COL = "3803648" *) 
  (* map_to_module = "164" *) 
  RTL_MINUS1 dividend1_i
       (.I0(pcpi_rs1),
        .O(dividend1));
  (* XLNX_LINE_COL = "993536" *) 
  (* map_to_module = "150" *) 
  RTL_AND1 dividend2_i
       (.I0(p_1_in),
        .I1(pcpi_rs1[31]),
        .O(dividend2));
  (* XLNX_LINE_COL = "989440" *) 
  (* map_to_module = "151" *) 
  RTL_OR0 dividend3_i
       (.I0(p_0_in[3]),
        .I1(p_0_in[1]),
        .O(p_1_in));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132132" *) 
  (* map_to_module = "118" *) 
  RTL_MUX18 dividend_i
       (.I0({dividend0_i_n_0,dividend0_i_n_1,dividend0_i_n_2,dividend0_i_n_3,dividend0_i_n_4,dividend0_i_n_5,dividend0_i_n_6,dividend0_i_n_7,dividend0_i_n_8,dividend0_i_n_9,dividend0_i_n_10,dividend0_i_n_11,dividend0_i_n_12,dividend0_i_n_13,dividend0_i_n_14,dividend0_i_n_15,dividend0_i_n_16,dividend0_i_n_17,dividend0_i_n_18,dividend0_i_n_19,dividend0_i_n_20,dividend0_i_n_21,dividend0_i_n_22,dividend0_i_n_23,dividend0_i_n_24,dividend0_i_n_25,dividend0_i_n_26,dividend0_i_n_27,dividend0_i_n_28,dividend0_i_n_29,dividend0_i_n_30,dividend0_i_n_31}),
        .I1(dividend0),
        .O(dividend__0),
        .S(start));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132124" *) 
  (* map_to_module = "122" *) 
  RTL_MUX2 dividend_i__0
       (.I0(\<const0> ),
        .I1(dividend0_i__1_n_0),
        .O(dividend_i__0_n_0),
        .S(pcpi_ready0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132132" *) 
  (* map_to_module = "121" *) 
  RTL_MUX2 dividend_i__1
       (.I0(\<const1> ),
        .I1(dividend_i__0_n_0),
        .O(dividend_i__1_n_0),
        .S(start));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "120" *) 
  RTL_MUX2 dividend_i__2
       (.I0(\<const0> ),
        .I1(dividend_i__1_n_0),
        .O(dividend_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[0] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[0]),
        .Q(dividend[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[10] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[10]),
        .Q(dividend[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[11] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[11]),
        .Q(dividend[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[12] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[12]),
        .Q(dividend[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[13] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[13]),
        .Q(dividend[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[14] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[14]),
        .Q(dividend[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[15] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[15]),
        .Q(dividend[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[16] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[16]),
        .Q(dividend[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[17] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[17]),
        .Q(dividend[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[18] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[18]),
        .Q(dividend[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[19] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[19]),
        .Q(dividend[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[1] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[1]),
        .Q(dividend[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[20] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[20]),
        .Q(dividend[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[21] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[21]),
        .Q(dividend[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[22] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[22]),
        .Q(dividend[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[23] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[23]),
        .Q(dividend[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[24] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[24]),
        .Q(dividend[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[25] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[25]),
        .Q(dividend[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[26] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[26]),
        .Q(dividend[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[27] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[27]),
        .Q(dividend[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[28] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[28]),
        .Q(dividend[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[29] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[29]),
        .Q(dividend[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[2] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[2]),
        .Q(dividend[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[30] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[30]),
        .Q(dividend[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[31] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[31]),
        .Q(dividend[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[3] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[3]),
        .Q(dividend[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[4] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[4]),
        .Q(dividend[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[5] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[5]),
        .Q(dividend[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[6] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[6]),
        .Q(dividend[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[7] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[7]),
        .Q(dividend[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[8] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[8]),
        .Q(dividend[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "99" *) 
  RTL_REG__BREG_11 \dividend_reg[9] 
       (.C(clk),
        .CE(dividend_i__2_n_0),
        .D(dividend__0[9]),
        .Q(dividend[9]));
  (* XLNX_LINE_COL = "935936" *) 
  (* map_to_module = "152" *) 
  RTL_LSHIFT1 divisor0_i
       (.I0(divisor1),
        .I1({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .I2(\<const1> ),
        .O(divisor0));
  (* XLNX_LINE_COL = "920832" *) 
  (* map_to_module = "154" *) 
  RTL_RSHIFT1 divisor0_i__0
       (.I0(divisor),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O({divisor0_i__0_n_0,divisor0_i__0_n_1,divisor0_i__0_n_2,divisor0_i__0_n_3,divisor0_i__0_n_4,divisor0_i__0_n_5,divisor0_i__0_n_6,divisor0_i__0_n_7,divisor0_i__0_n_8,divisor0_i__0_n_9,divisor0_i__0_n_10,divisor0_i__0_n_11,divisor0_i__0_n_12,divisor0_i__0_n_13,divisor0_i__0_n_14,divisor0_i__0_n_15,divisor0_i__0_n_16,divisor0_i__0_n_17,divisor0_i__0_n_18,divisor0_i__0_n_19,divisor0_i__0_n_20,divisor0_i__0_n_21,divisor0_i__0_n_22,divisor0_i__0_n_23,divisor0_i__0_n_24,divisor0_i__0_n_25,divisor0_i__0_n_26,divisor0_i__0_n_27,divisor0_i__0_n_28,divisor0_i__0_n_29,divisor0_i__0_n_30,divisor0_i__0_n_31,divisor0_i__0_n_32,divisor0_i__0_n_33,divisor0_i__0_n_34,divisor0_i__0_n_35,divisor0_i__0_n_36,divisor0_i__0_n_37,divisor0_i__0_n_38,divisor0_i__0_n_39,divisor0_i__0_n_40,divisor0_i__0_n_41,divisor0_i__0_n_42,divisor0_i__0_n_43,divisor0_i__0_n_44,divisor0_i__0_n_45,divisor0_i__0_n_46,divisor0_i__0_n_47,divisor0_i__0_n_48,divisor0_i__0_n_49,divisor0_i__0_n_50,divisor0_i__0_n_51,divisor0_i__0_n_52,divisor0_i__0_n_53,divisor0_i__0_n_54,divisor0_i__0_n_55,divisor0_i__0_n_56,divisor0_i__0_n_57,divisor0_i__0_n_58,divisor0_i__0_n_59,divisor0_i__0_n_60,divisor0_i__0_n_61,divisor0_i__0_n_62}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "934400" *) 
  (* map_to_module = "124" *) 
  RTL_MUX36 divisor1_i
       (.I0(divisor2),
        .I1(pcpi_rs2),
        .O(divisor1),
        .S(divisor3));
  (* XLNX_LINE_COL = "3803648" *) 
  (* map_to_module = "167" *) 
  RTL_MINUS2 divisor2_i
       (.I0(pcpi_rs2),
        .O(divisor2));
  (* XLNX_LINE_COL = "993536" *) 
  (* map_to_module = "153" *) 
  RTL_AND1 divisor3_i
       (.I0(p_1_in),
        .I1(pcpi_rs2[31]),
        .O(divisor3));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132132" *) 
  (* map_to_module = "123" *) 
  RTL_MUX35 divisor_i
       (.I0(divisor0),
        .I1({divisor0_i__0_n_0,divisor0_i__0_n_1,divisor0_i__0_n_2,divisor0_i__0_n_3,divisor0_i__0_n_4,divisor0_i__0_n_5,divisor0_i__0_n_6,divisor0_i__0_n_7,divisor0_i__0_n_8,divisor0_i__0_n_9,divisor0_i__0_n_10,divisor0_i__0_n_11,divisor0_i__0_n_12,divisor0_i__0_n_13,divisor0_i__0_n_14,divisor0_i__0_n_15,divisor0_i__0_n_16,divisor0_i__0_n_17,divisor0_i__0_n_18,divisor0_i__0_n_19,divisor0_i__0_n_20,divisor0_i__0_n_21,divisor0_i__0_n_22,divisor0_i__0_n_23,divisor0_i__0_n_24,divisor0_i__0_n_25,divisor0_i__0_n_26,divisor0_i__0_n_27,divisor0_i__0_n_28,divisor0_i__0_n_29,divisor0_i__0_n_30,divisor0_i__0_n_31,divisor0_i__0_n_32,divisor0_i__0_n_33,divisor0_i__0_n_34,divisor0_i__0_n_35,divisor0_i__0_n_36,divisor0_i__0_n_37,divisor0_i__0_n_38,divisor0_i__0_n_39,divisor0_i__0_n_40,divisor0_i__0_n_41,divisor0_i__0_n_42,divisor0_i__0_n_43,divisor0_i__0_n_44,divisor0_i__0_n_45,divisor0_i__0_n_46,divisor0_i__0_n_47,divisor0_i__0_n_48,divisor0_i__0_n_49,divisor0_i__0_n_50,divisor0_i__0_n_51,divisor0_i__0_n_52,divisor0_i__0_n_53,divisor0_i__0_n_54,divisor0_i__0_n_55,divisor0_i__0_n_56,divisor0_i__0_n_57,divisor0_i__0_n_58,divisor0_i__0_n_59,divisor0_i__0_n_60,divisor0_i__0_n_61,divisor0_i__0_n_62}),
        .O(divisor__0),
        .S(start));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132124" *) 
  (* map_to_module = "127" *) 
  RTL_MUX2 divisor_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(divisor_i__0_n_0),
        .S(pcpi_ready0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132132" *) 
  (* map_to_module = "126" *) 
  RTL_MUX2 divisor_i__1
       (.I0(\<const1> ),
        .I1(divisor_i__0_n_0),
        .O(divisor_i__1_n_0),
        .S(start));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "125" *) 
  RTL_MUX2 divisor_i__2
       (.I0(\<const0> ),
        .I1(divisor_i__1_n_0),
        .O(divisor_i__2_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[0] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[0]),
        .Q(divisor[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[10] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[10]),
        .Q(divisor[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[11] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[11]),
        .Q(divisor[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[12] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[12]),
        .Q(divisor[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[13] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[13]),
        .Q(divisor[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[14] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[14]),
        .Q(divisor[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[15] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[15]),
        .Q(divisor[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[16] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[16]),
        .Q(divisor[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[17] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[17]),
        .Q(divisor[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[18] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[18]),
        .Q(divisor[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[19] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[19]),
        .Q(divisor[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[1] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[1]),
        .Q(divisor[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[20] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[20]),
        .Q(divisor[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[21] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[21]),
        .Q(divisor[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[22] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[22]),
        .Q(divisor[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[23] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[23]),
        .Q(divisor[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[24] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[24]),
        .Q(divisor[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[25] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[25]),
        .Q(divisor[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[26] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[26]),
        .Q(divisor[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[27] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[27]),
        .Q(divisor[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[28] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[28]),
        .Q(divisor[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[29] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[29]),
        .Q(divisor[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[2] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[2]),
        .Q(divisor[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[30] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[30]),
        .Q(divisor[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[31] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[31]),
        .Q(divisor[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[32] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[32]),
        .Q(divisor[32]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[33] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[33]),
        .Q(divisor[33]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[34] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[34]),
        .Q(divisor[34]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[35] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[35]),
        .Q(divisor[35]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[36] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[36]),
        .Q(divisor[36]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[37] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[37]),
        .Q(divisor[37]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[38] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[38]),
        .Q(divisor[38]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[39] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[39]),
        .Q(divisor[39]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[3] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[3]),
        .Q(divisor[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[40] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[40]),
        .Q(divisor[40]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[41] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[41]),
        .Q(divisor[41]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[42] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[42]),
        .Q(divisor[42]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[43] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[43]),
        .Q(divisor[43]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[44] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[44]),
        .Q(divisor[44]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[45] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[45]),
        .Q(divisor[45]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[46] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[46]),
        .Q(divisor[46]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[47] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[47]),
        .Q(divisor[47]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[48] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[48]),
        .Q(divisor[48]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[49] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[49]),
        .Q(divisor[49]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[4] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[4]),
        .Q(divisor[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[50] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[50]),
        .Q(divisor[50]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[51] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[51]),
        .Q(divisor[51]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[52] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[52]),
        .Q(divisor[52]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[53] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[53]),
        .Q(divisor[53]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[54] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[54]),
        .Q(divisor[54]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[55] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[55]),
        .Q(divisor[55]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[56] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[56]),
        .Q(divisor[56]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[57] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[57]),
        .Q(divisor[57]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[58] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[58]),
        .Q(divisor[58]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[59] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[59]),
        .Q(divisor[59]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[5] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[5]),
        .Q(divisor[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[60] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[60]),
        .Q(divisor[60]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[61] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[61]),
        .Q(divisor[61]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[62] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[62]),
        .Q(divisor[62]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[6] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[6]),
        .Q(divisor[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[7] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[7]),
        .Q(divisor[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[8] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[8]),
        .Q(divisor[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "100" *) 
  RTL_REG__BREG_11 \divisor_reg[9] 
       (.C(clk),
        .CE(divisor_i__2_n_0),
        .D(divisor__0[9]),
        .Q(divisor[9]));
  (* XLNX_LINE_COL = "1716224" *) 
  (* map_to_module = "143" *) 
  RTL_REDUCTION_OR instr_any_div_rem_i
       (.I0(p_0_in),
        .O(instr_any_div_rem));
  (* XLNX_LINE_COL = "419328" *) 
  (* map_to_module = "135" *) 
  RTL_AND1 instr_div1_i
       (.I0(instr_div2),
        .I1(instr_div2_i__0_n_0),
        .O(instr_div1));
  (* XLNX_LINE_COL = "410624" *) 
  (* map_to_module = "136" *) 
  RTL_AND1 instr_div2_i
       (.I0(instr_div3),
        .I1(instr_div3_i__0_n_0),
        .O(instr_div2));
  (* XLNX_LINE_COL = "5054208" *) 
  (* map_to_module = "141" *) 
  RTL_EQ instr_div2_i__0
       (.I0(pcpi_insn[31:25]),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O(instr_div2_i__0_n_0));
  (* XLNX_LINE_COL = "402432" *) 
  (* map_to_module = "137" *) 
  RTL_AND1 instr_div3_i
       (.I0(instr_div4),
        .I1(instr_div4_i__0_n_0),
        .O(instr_div3));
  (* XLNX_LINE_COL = "2956544" *) 
  (* map_to_module = "140" *) 
  RTL_EQ instr_div3_i__0
       (.I0(pcpi_insn[6:0]),
        .I1({\<const0> ,\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(instr_div3_i__0_n_0));
  (* XLNX_LINE_COL = "398592" *) 
  (* map_to_module = "138" *) 
  RTL_AND1 instr_div4_i
       (.I0(resetn),
        .I1(pcpi_valid),
        .O(instr_div4));
  (* XLNX_LINE_COL = "1969152" *) 
  (* map_to_module = "139" *) 
  RTL_INV0 instr_div4_i__0
       (.I0(pcpi_ready),
        .O(instr_div4_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_4:1'b1,INIT_5:1'b0,INIT_6:1'b0,INIT_7:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "104" *) 
  RTL_ROM2 instr_div_i
       (.A(pcpi_insn[14:12]),
        .O(instr_div));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "105" *) 
  RTL_MUX2 instr_div_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_div_i__0_n_0),
        .S(instr_div1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1837568" *) 
  (* map_to_module = "90" *) 
  RTL_REG_SYNC__BREG_1 instr_div_reg
       (.C(clk),
        .D(instr_div),
        .Q(p_0_in[3]),
        .RST(instr_div_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_4:1'b0,INIT_5:1'b1,INIT_6:1'b0,INIT_7:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "106" *) 
  RTL_ROM2 instr_divu_i
       (.A(pcpi_insn[14:12]),
        .O(instr_divu));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "107" *) 
  RTL_MUX2 instr_divu_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_divu_i__0_n_0),
        .S(instr_div1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2558720" *) 
  (* map_to_module = "91" *) 
  RTL_REG_SYNC__BREG_1 instr_divu_reg
       (.C(clk),
        .D(instr_divu),
        .Q(p_0_in[2]),
        .RST(instr_divu_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_4:1'b0,INIT_5:1'b0,INIT_6:1'b1,INIT_7:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "108" *) 
  RTL_ROM2 instr_rem_i
       (.A(pcpi_insn[14:12]),
        .O(instr_rem));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "109" *) 
  RTL_MUX2 instr_rem_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_rem_i__0_n_0),
        .S(instr_div1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3344896" *) 
  (* map_to_module = "92" *) 
  RTL_REG_SYNC__BREG_1 instr_rem_reg
       (.C(clk),
        .D(instr_rem),
        .Q(p_0_in[1]),
        .RST(instr_rem_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_4:1'b0,INIT_5:1'b0,INIT_6:1'b0,INIT_7:1'b1" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "110" *) 
  RTL_ROM2 instr_remu_i
       (.A(pcpi_insn[14:12]),
        .O(instr_remu));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "111" *) 
  RTL_MUX2 instr_remu_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_remu_i__0_n_0),
        .S(instr_div1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4066048" *) 
  (* map_to_module = "93" *) 
  RTL_REG_SYNC__BREG_1 instr_remu_reg
       (.C(clk),
        .D(instr_remu),
        .Q(p_0_in[0]),
        .RST(instr_remu_i__0_n_0));
  (* XLNX_LINE_COL = "940544" *) 
  (* map_to_module = "155" *) 
  RTL_OR0 outsign0_i
       (.I0(outsign1),
        .I1(outsign1_i__0_n_0),
        .O(outsign0));
  (* XLNX_LINE_COL = "932608" *) 
  (* map_to_module = "156" *) 
  RTL_AND1 outsign1_i
       (.I0(outsign2),
        .I1(outsign2_i__0_n_0),
        .O(outsign1));
  (* XLNX_LINE_COL = "4987904" *) 
  (* map_to_module = "158" *) 
  RTL_AND1 outsign1_i__0
       (.I0(p_0_in[1]),
        .I1(pcpi_rs1[31]),
        .O(outsign1_i__0_n_0));
  (* XLNX_LINE_COL = "994304" *) 
  (* map_to_module = "157" *) 
  RTL_AND1 outsign2_i
       (.I0(p_0_in[3]),
        .I1(outsign3),
        .O(outsign2));
  (* XLNX_LINE_COL = "4065792" *) 
  (* map_to_module = "159" *) 
  RTL_REDUCTION_OR4 outsign2_i__0
       (.I0(pcpi_rs2),
        .O(outsign2_i__0_n_0));
  (* XLNX_LINE_COL = "1842944" *) 
  (* map_to_module = "168" *) 
  RTL_NEQ outsign3_i
       (.I0(pcpi_rs1[31]),
        .I1(pcpi_rs2[31]),
        .O(outsign3));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "128" *) 
  RTL_MUX2 outsign_i
       (.I0(\<const0> ),
        .I1(start),
        .O(outsign__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "101" *) 
  RTL_REG__BREG_11 outsign_reg
       (.C(clk),
        .CE(outsign__0),
        .D(outsign0),
        .Q(outsign));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "990976" *) 
  (* map_to_module = "114" *) 
  RTL_MUX18 pcpi_rd0_i
       (.I0({pcpi_rd1_i_n_0,pcpi_rd1_i_n_1,pcpi_rd1_i_n_2,pcpi_rd1_i_n_3,pcpi_rd1_i_n_4,pcpi_rd1_i_n_5,pcpi_rd1_i_n_6,pcpi_rd1_i_n_7,pcpi_rd1_i_n_8,pcpi_rd1_i_n_9,pcpi_rd1_i_n_10,pcpi_rd1_i_n_11,pcpi_rd1_i_n_12,pcpi_rd1_i_n_13,pcpi_rd1_i_n_14,pcpi_rd1_i_n_15,pcpi_rd1_i_n_16,pcpi_rd1_i_n_17,pcpi_rd1_i_n_18,pcpi_rd1_i_n_19,pcpi_rd1_i_n_20,pcpi_rd1_i_n_21,pcpi_rd1_i_n_22,pcpi_rd1_i_n_23,pcpi_rd1_i_n_24,pcpi_rd1_i_n_25,pcpi_rd1_i_n_26,pcpi_rd1_i_n_27,pcpi_rd1_i_n_28,pcpi_rd1_i_n_29,pcpi_rd1_i_n_30,pcpi_rd1_i_n_31}),
        .I1(quotient),
        .O({pcpi_rd0_i_n_0,pcpi_rd0_i_n_1,pcpi_rd0_i_n_2,pcpi_rd0_i_n_3,pcpi_rd0_i_n_4,pcpi_rd0_i_n_5,pcpi_rd0_i_n_6,pcpi_rd0_i_n_7,pcpi_rd0_i_n_8,pcpi_rd0_i_n_9,pcpi_rd0_i_n_10,pcpi_rd0_i_n_11,pcpi_rd0_i_n_12,pcpi_rd0_i_n_13,pcpi_rd0_i_n_14,pcpi_rd0_i_n_15,pcpi_rd0_i_n_16,pcpi_rd0_i_n_17,pcpi_rd0_i_n_18,pcpi_rd0_i_n_19,pcpi_rd0_i_n_20,pcpi_rd0_i_n_21,pcpi_rd0_i_n_22,pcpi_rd0_i_n_23,pcpi_rd0_i_n_24,pcpi_rd0_i_n_25,pcpi_rd0_i_n_26,pcpi_rd0_i_n_27,pcpi_rd0_i_n_28,pcpi_rd0_i_n_29,pcpi_rd0_i_n_30,pcpi_rd0_i_n_31}),
        .S(outsign));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "990976" *) 
  (* map_to_module = "115" *) 
  RTL_MUX18 pcpi_rd0_i__0
       (.I0({pcpi_rd1_i__0_n_0,pcpi_rd1_i__0_n_1,pcpi_rd1_i__0_n_2,pcpi_rd1_i__0_n_3,pcpi_rd1_i__0_n_4,pcpi_rd1_i__0_n_5,pcpi_rd1_i__0_n_6,pcpi_rd1_i__0_n_7,pcpi_rd1_i__0_n_8,pcpi_rd1_i__0_n_9,pcpi_rd1_i__0_n_10,pcpi_rd1_i__0_n_11,pcpi_rd1_i__0_n_12,pcpi_rd1_i__0_n_13,pcpi_rd1_i__0_n_14,pcpi_rd1_i__0_n_15,pcpi_rd1_i__0_n_16,pcpi_rd1_i__0_n_17,pcpi_rd1_i__0_n_18,pcpi_rd1_i__0_n_19,pcpi_rd1_i__0_n_20,pcpi_rd1_i__0_n_21,pcpi_rd1_i__0_n_22,pcpi_rd1_i__0_n_23,pcpi_rd1_i__0_n_24,pcpi_rd1_i__0_n_25,pcpi_rd1_i__0_n_26,pcpi_rd1_i__0_n_27,pcpi_rd1_i__0_n_28,pcpi_rd1_i__0_n_29,pcpi_rd1_i__0_n_30,pcpi_rd1_i__0_n_31}),
        .I1(dividend),
        .O({pcpi_rd0_i__0_n_0,pcpi_rd0_i__0_n_1,pcpi_rd0_i__0_n_2,pcpi_rd0_i__0_n_3,pcpi_rd0_i__0_n_4,pcpi_rd0_i__0_n_5,pcpi_rd0_i__0_n_6,pcpi_rd0_i__0_n_7,pcpi_rd0_i__0_n_8,pcpi_rd0_i__0_n_9,pcpi_rd0_i__0_n_10,pcpi_rd0_i__0_n_11,pcpi_rd0_i__0_n_12,pcpi_rd0_i__0_n_13,pcpi_rd0_i__0_n_14,pcpi_rd0_i__0_n_15,pcpi_rd0_i__0_n_16,pcpi_rd0_i__0_n_17,pcpi_rd0_i__0_n_18,pcpi_rd0_i__0_n_19,pcpi_rd0_i__0_n_20,pcpi_rd0_i__0_n_21,pcpi_rd0_i__0_n_22,pcpi_rd0_i__0_n_23,pcpi_rd0_i__0_n_24,pcpi_rd0_i__0_n_25,pcpi_rd0_i__0_n_26,pcpi_rd0_i__0_n_27,pcpi_rd0_i__0_n_28,pcpi_rd0_i__0_n_29,pcpi_rd0_i__0_n_30,pcpi_rd0_i__0_n_31}),
        .S(outsign));
  (* XLNX_LINE_COL = "1640960" *) 
  (* map_to_module = "162" *) 
  RTL_MINUS1 pcpi_rd1_i
       (.I0(quotient),
        .O({pcpi_rd1_i_n_0,pcpi_rd1_i_n_1,pcpi_rd1_i_n_2,pcpi_rd1_i_n_3,pcpi_rd1_i_n_4,pcpi_rd1_i_n_5,pcpi_rd1_i_n_6,pcpi_rd1_i_n_7,pcpi_rd1_i_n_8,pcpi_rd1_i_n_9,pcpi_rd1_i_n_10,pcpi_rd1_i_n_11,pcpi_rd1_i_n_12,pcpi_rd1_i_n_13,pcpi_rd1_i_n_14,pcpi_rd1_i_n_15,pcpi_rd1_i_n_16,pcpi_rd1_i_n_17,pcpi_rd1_i_n_18,pcpi_rd1_i_n_19,pcpi_rd1_i_n_20,pcpi_rd1_i_n_21,pcpi_rd1_i_n_22,pcpi_rd1_i_n_23,pcpi_rd1_i_n_24,pcpi_rd1_i_n_25,pcpi_rd1_i_n_26,pcpi_rd1_i_n_27,pcpi_rd1_i_n_28,pcpi_rd1_i_n_29,pcpi_rd1_i_n_30,pcpi_rd1_i_n_31}));
  (* XLNX_LINE_COL = "1640960" *) 
  (* map_to_module = "163" *) 
  RTL_MINUS1 pcpi_rd1_i__0
       (.I0(dividend),
        .O({pcpi_rd1_i__0_n_0,pcpi_rd1_i__0_n_1,pcpi_rd1_i__0_n_2,pcpi_rd1_i__0_n_3,pcpi_rd1_i__0_n_4,pcpi_rd1_i__0_n_5,pcpi_rd1_i__0_n_6,pcpi_rd1_i__0_n_7,pcpi_rd1_i__0_n_8,pcpi_rd1_i__0_n_9,pcpi_rd1_i__0_n_10,pcpi_rd1_i__0_n_11,pcpi_rd1_i__0_n_12,pcpi_rd1_i__0_n_13,pcpi_rd1_i__0_n_14,pcpi_rd1_i__0_n_15,pcpi_rd1_i__0_n_16,pcpi_rd1_i__0_n_17,pcpi_rd1_i__0_n_18,pcpi_rd1_i__0_n_19,pcpi_rd1_i__0_n_20,pcpi_rd1_i__0_n_21,pcpi_rd1_i__0_n_22,pcpi_rd1_i__0_n_23,pcpi_rd1_i__0_n_24,pcpi_rd1_i__0_n_25,pcpi_rd1_i__0_n_26,pcpi_rd1_i__0_n_27,pcpi_rd1_i__0_n_28,pcpi_rd1_i__0_n_29,pcpi_rd1_i__0_n_30,pcpi_rd1_i__0_n_31}));
  (* XLNX_LINE_COL = "464896" *) 
  (* map_to_module = "149" *) 
  RTL_OR0 pcpi_rd1_i__1
       (.I0(p_0_in[3]),
        .I1(p_0_in[2]),
        .O(pcpi_rd1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "207875" *) 
  (* map_to_module = "113" *) 
  RTL_MUX18 pcpi_rd_i
       (.I0({pcpi_rd0_i_n_0,pcpi_rd0_i_n_1,pcpi_rd0_i_n_2,pcpi_rd0_i_n_3,pcpi_rd0_i_n_4,pcpi_rd0_i_n_5,pcpi_rd0_i_n_6,pcpi_rd0_i_n_7,pcpi_rd0_i_n_8,pcpi_rd0_i_n_9,pcpi_rd0_i_n_10,pcpi_rd0_i_n_11,pcpi_rd0_i_n_12,pcpi_rd0_i_n_13,pcpi_rd0_i_n_14,pcpi_rd0_i_n_15,pcpi_rd0_i_n_16,pcpi_rd0_i_n_17,pcpi_rd0_i_n_18,pcpi_rd0_i_n_19,pcpi_rd0_i_n_20,pcpi_rd0_i_n_21,pcpi_rd0_i_n_22,pcpi_rd0_i_n_23,pcpi_rd0_i_n_24,pcpi_rd0_i_n_25,pcpi_rd0_i_n_26,pcpi_rd0_i_n_27,pcpi_rd0_i_n_28,pcpi_rd0_i_n_29,pcpi_rd0_i_n_30,pcpi_rd0_i_n_31}),
        .I1({pcpi_rd0_i__0_n_0,pcpi_rd0_i__0_n_1,pcpi_rd0_i__0_n_2,pcpi_rd0_i__0_n_3,pcpi_rd0_i__0_n_4,pcpi_rd0_i__0_n_5,pcpi_rd0_i__0_n_6,pcpi_rd0_i__0_n_7,pcpi_rd0_i__0_n_8,pcpi_rd0_i__0_n_9,pcpi_rd0_i__0_n_10,pcpi_rd0_i__0_n_11,pcpi_rd0_i__0_n_12,pcpi_rd0_i__0_n_13,pcpi_rd0_i__0_n_14,pcpi_rd0_i__0_n_15,pcpi_rd0_i__0_n_16,pcpi_rd0_i__0_n_17,pcpi_rd0_i__0_n_18,pcpi_rd0_i__0_n_19,pcpi_rd0_i__0_n_20,pcpi_rd0_i__0_n_21,pcpi_rd0_i__0_n_22,pcpi_rd0_i__0_n_23,pcpi_rd0_i__0_n_24,pcpi_rd0_i__0_n_25,pcpi_rd0_i__0_n_26,pcpi_rd0_i__0_n_27,pcpi_rd0_i__0_n_28,pcpi_rd0_i__0_n_29,pcpi_rd0_i__0_n_30,pcpi_rd0_i__0_n_31}),
        .O({pcpi_rd_i_n_0,pcpi_rd_i_n_1,pcpi_rd_i_n_2,pcpi_rd_i_n_3,pcpi_rd_i_n_4,pcpi_rd_i_n_5,pcpi_rd_i_n_6,pcpi_rd_i_n_7,pcpi_rd_i_n_8,pcpi_rd_i_n_9,pcpi_rd_i_n_10,pcpi_rd_i_n_11,pcpi_rd_i_n_12,pcpi_rd_i_n_13,pcpi_rd_i_n_14,pcpi_rd_i_n_15,pcpi_rd_i_n_16,pcpi_rd_i_n_17,pcpi_rd_i_n_18,pcpi_rd_i_n_19,pcpi_rd_i_n_20,pcpi_rd_i_n_21,pcpi_rd_i_n_22,pcpi_rd_i_n_23,pcpi_rd_i_n_24,pcpi_rd_i_n_25,pcpi_rd_i_n_26,pcpi_rd_i_n_27,pcpi_rd_i_n_28,pcpi_rd_i_n_29,pcpi_rd_i_n_30,pcpi_rd_i_n_31}),
        .S(pcpi_rd1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[0] 
       (.C(clk),
        .D(pcpi_rd_i_n_31),
        .Q(pcpi_rd[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[10] 
       (.C(clk),
        .D(pcpi_rd_i_n_21),
        .Q(pcpi_rd[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[11] 
       (.C(clk),
        .D(pcpi_rd_i_n_20),
        .Q(pcpi_rd[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[12] 
       (.C(clk),
        .D(pcpi_rd_i_n_19),
        .Q(pcpi_rd[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[13] 
       (.C(clk),
        .D(pcpi_rd_i_n_18),
        .Q(pcpi_rd[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[14] 
       (.C(clk),
        .D(pcpi_rd_i_n_17),
        .Q(pcpi_rd[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[15] 
       (.C(clk),
        .D(pcpi_rd_i_n_16),
        .Q(pcpi_rd[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[16] 
       (.C(clk),
        .D(pcpi_rd_i_n_15),
        .Q(pcpi_rd[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[17] 
       (.C(clk),
        .D(pcpi_rd_i_n_14),
        .Q(pcpi_rd[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[18] 
       (.C(clk),
        .D(pcpi_rd_i_n_13),
        .Q(pcpi_rd[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[19] 
       (.C(clk),
        .D(pcpi_rd_i_n_12),
        .Q(pcpi_rd[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[1] 
       (.C(clk),
        .D(pcpi_rd_i_n_30),
        .Q(pcpi_rd[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[20] 
       (.C(clk),
        .D(pcpi_rd_i_n_11),
        .Q(pcpi_rd[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[21] 
       (.C(clk),
        .D(pcpi_rd_i_n_10),
        .Q(pcpi_rd[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[22] 
       (.C(clk),
        .D(pcpi_rd_i_n_9),
        .Q(pcpi_rd[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[23] 
       (.C(clk),
        .D(pcpi_rd_i_n_8),
        .Q(pcpi_rd[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[24] 
       (.C(clk),
        .D(pcpi_rd_i_n_7),
        .Q(pcpi_rd[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[25] 
       (.C(clk),
        .D(pcpi_rd_i_n_6),
        .Q(pcpi_rd[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[26] 
       (.C(clk),
        .D(pcpi_rd_i_n_5),
        .Q(pcpi_rd[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[27] 
       (.C(clk),
        .D(pcpi_rd_i_n_4),
        .Q(pcpi_rd[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[28] 
       (.C(clk),
        .D(pcpi_rd_i_n_3),
        .Q(pcpi_rd[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[29] 
       (.C(clk),
        .D(pcpi_rd_i_n_2),
        .Q(pcpi_rd[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[2] 
       (.C(clk),
        .D(pcpi_rd_i_n_29),
        .Q(pcpi_rd[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[30] 
       (.C(clk),
        .D(pcpi_rd_i_n_1),
        .Q(pcpi_rd[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[31] 
       (.C(clk),
        .D(pcpi_rd_i_n_0),
        .Q(pcpi_rd[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[3] 
       (.C(clk),
        .D(pcpi_rd_i_n_28),
        .Q(pcpi_rd[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[4] 
       (.C(clk),
        .D(pcpi_rd_i_n_27),
        .Q(pcpi_rd[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[5] 
       (.C(clk),
        .D(pcpi_rd_i_n_26),
        .Q(pcpi_rd[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[6] 
       (.C(clk),
        .D(pcpi_rd_i_n_25),
        .Q(pcpi_rd[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[7] 
       (.C(clk),
        .D(pcpi_rd_i_n_24),
        .Q(pcpi_rd[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[8] 
       (.C(clk),
        .D(pcpi_rd_i_n_23),
        .Q(pcpi_rd[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "97" *) 
  RTL_REG__BREG_5 \pcpi_rd_reg[9] 
       (.C(clk),
        .D(pcpi_rd_i_n_22),
        .Q(pcpi_rd[9]));
  (* XLNX_LINE_COL = "399616" *) 
  (* map_to_module = "145" *) 
  RTL_AND1 pcpi_ready0_i
       (.I0(pcpi_ready1),
        .I1(running),
        .O(pcpi_ready0));
  (* XLNX_LINE_COL = "396800" *) 
  (* map_to_module = "146" *) 
  RTL_EQ3 pcpi_ready1_i
       (.I0(quotient_msk),
        .I1(\<const0> ),
        .O(pcpi_ready1));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "112" *) 
  RTL_MUX2 pcpi_ready_i
       (.I0(\<const1> ),
        .I1(start),
        .O(pcpi_ready_i_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133888" *) 
  (* map_to_module = "96" *) 
  RTL_REG_SYNC__BREG_1 pcpi_ready_reg
       (.C(clk),
        .D(pcpi_ready0),
        .Q(pcpi_ready),
        .RST(pcpi_ready_i_n_0));
  (* XLNX_LINE_COL = "990208" *) 
  (* map_to_module = "142" *) 
  RTL_AND1 pcpi_wait0_i
       (.I0(instr_any_div_rem),
        .I1(resetn),
        .O(pcpi_wait0));
  (* XLNX_LINE_COL = "1119232" *) 
  (* map_to_module = "144" *) 
  RTL_AND1 pcpi_wait_q0_i
       (.I0(pcpi_wait),
        .I1(resetn),
        .O(pcpi_wait_q0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1838080" *) 
  (* map_to_module = "95" *) 
  RTL_REG__BREG_5 pcpi_wait_q_reg
       (.C(clk),
        .D(pcpi_wait_q0),
        .Q(pcpi_wait_q));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "920064" *) 
  (* map_to_module = "94" *) 
  RTL_REG__BREG_5 pcpi_wait_reg
       (.C(clk),
        .D(pcpi_wait0),
        .Q(pcpi_wait));
  (* XLNX_LINE_COL = "1054720" *) 
  (* map_to_module = "160" *) 
  RTL_OR2 quotient0_i
       (.I0(quotient),
        .I1(quotient_msk),
        .O(quotient0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132124" *) 
  (* map_to_module = "130" *) 
  RTL_MUX2 quotient_i
       (.I0(\<const0> ),
        .I1(dividend0_i__1_n_0),
        .O(quotient_i_n_0),
        .S(pcpi_ready0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "129" *) 
  RTL_MUX2 quotient_i__0
       (.I0(\<const0> ),
        .I1(quotient_i_n_0),
        .O(quotient__0),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "131" *) 
  RTL_MUX2 quotient_i__1
       (.I0(\<const0> ),
        .I1(start),
        .O(quotient_i__1_n_0),
        .S(resetn));
  (* XLNX_LINE_COL = "1249792" *) 
  (* map_to_module = "161" *) 
  RTL_RSHIFT2 quotient_msk0_i
       (.I0(quotient_msk),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O(quotient_msk0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132124" *) 
  (* map_to_module = "133" *) 
  RTL_MUX2 quotient_msk_i
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(quotient_msk_i_n_0),
        .S(pcpi_ready0));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "132" *) 
  RTL_MUX2 quotient_msk_i__0
       (.I0(\<const0> ),
        .I1(quotient_msk_i_n_0),
        .O(quotient_msk__0),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "134" *) 
  RTL_MUX2 quotient_msk_i__1
       (.I0(\<const0> ),
        .I1(start),
        .O(quotient_msk_i__1_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[0] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[0]),
        .Q(quotient_msk[0]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[10] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[10]),
        .Q(quotient_msk[10]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[11] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[11]),
        .Q(quotient_msk[11]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[12] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[12]),
        .Q(quotient_msk[12]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[13] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[13]),
        .Q(quotient_msk[13]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[14] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[14]),
        .Q(quotient_msk[14]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[15] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[15]),
        .Q(quotient_msk[15]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[16] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[16]),
        .Q(quotient_msk[16]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[17] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[17]),
        .Q(quotient_msk[17]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[18] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[18]),
        .Q(quotient_msk[18]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[19] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[19]),
        .Q(quotient_msk[19]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[1] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[1]),
        .Q(quotient_msk[1]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[20] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[20]),
        .Q(quotient_msk[20]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[21] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[21]),
        .Q(quotient_msk[21]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[22] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[22]),
        .Q(quotient_msk[22]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[23] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[23]),
        .Q(quotient_msk[23]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[24] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[24]),
        .Q(quotient_msk[24]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[25] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[25]),
        .Q(quotient_msk[25]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[26] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[26]),
        .Q(quotient_msk[26]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[27] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[27]),
        .Q(quotient_msk[27]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[28] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[28]),
        .Q(quotient_msk[28]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[29] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[29]),
        .Q(quotient_msk[29]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[2] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[2]),
        .Q(quotient_msk[2]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[30] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[30]),
        .Q(quotient_msk[30]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[31] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[31]),
        .Q(quotient_msk[31]),
        .SET(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[3] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[3]),
        .Q(quotient_msk[3]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[4] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[4]),
        .Q(quotient_msk[4]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[5] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[5]),
        .Q(quotient_msk[5]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[6] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[6]),
        .Q(quotient_msk[6]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[7] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[7]),
        .Q(quotient_msk[7]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[8] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[8]),
        .Q(quotient_msk[8]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199936" *) 
  (* map_to_module = "103" *) 
  RTL_REG_SYNC__BREG_22 \quotient_msk_reg[9] 
       (.C(clk),
        .CE(quotient_msk__0),
        .D(quotient_msk0[9]),
        .Q(quotient_msk[9]),
        .RST(quotient_msk_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[0] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[0]),
        .Q(quotient[0]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[10] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[10]),
        .Q(quotient[10]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[11] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[11]),
        .Q(quotient[11]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[12] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[12]),
        .Q(quotient[12]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[13] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[13]),
        .Q(quotient[13]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[14] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[14]),
        .Q(quotient[14]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[15] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[15]),
        .Q(quotient[15]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[16] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[16]),
        .Q(quotient[16]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[17] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[17]),
        .Q(quotient[17]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[18] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[18]),
        .Q(quotient[18]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[19] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[19]),
        .Q(quotient[19]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[1] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[1]),
        .Q(quotient[1]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[20] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[20]),
        .Q(quotient[20]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[21] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[21]),
        .Q(quotient[21]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[22] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[22]),
        .Q(quotient[22]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[23] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[23]),
        .Q(quotient[23]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[24] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[24]),
        .Q(quotient[24]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[25] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[25]),
        .Q(quotient[25]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[26] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[26]),
        .Q(quotient[26]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[27] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[27]),
        .Q(quotient[27]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[28] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[28]),
        .Q(quotient[28]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[29] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[29]),
        .Q(quotient[29]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[2] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[2]),
        .Q(quotient[2]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[30] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[30]),
        .Q(quotient[30]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[31] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[31]),
        .Q(quotient[31]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[3] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[3]),
        .Q(quotient[3]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[4] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[4]),
        .Q(quotient[4]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[5] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[5]),
        .Q(quotient[5]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[6] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[6]),
        .Q(quotient[6]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[7] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[7]),
        .Q(quotient[7]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[8] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[8]),
        .Q(quotient[8]),
        .RST(quotient_i__1_n_0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198912" *) 
  (* map_to_module = "102" *) 
  RTL_REG_SYNC__BREG_13 \quotient_reg[9] 
       (.C(clk),
        .CE(quotient__0),
        .D(quotient0[9]),
        .Q(quotient[9]),
        .RST(quotient_i__1_n_0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132132" *) 
  (* map_to_module = "116" *) 
  RTL_MUX2 running_i
       (.I0(\<const1> ),
        .I1(pcpi_ready0),
        .O(running__0),
        .S(start));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132135" *) 
  (* map_to_module = "117" *) 
  RTL_MUX2 running_i__0
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(running_i__0_n_0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "98" *) 
  RTL_REG_SYNC__BREG_13 running_reg
       (.C(clk),
        .CE(running__0),
        .D(start),
        .Q(running),
        .RST(running_i__0_n_0));
  (* XLNX_LINE_COL = "1772800" *) 
  (* map_to_module = "148" *) 
  RTL_INV0 start0_i
       (.I0(pcpi_wait_q),
        .O(start0));
  (* XLNX_LINE_COL = "924160" *) 
  (* map_to_module = "147" *) 
  RTL_AND1 start_i
       (.I0(pcpi_wait),
        .I1(start0),
        .O(start));
endmodule

(* CARRY_CHAIN = "4" *) (* STEPS_AT_ONCE = "1" *) (* XLNX_LINE_COL = "2679" *) 
module picorv32_pcpi_mul
   (clk,
    resetn,
    pcpi_valid,
    pcpi_insn,
    pcpi_rs1,
    pcpi_rs2,
    pcpi_wr,
    pcpi_rd,
    pcpi_wait,
    pcpi_ready);
  input clk;
  input resetn;
  input pcpi_valid;
  input [31:0]pcpi_insn;
  input [31:0]pcpi_rs1;
  input [31:0]pcpi_rs2;
  output pcpi_wr;
  output [31:0]pcpi_rd;
  output pcpi_wait;
  output pcpi_ready;

  wire \<const0> ;
  wire \<const1> ;
  wire clk;
  wire instr_any_mul;
  wire instr_any_mulh;
  wire instr_mul;
  wire instr_mul1;
  wire instr_mul2;
  wire instr_mul2_i__0_n_0;
  wire instr_mul3;
  wire instr_mul3_i__0_n_0;
  wire instr_mul__0;
  wire instr_mul_i__0_n_0;
  wire instr_mulh;
  wire instr_mulh__0;
  wire instr_mulh_i__0_n_0;
  wire instr_mulhsu;
  wire instr_mulhsu__0;
  wire instr_mulhsu_i__0_n_0;
  wire instr_mulhu;
  wire instr_mulhu__0;
  wire instr_mulhu_i__0_n_0;
  wire instr_rs1_signed;
  wire instr_rs2_signed;
  wire [6:0]mul_counter;
  wire [6:0]mul_counter0;
  wire mul_counter0_i__0_n_0;
  wire mul_counter0_i__0_n_1;
  wire mul_counter0_i__0_n_2;
  wire mul_counter0_i__0_n_3;
  wire mul_counter0_i__0_n_4;
  wire mul_counter0_i__0_n_5;
  wire mul_counter0_i__0_n_6;
  wire mul_counter_i__1_n_0;
  wire mul_counter_i__1_n_1;
  wire mul_counter_i__1_n_2;
  wire mul_counter_i__1_n_3;
  wire mul_counter_i__1_n_4;
  wire mul_counter_i__1_n_5;
  wire mul_counter_i__1_n_6;
  wire mul_counter_i__2_n_0;
  wire mul_counter_i__2_n_1;
  wire mul_counter_i__2_n_2;
  wire mul_counter_i__2_n_3;
  wire mul_counter_i__2_n_4;
  wire mul_counter_i__2_n_5;
  wire mul_counter_i__2_n_6;
  wire mul_counter_i_n_0;
  wire mul_counter_i_n_1;
  wire mul_counter_i_n_2;
  wire mul_counter_i_n_3;
  wire mul_counter_i_n_4;
  wire mul_counter_i_n_5;
  wire mul_counter_i_n_6;
  wire mul_counter_reg_n_1;
  wire mul_counter_reg_n_2;
  wire mul_counter_reg_n_3;
  wire mul_counter_reg_n_4;
  wire mul_counter_reg_n_5;
  wire mul_counter_reg_n_6;
  wire mul_finish;
  wire mul_finish__0;
  wire mul_start;
  wire mul_start0;
  wire mul_waiting;
  wire mul_waiting0;
  wire mul_waiting1_out;
  wire mul_waiting__0;
  wire mul_waiting_i__0_n_0;
  wire [63:0]next_rd;
  wire [63:3]next_rdt;
  wire [63:0]next_rdx;
  wire [63:0]next_rs1;
  wire [63:0]next_rs2;
  wire p_0_in;
  wire [3:0]p_1_in;
  wire [31:0]pcpi_insn;
  wire [31:0]pcpi_rd;
  wire [31:0]pcpi_rd0;
  wire pcpi_rd1_i_n_0;
  wire pcpi_rd1_i_n_1;
  wire pcpi_rd1_i_n_10;
  wire pcpi_rd1_i_n_11;
  wire pcpi_rd1_i_n_12;
  wire pcpi_rd1_i_n_13;
  wire pcpi_rd1_i_n_14;
  wire pcpi_rd1_i_n_15;
  wire pcpi_rd1_i_n_16;
  wire pcpi_rd1_i_n_17;
  wire pcpi_rd1_i_n_18;
  wire pcpi_rd1_i_n_19;
  wire pcpi_rd1_i_n_2;
  wire pcpi_rd1_i_n_20;
  wire pcpi_rd1_i_n_21;
  wire pcpi_rd1_i_n_22;
  wire pcpi_rd1_i_n_23;
  wire pcpi_rd1_i_n_24;
  wire pcpi_rd1_i_n_25;
  wire pcpi_rd1_i_n_26;
  wire pcpi_rd1_i_n_27;
  wire pcpi_rd1_i_n_28;
  wire pcpi_rd1_i_n_29;
  wire pcpi_rd1_i_n_3;
  wire pcpi_rd1_i_n_30;
  wire pcpi_rd1_i_n_31;
  wire pcpi_rd1_i_n_4;
  wire pcpi_rd1_i_n_5;
  wire pcpi_rd1_i_n_6;
  wire pcpi_rd1_i_n_7;
  wire pcpi_rd1_i_n_8;
  wire pcpi_rd1_i_n_9;
  wire pcpi_ready;
  wire [31:0]pcpi_rs1;
  wire [31:0]pcpi_rs2;
  wire pcpi_valid;
  wire pcpi_wait;
  wire pcpi_wait_q;
  wire pcpi_wr0;
  wire rd;
  wire [4:0]rd1;
  wire [4:0]rd11;
  wire [4:0]rd13;
  wire [4:0]rd15;
  wire [4:0]rd17;
  wire [4:0]rd19;
  wire [4:0]rd21;
  wire [4:0]rd23;
  wire [4:0]rd25;
  wire [4:0]rd27;
  wire [4:0]rd29;
  wire [4:0]rd3;
  wire [4:0]rd31;
  wire [4:0]rd5;
  wire [4:0]rd7;
  wire [4:0]rd9;
  wire rd_reg_n_0;
  wire rd_reg_n_1;
  wire rd_reg_n_10;
  wire rd_reg_n_11;
  wire rd_reg_n_12;
  wire rd_reg_n_13;
  wire rd_reg_n_14;
  wire rd_reg_n_15;
  wire rd_reg_n_16;
  wire rd_reg_n_17;
  wire rd_reg_n_18;
  wire rd_reg_n_19;
  wire rd_reg_n_2;
  wire rd_reg_n_20;
  wire rd_reg_n_21;
  wire rd_reg_n_22;
  wire rd_reg_n_23;
  wire rd_reg_n_24;
  wire rd_reg_n_25;
  wire rd_reg_n_26;
  wire rd_reg_n_27;
  wire rd_reg_n_28;
  wire rd_reg_n_29;
  wire rd_reg_n_3;
  wire rd_reg_n_30;
  wire rd_reg_n_31;
  wire rd_reg_n_32;
  wire rd_reg_n_33;
  wire rd_reg_n_34;
  wire rd_reg_n_35;
  wire rd_reg_n_36;
  wire rd_reg_n_37;
  wire rd_reg_n_38;
  wire rd_reg_n_39;
  wire rd_reg_n_4;
  wire rd_reg_n_40;
  wire rd_reg_n_41;
  wire rd_reg_n_42;
  wire rd_reg_n_43;
  wire rd_reg_n_44;
  wire rd_reg_n_45;
  wire rd_reg_n_46;
  wire rd_reg_n_47;
  wire rd_reg_n_48;
  wire rd_reg_n_49;
  wire rd_reg_n_5;
  wire rd_reg_n_50;
  wire rd_reg_n_51;
  wire rd_reg_n_52;
  wire rd_reg_n_53;
  wire rd_reg_n_54;
  wire rd_reg_n_55;
  wire rd_reg_n_56;
  wire rd_reg_n_57;
  wire rd_reg_n_58;
  wire rd_reg_n_59;
  wire rd_reg_n_6;
  wire rd_reg_n_7;
  wire rd_reg_n_8;
  wire rd_reg_n_9;
  wire [63:0]rdx;
  wire rdx__0;
  wire resetn;
  wire [63:0]rs1;
  wire [63:0]rs1__0;
  wire rs1_i_n_0;
  wire rs1_i_n_1;
  wire rs1_i_n_10;
  wire rs1_i_n_11;
  wire rs1_i_n_12;
  wire rs1_i_n_13;
  wire rs1_i_n_14;
  wire rs1_i_n_15;
  wire rs1_i_n_16;
  wire rs1_i_n_17;
  wire rs1_i_n_18;
  wire rs1_i_n_19;
  wire rs1_i_n_2;
  wire rs1_i_n_20;
  wire rs1_i_n_21;
  wire rs1_i_n_22;
  wire rs1_i_n_23;
  wire rs1_i_n_24;
  wire rs1_i_n_25;
  wire rs1_i_n_26;
  wire rs1_i_n_27;
  wire rs1_i_n_28;
  wire rs1_i_n_29;
  wire rs1_i_n_3;
  wire rs1_i_n_30;
  wire rs1_i_n_31;
  wire rs1_i_n_32;
  wire rs1_i_n_33;
  wire rs1_i_n_34;
  wire rs1_i_n_35;
  wire rs1_i_n_36;
  wire rs1_i_n_37;
  wire rs1_i_n_38;
  wire rs1_i_n_39;
  wire rs1_i_n_4;
  wire rs1_i_n_40;
  wire rs1_i_n_41;
  wire rs1_i_n_42;
  wire rs1_i_n_43;
  wire rs1_i_n_44;
  wire rs1_i_n_45;
  wire rs1_i_n_46;
  wire rs1_i_n_47;
  wire rs1_i_n_48;
  wire rs1_i_n_49;
  wire rs1_i_n_5;
  wire rs1_i_n_50;
  wire rs1_i_n_51;
  wire rs1_i_n_52;
  wire rs1_i_n_53;
  wire rs1_i_n_54;
  wire rs1_i_n_55;
  wire rs1_i_n_56;
  wire rs1_i_n_57;
  wire rs1_i_n_58;
  wire rs1_i_n_59;
  wire rs1_i_n_6;
  wire rs1_i_n_60;
  wire rs1_i_n_61;
  wire rs1_i_n_62;
  wire rs1_i_n_63;
  wire rs1_i_n_7;
  wire rs1_i_n_8;
  wire rs1_i_n_9;
  wire [63:0]rs2;
  wire [63:0]rs2__0;
  wire rs2_i_n_0;
  wire rs2_i_n_1;
  wire rs2_i_n_10;
  wire rs2_i_n_11;
  wire rs2_i_n_12;
  wire rs2_i_n_13;
  wire rs2_i_n_14;
  wire rs2_i_n_15;
  wire rs2_i_n_16;
  wire rs2_i_n_17;
  wire rs2_i_n_18;
  wire rs2_i_n_19;
  wire rs2_i_n_2;
  wire rs2_i_n_20;
  wire rs2_i_n_21;
  wire rs2_i_n_22;
  wire rs2_i_n_23;
  wire rs2_i_n_24;
  wire rs2_i_n_25;
  wire rs2_i_n_26;
  wire rs2_i_n_27;
  wire rs2_i_n_28;
  wire rs2_i_n_29;
  wire rs2_i_n_3;
  wire rs2_i_n_30;
  wire rs2_i_n_31;
  wire rs2_i_n_32;
  wire rs2_i_n_33;
  wire rs2_i_n_34;
  wire rs2_i_n_35;
  wire rs2_i_n_36;
  wire rs2_i_n_37;
  wire rs2_i_n_38;
  wire rs2_i_n_39;
  wire rs2_i_n_4;
  wire rs2_i_n_40;
  wire rs2_i_n_41;
  wire rs2_i_n_42;
  wire rs2_i_n_43;
  wire rs2_i_n_44;
  wire rs2_i_n_45;
  wire rs2_i_n_46;
  wire rs2_i_n_47;
  wire rs2_i_n_48;
  wire rs2_i_n_49;
  wire rs2_i_n_5;
  wire rs2_i_n_50;
  wire rs2_i_n_51;
  wire rs2_i_n_52;
  wire rs2_i_n_53;
  wire rs2_i_n_54;
  wire rs2_i_n_55;
  wire rs2_i_n_56;
  wire rs2_i_n_57;
  wire rs2_i_n_58;
  wire rs2_i_n_59;
  wire rs2_i_n_6;
  wire rs2_i_n_60;
  wire rs2_i_n_61;
  wire rs2_i_n_62;
  wire rs2_i_n_63;
  wire rs2_i_n_7;
  wire rs2_i_n_8;
  wire rs2_i_n_9;
  wire [63:0]this_rs2;

  assign pcpi_wr = pcpi_ready;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* XLNX_LINE_COL = "1455104" *) 
  (* map_to_module = "46" *) 
  RTL_REDUCTION_OR instr_any_mul_i
       (.I0({instr_mul,instr_mulh,instr_mulhsu,instr_mulhu}),
        .O(instr_any_mul));
  (* XLNX_LINE_COL = "1517824" *) 
  (* map_to_module = "52" *) 
  RTL_REDUCTION_OR2 instr_any_mulh_i
       (.I0({instr_mulh,instr_mulhsu,instr_mulhu}),
        .O(instr_any_mulh));
  (* XLNX_LINE_COL = "415488" *) 
  (* map_to_module = "41" *) 
  RTL_AND1 instr_mul1_i
       (.I0(instr_mul2),
        .I1(instr_mul2_i__0_n_0),
        .O(instr_mul1));
  (* XLNX_LINE_COL = "406784" *) 
  (* map_to_module = "42" *) 
  RTL_AND1 instr_mul2_i
       (.I0(instr_mul3),
        .I1(instr_mul3_i__0_n_0),
        .O(instr_mul2));
  (* XLNX_LINE_COL = "4071168" *) 
  (* map_to_module = "45" *) 
  RTL_EQ instr_mul2_i__0
       (.I0(pcpi_insn[31:25]),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const1> }),
        .O(instr_mul2_i__0_n_0));
  (* XLNX_LINE_COL = "398592" *) 
  (* map_to_module = "43" *) 
  RTL_AND1 instr_mul3_i
       (.I0(resetn),
        .I1(pcpi_valid),
        .O(instr_mul3));
  (* XLNX_LINE_COL = "1973504" *) 
  (* map_to_module = "44" *) 
  RTL_EQ instr_mul3_i__0
       (.I0(pcpi_insn[6:0]),
        .I1({\<const0> ,\<const1> ,\<const1> ,\<const0> ,\<const0> ,\<const1> ,\<const1> }),
        .O(instr_mul3_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b1,INIT_1:1'b0,INIT_2:1'b0,INIT_3:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "15" *) 
  RTL_ROM2 instr_mul_i
       (.A(pcpi_insn[14:12]),
        .O(instr_mul__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "16" *) 
  RTL_MUX2 instr_mul_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_mul_i__0_n_0),
        .S(instr_mul1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1575424" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 instr_mul_reg
       (.C(clk),
        .D(instr_mul__0),
        .Q(instr_mul),
        .RST(instr_mul_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b0,INIT_1:1'b1,INIT_2:1'b0,INIT_3:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "17" *) 
  RTL_ROM2 instr_mulh_i
       (.A(pcpi_insn[14:12]),
        .O(instr_mulh__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "18" *) 
  RTL_MUX2 instr_mulh_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_mulh_i__0_n_0),
        .S(instr_mul1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2296576" *) 
  (* map_to_module = "1" *) 
  RTL_REG_SYNC__BREG_1 instr_mulh_reg
       (.C(clk),
        .D(instr_mulh__0),
        .Q(instr_mulh),
        .RST(instr_mulh_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b0,INIT_1:1'b0,INIT_2:1'b1,INIT_3:1'b0" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "19" *) 
  RTL_ROM2 instr_mulhsu_i
       (.A(pcpi_insn[14:12]),
        .O(instr_mulhsu__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "20" *) 
  RTL_MUX2 instr_mulhsu_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_mulhsu_i__0_n_0),
        .S(instr_mul1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "3083520" *) 
  (* map_to_module = "2" *) 
  RTL_REG_SYNC__BREG_1 instr_mulhsu_reg
       (.C(clk),
        .D(instr_mulhsu__0),
        .Q(instr_mulhsu),
        .RST(instr_mulhsu_i__0_n_0));
  (* INIT_VAL = "INIT_DEFAULT:1'b0,INIT_0:1'b0,INIT_1:1'b0,INIT_2:1'b0,INIT_3:1'b1" *) 
  (* XLNX_LINE_COL = "198661" *) 
  (* map_to_module = "21" *) 
  RTL_ROM2 instr_mulhu_i
       (.A(pcpi_insn[14:12]),
        .O(instr_mulhu__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132103" *) 
  (* map_to_module = "22" *) 
  RTL_MUX2 instr_mulhu_i__0
       (.I0(\<const0> ),
        .I1(\<const1> ),
        .O(instr_mulhu_i__0_n_0),
        .S(instr_mul1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4000768" *) 
  (* map_to_module = "3" *) 
  RTL_REG_SYNC__BREG_1 instr_mulhu_reg
       (.C(clk),
        .D(instr_mulhu__0),
        .Q(instr_mulhu),
        .RST(instr_mulhu_i__0_n_0));
  (* XLNX_LINE_COL = "1645568" *) 
  (* map_to_module = "50" *) 
  RTL_REDUCTION_OR0 instr_rs1_signed_i
       (.I0({instr_mulh,instr_mulhsu}),
        .O(instr_rs1_signed));
  (* XLNX_LINE_COL = "1641984" *) 
  (* map_to_module = "51" *) 
  RTL_REDUCTION_OR1 instr_rs2_signed_i
       (.I0(instr_mulh),
        .O(instr_rs2_signed));
  (* XLNX_LINE_COL = "1186816" *) 
  (* map_to_module = "57" *) 
  RTL_SUB mul_counter0_i
       (.I0({p_0_in,mul_counter_reg_n_1,mul_counter_reg_n_2,mul_counter_reg_n_3,mul_counter_reg_n_4,mul_counter_reg_n_5,mul_counter_reg_n_6}),
        .I1(\<const1> ),
        .O(mul_counter0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1194752" *) 
  (* map_to_module = "35" *) 
  RTL_MUX15 mul_counter0_i__0
       (.I0({\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .I1({\<const1> ,\<const0> ,\<const1> ,\<const1> ,\<const1> ,\<const1> ,\<const1> }),
        .O({mul_counter0_i__0_n_0,mul_counter0_i__0_n_1,mul_counter0_i__0_n_2,mul_counter0_i__0_n_3,mul_counter0_i__0_n_4,mul_counter0_i__0_n_5,mul_counter0_i__0_n_6}),
        .S(instr_any_mulh));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "34" *) 
  RTL_MUX15 mul_counter_i
       (.I0({mul_counter0_i__0_n_0,mul_counter0_i__0_n_1,mul_counter0_i__0_n_2,mul_counter0_i__0_n_3,mul_counter0_i__0_n_4,mul_counter0_i__0_n_5,mul_counter0_i__0_n_6}),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({mul_counter_i_n_0,mul_counter_i_n_1,mul_counter_i_n_2,mul_counter_i_n_3,mul_counter_i_n_4,mul_counter_i_n_5,mul_counter_i_n_6}),
        .S(mul_waiting));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "33" *) 
  RTL_MUX15 mul_counter_i__0
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1({mul_counter_i_n_0,mul_counter_i_n_1,mul_counter_i_n_2,mul_counter_i_n_3,mul_counter_i_n_4,mul_counter_i_n_5,mul_counter_i_n_6}),
        .O(mul_counter),
        .S(resetn));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "37" *) 
  RTL_MUX15 mul_counter_i__1
       (.I0({\<const0> ,\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O({mul_counter_i__1_n_0,mul_counter_i__1_n_1,mul_counter_i__1_n_2,mul_counter_i__1_n_3,mul_counter_i__1_n_4,mul_counter_i__1_n_5,mul_counter_i__1_n_6}),
        .S(mul_waiting));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "36" *) 
  RTL_MUX15 mul_counter_i__2
       (.I0({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I1({mul_counter_i__1_n_0,mul_counter_i__1_n_1,mul_counter_i__1_n_2,mul_counter_i__1_n_3,mul_counter_i__1_n_4,mul_counter_i__1_n_5,mul_counter_i__1_n_6}),
        .O({mul_counter_i__2_n_0,mul_counter_i__2_n_1,mul_counter_i__2_n_2,mul_counter_i__2_n_3,mul_counter_i__2_n_4,mul_counter_i__2_n_5,mul_counter_i__2_n_6}),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[0] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[0]),
        .Q(mul_counter_reg_n_6),
        .RST(mul_counter[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[1] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[1]),
        .Q(mul_counter_reg_n_5),
        .SET(mul_counter[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[2] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[2]),
        .Q(mul_counter_reg_n_4),
        .SET(mul_counter[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[3] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[3]),
        .Q(mul_counter_reg_n_3),
        .SET(mul_counter[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[4] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[4]),
        .Q(mul_counter_reg_n_2),
        .SET(mul_counter[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[5] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[5]),
        .Q(mul_counter_reg_n_1),
        .SET(mul_counter[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "12" *) 
  RTL_REG_SYNC__BREG_8 \mul_counter_reg[6] 
       (.C(clk),
        .CE(resetn),
        .D(mul_counter0[6]),
        .Q(p_0_in),
        .RST(mul_counter[6]));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "23" *) 
  RTL_MUX2 mul_finish_i
       (.I0(\<const1> ),
        .I1(mul_waiting),
        .O(mul_finish__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133888" *) 
  (* map_to_module = "6" *) 
  RTL_REG_SYNC__BREG_1 mul_finish_reg
       (.C(clk),
        .D(p_0_in),
        .Q(mul_finish),
        .RST(mul_finish__0));
  (* XLNX_LINE_COL = "2034944" *) 
  (* map_to_module = "49" *) 
  RTL_INV0 mul_start0_i
       (.I0(pcpi_wait_q),
        .O(mul_start0));
  (* XLNX_LINE_COL = "1186304" *) 
  (* map_to_module = "48" *) 
  RTL_AND1 mul_start_i
       (.I0(pcpi_wait),
        .I1(mul_start0),
        .O(mul_start));
  (* XLNX_LINE_COL = "1182464" *) 
  (* map_to_module = "47" *) 
  RTL_INV0 mul_waiting0_i
       (.I0(mul_start),
        .O(mul_waiting0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "24" *) 
  RTL_MUX2 mul_waiting_i
       (.I0(mul_waiting0),
        .I1(p_0_in),
        .O(mul_waiting1_out),
        .S(mul_waiting));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "25" *) 
  RTL_MUX2 mul_waiting_i__0
       (.I0(\<const1> ),
        .I1(p_0_in),
        .O(mul_waiting_i__0_n_0),
        .S(mul_waiting));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "26" *) 
  RTL_MUX2 mul_waiting_i__1
       (.I0(\<const1> ),
        .I1(\<const0> ),
        .O(mul_waiting__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "199680" *) 
  (* map_to_module = "7" *) 
  RTL_REG_SYNC__BREG_7 mul_waiting_reg
       (.C(clk),
        .CE(mul_waiting_i__0_n_0),
        .D(mul_waiting1_out),
        .Q(mul_waiting),
        .SET(mul_waiting__0));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1194752" *) 
  (* map_to_module = "38" *) 
  RTL_MUX18 pcpi_rd0_i
       (.I0({pcpi_rd1_i_n_0,pcpi_rd1_i_n_1,pcpi_rd1_i_n_2,pcpi_rd1_i_n_3,pcpi_rd1_i_n_4,pcpi_rd1_i_n_5,pcpi_rd1_i_n_6,pcpi_rd1_i_n_7,pcpi_rd1_i_n_8,pcpi_rd1_i_n_9,pcpi_rd1_i_n_10,pcpi_rd1_i_n_11,pcpi_rd1_i_n_12,pcpi_rd1_i_n_13,pcpi_rd1_i_n_14,pcpi_rd1_i_n_15,pcpi_rd1_i_n_16,pcpi_rd1_i_n_17,pcpi_rd1_i_n_18,pcpi_rd1_i_n_19,pcpi_rd1_i_n_20,pcpi_rd1_i_n_21,pcpi_rd1_i_n_22,pcpi_rd1_i_n_23,pcpi_rd1_i_n_24,pcpi_rd1_i_n_25,pcpi_rd1_i_n_26,pcpi_rd1_i_n_27,pcpi_rd1_i_n_28,pcpi_rd1_i_n_29,pcpi_rd1_i_n_30,pcpi_rd1_i_n_31}),
        .I1({rd_reg_n_32,rd_reg_n_33,rd_reg_n_34,rd_reg_n_35,rd_reg_n_36,rd_reg_n_37,rd_reg_n_38,rd_reg_n_39,rd_reg_n_40,rd_reg_n_41,rd_reg_n_42,rd_reg_n_43,rd_reg_n_44,rd_reg_n_45,rd_reg_n_46,rd_reg_n_47,rd_reg_n_48,rd_reg_n_49,rd_reg_n_50,rd_reg_n_51,rd_reg_n_52,rd_reg_n_53,rd_reg_n_54,rd_reg_n_55,rd_reg_n_56,rd_reg_n_57,rd_reg_n_58,rd_reg_n_59,p_1_in}),
        .O(pcpi_rd0),
        .S(instr_any_mulh));
  (* XLNX_LINE_COL = "2033920" *) 
  (* map_to_module = "39" *) 
  RTL_RSHIFT pcpi_rd1_i
       (.I0({rd_reg_n_0,rd_reg_n_1,rd_reg_n_2,rd_reg_n_3,rd_reg_n_4,rd_reg_n_5,rd_reg_n_6,rd_reg_n_7,rd_reg_n_8,rd_reg_n_9,rd_reg_n_10,rd_reg_n_11,rd_reg_n_12,rd_reg_n_13,rd_reg_n_14,rd_reg_n_15,rd_reg_n_16,rd_reg_n_17,rd_reg_n_18,rd_reg_n_19,rd_reg_n_20,rd_reg_n_21,rd_reg_n_22,rd_reg_n_23,rd_reg_n_24,rd_reg_n_25,rd_reg_n_26,rd_reg_n_27,rd_reg_n_28,rd_reg_n_29,rd_reg_n_30,rd_reg_n_31,rd_reg_n_32,rd_reg_n_33,rd_reg_n_34,rd_reg_n_35,rd_reg_n_36,rd_reg_n_37,rd_reg_n_38,rd_reg_n_39,rd_reg_n_40,rd_reg_n_41,rd_reg_n_42,rd_reg_n_43,rd_reg_n_44,rd_reg_n_45,rd_reg_n_46,rd_reg_n_47,rd_reg_n_48,rd_reg_n_49,rd_reg_n_50,rd_reg_n_51,rd_reg_n_52,rd_reg_n_53,rd_reg_n_54,rd_reg_n_55,rd_reg_n_56,rd_reg_n_57,rd_reg_n_58,rd_reg_n_59,p_1_in}),
        .I1({\<const1> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .I2(\<const1> ),
        .O({pcpi_rd1_i_n_0,pcpi_rd1_i_n_1,pcpi_rd1_i_n_2,pcpi_rd1_i_n_3,pcpi_rd1_i_n_4,pcpi_rd1_i_n_5,pcpi_rd1_i_n_6,pcpi_rd1_i_n_7,pcpi_rd1_i_n_8,pcpi_rd1_i_n_9,pcpi_rd1_i_n_10,pcpi_rd1_i_n_11,pcpi_rd1_i_n_12,pcpi_rd1_i_n_13,pcpi_rd1_i_n_14,pcpi_rd1_i_n_15,pcpi_rd1_i_n_16,pcpi_rd1_i_n_17,pcpi_rd1_i_n_18,pcpi_rd1_i_n_19,pcpi_rd1_i_n_20,pcpi_rd1_i_n_21,pcpi_rd1_i_n_22,pcpi_rd1_i_n_23,pcpi_rd1_i_n_24,pcpi_rd1_i_n_25,pcpi_rd1_i_n_26,pcpi_rd1_i_n_27,pcpi_rd1_i_n_28,pcpi_rd1_i_n_29,pcpi_rd1_i_n_30,pcpi_rd1_i_n_31}));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[0] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[0]),
        .Q(pcpi_rd[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[10] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[10]),
        .Q(pcpi_rd[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[11] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[11]),
        .Q(pcpi_rd[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[12] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[12]),
        .Q(pcpi_rd[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[13] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[13]),
        .Q(pcpi_rd[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[14] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[14]),
        .Q(pcpi_rd[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[15] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[15]),
        .Q(pcpi_rd[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[16] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[16]),
        .Q(pcpi_rd[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[17] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[17]),
        .Q(pcpi_rd[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[18] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[18]),
        .Q(pcpi_rd[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[19] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[19]),
        .Q(pcpi_rd[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[1] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[1]),
        .Q(pcpi_rd[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[20] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[20]),
        .Q(pcpi_rd[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[21] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[21]),
        .Q(pcpi_rd[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[22] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[22]),
        .Q(pcpi_rd[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[23] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[23]),
        .Q(pcpi_rd[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[24] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[24]),
        .Q(pcpi_rd[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[25] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[25]),
        .Q(pcpi_rd[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[26] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[26]),
        .Q(pcpi_rd[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[27] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[27]),
        .Q(pcpi_rd[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[28] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[28]),
        .Q(pcpi_rd[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[29] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[29]),
        .Q(pcpi_rd[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[2] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[2]),
        .Q(pcpi_rd[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[30] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[30]),
        .Q(pcpi_rd[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[31] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[31]),
        .Q(pcpi_rd[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[3] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[3]),
        .Q(pcpi_rd[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[4] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[4]),
        .Q(pcpi_rd[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[5] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[5]),
        .Q(pcpi_rd[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[6] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[6]),
        .Q(pcpi_rd[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[7] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[7]),
        .Q(pcpi_rd[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[8] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[8]),
        .Q(pcpi_rd[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198656" *) 
  (* map_to_module = "14" *) 
  RTL_REG__BREG_11 \pcpi_rd_reg[9] 
       (.C(clk),
        .CE(pcpi_wr0),
        .D(pcpi_rd0[9]),
        .Q(pcpi_rd[9]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "2100224" *) 
  (* map_to_module = "5" *) 
  RTL_REG__BREG_5 pcpi_wait_q_reg
       (.C(clk),
        .D(pcpi_wait),
        .Q(pcpi_wait_q));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "1182208" *) 
  (* map_to_module = "4" *) 
  RTL_REG__BREG_5 pcpi_wait_reg
       (.C(clk),
        .D(instr_any_mul),
        .Q(pcpi_wait));
  (* XLNX_LINE_COL = "398592" *) 
  (* map_to_module = "53" *) 
  RTL_AND1 pcpi_wr0_i
       (.I0(mul_finish),
        .I1(resetn),
        .O(pcpi_wr0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "133120" *) 
  (* map_to_module = "13" *) 
  RTL_REG__BREG_5 pcpi_wr_reg
       (.C(clk),
        .D(pcpi_wr0),
        .Q(pcpi_ready));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "58" *) 
  RTL_ADD27 rd0_i
       (.I0(rd1),
        .I1(this_rs2[63:60]),
        .O({next_rdt[63],next_rd[63:60]}));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "68" *) 
  RTL_ADD27 rd10_i
       (.I0(rd11),
        .I1(this_rs2[43:40]),
        .O({next_rdt[43],next_rd[43:40]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "69" *) 
  RTL_ADD28 rd11_i
       (.I0({rd_reg_n_20,rd_reg_n_21,rd_reg_n_22,rd_reg_n_23}),
        .I1(rdx[43:40]),
        .O(rd11));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "70" *) 
  RTL_ADD27 rd12_i
       (.I0(rd13),
        .I1(this_rs2[39:36]),
        .O({next_rdt[39],next_rd[39:36]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "71" *) 
  RTL_ADD28 rd13_i
       (.I0({rd_reg_n_24,rd_reg_n_25,rd_reg_n_26,rd_reg_n_27}),
        .I1(rdx[39:36]),
        .O(rd13));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "72" *) 
  RTL_ADD27 rd14_i
       (.I0(rd15),
        .I1(this_rs2[35:32]),
        .O({next_rdt[35],next_rd[35:32]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "73" *) 
  RTL_ADD28 rd15_i
       (.I0({rd_reg_n_28,rd_reg_n_29,rd_reg_n_30,rd_reg_n_31}),
        .I1(rdx[35:32]),
        .O(rd15));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "74" *) 
  RTL_ADD27 rd16_i
       (.I0(rd17),
        .I1(this_rs2[31:28]),
        .O({next_rdt[31],next_rd[31:28]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "75" *) 
  RTL_ADD28 rd17_i
       (.I0({rd_reg_n_32,rd_reg_n_33,rd_reg_n_34,rd_reg_n_35}),
        .I1(rdx[31:28]),
        .O(rd17));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "76" *) 
  RTL_ADD27 rd18_i
       (.I0(rd19),
        .I1(this_rs2[27:24]),
        .O({next_rdt[27],next_rd[27:24]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "77" *) 
  RTL_ADD28 rd19_i
       (.I0({rd_reg_n_36,rd_reg_n_37,rd_reg_n_38,rd_reg_n_39}),
        .I1(rdx[27:24]),
        .O(rd19));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "59" *) 
  RTL_ADD28 rd1_i
       (.I0({rd_reg_n_0,rd_reg_n_1,rd_reg_n_2,rd_reg_n_3}),
        .I1(rdx[63:60]),
        .O(rd1));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "78" *) 
  RTL_ADD27 rd20_i
       (.I0(rd21),
        .I1(this_rs2[23:20]),
        .O({next_rdt[23],next_rd[23:20]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "79" *) 
  RTL_ADD28 rd21_i
       (.I0({rd_reg_n_40,rd_reg_n_41,rd_reg_n_42,rd_reg_n_43}),
        .I1(rdx[23:20]),
        .O(rd21));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "80" *) 
  RTL_ADD27 rd22_i
       (.I0(rd23),
        .I1(this_rs2[19:16]),
        .O({next_rdt[19],next_rd[19:16]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "81" *) 
  RTL_ADD28 rd23_i
       (.I0({rd_reg_n_44,rd_reg_n_45,rd_reg_n_46,rd_reg_n_47}),
        .I1(rdx[19:16]),
        .O(rd23));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "82" *) 
  RTL_ADD27 rd24_i
       (.I0(rd25),
        .I1(this_rs2[15:12]),
        .O({next_rdt[15],next_rd[15:12]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "83" *) 
  RTL_ADD28 rd25_i
       (.I0({rd_reg_n_48,rd_reg_n_49,rd_reg_n_50,rd_reg_n_51}),
        .I1(rdx[15:12]),
        .O(rd25));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "84" *) 
  RTL_ADD27 rd26_i
       (.I0(rd27),
        .I1(this_rs2[11:8]),
        .O({next_rdt[11],next_rd[11:8]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "85" *) 
  RTL_ADD28 rd27_i
       (.I0({rd_reg_n_52,rd_reg_n_53,rd_reg_n_54,rd_reg_n_55}),
        .I1(rdx[11:8]),
        .O(rd27));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "86" *) 
  RTL_ADD27 rd28_i
       (.I0(rd29),
        .I1(this_rs2[7:4]),
        .O({next_rdt[7],next_rd[7:4]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "87" *) 
  RTL_ADD28 rd29_i
       (.I0({rd_reg_n_56,rd_reg_n_57,rd_reg_n_58,rd_reg_n_59}),
        .I1(rdx[7:4]),
        .O(rd29));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "60" *) 
  RTL_ADD27 rd2_i
       (.I0(rd3),
        .I1(this_rs2[59:56]),
        .O({next_rdt[59],next_rd[59:56]}));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "88" *) 
  RTL_ADD27 rd30_i
       (.I0(rd31),
        .I1(this_rs2[3:0]),
        .O({next_rdt[3],next_rd[3:0]}));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "924416" *) 
  (* map_to_module = "40" *) 
  RTL_MUX9 rd31_i
       (.I0(rs2),
        .I1({\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> ,\<const0> }),
        .O(this_rs2),
        .S(rs1[0]));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "89" *) 
  RTL_ADD28 rd31_i__0
       (.I0(p_1_in),
        .I1(rdx[3:0]),
        .O(rd31));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "61" *) 
  RTL_ADD28 rd3_i
       (.I0({rd_reg_n_4,rd_reg_n_5,rd_reg_n_6,rd_reg_n_7}),
        .I1(rdx[59:56]),
        .O(rd3));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "62" *) 
  RTL_ADD27 rd4_i
       (.I0(rd5),
        .I1(this_rs2[55:52]),
        .O({next_rdt[55],next_rd[55:52]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "63" *) 
  RTL_ADD28 rd5_i
       (.I0({rd_reg_n_8,rd_reg_n_9,rd_reg_n_10,rd_reg_n_11}),
        .I1(rdx[55:52]),
        .O(rd5));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "64" *) 
  RTL_ADD27 rd6_i
       (.I0(rd7),
        .I1(this_rs2[51:48]),
        .O({next_rdt[51],next_rd[51:48]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "65" *) 
  RTL_ADD28 rd7_i
       (.I0({rd_reg_n_12,rd_reg_n_13,rd_reg_n_14,rd_reg_n_15}),
        .I1(rdx[51:48]),
        .O(rd7));
  (* XLNX_LINE_COL = "480256" *) 
  (* map_to_module = "66" *) 
  RTL_ADD27 rd8_i
       (.I0(rd9),
        .I1(this_rs2[47:44]),
        .O({next_rdt[47],next_rd[47:44]}));
  (* XLNX_LINE_COL = "472832" *) 
  (* map_to_module = "67" *) 
  RTL_ADD28 rd9_i
       (.I0({rd_reg_n_16,rd_reg_n_17,rd_reg_n_18,rd_reg_n_19}),
        .I1(rdx[47:44]),
        .O(rd9));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "31" *) 
  RTL_MUX2 rd_i
       (.I0(\<const0> ),
        .I1(mul_waiting),
        .O(rd),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[0] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[0]),
        .Q(p_1_in[0]),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[10] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[10]),
        .Q(rd_reg_n_53),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[11] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[11]),
        .Q(rd_reg_n_52),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[12] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[12]),
        .Q(rd_reg_n_51),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[13] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[13]),
        .Q(rd_reg_n_50),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[14] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[14]),
        .Q(rd_reg_n_49),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[15] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[15]),
        .Q(rd_reg_n_48),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[16] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[16]),
        .Q(rd_reg_n_47),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[17] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[17]),
        .Q(rd_reg_n_46),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[18] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[18]),
        .Q(rd_reg_n_45),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[19] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[19]),
        .Q(rd_reg_n_44),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[1] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[1]),
        .Q(p_1_in[1]),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[20] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[20]),
        .Q(rd_reg_n_43),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[21] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[21]),
        .Q(rd_reg_n_42),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[22] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[22]),
        .Q(rd_reg_n_41),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[23] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[23]),
        .Q(rd_reg_n_40),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[24] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[24]),
        .Q(rd_reg_n_39),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[25] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[25]),
        .Q(rd_reg_n_38),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[26] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[26]),
        .Q(rd_reg_n_37),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[27] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[27]),
        .Q(rd_reg_n_36),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[28] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[28]),
        .Q(rd_reg_n_35),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[29] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[29]),
        .Q(rd_reg_n_34),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[2] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[2]),
        .Q(p_1_in[2]),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[30] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[30]),
        .Q(rd_reg_n_33),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[31] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[31]),
        .Q(rd_reg_n_32),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[32] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[32]),
        .Q(rd_reg_n_31),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[33] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[33]),
        .Q(rd_reg_n_30),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[34] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[34]),
        .Q(rd_reg_n_29),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[35] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[35]),
        .Q(rd_reg_n_28),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[36] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[36]),
        .Q(rd_reg_n_27),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[37] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[37]),
        .Q(rd_reg_n_26),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[38] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[38]),
        .Q(rd_reg_n_25),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[39] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[39]),
        .Q(rd_reg_n_24),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[3] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[3]),
        .Q(p_1_in[3]),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[40] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[40]),
        .Q(rd_reg_n_23),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[41] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[41]),
        .Q(rd_reg_n_22),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[42] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[42]),
        .Q(rd_reg_n_21),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[43] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[43]),
        .Q(rd_reg_n_20),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[44] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[44]),
        .Q(rd_reg_n_19),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[45] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[45]),
        .Q(rd_reg_n_18),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[46] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[46]),
        .Q(rd_reg_n_17),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[47] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[47]),
        .Q(rd_reg_n_16),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[48] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[48]),
        .Q(rd_reg_n_15),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[49] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[49]),
        .Q(rd_reg_n_14),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[4] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[4]),
        .Q(rd_reg_n_59),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[50] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[50]),
        .Q(rd_reg_n_13),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[51] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[51]),
        .Q(rd_reg_n_12),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[52] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[52]),
        .Q(rd_reg_n_11),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[53] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[53]),
        .Q(rd_reg_n_10),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[54] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[54]),
        .Q(rd_reg_n_9),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[55] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[55]),
        .Q(rd_reg_n_8),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[56] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[56]),
        .Q(rd_reg_n_7),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[57] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[57]),
        .Q(rd_reg_n_6),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[58] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[58]),
        .Q(rd_reg_n_5),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[59] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[59]),
        .Q(rd_reg_n_4),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[5] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[5]),
        .Q(rd_reg_n_58),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[60] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[60]),
        .Q(rd_reg_n_3),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[61] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[61]),
        .Q(rd_reg_n_2),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[62] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[62]),
        .Q(rd_reg_n_1),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[63] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[63]),
        .Q(rd_reg_n_0),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[6] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[6]),
        .Q(rd_reg_n_57),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[7] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[7]),
        .Q(rd_reg_n_56),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[8] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[8]),
        .Q(rd_reg_n_55),
        .RST(rd));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197376" *) 
  (* map_to_module = "10" *) 
  RTL_REG_SYNC__BREG_13 \rd_reg[9] 
       (.C(clk),
        .CE(resetn),
        .D(next_rd[9]),
        .Q(rd_reg_n_54),
        .RST(rd));
  (* XLNX_LINE_COL = "986624" *) 
  (* map_to_module = "56" *) 
  RTL_LSHIFT rdx0_i
       (.I0({next_rdt[63],\<const0> ,\<const0> ,\<const0> ,next_rdt[59],\<const0> ,\<const0> ,\<const0> ,next_rdt[55],\<const0> ,\<const0> ,\<const0> ,next_rdt[51],\<const0> ,\<const0> ,\<const0> ,next_rdt[47],\<const0> ,\<const0> ,\<const0> ,next_rdt[43],\<const0> ,\<const0> ,\<const0> ,next_rdt[39],\<const0> ,\<const0> ,\<const0> ,next_rdt[35],\<const0> ,\<const0> ,\<const0> ,next_rdt[31],\<const0> ,\<const0> ,\<const0> ,next_rdt[27],\<const0> ,\<const0> ,\<const0> ,next_rdt[23],\<const0> ,\<const0> ,\<const0> ,next_rdt[19],\<const0> ,\<const0> ,\<const0> ,next_rdt[15],\<const0> ,\<const0> ,\<const0> ,next_rdt[11],\<const0> ,\<const0> ,\<const0> ,next_rdt[7],\<const0> ,\<const0> ,\<const0> ,next_rdt[3],\<const0> ,\<const0> ,\<const0> }),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O(next_rdx));
  (* SEL_VAL = "I0:S=1'b0,I1:S=default" *) 
  (* XLNX_LINE_COL = "132125" *) 
  (* map_to_module = "32" *) 
  RTL_MUX2 rdx_i
       (.I0(\<const0> ),
        .I1(mul_waiting),
        .O(rdx__0),
        .S(resetn));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[0] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[0]),
        .Q(rdx[0]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[10] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[10]),
        .Q(rdx[10]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[11] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[11]),
        .Q(rdx[11]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[12] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[12]),
        .Q(rdx[12]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[13] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[13]),
        .Q(rdx[13]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[14] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[14]),
        .Q(rdx[14]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[15] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[15]),
        .Q(rdx[15]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[16] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[16]),
        .Q(rdx[16]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[17] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[17]),
        .Q(rdx[17]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[18] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[18]),
        .Q(rdx[18]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[19] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[19]),
        .Q(rdx[19]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[1] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[1]),
        .Q(rdx[1]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[20] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[20]),
        .Q(rdx[20]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[21] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[21]),
        .Q(rdx[21]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[22] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[22]),
        .Q(rdx[22]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[23] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[23]),
        .Q(rdx[23]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[24] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[24]),
        .Q(rdx[24]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[25] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[25]),
        .Q(rdx[25]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[26] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[26]),
        .Q(rdx[26]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[27] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[27]),
        .Q(rdx[27]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[28] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[28]),
        .Q(rdx[28]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[29] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[29]),
        .Q(rdx[29]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[2] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[2]),
        .Q(rdx[2]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[30] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[30]),
        .Q(rdx[30]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[31] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[31]),
        .Q(rdx[31]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[32] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[32]),
        .Q(rdx[32]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[33] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[33]),
        .Q(rdx[33]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[34] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[34]),
        .Q(rdx[34]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[35] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[35]),
        .Q(rdx[35]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[36] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[36]),
        .Q(rdx[36]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[37] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[37]),
        .Q(rdx[37]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[38] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[38]),
        .Q(rdx[38]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[39] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[39]),
        .Q(rdx[39]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[3] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[3]),
        .Q(rdx[3]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[40] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[40]),
        .Q(rdx[40]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[41] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[41]),
        .Q(rdx[41]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[42] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[42]),
        .Q(rdx[42]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[43] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[43]),
        .Q(rdx[43]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[44] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[44]),
        .Q(rdx[44]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[45] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[45]),
        .Q(rdx[45]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[46] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[46]),
        .Q(rdx[46]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[47] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[47]),
        .Q(rdx[47]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[48] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[48]),
        .Q(rdx[48]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[49] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[49]),
        .Q(rdx[49]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[4] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[4]),
        .Q(rdx[4]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[50] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[50]),
        .Q(rdx[50]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[51] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[51]),
        .Q(rdx[51]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[52] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[52]),
        .Q(rdx[52]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[53] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[53]),
        .Q(rdx[53]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[54] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[54]),
        .Q(rdx[54]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[55] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[55]),
        .Q(rdx[55]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[56] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[56]),
        .Q(rdx[56]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[57] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[57]),
        .Q(rdx[57]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[58] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[58]),
        .Q(rdx[58]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[59] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[59]),
        .Q(rdx[59]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[5] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[5]),
        .Q(rdx[5]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[60] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[60]),
        .Q(rdx[60]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[61] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[61]),
        .Q(rdx[61]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[62] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[62]),
        .Q(rdx[62]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[63] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[63]),
        .Q(rdx[63]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[6] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[6]),
        .Q(rdx[6]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[7] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[7]),
        .Q(rdx[7]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[8] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[8]),
        .Q(rdx[8]),
        .RST(rdx__0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "197632" *) 
  (* map_to_module = "11" *) 
  RTL_REG_SYNC__BREG_13 \rdx_reg[9] 
       (.C(clk),
        .CE(resetn),
        .D(next_rdx[9]),
        .Q(rdx[9]),
        .RST(rdx__0));
  (* XLNX_LINE_COL = "921088" *) 
  (* map_to_module = "54" *) 
  RTL_RSHIFT0 rs10_i
       (.I0(rs1),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O(next_rs1));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "204035" *) 
  (* map_to_module = "28" *) 
  RTL_MUX10 rs1_i
       (.I0({pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1[31],pcpi_rs1}),
        .I1(pcpi_rs1),
        .O({rs1_i_n_0,rs1_i_n_1,rs1_i_n_2,rs1_i_n_3,rs1_i_n_4,rs1_i_n_5,rs1_i_n_6,rs1_i_n_7,rs1_i_n_8,rs1_i_n_9,rs1_i_n_10,rs1_i_n_11,rs1_i_n_12,rs1_i_n_13,rs1_i_n_14,rs1_i_n_15,rs1_i_n_16,rs1_i_n_17,rs1_i_n_18,rs1_i_n_19,rs1_i_n_20,rs1_i_n_21,rs1_i_n_22,rs1_i_n_23,rs1_i_n_24,rs1_i_n_25,rs1_i_n_26,rs1_i_n_27,rs1_i_n_28,rs1_i_n_29,rs1_i_n_30,rs1_i_n_31,rs1_i_n_32,rs1_i_n_33,rs1_i_n_34,rs1_i_n_35,rs1_i_n_36,rs1_i_n_37,rs1_i_n_38,rs1_i_n_39,rs1_i_n_40,rs1_i_n_41,rs1_i_n_42,rs1_i_n_43,rs1_i_n_44,rs1_i_n_45,rs1_i_n_46,rs1_i_n_47,rs1_i_n_48,rs1_i_n_49,rs1_i_n_50,rs1_i_n_51,rs1_i_n_52,rs1_i_n_53,rs1_i_n_54,rs1_i_n_55,rs1_i_n_56,rs1_i_n_57,rs1_i_n_58,rs1_i_n_59,rs1_i_n_60,rs1_i_n_61,rs1_i_n_62,rs1_i_n_63}),
        .S(instr_rs1_signed));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "27" *) 
  RTL_MUX9 rs1_i__0
       (.I0({rs1_i_n_0,rs1_i_n_1,rs1_i_n_2,rs1_i_n_3,rs1_i_n_4,rs1_i_n_5,rs1_i_n_6,rs1_i_n_7,rs1_i_n_8,rs1_i_n_9,rs1_i_n_10,rs1_i_n_11,rs1_i_n_12,rs1_i_n_13,rs1_i_n_14,rs1_i_n_15,rs1_i_n_16,rs1_i_n_17,rs1_i_n_18,rs1_i_n_19,rs1_i_n_20,rs1_i_n_21,rs1_i_n_22,rs1_i_n_23,rs1_i_n_24,rs1_i_n_25,rs1_i_n_26,rs1_i_n_27,rs1_i_n_28,rs1_i_n_29,rs1_i_n_30,rs1_i_n_31,rs1_i_n_32,rs1_i_n_33,rs1_i_n_34,rs1_i_n_35,rs1_i_n_36,rs1_i_n_37,rs1_i_n_38,rs1_i_n_39,rs1_i_n_40,rs1_i_n_41,rs1_i_n_42,rs1_i_n_43,rs1_i_n_44,rs1_i_n_45,rs1_i_n_46,rs1_i_n_47,rs1_i_n_48,rs1_i_n_49,rs1_i_n_50,rs1_i_n_51,rs1_i_n_52,rs1_i_n_53,rs1_i_n_54,rs1_i_n_55,rs1_i_n_56,rs1_i_n_57,rs1_i_n_58,rs1_i_n_59,rs1_i_n_60,rs1_i_n_61,rs1_i_n_62,rs1_i_n_63}),
        .I1(next_rs1),
        .O(rs1__0),
        .S(mul_waiting));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[0] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[0]),
        .Q(rs1[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[10] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[10]),
        .Q(rs1[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[11] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[11]),
        .Q(rs1[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[12] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[12]),
        .Q(rs1[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[13] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[13]),
        .Q(rs1[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[14] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[14]),
        .Q(rs1[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[15] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[15]),
        .Q(rs1[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[16] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[16]),
        .Q(rs1[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[17] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[17]),
        .Q(rs1[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[18] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[18]),
        .Q(rs1[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[19] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[19]),
        .Q(rs1[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[1] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[1]),
        .Q(rs1[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[20] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[20]),
        .Q(rs1[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[21] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[21]),
        .Q(rs1[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[22] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[22]),
        .Q(rs1[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[23] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[23]),
        .Q(rs1[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[24] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[24]),
        .Q(rs1[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[25] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[25]),
        .Q(rs1[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[26] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[26]),
        .Q(rs1[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[27] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[27]),
        .Q(rs1[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[28] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[28]),
        .Q(rs1[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[29] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[29]),
        .Q(rs1[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[2] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[2]),
        .Q(rs1[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[30] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[30]),
        .Q(rs1[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[31] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[31]),
        .Q(rs1[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[32] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[32]),
        .Q(rs1[32]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[33] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[33]),
        .Q(rs1[33]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[34] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[34]),
        .Q(rs1[34]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[35] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[35]),
        .Q(rs1[35]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[36] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[36]),
        .Q(rs1[36]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[37] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[37]),
        .Q(rs1[37]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[38] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[38]),
        .Q(rs1[38]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[39] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[39]),
        .Q(rs1[39]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[3] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[3]),
        .Q(rs1[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[40] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[40]),
        .Q(rs1[40]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[41] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[41]),
        .Q(rs1[41]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[42] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[42]),
        .Q(rs1[42]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[43] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[43]),
        .Q(rs1[43]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[44] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[44]),
        .Q(rs1[44]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[45] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[45]),
        .Q(rs1[45]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[46] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[46]),
        .Q(rs1[46]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[47] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[47]),
        .Q(rs1[47]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[48] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[48]),
        .Q(rs1[48]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[49] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[49]),
        .Q(rs1[49]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[4] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[4]),
        .Q(rs1[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[50] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[50]),
        .Q(rs1[50]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[51] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[51]),
        .Q(rs1[51]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[52] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[52]),
        .Q(rs1[52]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[53] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[53]),
        .Q(rs1[53]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[54] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[54]),
        .Q(rs1[54]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[55] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[55]),
        .Q(rs1[55]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[56] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[56]),
        .Q(rs1[56]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[57] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[57]),
        .Q(rs1[57]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[58] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[58]),
        .Q(rs1[58]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[59] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[59]),
        .Q(rs1[59]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[5] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[5]),
        .Q(rs1[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[60] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[60]),
        .Q(rs1[60]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[61] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[61]),
        .Q(rs1[61]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[62] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[62]),
        .Q(rs1[62]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[63] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[63]),
        .Q(rs1[63]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[6] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[6]),
        .Q(rs1[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[7] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[7]),
        .Q(rs1[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[8] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[8]),
        .Q(rs1[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "8" *) 
  RTL_REG__BREG_11 \rs1_reg[9] 
       (.C(clk),
        .CE(resetn),
        .D(rs1__0[9]),
        .Q(rs1[9]));
  (* XLNX_LINE_COL = "921088" *) 
  (* map_to_module = "55" *) 
  RTL_LSHIFT rs20_i
       (.I0(rs2),
        .I1(\<const1> ),
        .I2(\<const1> ),
        .O(next_rs2));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "204035" *) 
  (* map_to_module = "30" *) 
  RTL_MUX10 rs2_i
       (.I0({pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2[31],pcpi_rs2}),
        .I1(pcpi_rs2),
        .O({rs2_i_n_0,rs2_i_n_1,rs2_i_n_2,rs2_i_n_3,rs2_i_n_4,rs2_i_n_5,rs2_i_n_6,rs2_i_n_7,rs2_i_n_8,rs2_i_n_9,rs2_i_n_10,rs2_i_n_11,rs2_i_n_12,rs2_i_n_13,rs2_i_n_14,rs2_i_n_15,rs2_i_n_16,rs2_i_n_17,rs2_i_n_18,rs2_i_n_19,rs2_i_n_20,rs2_i_n_21,rs2_i_n_22,rs2_i_n_23,rs2_i_n_24,rs2_i_n_25,rs2_i_n_26,rs2_i_n_27,rs2_i_n_28,rs2_i_n_29,rs2_i_n_30,rs2_i_n_31,rs2_i_n_32,rs2_i_n_33,rs2_i_n_34,rs2_i_n_35,rs2_i_n_36,rs2_i_n_37,rs2_i_n_38,rs2_i_n_39,rs2_i_n_40,rs2_i_n_41,rs2_i_n_42,rs2_i_n_43,rs2_i_n_44,rs2_i_n_45,rs2_i_n_46,rs2_i_n_47,rs2_i_n_48,rs2_i_n_49,rs2_i_n_50,rs2_i_n_51,rs2_i_n_52,rs2_i_n_53,rs2_i_n_54,rs2_i_n_55,rs2_i_n_56,rs2_i_n_57,rs2_i_n_58,rs2_i_n_59,rs2_i_n_60,rs2_i_n_61,rs2_i_n_62,rs2_i_n_63}),
        .S(instr_rs2_signed));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "132122" *) 
  (* map_to_module = "29" *) 
  RTL_MUX9 rs2_i__0
       (.I0({rs2_i_n_0,rs2_i_n_1,rs2_i_n_2,rs2_i_n_3,rs2_i_n_4,rs2_i_n_5,rs2_i_n_6,rs2_i_n_7,rs2_i_n_8,rs2_i_n_9,rs2_i_n_10,rs2_i_n_11,rs2_i_n_12,rs2_i_n_13,rs2_i_n_14,rs2_i_n_15,rs2_i_n_16,rs2_i_n_17,rs2_i_n_18,rs2_i_n_19,rs2_i_n_20,rs2_i_n_21,rs2_i_n_22,rs2_i_n_23,rs2_i_n_24,rs2_i_n_25,rs2_i_n_26,rs2_i_n_27,rs2_i_n_28,rs2_i_n_29,rs2_i_n_30,rs2_i_n_31,rs2_i_n_32,rs2_i_n_33,rs2_i_n_34,rs2_i_n_35,rs2_i_n_36,rs2_i_n_37,rs2_i_n_38,rs2_i_n_39,rs2_i_n_40,rs2_i_n_41,rs2_i_n_42,rs2_i_n_43,rs2_i_n_44,rs2_i_n_45,rs2_i_n_46,rs2_i_n_47,rs2_i_n_48,rs2_i_n_49,rs2_i_n_50,rs2_i_n_51,rs2_i_n_52,rs2_i_n_53,rs2_i_n_54,rs2_i_n_55,rs2_i_n_56,rs2_i_n_57,rs2_i_n_58,rs2_i_n_59,rs2_i_n_60,rs2_i_n_61,rs2_i_n_62,rs2_i_n_63}),
        .I1(next_rs2),
        .O(rs2__0),
        .S(mul_waiting));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[0] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[0]),
        .Q(rs2[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[10] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[10]),
        .Q(rs2[10]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[11] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[11]),
        .Q(rs2[11]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[12] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[12]),
        .Q(rs2[12]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[13] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[13]),
        .Q(rs2[13]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[14] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[14]),
        .Q(rs2[14]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[15] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[15]),
        .Q(rs2[15]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[16] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[16]),
        .Q(rs2[16]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[17] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[17]),
        .Q(rs2[17]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[18] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[18]),
        .Q(rs2[18]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[19] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[19]),
        .Q(rs2[19]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[1] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[1]),
        .Q(rs2[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[20] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[20]),
        .Q(rs2[20]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[21] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[21]),
        .Q(rs2[21]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[22] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[22]),
        .Q(rs2[22]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[23] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[23]),
        .Q(rs2[23]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[24] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[24]),
        .Q(rs2[24]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[25] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[25]),
        .Q(rs2[25]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[26] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[26]),
        .Q(rs2[26]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[27] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[27]),
        .Q(rs2[27]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[28] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[28]),
        .Q(rs2[28]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[29] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[29]),
        .Q(rs2[29]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[2] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[2]),
        .Q(rs2[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[30] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[30]),
        .Q(rs2[30]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[31] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[31]),
        .Q(rs2[31]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[32] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[32]),
        .Q(rs2[32]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[33] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[33]),
        .Q(rs2[33]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[34] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[34]),
        .Q(rs2[34]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[35] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[35]),
        .Q(rs2[35]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[36] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[36]),
        .Q(rs2[36]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[37] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[37]),
        .Q(rs2[37]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[38] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[38]),
        .Q(rs2[38]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[39] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[39]),
        .Q(rs2[39]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[3] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[3]),
        .Q(rs2[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[40] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[40]),
        .Q(rs2[40]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[41] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[41]),
        .Q(rs2[41]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[42] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[42]),
        .Q(rs2[42]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[43] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[43]),
        .Q(rs2[43]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[44] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[44]),
        .Q(rs2[44]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[45] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[45]),
        .Q(rs2[45]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[46] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[46]),
        .Q(rs2[46]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[47] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[47]),
        .Q(rs2[47]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[48] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[48]),
        .Q(rs2[48]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[49] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[49]),
        .Q(rs2[49]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[4] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[4]),
        .Q(rs2[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[50] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[50]),
        .Q(rs2[50]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[51] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[51]),
        .Q(rs2[51]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[52] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[52]),
        .Q(rs2[52]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[53] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[53]),
        .Q(rs2[53]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[54] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[54]),
        .Q(rs2[54]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[55] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[55]),
        .Q(rs2[55]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[56] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[56]),
        .Q(rs2[56]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[57] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[57]),
        .Q(rs2[57]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[58] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[58]),
        .Q(rs2[58]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[59] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[59]),
        .Q(rs2[59]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[5] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[5]),
        .Q(rs2[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[60] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[60]),
        .Q(rs2[60]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[61] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[61]),
        .Q(rs2[61]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[62] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[62]),
        .Q(rs2[62]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[63] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[63]),
        .Q(rs2[63]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[6] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[6]),
        .Q(rs2[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[7] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[7]),
        .Q(rs2[7]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[8] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[8]),
        .Q(rs2[8]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "263168" *) 
  (* map_to_module = "9" *) 
  RTL_REG__BREG_11 \rs2_reg[9] 
       (.C(clk),
        .CE(resetn),
        .D(rs2__0[9]),
        .Q(rs2[9]));
endmodule
