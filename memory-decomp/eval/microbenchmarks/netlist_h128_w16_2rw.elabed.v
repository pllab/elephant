// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:02 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/netlist_h128_w16_2rw.elabed.v
// Design      : toplevel
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* XLNX_LINE_COL = "2606" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module toplevel
   (clk,
    openram_h128_w16_2rw_raddr_0,
    openram_h128_w16_2rw_raddr_1,
    openram_h128_w16_2rw_ren_0,
    openram_h128_w16_2rw_ren_1,
    openram_h128_w16_2rw_waddr,
    openram_h128_w16_2rw_wdata,
    openram_h128_w16_2rw_wen,
    openram_h128_w16_2rw_rdata_0,
    openram_h128_w16_2rw_rdata_1);
  input clk;
  input [6:0]openram_h128_w16_2rw_raddr_0;
  input [6:0]openram_h128_w16_2rw_raddr_1;
  input openram_h128_w16_2rw_ren_0;
  input openram_h128_w16_2rw_ren_1;
  input [6:0]openram_h128_w16_2rw_waddr;
  input [15:0]openram_h128_w16_2rw_wdata;
  input openram_h128_w16_2rw_wen;
  output [15:0]openram_h128_w16_2rw_rdata_0;
  output [15:0]openram_h128_w16_2rw_rdata_1;

  wire clk;
  wire [6:0]openram_h128_w16_2rw_raddr_0;
  wire [6:0]openram_h128_w16_2rw_raddr_1;
  wire [15:0]openram_h128_w16_2rw_rdata_0;
  wire [15:0]openram_h128_w16_2rw_rdata_1;
  wire openram_h128_w16_2rw_ren_0;
  wire openram_h128_w16_2rw_ren_1;
  wire [6:0]openram_h128_w16_2rw_waddr;
  wire [15:0]openram_h128_w16_2rw_wdata;
  wire openram_h128_w16_2rw_wen;
  wire [6:0]tmp102;
  wire [6:0]tmp105;

  (* XLNX_LINE_COL = "795392" *) 
  (* map_to_module = "0" *) 
  RTL_RAM mem_23_reg
       (.RA2(tmp105),
        .RA3(tmp102),
        .RO2(openram_h128_w16_2rw_rdata_1),
        .RO3(openram_h128_w16_2rw_rdata_0),
        .WA1(openram_h128_w16_2rw_waddr),
        .WCLK(clk),
        .WD1(openram_h128_w16_2rw_wdata),
        .WE1(openram_h128_w16_2rw_wen));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[0] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[0]),
        .Q(tmp102[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[1] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[1]),
        .Q(tmp102[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[2] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[2]),
        .Q(tmp102[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[3] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[3]),
        .Q(tmp102[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[4] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[4]),
        .Q(tmp102[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[5] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[5]),
        .Q(tmp102[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "1" *) 
  RTL_REG__BREG_1 \tmp102_reg[6] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_0),
        .D(openram_h128_w16_2rw_raddr_0[6]),
        .Q(tmp102[6]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[0] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[0]),
        .Q(tmp105[0]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[1] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[1]),
        .Q(tmp105[1]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[2] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[2]),
        .Q(tmp105[2]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[3] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[3]),
        .Q(tmp105[3]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[4] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[4]),
        .Q(tmp105[4]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[5] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[5]),
        .Q(tmp105[5]));
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "5244672" *) 
  (* map_to_module = "2" *) 
  RTL_REG__BREG_1 \tmp105_reg[6] 
       (.C(clk),
        .CE(openram_h128_w16_2rw_ren_1),
        .D(openram_h128_w16_2rw_raddr_1[6]),
        .Q(tmp105[6]));
endmodule
