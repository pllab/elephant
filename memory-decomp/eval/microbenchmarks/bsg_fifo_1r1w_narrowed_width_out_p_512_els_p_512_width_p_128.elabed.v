// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2022.2 (lin64) Build 3671981 Fri Oct 14 04:59:54 MDT 2022
// Date        : Thu Nov 21 18:22:03 2024
// Host        : kk9.cs.washington.edu running 64-bit CentOS Linux release 7.9.2009 (Core)
// Command     : write_verilog -force microbenchmarks/bsg_fifo_1r1w_narrowed_width_out_p_512_els_p_512_width_p_128.elabed.v
// Design      : bsg_fifo_1r1w_narrowed
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7z020clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* XLNX_LINE_COL = "2580" *) 
module bsg_channel_narrow_width_in_p128_width_out_p512_lsb_to_msb_p1
   (clk_i,
    reset_i,
    data_i,
    deque_o,
    data_o,
    deque_i);
  input clk_i;
  input reset_i;
  input [127:0]data_i;
  output deque_o;
  output [511:0]data_o;
  input deque_i;

  wire \<const0> ;
  wire [127:0]data_i;
  wire deque_i;

  assign data_o[511] = \<const0> ;
  assign data_o[510] = \<const0> ;
  assign data_o[509] = \<const0> ;
  assign data_o[508] = \<const0> ;
  assign data_o[507] = \<const0> ;
  assign data_o[506] = \<const0> ;
  assign data_o[505] = \<const0> ;
  assign data_o[504] = \<const0> ;
  assign data_o[503] = \<const0> ;
  assign data_o[502] = \<const0> ;
  assign data_o[501] = \<const0> ;
  assign data_o[500] = \<const0> ;
  assign data_o[499] = \<const0> ;
  assign data_o[498] = \<const0> ;
  assign data_o[497] = \<const0> ;
  assign data_o[496] = \<const0> ;
  assign data_o[495] = \<const0> ;
  assign data_o[494] = \<const0> ;
  assign data_o[493] = \<const0> ;
  assign data_o[492] = \<const0> ;
  assign data_o[491] = \<const0> ;
  assign data_o[490] = \<const0> ;
  assign data_o[489] = \<const0> ;
  assign data_o[488] = \<const0> ;
  assign data_o[487] = \<const0> ;
  assign data_o[486] = \<const0> ;
  assign data_o[485] = \<const0> ;
  assign data_o[484] = \<const0> ;
  assign data_o[483] = \<const0> ;
  assign data_o[482] = \<const0> ;
  assign data_o[481] = \<const0> ;
  assign data_o[480] = \<const0> ;
  assign data_o[479] = \<const0> ;
  assign data_o[478] = \<const0> ;
  assign data_o[477] = \<const0> ;
  assign data_o[476] = \<const0> ;
  assign data_o[475] = \<const0> ;
  assign data_o[474] = \<const0> ;
  assign data_o[473] = \<const0> ;
  assign data_o[472] = \<const0> ;
  assign data_o[471] = \<const0> ;
  assign data_o[470] = \<const0> ;
  assign data_o[469] = \<const0> ;
  assign data_o[468] = \<const0> ;
  assign data_o[467] = \<const0> ;
  assign data_o[466] = \<const0> ;
  assign data_o[465] = \<const0> ;
  assign data_o[464] = \<const0> ;
  assign data_o[463] = \<const0> ;
  assign data_o[462] = \<const0> ;
  assign data_o[461] = \<const0> ;
  assign data_o[460] = \<const0> ;
  assign data_o[459] = \<const0> ;
  assign data_o[458] = \<const0> ;
  assign data_o[457] = \<const0> ;
  assign data_o[456] = \<const0> ;
  assign data_o[455] = \<const0> ;
  assign data_o[454] = \<const0> ;
  assign data_o[453] = \<const0> ;
  assign data_o[452] = \<const0> ;
  assign data_o[451] = \<const0> ;
  assign data_o[450] = \<const0> ;
  assign data_o[449] = \<const0> ;
  assign data_o[448] = \<const0> ;
  assign data_o[447] = \<const0> ;
  assign data_o[446] = \<const0> ;
  assign data_o[445] = \<const0> ;
  assign data_o[444] = \<const0> ;
  assign data_o[443] = \<const0> ;
  assign data_o[442] = \<const0> ;
  assign data_o[441] = \<const0> ;
  assign data_o[440] = \<const0> ;
  assign data_o[439] = \<const0> ;
  assign data_o[438] = \<const0> ;
  assign data_o[437] = \<const0> ;
  assign data_o[436] = \<const0> ;
  assign data_o[435] = \<const0> ;
  assign data_o[434] = \<const0> ;
  assign data_o[433] = \<const0> ;
  assign data_o[432] = \<const0> ;
  assign data_o[431] = \<const0> ;
  assign data_o[430] = \<const0> ;
  assign data_o[429] = \<const0> ;
  assign data_o[428] = \<const0> ;
  assign data_o[427] = \<const0> ;
  assign data_o[426] = \<const0> ;
  assign data_o[425] = \<const0> ;
  assign data_o[424] = \<const0> ;
  assign data_o[423] = \<const0> ;
  assign data_o[422] = \<const0> ;
  assign data_o[421] = \<const0> ;
  assign data_o[420] = \<const0> ;
  assign data_o[419] = \<const0> ;
  assign data_o[418] = \<const0> ;
  assign data_o[417] = \<const0> ;
  assign data_o[416] = \<const0> ;
  assign data_o[415] = \<const0> ;
  assign data_o[414] = \<const0> ;
  assign data_o[413] = \<const0> ;
  assign data_o[412] = \<const0> ;
  assign data_o[411] = \<const0> ;
  assign data_o[410] = \<const0> ;
  assign data_o[409] = \<const0> ;
  assign data_o[408] = \<const0> ;
  assign data_o[407] = \<const0> ;
  assign data_o[406] = \<const0> ;
  assign data_o[405] = \<const0> ;
  assign data_o[404] = \<const0> ;
  assign data_o[403] = \<const0> ;
  assign data_o[402] = \<const0> ;
  assign data_o[401] = \<const0> ;
  assign data_o[400] = \<const0> ;
  assign data_o[399] = \<const0> ;
  assign data_o[398] = \<const0> ;
  assign data_o[397] = \<const0> ;
  assign data_o[396] = \<const0> ;
  assign data_o[395] = \<const0> ;
  assign data_o[394] = \<const0> ;
  assign data_o[393] = \<const0> ;
  assign data_o[392] = \<const0> ;
  assign data_o[391] = \<const0> ;
  assign data_o[390] = \<const0> ;
  assign data_o[389] = \<const0> ;
  assign data_o[388] = \<const0> ;
  assign data_o[387] = \<const0> ;
  assign data_o[386] = \<const0> ;
  assign data_o[385] = \<const0> ;
  assign data_o[384] = \<const0> ;
  assign data_o[383] = \<const0> ;
  assign data_o[382] = \<const0> ;
  assign data_o[381] = \<const0> ;
  assign data_o[380] = \<const0> ;
  assign data_o[379] = \<const0> ;
  assign data_o[378] = \<const0> ;
  assign data_o[377] = \<const0> ;
  assign data_o[376] = \<const0> ;
  assign data_o[375] = \<const0> ;
  assign data_o[374] = \<const0> ;
  assign data_o[373] = \<const0> ;
  assign data_o[372] = \<const0> ;
  assign data_o[371] = \<const0> ;
  assign data_o[370] = \<const0> ;
  assign data_o[369] = \<const0> ;
  assign data_o[368] = \<const0> ;
  assign data_o[367] = \<const0> ;
  assign data_o[366] = \<const0> ;
  assign data_o[365] = \<const0> ;
  assign data_o[364] = \<const0> ;
  assign data_o[363] = \<const0> ;
  assign data_o[362] = \<const0> ;
  assign data_o[361] = \<const0> ;
  assign data_o[360] = \<const0> ;
  assign data_o[359] = \<const0> ;
  assign data_o[358] = \<const0> ;
  assign data_o[357] = \<const0> ;
  assign data_o[356] = \<const0> ;
  assign data_o[355] = \<const0> ;
  assign data_o[354] = \<const0> ;
  assign data_o[353] = \<const0> ;
  assign data_o[352] = \<const0> ;
  assign data_o[351] = \<const0> ;
  assign data_o[350] = \<const0> ;
  assign data_o[349] = \<const0> ;
  assign data_o[348] = \<const0> ;
  assign data_o[347] = \<const0> ;
  assign data_o[346] = \<const0> ;
  assign data_o[345] = \<const0> ;
  assign data_o[344] = \<const0> ;
  assign data_o[343] = \<const0> ;
  assign data_o[342] = \<const0> ;
  assign data_o[341] = \<const0> ;
  assign data_o[340] = \<const0> ;
  assign data_o[339] = \<const0> ;
  assign data_o[338] = \<const0> ;
  assign data_o[337] = \<const0> ;
  assign data_o[336] = \<const0> ;
  assign data_o[335] = \<const0> ;
  assign data_o[334] = \<const0> ;
  assign data_o[333] = \<const0> ;
  assign data_o[332] = \<const0> ;
  assign data_o[331] = \<const0> ;
  assign data_o[330] = \<const0> ;
  assign data_o[329] = \<const0> ;
  assign data_o[328] = \<const0> ;
  assign data_o[327] = \<const0> ;
  assign data_o[326] = \<const0> ;
  assign data_o[325] = \<const0> ;
  assign data_o[324] = \<const0> ;
  assign data_o[323] = \<const0> ;
  assign data_o[322] = \<const0> ;
  assign data_o[321] = \<const0> ;
  assign data_o[320] = \<const0> ;
  assign data_o[319] = \<const0> ;
  assign data_o[318] = \<const0> ;
  assign data_o[317] = \<const0> ;
  assign data_o[316] = \<const0> ;
  assign data_o[315] = \<const0> ;
  assign data_o[314] = \<const0> ;
  assign data_o[313] = \<const0> ;
  assign data_o[312] = \<const0> ;
  assign data_o[311] = \<const0> ;
  assign data_o[310] = \<const0> ;
  assign data_o[309] = \<const0> ;
  assign data_o[308] = \<const0> ;
  assign data_o[307] = \<const0> ;
  assign data_o[306] = \<const0> ;
  assign data_o[305] = \<const0> ;
  assign data_o[304] = \<const0> ;
  assign data_o[303] = \<const0> ;
  assign data_o[302] = \<const0> ;
  assign data_o[301] = \<const0> ;
  assign data_o[300] = \<const0> ;
  assign data_o[299] = \<const0> ;
  assign data_o[298] = \<const0> ;
  assign data_o[297] = \<const0> ;
  assign data_o[296] = \<const0> ;
  assign data_o[295] = \<const0> ;
  assign data_o[294] = \<const0> ;
  assign data_o[293] = \<const0> ;
  assign data_o[292] = \<const0> ;
  assign data_o[291] = \<const0> ;
  assign data_o[290] = \<const0> ;
  assign data_o[289] = \<const0> ;
  assign data_o[288] = \<const0> ;
  assign data_o[287] = \<const0> ;
  assign data_o[286] = \<const0> ;
  assign data_o[285] = \<const0> ;
  assign data_o[284] = \<const0> ;
  assign data_o[283] = \<const0> ;
  assign data_o[282] = \<const0> ;
  assign data_o[281] = \<const0> ;
  assign data_o[280] = \<const0> ;
  assign data_o[279] = \<const0> ;
  assign data_o[278] = \<const0> ;
  assign data_o[277] = \<const0> ;
  assign data_o[276] = \<const0> ;
  assign data_o[275] = \<const0> ;
  assign data_o[274] = \<const0> ;
  assign data_o[273] = \<const0> ;
  assign data_o[272] = \<const0> ;
  assign data_o[271] = \<const0> ;
  assign data_o[270] = \<const0> ;
  assign data_o[269] = \<const0> ;
  assign data_o[268] = \<const0> ;
  assign data_o[267] = \<const0> ;
  assign data_o[266] = \<const0> ;
  assign data_o[265] = \<const0> ;
  assign data_o[264] = \<const0> ;
  assign data_o[263] = \<const0> ;
  assign data_o[262] = \<const0> ;
  assign data_o[261] = \<const0> ;
  assign data_o[260] = \<const0> ;
  assign data_o[259] = \<const0> ;
  assign data_o[258] = \<const0> ;
  assign data_o[257] = \<const0> ;
  assign data_o[256] = \<const0> ;
  assign data_o[255] = \<const0> ;
  assign data_o[254] = \<const0> ;
  assign data_o[253] = \<const0> ;
  assign data_o[252] = \<const0> ;
  assign data_o[251] = \<const0> ;
  assign data_o[250] = \<const0> ;
  assign data_o[249] = \<const0> ;
  assign data_o[248] = \<const0> ;
  assign data_o[247] = \<const0> ;
  assign data_o[246] = \<const0> ;
  assign data_o[245] = \<const0> ;
  assign data_o[244] = \<const0> ;
  assign data_o[243] = \<const0> ;
  assign data_o[242] = \<const0> ;
  assign data_o[241] = \<const0> ;
  assign data_o[240] = \<const0> ;
  assign data_o[239] = \<const0> ;
  assign data_o[238] = \<const0> ;
  assign data_o[237] = \<const0> ;
  assign data_o[236] = \<const0> ;
  assign data_o[235] = \<const0> ;
  assign data_o[234] = \<const0> ;
  assign data_o[233] = \<const0> ;
  assign data_o[232] = \<const0> ;
  assign data_o[231] = \<const0> ;
  assign data_o[230] = \<const0> ;
  assign data_o[229] = \<const0> ;
  assign data_o[228] = \<const0> ;
  assign data_o[227] = \<const0> ;
  assign data_o[226] = \<const0> ;
  assign data_o[225] = \<const0> ;
  assign data_o[224] = \<const0> ;
  assign data_o[223] = \<const0> ;
  assign data_o[222] = \<const0> ;
  assign data_o[221] = \<const0> ;
  assign data_o[220] = \<const0> ;
  assign data_o[219] = \<const0> ;
  assign data_o[218] = \<const0> ;
  assign data_o[217] = \<const0> ;
  assign data_o[216] = \<const0> ;
  assign data_o[215] = \<const0> ;
  assign data_o[214] = \<const0> ;
  assign data_o[213] = \<const0> ;
  assign data_o[212] = \<const0> ;
  assign data_o[211] = \<const0> ;
  assign data_o[210] = \<const0> ;
  assign data_o[209] = \<const0> ;
  assign data_o[208] = \<const0> ;
  assign data_o[207] = \<const0> ;
  assign data_o[206] = \<const0> ;
  assign data_o[205] = \<const0> ;
  assign data_o[204] = \<const0> ;
  assign data_o[203] = \<const0> ;
  assign data_o[202] = \<const0> ;
  assign data_o[201] = \<const0> ;
  assign data_o[200] = \<const0> ;
  assign data_o[199] = \<const0> ;
  assign data_o[198] = \<const0> ;
  assign data_o[197] = \<const0> ;
  assign data_o[196] = \<const0> ;
  assign data_o[195] = \<const0> ;
  assign data_o[194] = \<const0> ;
  assign data_o[193] = \<const0> ;
  assign data_o[192] = \<const0> ;
  assign data_o[191] = \<const0> ;
  assign data_o[190] = \<const0> ;
  assign data_o[189] = \<const0> ;
  assign data_o[188] = \<const0> ;
  assign data_o[187] = \<const0> ;
  assign data_o[186] = \<const0> ;
  assign data_o[185] = \<const0> ;
  assign data_o[184] = \<const0> ;
  assign data_o[183] = \<const0> ;
  assign data_o[182] = \<const0> ;
  assign data_o[181] = \<const0> ;
  assign data_o[180] = \<const0> ;
  assign data_o[179] = \<const0> ;
  assign data_o[178] = \<const0> ;
  assign data_o[177] = \<const0> ;
  assign data_o[176] = \<const0> ;
  assign data_o[175] = \<const0> ;
  assign data_o[174] = \<const0> ;
  assign data_o[173] = \<const0> ;
  assign data_o[172] = \<const0> ;
  assign data_o[171] = \<const0> ;
  assign data_o[170] = \<const0> ;
  assign data_o[169] = \<const0> ;
  assign data_o[168] = \<const0> ;
  assign data_o[167] = \<const0> ;
  assign data_o[166] = \<const0> ;
  assign data_o[165] = \<const0> ;
  assign data_o[164] = \<const0> ;
  assign data_o[163] = \<const0> ;
  assign data_o[162] = \<const0> ;
  assign data_o[161] = \<const0> ;
  assign data_o[160] = \<const0> ;
  assign data_o[159] = \<const0> ;
  assign data_o[158] = \<const0> ;
  assign data_o[157] = \<const0> ;
  assign data_o[156] = \<const0> ;
  assign data_o[155] = \<const0> ;
  assign data_o[154] = \<const0> ;
  assign data_o[153] = \<const0> ;
  assign data_o[152] = \<const0> ;
  assign data_o[151] = \<const0> ;
  assign data_o[150] = \<const0> ;
  assign data_o[149] = \<const0> ;
  assign data_o[148] = \<const0> ;
  assign data_o[147] = \<const0> ;
  assign data_o[146] = \<const0> ;
  assign data_o[145] = \<const0> ;
  assign data_o[144] = \<const0> ;
  assign data_o[143] = \<const0> ;
  assign data_o[142] = \<const0> ;
  assign data_o[141] = \<const0> ;
  assign data_o[140] = \<const0> ;
  assign data_o[139] = \<const0> ;
  assign data_o[138] = \<const0> ;
  assign data_o[137] = \<const0> ;
  assign data_o[136] = \<const0> ;
  assign data_o[135] = \<const0> ;
  assign data_o[134] = \<const0> ;
  assign data_o[133] = \<const0> ;
  assign data_o[132] = \<const0> ;
  assign data_o[131] = \<const0> ;
  assign data_o[130] = \<const0> ;
  assign data_o[129] = \<const0> ;
  assign data_o[128] = \<const0> ;
  assign data_o[127:0] = data_i;
  assign deque_o = deque_i;
  GND GND
       (.G(\<const0> ));
