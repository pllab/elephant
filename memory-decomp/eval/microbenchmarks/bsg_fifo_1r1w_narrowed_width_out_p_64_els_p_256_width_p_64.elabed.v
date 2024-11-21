// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:03 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/bsg_fifo_1r1w_narrowed_width_out_p_64_els_p_256_width_p_64.elabed.v
// Design      : bsg_fifo_1r1w_narrowed
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* XLNX_LINE_COL = "2644" *) 
module bsg_channel_narrow_width_in_p64_width_out_p64_lsb_to_msb_p1
   (clk_i,
    reset_i,
    data_i,
    deque_o,
    data_o,
    deque_i);
  input clk_i;
  input reset_i;
  input [63:0]data_i;
  output deque_o;
  output [63:0]data_o;
  input deque_i;

  wire [63:0]data_i;
  wire deque_i;

  assign data_o[63:0] = data_i;
  assign deque_o = deque_i;
endmodule

(* XLNX_LINE_COL = "2612" *) (* max_add_p = "1" *) (* ptr_width_lp = "8" *) 
(* slots_p = "256" *) 
module bsg_circular_ptr
   (clk,
    reset_i,
    add_i,
    o,
    n_o);
  input clk;
  input reset_i;
  input [0:0]add_i;
  output [7:0]o;
  output [7:0]n_o;

  wire \<const1> ;
  wire [0:0]add_i;
  wire clk;
  wire [7:0]n_o;
  wire [7:0]o;
  wire [7:0]ptr_r_p1;
  wire reset_i;

  VCC VCC
       (.P(\<const1> ));
  (* SEL_VAL = "I0:S=1'b1,I1:S=default" *) 
  (* XLNX_LINE_COL = "1186560" *) 
  (* map_to_module = "1" *) 
  RTL_MUX ptr_n_i
       (.I0(ptr_r_p1),
        .I1(o),
        .O(n_o),
        .S(add_i));
  (* XLNX_LINE_COL = "2624768" *) 
  (* map_to_module = "2" *) 
  RTL_ADD ptr_r_p1_i
       (.I0(o),
        .I1(\<const1> ),
        .O(ptr_r_p1));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[0] 
       (.C(clk),
        .D(n_o[0]),
        .Q(o[0]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[1] 
       (.C(clk),
        .D(n_o[1]),
        .Q(o[1]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[2] 
       (.C(clk),
        .D(n_o[2]),
        .Q(o[2]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[3] 
       (.C(clk),
        .D(n_o[3]),
        .Q(o[3]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[4] 
       (.C(clk),
        .D(n_o[4]),
        .Q(o[4]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[5] 
       (.C(clk),
        .D(n_o[5]),
        .Q(o[5]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[6] 
       (.C(clk),
        .D(n_o[6]),
        .Q(o[6]),
        .RST(reset_i));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[7] 
       (.C(clk),
        .D(n_o[7]),
        .Q(o[7]),
        .RST(reset_i));
endmodule

(* XLNX_LINE_COL = "2609" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module bsg_fifo_1r1w_narrowed
   (clk_i,
    reset_i,
    data_i,
    v_i,
    ready_o,
    v_o,
    data_o,
    yumi_i);
  input clk_i;
  input reset_i;
  input [63:0]data_i;
  input v_i;
  output ready_o;
  output v_o;
  output [63:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [63:0]data;
  wire [63:0]data_i;
  wire [63:0]data_o;
  wire ready_o;
  wire reset_i;
  wire v_i;
  wire v_o;
  wire yumi;
  wire yumi_i;

  (* XLNX_LINE_COL = "133632" *) 
  (* els_p = "256" *) 
  (* harden_p = "0" *) 
  (* ready_THEN_valid_p = "0" *) 
  (* width_p = "64" *) 
  bsg_fifo_1r1w_small main_fifo
       (.clk_i(clk_i),
        .data_i(data_i),
        .data_o(data),
        .ready_o(ready_o),
        .reset_i(reset_i),
        .v_i(v_i),
        .v_o(v_o),
        .yumi_i(yumi));
  (* XLNX_LINE_COL = "135168" *) 
  bsg_channel_narrow_width_in_p64_width_out_p64_lsb_to_msb_p1 output_narrower
       (.clk_i(clk_i),
        .data_i(data),
        .data_o(data_o),
        .deque_i(yumi_i),
        .deque_o(yumi),
        .reset_i(reset_i));
endmodule

(* XLNX_LINE_COL = "2633" *) (* els_p = "256" *) (* harden_p = "0" *) 
(* ready_THEN_valid_p = "0" *) (* width_p = "64" *) 
module bsg_fifo_1r1w_small
   (clk_i,
    reset_i,
    v_i,
    ready_o,
    data_i,
    v_o,
    data_o,
    yumi_i);
  input clk_i;
  input reset_i;
  input v_i;
  output ready_o;
  input [63:0]data_i;
  output v_o;
  output [63:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [63:0]data_i;
  wire [63:0]data_o;
  wire ready_o;
  wire reset_i;
  wire v_i;
  wire v_o;
  wire yumi_i;

  (* XLNX_LINE_COL = "394496" *) 
  (* els_p = "256" *) 
  (* ptr_width_lp = "8" *) 
  (* ready_THEN_valid_p = "0" *) 
  (* width_p = "64" *) 
  bsg_fifo_1r1w_small_unhardened \unhardened.un.fifo 
       (.clk_i(clk_i),
        .data_i(data_i),
        .data_o(data_o),
        .ready_o(ready_o),
        .reset_i(reset_i),
        .v_i(v_i),
        .v_o(v_o),
        .yumi_i(yumi_i));
endmodule

(* XLNX_LINE_COL = "2627" *) (* els_p = "256" *) (* ptr_width_lp = "8" *) 
(* ready_THEN_valid_p = "0" *) (* width_p = "64" *) 
module bsg_fifo_1r1w_small_unhardened
   (clk_i,
    reset_i,
    v_i,
    ready_o,
    data_i,
    v_o,
    data_o,
    yumi_i);
  input clk_i;
  input reset_i;
  input v_i;
  output ready_o;
  input [63:0]data_i;
  output v_o;
  output [63:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [63:0]data_i;
  wire [63:0]data_o;
  wire empty;
  wire enque;
  wire full;
  wire ready_o;
  wire reset_i;
  wire [7:0]rptr_r;
  wire v_i;
  wire v_o;
  wire [7:0]wptr_r;
  wire yumi_i;

  (* XLNX_LINE_COL = "1183488" *) 
  (* map_to_module = "11" *) 
  RTL_AND enque_i
       (.I0(v_i),
        .I1(ready_o),
        .O(enque));
  (* XLNX_LINE_COL = "2294528" *) 
  (* els_p = "256" *) 
  (* ptr_width_lp = "8" *) 
  bsg_fifo_tracker ft
       (.clk_i(clk_i),
        .deq_i(yumi_i),
        .empty_o(empty),
        .enq_i(enque),
        .full_o(full),
        .reset_i(reset_i),
        .rptr_r_o(rptr_r),
        .wptr_r_o(wptr_r));
  (* XLNX_LINE_COL = "198912" *) 
  (* addr_width_lp = "8" *) 
  (* els_p = "256" *) 
  (* harden_p = "0" *) 
  (* read_write_same_addr_p = "0" *) 
  (* width_p = "64" *) 
  bsg_mem_1r1w mem_1r1w
       (.r_addr_i(rptr_r),
        .r_data_o(data_o),
        .r_v_i(v_o),
        .w_addr_i(wptr_r),
        .w_clk_i(clk_i),
        .w_data_i(data_i),
        .w_reset_i(reset_i),
        .w_v_i(enque));
  (* XLNX_LINE_COL = "1246720" *) 
  (* map_to_module = "10" *) 
  RTL_INV ready_lo_i
       (.I0(full),
        .O(ready_o));
  (* XLNX_LINE_COL = "1181440" *) 
  (* map_to_module = "12" *) 
  RTL_INV v_o_tmp_i
       (.I0(empty),
        .O(v_o));
endmodule

(* XLNX_LINE_COL = "2627" *) (* els_p = "256" *) (* ptr_width_lp = "8" *) 
module bsg_fifo_tracker
   (clk_i,
    reset_i,
    enq_i,
    deq_i,
    wptr_r_o,
    rptr_r_o,
    rptr_n_o,
    full_o,
    empty_o);
  input clk_i;
  input reset_i;
  input enq_i;
  input deq_i;
  output [7:0]wptr_r_o;
  output [7:0]rptr_r_o;
  output [7:0]rptr_n_o;
  output full_o;
  output empty_o;

  wire clk_i;
  wire deq_i;
  wire deq_r;
  wire empty_o;
  wire enq_i;
  wire enq_r;
  wire enq_r0;
  wire equal_ptrs;
  wire full_o;
  wire reset_i;
  wire [7:0]rptr_n_o;
  wire [7:0]rptr_r_o;
  wire [7:0]wptr_r_o;

  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198144" *) 
  (* map_to_module = "4" *) 
  RTL_REG_SYNC__BREG_4 deq_r_reg
       (.C(clk_i),
        .CE(enq_r0),
        .D(deq_i),
        .Q(deq_r),
        .SET(reset_i));
  (* XLNX_LINE_COL = "1053440" *) 
  (* map_to_module = "6" *) 
  RTL_AND empty_i
       (.I0(equal_ptrs),
        .I1(deq_r),
        .O(empty_o));
  (* XLNX_LINE_COL = "724480" *) 
  (* map_to_module = "7" *) 
  RTL_OR enq_r0_i
       (.I0(enq_i),
        .I1(deq_i),
        .O(enq_r0));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "198144" *) 
  (* map_to_module = "3" *) 
  RTL_REG_SYNC__BREG_3 enq_r_reg
       (.C(clk_i),
        .CE(enq_r0),
        .D(enq_i),
        .Q(enq_r),
        .RST(reset_i));
  (* XLNX_LINE_COL = "1380608" *) 
  (* map_to_module = "8" *) 
  RTL_EQ equal_ptrs_i
       (.I0(rptr_r_o),
        .I1(wptr_r_o),
        .O(equal_ptrs));
  (* XLNX_LINE_COL = "987904" *) 
  (* map_to_module = "5" *) 
  RTL_AND full_i
       (.I0(equal_ptrs),
        .I1(enq_r),
        .O(full_o));
  (* XLNX_LINE_COL = "197888" *) 
  (* max_add_p = "1" *) 
  (* ptr_width_lp = "8" *) 
  (* slots_p = "256" *) 
  bsg_circular_ptr rptr
       (.add_i(deq_i),
        .clk(clk_i),
        .n_o(rptr_n_o),
        .o(rptr_r_o),
        .reset_i(reset_i));
  (* XLNX_LINE_COL = "197888" *) 
  (* max_add_p = "1" *) 
  (* ptr_width_lp = "8" *) 
  (* slots_p = "256" *) 
  bsg_circular_ptr wptr
       (.add_i(enq_i),
        .clk(clk_i),
        .o(wptr_r_o),
        .reset_i(reset_i));
endmodule

(* XLNX_LINE_COL = "2601" *) (* addr_width_lp = "8" *) (* els_p = "256" *) 
(* harden_p = "0" *) (* read_write_same_addr_p = "0" *) (* width_p = "64" *) 
module bsg_mem_1r1w
   (w_clk_i,
    w_reset_i,
    w_v_i,
    w_addr_i,
    w_data_i,
    r_v_i,
    r_addr_i,
    r_data_o);
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input [7:0]w_addr_i;
  input [63:0]w_data_i;
  input r_v_i;
  input [7:0]r_addr_i;
  output [63:0]r_data_o;

  wire [7:0]r_addr_i;
  wire [63:0]r_data_o;
  wire r_v_i;
  wire [7:0]w_addr_i;
  wire w_clk_i;
  wire [63:0]w_data_i;
  wire w_reset_i;
  wire w_v_i;

  (* XLNX_LINE_COL = "198144" *) 
  (* addr_width_lp = "8" *) 
  (* els_p = "256" *) 
  (* harden_p = "0" *) 
  (* read_write_same_addr_p = "0" *) 
  (* width_p = "64" *) 
  bsg_mem_1r1w_synth synth
       (.r_addr_i(r_addr_i),
        .r_data_o(r_data_o),
        .r_v_i(r_v_i),
        .w_addr_i(w_addr_i),
        .w_clk_i(w_clk_i),
        .w_data_i(w_data_i),
        .w_reset_i(w_reset_i),
        .w_v_i(w_v_i));
endmodule

(* XLNX_LINE_COL = "2590" *) (* addr_width_lp = "8" *) (* els_p = "256" *) 
(* harden_p = "0" *) (* read_write_same_addr_p = "0" *) (* width_p = "64" *) 
module bsg_mem_1r1w_synth
   (w_clk_i,
    w_reset_i,
    w_v_i,
    w_addr_i,
    w_data_i,
    r_v_i,
    r_addr_i,
    r_data_o);
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input [7:0]w_addr_i;
  input [63:0]w_data_i;
  input r_v_i;
  input [7:0]r_addr_i;
  output [63:0]r_data_o;

  wire [7:0]r_addr_i;
  wire [63:0]r_data_o;
  wire [7:0]w_addr_i;
  wire w_clk_i;
  wire [63:0]w_data_i;
  wire w_v_i;

  (* XLNX_LINE_COL = "1248768" *) 
  (* map_to_module = "9" *) 
  RTL_RAM mem_reg
       (.RA2(r_addr_i),
        .RO2(r_data_o),
        .WA1(w_addr_i),
        .WCLK(w_clk_i),
        .WD1(w_data_i),
        .WE1(w_v_i));
endmodule
