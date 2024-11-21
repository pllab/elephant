// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:03 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/netlist_h128_w16_1r1w.elabed.v
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
    openram_h128_w16_1r1w_raddr,
    openram_h128_w16_1r1w_ren,
    openram_h128_w16_1r1w_waddr,
    openram_h128_w16_1r1w_wdata,
    openram_h128_w16_1r1w_wen,
    openram_h128_w16_1r1w_rdata);
  input clk;
  input [6:0]openram_h128_w16_1r1w_raddr;
  input openram_h128_w16_1r1w_ren;
  input [6:0]openram_h128_w16_1r1w_waddr;
  input [15:0]openram_h128_w16_1r1w_wdata;
  input openram_h128_w16_1r1w_wen;
  output [15:0]openram_h128_w16_1r1w_rdata;

  wire clk;
  wire [6:0]openram_h128_w16_1r1w_raddr;
  wire [15:0]openram_h128_w16_1r1w_rdata;
  wire openram_h128_w16_1r1w_ren;
  wire [6:0]openram_h128_w16_1r1w_waddr;
  wire [15:0]openram_h128_w16_1r1w_wdata;
  wire openram_h128_w16_1r1w_wen;
  wire [6:0]tmp141;

  (* XLNX_LINE_COL = "795648" *) 
  (* map_to_module = "0" *) 
  RTL_RAM mem_35_reg
       (.RA2(tmp141),
        .RO2(openram_h128_w16_1r1w_rdata),
        .WA1(openram_h128_w16_1r1w_waddr),
        .WCLK(clk),
        .WD1(openram_h128_w16_1r1w_wdata),
        .WE1(openram_h128_w16_1r1w_wen));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[0] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[0]),
        .Q(tmp141[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[1] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[1]),
        .Q(tmp141[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[2] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[2]),
        .Q(tmp141[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[3] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[3]),
        .Q(tmp141[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[4] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[4]),
        .Q(tmp141[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[5] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[5]),
        .Q(tmp141[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5113600" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp141_reg[6] 
       (.C(clk),
        .CE(openram_h128_w16_1r1w_ren),
        .D(openram_h128_w16_1r1w_raddr[6]),
        .Q(tmp141[6]));
endmodule
