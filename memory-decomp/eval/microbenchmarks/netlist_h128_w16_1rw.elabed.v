// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:03 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/netlist_h128_w16_1rw.elabed.v
// Design      : toplevel
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* XLNX_LINE_COL = "2596" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module toplevel
   (clk,
    openram_h128_w16_1rw_raddr,
    openram_h128_w16_1rw_ren,
    openram_h128_w16_1rw_waddr,
    openram_h128_w16_1rw_wdata,
    openram_h128_w16_1rw_wen,
    openram_h128_w16_1rw_rdata);
  input clk;
  input [6:0]openram_h128_w16_1rw_raddr;
  input openram_h128_w16_1rw_ren;
  input [6:0]openram_h128_w16_1rw_waddr;
  input [15:0]openram_h128_w16_1rw_wdata;
  input openram_h128_w16_1rw_wen;
  output [15:0]openram_h128_w16_1rw_rdata;

  wire clk;
  wire [6:0]openram_h128_w16_1rw_raddr;
  wire [15:0]openram_h128_w16_1rw_rdata;
  wire openram_h128_w16_1rw_ren;
  wire [6:0]openram_h128_w16_1rw_waddr;
  wire [15:0]openram_h128_w16_1rw_wdata;
  wire openram_h128_w16_1rw_wen;
  wire [6:0]tmp33;

  (* XLNX_LINE_COL = "795392" *) 
  (* map_to_module = "0" *) 
  RTL_RAM mem_11_reg
       (.RA2(tmp33),
        .RO2(openram_h128_w16_1rw_rdata),
        .WA1(openram_h128_w16_1rw_waddr),
        .WCLK(clk),
        .WD1(openram_h128_w16_1rw_wdata),
        .WE1(openram_h128_w16_1rw_wen));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[0] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[0]),
        .Q(tmp33[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[1] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[1]),
        .Q(tmp33[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[2] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[2]),
        .Q(tmp33[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[3] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[3]),
        .Q(tmp33[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[4] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[4]),
        .Q(tmp33[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[5] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[5]),
        .Q(tmp33[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "4916736" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp33_reg[6] 
       (.C(clk),
        .CE(openram_h128_w16_1rw_ren),
        .D(openram_h128_w16_1rw_raddr[6]),
        .Q(tmp33[6]));
endmodule