endmodule

(* XLNX_LINE_COL = "2612" *) (* max_add_p = "1" *) (* ptr_width_lp = "9" *) 
(* slots_p = "512" *) 
module bsg_circular_ptr
   (clk,
    reset_i,
    add_i,
    o,
    n_o);
  input clk;
  input reset_i;
  input [0:0]add_i;
  output [8:0]o;
  output [8:0]n_o;

  wire \<const1> ;
  wire [0:0]add_i;
  wire clk;
  wire [8:0]n_o;
  wire [8:0]o;
  wire [8:0]ptr_r_p1;
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
  (* PRIMITIVE_NAME = "RTL_REG" *) 
  (* XLNX_LINE_COL = "787968" *) 
  (* map_to_module = "0" *) 
  RTL_REG_SYNC__BREG_1 \ptr_r_reg[8] 
       (.C(clk),
        .D(n_o[8]),
        .Q(o[8]),
        .RST(reset_i));
endmodule

(* XLNX_LINE_COL = "2610" *) 
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
  input [127:0]data_i;
  input v_i;
  output ready_o;
  output v_o;
  output [511:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [127:0]data;
  wire [127:0]data_i;
  wire [511:0]data_o;
  wire ready_o;
  wire reset_i;
  wire v_i;
  wire v_o;
  wire yumi;
  wire yumi_i;

  (* XLNX_LINE_COL = "133632" *) 
  (* els_p = "512" *) 
  (* harden_p = "0" *) 
  (* ready_THEN_valid_p = "0" *) 
  (* width_p = "128" *) 
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
  bsg_channel_narrow_width_in_p128_width_out_p512_lsb_to_msb_p1 output_narrower
       (.clk_i(clk_i),
        .data_i(data),
        .data_o(data_o),
        .deque_i(yumi_i),
        .deque_o(yumi),
        .reset_i(reset_i));
endmodule

(* XLNX_LINE_COL = "2633" *) (* els_p = "512" *) (* harden_p = "0" *) 
(* ready_THEN_valid_p = "0" *) (* width_p = "128" *) 
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
  input [127:0]data_i;
  output v_o;
  output [127:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [127:0]data_i;
  wire [127:0]data_o;
  wire ready_o;
  wire reset_i;
  wire v_i;
  wire v_o;
  wire yumi_i;

  (* XLNX_LINE_COL = "394496" *) 
  (* els_p = "512" *) 
  (* ptr_width_lp = "9" *) 
  (* ready_THEN_valid_p = "0" *) 
  (* width_p = "128" *) 
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

(* XLNX_LINE_COL = "2627" *) (* els_p = "512" *) (* ptr_width_lp = "9" *) 
(* ready_THEN_valid_p = "0" *) (* width_p = "128" *) 
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
  input [127:0]data_i;
  output v_o;
  output [127:0]data_o;
  input yumi_i;

  wire clk_i;
  wire [127:0]data_i;
  wire [127:0]data_o;
  wire empty;
  wire enque;
  wire full;
  wire ready_o;
  wire reset_i;
  wire [8:0]rptr_r;
  wire v_i;
  wire v_o;
  wire [8:0]wptr_r;
  wire yumi_i;

  (* XLNX_LINE_COL = "1183488" *) 
  (* map_to_module = "11" *) 
  RTL_AND enque_i
       (.I0(v_i),
        .I1(ready_o),
        .O(enque));
  (* XLNX_LINE_COL = "2294528" *) 
  (* els_p = "512" *) 
  (* ptr_width_lp = "9" *) 
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
  (* addr_width_lp = "9" *) 
  (* els_p = "512" *) 
  (* harden_p = "0" *) 
  (* read_write_same_addr_p = "0" *) 
  (* width_p = "128" *) 
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

(* XLNX_LINE_COL = "2627" *) (* els_p = "512" *) (* ptr_width_lp = "9" *) 
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
  output [8:0]wptr_r_o;
  output [8:0]rptr_r_o;
  output [8:0]rptr_n_o;
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
  wire [8:0]rptr_n_o;
  wire [8:0]rptr_r_o;
  wire [8:0]wptr_r_o;

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
  (* ptr_width_lp = "9" *) 
  (* slots_p = "512" *) 
  bsg_circular_ptr rptr
       (.add_i(deq_i),
        .clk(clk_i),
        .n_o(rptr_n_o),
        .o(rptr_r_o),
        .reset_i(reset_i));
  (* XLNX_LINE_COL = "197888" *) 
  (* max_add_p = "1" *) 
  (* ptr_width_lp = "9" *) 
  (* slots_p = "512" *) 
  bsg_circular_ptr wptr
       (.add_i(enq_i),
        .clk(clk_i),
        .o(wptr_r_o),
        .reset_i(reset_i));
endmodule

(* XLNX_LINE_COL = "2601" *) (* addr_width_lp = "9" *) (* els_p = "512" *) 
(* harden_p = "0" *) (* read_write_same_addr_p = "0" *) (* width_p = "128" *) 
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
  input [8:0]w_addr_i;
  input [127:0]w_data_i;
  input r_v_i;
  input [8:0]r_addr_i;
  output [127:0]r_data_o;

  wire [8:0]r_addr_i;
  wire [127:0]r_data_o;
  wire r_v_i;
  wire [8:0]w_addr_i;
  wire w_clk_i;
  wire [127:0]w_data_i;
  wire w_reset_i;
  wire w_v_i;

  (* XLNX_LINE_COL = "198144" *) 
  (* addr_width_lp = "9" *) 
  (* els_p = "512" *) 
  (* harden_p = "0" *) 
  (* read_write_same_addr_p = "0" *) 
  (* width_p = "128" *) 
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

(* XLNX_LINE_COL = "2590" *) (* addr_width_lp = "9" *) (* els_p = "512" *) 
(* harden_p = "0" *) (* read_write_same_addr_p = "0" *) (* width_p = "128" *) 
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
  input [8:0]w_addr_i;
  input [127:0]w_data_i;
  input r_v_i;
  input [8:0]r_addr_i;
  output [127:0]r_data_o;

  wire [8:0]r_addr_i;
  wire [127:0]r_data_o;
  wire [8:0]w_addr_i;
  wire w_clk_i;
  wire [127:0]w_data_i;
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
