

module top
(
  clk_i,
  en_i,
  x_i,
  y_i,
  signed_i,
  z_o
);

  input [31:0] x_i;
  input [31:0] y_i;
  output [63:0] z_o;
  input clk_i;
  input en_i;
  input signed_i;

  bsg_mul_pipelined
  wrapper
  (
    .x_i(x_i),
    .y_i(y_i),
    .z_o(z_o),
    .clk_i(clk_i),
    .en_i(en_i),
    .signed_i(signed_i)
  );


endmodule



module bsg_mul_SDN_width_p32
(
  x_i,
  signed_i,
  SDN_o
);

  input [31:0] x_i;
  output [50:0] SDN_o;
  input signed_i;
  wire [50:0] SDN_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,N61,
  N62,N63,N64,N65,N66,N67,N68,N69,N70,N71,N72,N73,N74,N75,N76,N77,N78,N79,N80,N81,
  N82,N83,N84,N85,N86,N87,N88,N89,N90,N91,N92,N93,N94,N95,N96,N97,N98,N99,N100,N101,
  N102;
  wire [1:0] rof_16__trip;
  assign SDN_o[45] = x_i[31];
  assign SDN_o[42] = x_i[29];
  assign SDN_o[39] = x_i[27];
  assign SDN_o[36] = x_i[25];
  assign SDN_o[33] = x_i[23];
  assign SDN_o[30] = x_i[21];
  assign SDN_o[27] = x_i[19];
  assign SDN_o[24] = x_i[17];
  assign SDN_o[21] = x_i[15];
  assign SDN_o[18] = x_i[13];
  assign SDN_o[15] = x_i[11];
  assign SDN_o[12] = x_i[9];
  assign SDN_o[9] = x_i[7];
  assign SDN_o[6] = x_i[5];
  assign SDN_o[3] = x_i[3];
  assign SDN_o[0] = x_i[1];
  assign SDN_o[1] = N2 | N5;
  assign N2 = N0 & N1;
  assign N0 = x_i[0] & 1'b0;
  assign N1 = ~x_i[1];
  assign N5 = N4 & x_i[1];
  assign N4 = ~N3;
  assign N3 = x_i[0] | 1'b0;
  assign SDN_o[2] = 1'b0 ^ x_i[0];
  assign SDN_o[4] = N8 | N11;
  assign N8 = N6 & N7;
  assign N6 = x_i[2] & x_i[1];
  assign N7 = ~x_i[3];
  assign N11 = N10 & x_i[3];
  assign N10 = ~N9;
  assign N9 = x_i[2] | x_i[1];
  assign SDN_o[5] = x_i[1] ^ x_i[2];
  assign SDN_o[7] = N14 | N17;
  assign N14 = N12 & N13;
  assign N12 = x_i[4] & x_i[3];
  assign N13 = ~x_i[5];
  assign N17 = N16 & x_i[5];
  assign N16 = ~N15;
  assign N15 = x_i[4] | x_i[3];
  assign SDN_o[8] = x_i[3] ^ x_i[4];
  assign SDN_o[10] = N20 | N23;
  assign N20 = N18 & N19;
  assign N18 = x_i[6] & x_i[5];
  assign N19 = ~x_i[7];
  assign N23 = N22 & x_i[7];
  assign N22 = ~N21;
  assign N21 = x_i[6] | x_i[5];
  assign SDN_o[11] = x_i[5] ^ x_i[6];
  assign SDN_o[13] = N26 | N29;
  assign N26 = N24 & N25;
  assign N24 = x_i[8] & x_i[7];
  assign N25 = ~x_i[9];
  assign N29 = N28 & x_i[9];
  assign N28 = ~N27;
  assign N27 = x_i[8] | x_i[7];
  assign SDN_o[14] = x_i[7] ^ x_i[8];
  assign SDN_o[16] = N32 | N35;
  assign N32 = N30 & N31;
  assign N30 = x_i[10] & x_i[9];
  assign N31 = ~x_i[11];
  assign N35 = N34 & x_i[11];
  assign N34 = ~N33;
  assign N33 = x_i[10] | x_i[9];
  assign SDN_o[17] = x_i[9] ^ x_i[10];
  assign SDN_o[19] = N38 | N41;
  assign N38 = N36 & N37;
  assign N36 = x_i[12] & x_i[11];
  assign N37 = ~x_i[13];
  assign N41 = N40 & x_i[13];
  assign N40 = ~N39;
  assign N39 = x_i[12] | x_i[11];
  assign SDN_o[20] = x_i[11] ^ x_i[12];
  assign SDN_o[22] = N44 | N47;
  assign N44 = N42 & N43;
  assign N42 = x_i[14] & x_i[13];
  assign N43 = ~x_i[15];
  assign N47 = N46 & x_i[15];
  assign N46 = ~N45;
  assign N45 = x_i[14] | x_i[13];
  assign SDN_o[23] = x_i[13] ^ x_i[14];
  assign SDN_o[25] = N50 | N53;
  assign N50 = N48 & N49;
  assign N48 = x_i[16] & x_i[15];
  assign N49 = ~x_i[17];
  assign N53 = N52 & x_i[17];
  assign N52 = ~N51;
  assign N51 = x_i[16] | x_i[15];
  assign SDN_o[26] = x_i[15] ^ x_i[16];
  assign SDN_o[28] = N56 | N59;
  assign N56 = N54 & N55;
  assign N54 = x_i[18] & x_i[17];
  assign N55 = ~x_i[19];
  assign N59 = N58 & x_i[19];
  assign N58 = ~N57;
  assign N57 = x_i[18] | x_i[17];
  assign SDN_o[29] = x_i[17] ^ x_i[18];
  assign SDN_o[31] = N62 | N65;
  assign N62 = N60 & N61;
  assign N60 = x_i[20] & x_i[19];
  assign N61 = ~x_i[21];
  assign N65 = N64 & x_i[21];
  assign N64 = ~N63;
  assign N63 = x_i[20] | x_i[19];
  assign SDN_o[32] = x_i[19] ^ x_i[20];
  assign SDN_o[34] = N68 | N71;
  assign N68 = N66 & N67;
  assign N66 = x_i[22] & x_i[21];
  assign N67 = ~x_i[23];
  assign N71 = N70 & x_i[23];
  assign N70 = ~N69;
  assign N69 = x_i[22] | x_i[21];
  assign SDN_o[35] = x_i[21] ^ x_i[22];
  assign SDN_o[37] = N74 | N77;
  assign N74 = N72 & N73;
  assign N72 = x_i[24] & x_i[23];
  assign N73 = ~x_i[25];
  assign N77 = N76 & x_i[25];
  assign N76 = ~N75;
  assign N75 = x_i[24] | x_i[23];
  assign SDN_o[38] = x_i[23] ^ x_i[24];
  assign SDN_o[40] = N80 | N83;
  assign N80 = N78 & N79;
  assign N78 = x_i[26] & x_i[25];
  assign N79 = ~x_i[27];
  assign N83 = N82 & x_i[27];
  assign N82 = ~N81;
  assign N81 = x_i[26] | x_i[25];
  assign SDN_o[41] = x_i[25] ^ x_i[26];
  assign SDN_o[43] = N86 | N89;
  assign N86 = N84 & N85;
  assign N84 = x_i[28] & x_i[27];
  assign N85 = ~x_i[29];
  assign N89 = N88 & x_i[29];
  assign N88 = ~N87;
  assign N87 = x_i[28] | x_i[27];
  assign SDN_o[44] = x_i[27] ^ x_i[28];
  assign SDN_o[46] = N92 | N95;
  assign N92 = N90 & N91;
  assign N90 = x_i[30] & x_i[29];
  assign N91 = ~x_i[31];
  assign N95 = N94 & x_i[31];
  assign N94 = ~N93;
  assign N93 = x_i[30] | x_i[29];
  assign SDN_o[47] = x_i[29] ^ x_i[30];
  assign SDN_o[48] = 1'b0 & N96;
  assign N96 = ~signed_i;
  assign rof_16__trip[1] = 1'b0 & N96;
  assign rof_16__trip[0] = x_i[31] & N96;
  assign SDN_o[49] = N99 | N102;
  assign N99 = N97 & N98;
  assign N97 = rof_16__trip[1] & rof_16__trip[0];
  assign N98 = ~SDN_o[48];
  assign N102 = N101 & SDN_o[48];
  assign N101 = ~N100;
  assign N100 = rof_16__trip[1] | rof_16__trip[0];
  assign SDN_o[50] = rof_16__trip[0] ^ rof_16__trip[1];

endmodule



module bsg_mul_csa
(
  x_i,
  y_i,
  z_i,
  c_o,
  s_o
);

  input x_i;
  input y_i;
  input z_i;
  output c_o;
  output s_o;
  wire c_o,s_o,N0,N1;
  assign { N1, N0 } = x_i + y_i;
  assign { c_o, s_o } = { N1, N0 } + z_i;

endmodule



module bsg_mul_comp42
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [3:0] i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,tmp;

  bsg_mul_csa
  csa_1
  (
    .x_i(i[0]),
    .y_i(i[1]),
    .z_i(i[2]),
    .c_o(cl_o),
    .s_o(tmp)
  );


  bsg_mul_csa
  csa_2
  (
    .x_i(i[3]),
    .y_i(tmp),
    .z_i(cr_i),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_000002_000000_00000c_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [0:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, SDN_i[3:3], dot_vals[0:0] }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];

endmodule



module bsg_mul_booth_4_block_000000_000000_00000e_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [0:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, 1'b0, dot_vals[0:0] }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];

endmodule



module bsg_mul_booth_4_block_000004_000000_000008_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [1:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, SDN_i[6:6], dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];

endmodule



module bsg_mul_booth_4_block_000000_000000_00000c_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [1:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];

endmodule



module bsg_mul_booth_4_block_000008_000000_000000_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [2:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ SDN_i[9:9], dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];

endmodule



module bsg_mul_booth_4_block_000000_000000_000008_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [2:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];

endmodule



module bsg_mul_booth_4_block_rep_00000006_080402_000000_80c8ec_000000
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [47:0] y_vec_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [5:1] ci_local;

  bsg_mul_booth_4_block_000002_000000_00000c_000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_000000_000000_00000e_000000
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_000004_000000_000008_000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_000000_000000_00000c_000000
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_000008_000000_000000_000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_000000_000000_000008_000000
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(cl_o),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


endmodule



module bsg_mul_B4B_rep_00000006_00000000000000_32_080402_000000_80c8ec_000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000006_080402_000000_80c8ec_000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ 1'b0, 1'b0, y_i[1:0], y_i[3:2], y_i[5:4], 1'b0, 1'b0, y_i[0:0], 1'b0, y_i[2:1], y_i[4:3], 1'b0, 1'b0, 1'b0, 1'b0, y_i[1:0], y_i[3:2], 1'b0, 1'b0, 1'b0, 1'b0, y_i[0:0], 1'b0, y_i[2:1], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, y_i[1:0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, y_i[0:0], 1'b0 }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N11 ^ SDN_i[12];
  assign N11 = N9 | N10;
  assign N9 = SDN_i[14] & y_i[7];
  assign N10 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [63:0] y_vec_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [7:1] ci_local;

  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_6__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[6]),
    .y_i(y_vec_i[55:48]),
    .cl_o(ci_local[7]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000000
  rof_7__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[7]),
    .y_i(y_vec_i[63:56]),
    .cl_o(cl_o),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000000000006_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[7:6], y_i[9:8], y_i[11:10], y_i[13:12], y_i[6:5], y_i[8:7], y_i[10:9], y_i[12:11], y_i[5:4], y_i[7:6], y_i[9:8], y_i[11:10], y_i[4:3], y_i[6:5], y_i[8:7], y_i[10:9], y_i[3:2], y_i[5:4], y_i[7:6], y_i[9:8], y_i[2:1], y_i[4:3], y_i[6:5], y_i[8:7], y_i[1:0], y_i[3:2], y_i[5:4], y_i[7:6], y_i[0:0], 1'b0, y_i[2:1], y_i[4:3], y_i[6:5] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_0000000000000e_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[15:14], y_i[17:16], y_i[19:18], y_i[21:20], y_i[14:13], y_i[16:15], y_i[18:17], y_i[20:19], y_i[13:12], y_i[15:14], y_i[17:16], y_i[19:18], y_i[12:11], y_i[14:13], y_i[16:15], y_i[18:17], y_i[11:10], y_i[13:12], y_i[15:14], y_i[17:16], y_i[10:9], y_i[12:11], y_i[14:13], y_i[16:15], y_i[9:8], y_i[11:10], y_i[13:12], y_i[15:14], y_i[8:7], y_i[10:9], y_i[12:11], y_i[14:13] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000000000016_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[23:22], y_i[25:24], y_i[27:26], y_i[29:28], y_i[22:21], y_i[24:23], y_i[26:25], y_i[28:27], y_i[21:20], y_i[23:22], y_i[25:24], y_i[27:26], y_i[20:19], y_i[22:21], y_i[24:23], y_i[26:25], y_i[19:18], y_i[21:20], y_i[23:22], y_i[25:24], y_i[18:17], y_i[20:19], y_i[22:21], y_i[24:23], y_i[17:16], y_i[19:18], y_i[21:20], y_i[23:22], y_i[16:15], y_i[18:17], y_i[20:19], y_i[22:21] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_00000_00000_00000_00000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N11 ^ SDN_i[12];
  assign N11 = N9 | N10;
  assign N9 = SDN_i[14] & y_i[7];
  assign N10 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_rep_00000005_00000_00000_00000_00000
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [39:0] y_vec_i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;
  wire [4:1] ci_local;

  bsg_mul_booth_4_block_00000_00000_00000_00000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_00000_00000_00000_00000
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_00000_00000_00000_00000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_00000_00000_00000_00000
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_00000_00000_00000_00000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(cl_o),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


endmodule



module bsg_mul_B4B_rep_00000005_0000000000001e_32_00000_00000_00000_00000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;
  wire [43:41] y_pad;

  bsg_mul_booth_4_block_rep_00000005_00000_00000_00000_00000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_i[27:26], y_i[29:28], y_i[31:30], y_pad[42:41], y_i[26:25], y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_i[25:24], y_i[27:26], y_i[29:28], y_i[31:30], y_i[24:23], y_i[26:25], y_i[28:27], y_i[30:29] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[43] = y_i[31] & signed_i;
  assign y_pad[42] = y_i[31] & signed_i;
  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_booth_4_block_000000_000003_000000_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N4 ^ SDN_i[3];
  assign N4 = N2 | N3;
  assign N2 = SDN_i[5] & y_i[1];
  assign N3 = SDN_i[4] & y_i[0];
  assign dot_vals[0] = ~N0;
  assign N1 = N7 ^ SDN_i[6];
  assign N7 = N5 | N6;
  assign N5 = SDN_i[8] & y_i[3];
  assign N6 = SDN_i[7] & y_i[2];
  assign dot_vals[1] = ~N1;
  assign dot_vals[2] = N10 ^ SDN_i[9];
  assign N10 = N8 | N9;
  assign N8 = SDN_i[11] & y_i[5];
  assign N9 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N13 ^ SDN_i[12];
  assign N13 = N11 | N12;
  assign N11 = SDN_i[14] & y_i[7];
  assign N12 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_000000_000000_000001_000002
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b1, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[2] = N2 ^ SDN_i[9];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[11] & y_i[5];
  assign N1 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N5 ^ SDN_i[12];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[14] & y_i[7];
  assign N4 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_000000_000004_000003_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[9];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[11] & y_i[5];
  assign N2 = SDN_i[10] & y_i[4];
  assign dot_vals[2] = ~N0;
  assign dot_vals[3] = N6 ^ SDN_i[12];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[14] & y_i[7];
  assign N5 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_000000_000000_000003_000004
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b1, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[3] = N2 ^ SDN_i[12];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[14] & y_i[7];
  assign N1 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_000000_000008_000007_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[12];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[14] & y_i[7];
  assign N2 = SDN_i[13] & y_i[6];
  assign dot_vals[3] = ~N0;

endmodule



module bsg_mul_booth_4_block_000000_000000_000007_000008
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o;

  bsg_mul_comp42
  c
  (
    .i({ 1'b1, 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_rep_00000006_000000_080403_773310_804020
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [47:0] y_vec_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [5:1] ci_local;

  bsg_mul_booth_4_block_000000_000003_000000_000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_000000_000000_000001_000002
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_000000_000004_000003_000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_000000_000000_000003_000004
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_000000_000008_000007_000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_000000_000000_000007_000008
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(cl_o),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


endmodule



module bsg_mul_B4B_rep_00000006_00000000000023_32_000000_080403_773310_804020_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [48:41] y_pad;

  bsg_mul_booth_4_block_rep_00000006_000000_080403_773310_804020
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_pad[43:42], y_pad[45:44], y_pad[47:46], 1'b0, y_pad[48:48], y_pad[42:41], y_pad[44:43], y_pad[46:45], y_pad[48:47], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_pad[47:46], y_i[31:30], y_pad[42:41], y_pad[44:43], y_pad[46:45], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_i[29:28], y_i[31:30], y_pad[42:41], y_pad[44:43] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[48] = y_i[31] & signed_i;
  assign y_pad[47] = y_i[31] & signed_i;
  assign y_pad[46] = y_i[31] & signed_i;
  assign y_pad[45] = y_i[31] & signed_i;
  assign y_pad[44] = y_i[31] & signed_i;
  assign y_pad[43] = y_i[31] & signed_i;
  assign y_pad[42] = y_i[31] & signed_i;
  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_B4B_rep_rep_6_41_29231e160e0600_0_32_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [40:0] c_o;
  output [40:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [40:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_B4B_rep_00000006_00000000000000_32_080402_000000_80c8ec_000000_1
  rof_0__br
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[1]),
    .c_o(c_o[5:0]),
    .s_o(s_o[5:0])
  );


  bsg_mul_B4B_rep_00000008_00000000000006_32_00000000_00000000_00000000_00000000_1
  rof_1__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[1]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[2]),
    .c_o(c_o[13:6]),
    .s_o(s_o[13:6])
  );


  bsg_mul_B4B_rep_00000008_0000000000000e_32_00000000_00000000_00000000_00000000_1
  rof_2__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[2]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[3]),
    .c_o(c_o[21:14]),
    .s_o(s_o[21:14])
  );


  bsg_mul_B4B_rep_00000008_00000000000016_32_00000000_00000000_00000000_00000000_1
  rof_3__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[3]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[4]),
    .c_o(c_o[29:22]),
    .s_o(s_o[29:22])
  );


  bsg_mul_B4B_rep_00000005_0000000000001e_32_00000_00000_00000_00000_1
  rof_4__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[4]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[5]),
    .c_o(c_o[34:30]),
    .s_o(s_o[34:30])
  );


  bsg_mul_B4B_rep_00000006_00000000000023_32_000000_080403_773310_804020_1
  rof_5__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[5]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(cl_o),
    .c_o(c_o[40:35]),
    .s_o(s_o[40:35])
  );


endmodule



module bsg_and_00000006_1
(
  a_i,
  b_i,
  o
);

  input [5:0] a_i;
  input [5:0] b_i;
  output [5:0] o;
  wire [5:0] o;
  assign o[5] = a_i[5] & b_i[5];
  assign o[4] = a_i[4] & b_i[4];
  assign o[3] = a_i[3] & b_i[3];
  assign o[2] = a_i[2] & b_i[2];
  assign o[1] = a_i[1] & b_i[1];
  assign o[0] = a_i[0] & b_i[0];

endmodule



module bsg_and_00000008_1
(
  a_i,
  b_i,
  o
);

  input [7:0] a_i;
  input [7:0] b_i;
  output [7:0] o;
  wire [7:0] o;
  assign o[7] = a_i[7] & b_i[7];
  assign o[6] = a_i[6] & b_i[6];
  assign o[5] = a_i[5] & b_i[5];
  assign o[4] = a_i[4] & b_i[4];
  assign o[3] = a_i[3] & b_i[3];
  assign o[2] = a_i[2] & b_i[2];
  assign o[1] = a_i[1] & b_i[1];
  assign o[0] = a_i[0] & b_i[0];

endmodule



module bsg_and_00000007_1
(
  a_i,
  b_i,
  o
);

  input [6:0] a_i;
  input [6:0] b_i;
  output [6:0] o;
  wire [6:0] o;
  assign o[6] = a_i[6] & b_i[6];
  assign o[5] = a_i[5] & b_i[5];
  assign o[4] = a_i[4] & b_i[4];
  assign o[3] = a_i[3] & b_i[3];
  assign o[2] = a_i[2] & b_i[2];
  assign o[1] = a_i[1] & b_i[1];
  assign o[0] = a_i[0] & b_i[0];

endmodule



module bsg_mul_green_booth_dots_32_1_5_221b130b0500
(
  SDN_i,
  y_i,
  dot_o
);

  input [5:0] SDN_i;
  input [31:0] y_i;
  output [33:0] dot_o;
  wire [33:0] dot_o;
  assign dot_o[1] = 1'b0;
  assign dot_o[0] = SDN_i[0];

  bsg_and_00000006_1
  blk_1__macro_ba
  (
    .a_i({ SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5] }),
    .b_i(y_i[8:3]),
    .o(dot_o[10:5])
  );


  bsg_and_00000008_1
  blk_2__macro_ba
  (
    .a_i({ SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5] }),
    .b_i(y_i[16:9]),
    .o(dot_o[18:11])
  );


  bsg_and_00000008_1
  blk_3__macro_ba
  (
    .a_i({ SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5] }),
    .b_i(y_i[24:17]),
    .o(dot_o[26:19])
  );


  bsg_and_00000007_1
  blk_4__macro_ba
  (
    .a_i({ SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5], SDN_i[5:5] }),
    .b_i(y_i[31:25]),
    .o(dot_o[33:27])
  );

  assign dot_o[2] = SDN_i[5] & y_i[0];
  assign dot_o[3] = SDN_i[5] & y_i[1];
  assign dot_o[4] = SDN_i[5] & y_i[2];

endmodule



module bsg_mul_comp42_rep_00000000000008
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [31:0] i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [7:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[24:24], i[16:16], i[8:8], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[25:25], i[17:17], i[9:9], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[26:26], i[18:18], i[10:10], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[27:27], i[19:19], i[11:11], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[28:28], i[20:20], i[12:12], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[29:29], i[21:21], i[13:13], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_comp42
  rof_6__c
  (
    .i({ i[30:30], i[22:22], i[14:14], i[6:6] }),
    .cr_i(ci_local[6]),
    .cl_o(ci_local[7]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_comp42
  rof_7__c
  (
    .i({ i[31:31], i[23:23], i[15:15], i[7:7] }),
    .cr_i(ci_local[7]),
    .cl_o(cl_o),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


endmodule



module bsg_mul_comp42_rep_00000000000005
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [19:0] i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;
  wire [4:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[15:15], i[10:10], i[5:5], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[16:16], i[11:11], i[6:6], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[17:17], i[12:12], i[7:7], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[18:18], i[13:13], i[8:8], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[19:19], i[14:14], i[9:9], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(cl_o),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


endmodule



module bsg_mul_comp42_rep_00000000000006
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [23:0] i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [5:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[18:18], i[12:12], i[6:6], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[19:19], i[13:13], i[7:7], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[20:20], i[14:14], i[8:8], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[21:21], i[15:15], i[9:9], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[22:22], i[16:16], i[10:10], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[23:23], i[17:17], i[11:11], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(cl_o),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


endmodule



module bsg_mul_comp42_rep_rep_6_43_2b231d18100800
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [171:0] i;
  output [42:0] c_o;
  output [42:0] s_o;
  input cr_i;
  output cl_o;
  wire [42:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_comp42_rep_00000000000008
  rof_0__cr
  (
    .i({ i[136:129], i[93:86], i[50:43], i[7:0] }),
    .cr_i(cr_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_comp42_rep_00000000000008
  rof_1__cr
  (
    .i({ i[144:137], i[101:94], i[58:51], i[15:8] }),
    .cr_i(carries[1]),
    .cl_o(carries[2]),
    .c_o(c_o[15:8]),
    .s_o(s_o[15:8])
  );


  bsg_mul_comp42_rep_00000000000008
  rof_2__cr
  (
    .i({ i[152:145], i[109:102], i[66:59], i[23:16] }),
    .cr_i(carries[2]),
    .cl_o(carries[3]),
    .c_o(c_o[23:16]),
    .s_o(s_o[23:16])
  );


  bsg_mul_comp42_rep_00000000000005
  rof_3__cr
  (
    .i({ i[157:153], i[114:110], i[71:67], i[28:24] }),
    .cr_i(carries[3]),
    .cl_o(carries[4]),
    .c_o(c_o[28:24]),
    .s_o(s_o[28:24])
  );


  bsg_mul_comp42_rep_00000000000006
  rof_4__cr
  (
    .i({ i[163:158], i[120:115], i[77:72], i[34:29] }),
    .cr_i(carries[4]),
    .cl_o(carries[5]),
    .c_o(c_o[34:29]),
    .s_o(s_o[34:29])
  );


  bsg_mul_comp42_rep_00000000000008
  rof_5__cr
  (
    .i({ i[171:164], i[128:121], i[85:78], i[42:35] }),
    .cr_i(carries[5]),
    .cl_o(cl_o),
    .c_o(c_o[42:35]),
    .s_o(s_o[42:35])
  );


endmodule



module bsg_mul_booth_4_block_00000001_00000000_0000000e_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, 1'b0, SDN_i[0:0] }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_00000000_00000000_0000000f_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_00000002_00000000_0000000c_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [0:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, SDN_i[3:3], dot_vals[0:0] }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_0000000e_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [0:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, 1'b0, dot_vals[0:0] }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];

endmodule



module bsg_mul_booth_4_block_00000004_00000000_00000008_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [1:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, SDN_i[6:6], dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_0000000c_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [1:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, 1'b0, dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];

endmodule



module bsg_mul_booth_4_block_00000008_00000000_00000000_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [2:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ SDN_i[9:9], dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000008_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [2:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ 1'b0, dot_vals }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];

endmodule



module bsg_mul_booth_4_block_rep_00000008_08040201_00000000_80c8ecfe_00000000
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [63:0] y_vec_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [7:1] ci_local;

  bsg_mul_booth_4_block_00000001_00000000_0000000e_00000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_00000000_00000000_0000000f_00000000
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_00000002_00000000_0000000c_00000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_00000000_00000000_0000000e_00000000
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_00000004_00000000_00000008_00000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_00000000_00000000_0000000c_00000000
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_booth_4_block_00000008_00000000_00000000_00000000
  rof_6__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[6]),
    .y_i(y_vec_i[55:48]),
    .cl_o(ci_local[7]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000008_00000000
  rof_7__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[7]),
    .y_i(y_vec_i[63:56]),
    .cl_o(cl_o),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


endmodule



module bsg_mul_B4B_rep_00000008_000000fffffffe_32_08040201_00000000_80c8ecfe_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_08040201_00000000_80c8ecfe_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ 1'b0, 1'b0, y_i[1:0], y_i[3:2], y_i[5:4], 1'b0, 1'b0, y_i[0:0], 1'b0, y_i[2:1], y_i[4:3], 1'b0, 1'b0, 1'b0, 1'b0, y_i[1:0], y_i[3:2], 1'b0, 1'b0, 1'b0, 1'b0, y_i[0:0], 1'b0, y_i[2:1], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, y_i[1:0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, y_i[0:0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000100000006_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[7:6], y_i[9:8], y_i[11:10], y_i[13:12], y_i[6:5], y_i[8:7], y_i[10:9], y_i[12:11], y_i[5:4], y_i[7:6], y_i[9:8], y_i[11:10], y_i[4:3], y_i[6:5], y_i[8:7], y_i[10:9], y_i[3:2], y_i[5:4], y_i[7:6], y_i[9:8], y_i[2:1], y_i[4:3], y_i[6:5], y_i[8:7], y_i[1:0], y_i[3:2], y_i[5:4], y_i[7:6], y_i[0:0], 1'b0, y_i[2:1], y_i[4:3], y_i[6:5] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_0000010000000e_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[15:14], y_i[17:16], y_i[19:18], y_i[21:20], y_i[14:13], y_i[16:15], y_i[18:17], y_i[20:19], y_i[13:12], y_i[15:14], y_i[17:16], y_i[19:18], y_i[12:11], y_i[14:13], y_i[16:15], y_i[18:17], y_i[11:10], y_i[13:12], y_i[15:14], y_i[17:16], y_i[10:9], y_i[12:11], y_i[14:13], y_i[16:15], y_i[9:8], y_i[11:10], y_i[13:12], y_i[15:14], y_i[8:7], y_i[10:9], y_i[12:11], y_i[14:13] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000005_00000100000016_32_00000_00000_00000_00000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000005_00000_00000_00000_00000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[20:19], y_i[22:21], y_i[24:23], y_i[26:25], y_i[19:18], y_i[21:20], y_i[23:22], y_i[25:24], y_i[18:17], y_i[20:19], y_i[22:21], y_i[24:23], y_i[17:16], y_i[19:18], y_i[21:20], y_i[23:22], y_i[16:15], y_i[18:17], y_i[20:19], y_i[22:21] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_000000_000000_000000_000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[0] = N2 ^ SDN_i[3];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[5] & y_i[1];
  assign N1 = SDN_i[4] & y_i[0];
  assign dot_vals[1] = N5 ^ SDN_i[6];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[8] & y_i[3];
  assign N4 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N8 ^ SDN_i[9];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[11] & y_i[5];
  assign N7 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N11 ^ SDN_i[12];
  assign N11 = N9 | N10;
  assign N9 = SDN_i[14] & y_i[7];
  assign N10 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_rep_00000006_000000_000000_000000_000000
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [47:0] y_vec_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [5:1] ci_local;

  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_000000_000000_000000_000000
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(cl_o),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


endmodule



module bsg_mul_B4B_rep_00000006_0000010000001b_32_000000_000000_000000_000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [41:41] y_pad;

  bsg_mul_booth_4_block_rep_00000006_000000_000000_000000_000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[26:25], y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_i[25:24], y_i[27:26], y_i[29:28], y_i[31:30], y_i[24:23], y_i[26:25], y_i[28:27], y_i[30:29], y_i[23:22], y_i[25:24], y_i[27:26], y_i[29:28], y_i[22:21], y_i[24:23], y_i[26:25], y_i[28:27], y_i[21:20], y_i[23:22], y_i[25:24], y_i[27:26] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_booth_4_block_00000000_00000001_00000000_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[3];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[5] & y_i[1];
  assign N2 = SDN_i[4] & y_i[0];
  assign dot_vals[0] = ~N0;
  assign dot_vals[1] = N6 ^ SDN_i[6];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[8] & y_i[3];
  assign N5 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N9 ^ SDN_i[9];
  assign N9 = N7 | N8;
  assign N7 = SDN_i[11] & y_i[5];
  assign N8 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N12 ^ SDN_i[12];
  assign N12 = N10 | N11;
  assign N10 = SDN_i[14] & y_i[7];
  assign N11 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000000_00000001
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [3:1] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b1 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[1] = N2 ^ SDN_i[6];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[8] & y_i[3];
  assign N1 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N5 ^ SDN_i[9];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[11] & y_i[5];
  assign N4 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N8 ^ SDN_i[12];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[14] & y_i[7];
  assign N7 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000002_00000001_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9;
  wire [3:1] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[6];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[8] & y_i[3];
  assign N2 = SDN_i[7] & y_i[2];
  assign dot_vals[1] = ~N0;
  assign dot_vals[2] = N6 ^ SDN_i[9];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[11] & y_i[5];
  assign N5 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N9 ^ SDN_i[12];
  assign N9 = N7 | N8;
  assign N7 = SDN_i[14] & y_i[7];
  assign N8 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000001_00000002
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b1, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[2] = N2 ^ SDN_i[9];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[11] & y_i[5];
  assign N1 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N5 ^ SDN_i[12];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[14] & y_i[7];
  assign N4 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000004_00000003_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[9];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[11] & y_i[5];
  assign N2 = SDN_i[10] & y_i[4];
  assign dot_vals[2] = ~N0;
  assign dot_vals[3] = N6 ^ SDN_i[12];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[14] & y_i[7];
  assign N5 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000003_00000004
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b1, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[3] = N2 ^ SDN_i[12];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[14] & y_i[7];
  assign N1 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_00000000_00000008_00000007_00000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[12];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[14] & y_i[7];
  assign N2 = SDN_i[13] & y_i[6];
  assign dot_vals[3] = ~N0;

endmodule



module bsg_mul_booth_4_block_00000000_00000000_00000007_00000008
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o;

  bsg_mul_comp42
  c
  (
    .i({ 1'b1, 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_rep_00000008_00000000_08040201_77331100_80402010
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [63:0] y_vec_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [7:1] ci_local;

  bsg_mul_booth_4_block_00000000_00000001_00000000_00000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000000_00000001
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_00000000_00000002_00000001_00000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000001_00000002
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_00000000_00000004_00000003_00000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000003_00000004
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_booth_4_block_00000000_00000008_00000007_00000000
  rof_6__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[6]),
    .y_i(y_vec_i[55:48]),
    .cl_o(ci_local[7]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_booth_4_block_00000000_00000000_00000007_00000008
  rof_7__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[7]),
    .y_i(y_vec_i[63:56]),
    .cl_o(cl_o),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000100000021_32_00000000_08040201_77331100_80402010_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [48:41] y_pad;

  bsg_mul_booth_4_block_rep_00000008_00000000_08040201_77331100_80402010
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_pad[43:42], y_pad[45:44], y_pad[47:46], 1'b0, y_pad[48:48], y_pad[42:41], y_pad[44:43], y_pad[46:45], y_pad[48:47], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_pad[47:46], y_i[31:30], y_pad[42:41], y_pad[44:43], y_pad[46:45], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_i[29:28], y_i[31:30], y_pad[42:41], y_pad[44:43], y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_i[27:26], y_i[29:28], y_i[31:30], y_pad[42:41] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[48] = y_i[31] & signed_i;
  assign y_pad[47] = y_i[31] & signed_i;
  assign y_pad[46] = y_i[31] & signed_i;
  assign y_pad[45] = y_i[31] & signed_i;
  assign y_pad[44] = y_i[31] & signed_i;
  assign y_pad[43] = y_i[31] & signed_i;
  assign y_pad[42] = y_i[31] & signed_i;
  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_B4B_rep_rep_6_43_2b231d18100800_n2_32_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [42:0] c_o;
  output [42:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [42:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_B4B_rep_00000008_000000fffffffe_32_08040201_00000000_80c8ecfe_00000000_1
  rof_0__br
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_B4B_rep_00000008_00000100000006_32_00000000_00000000_00000000_00000000_1
  rof_1__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[1]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[2]),
    .c_o(c_o[15:8]),
    .s_o(s_o[15:8])
  );


  bsg_mul_B4B_rep_00000008_0000010000000e_32_00000000_00000000_00000000_00000000_1
  rof_2__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[2]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[3]),
    .c_o(c_o[23:16]),
    .s_o(s_o[23:16])
  );


  bsg_mul_B4B_rep_00000005_00000100000016_32_00000_00000_00000_00000_1
  rof_3__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[3]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[4]),
    .c_o(c_o[28:24]),
    .s_o(s_o[28:24])
  );


  bsg_mul_B4B_rep_00000006_0000010000001b_32_000000_000000_000000_000000_1
  rof_4__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[4]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[5]),
    .c_o(c_o[34:29]),
    .s_o(s_o[34:29])
  );


  bsg_mul_B4B_rep_00000008_00000100000021_32_00000000_08040201_77331100_80402010_1
  rof_5__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[5]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(cl_o),
    .c_o(c_o[42:35]),
    .s_o(s_o[42:35])
  );


endmodule



module bsg_mul_comp42_rep_0000000000000008
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [31:0] i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [7:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[24:24], i[16:16], i[8:8], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[25:25], i[17:17], i[9:9], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[26:26], i[18:18], i[10:10], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[27:27], i[19:19], i[11:11], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[28:28], i[20:20], i[12:12], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[29:29], i[21:21], i[13:13], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_comp42
  rof_6__c
  (
    .i({ i[30:30], i[22:22], i[14:14], i[6:6] }),
    .cr_i(ci_local[6]),
    .cl_o(ci_local[7]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_comp42
  rof_7__c
  (
    .i({ i[31:31], i[23:23], i[15:15], i[7:7] }),
    .cr_i(ci_local[7]),
    .cl_o(cl_o),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


endmodule



module bsg_mul_comp42_rep_0000000000000005
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [19:0] i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;
  wire [4:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[15:15], i[10:10], i[5:5], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[16:16], i[11:11], i[6:6], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[17:17], i[12:12], i[7:7], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[18:18], i[13:13], i[8:8], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[19:19], i[14:14], i[9:9], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(cl_o),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


endmodule



module bsg_mul_comp42_rep_0000000000000006
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [23:0] i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;
  wire [5:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[18:18], i[12:12], i[6:6], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[19:19], i[13:13], i[7:7], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[20:20], i[14:14], i[8:8], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[21:21], i[15:15], i[9:9], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[22:22], i[16:16], i[10:10], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[23:23], i[17:17], i[11:11], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(cl_o),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


endmodule



module bsg_mul_comp42_rep_0000000000000007
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [27:0] i;
  output [6:0] c_o;
  output [6:0] s_o;
  input cr_i;
  output cl_o;
  wire [6:0] c_o,s_o;
  wire cl_o;
  wire [6:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[21:21], i[14:14], i[7:7], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[22:22], i[15:15], i[8:8], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[23:23], i[16:16], i[9:9], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[24:24], i[17:17], i[10:10], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[25:25], i[18:18], i[11:11], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[26:26], i[19:19], i[12:12], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_comp42
  rof_6__c
  (
    .i({ i[27:27], i[20:20], i[13:13], i[6:6] }),
    .cr_i(ci_local[6]),
    .cl_o(cl_o),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


endmodule



module bsg_mul_comp42_rep_rep_7_50_322b231b15100800
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [199:0] i;
  output [49:0] c_o;
  output [49:0] s_o;
  input cr_i;
  output cl_o;
  wire [49:0] c_o,s_o;
  wire cl_o;
  wire [6:1] carries;

  bsg_mul_comp42_rep_0000000000000008
  rof_0__cr
  (
    .i({ i[157:150], i[107:100], i[57:50], i[7:0] }),
    .cr_i(cr_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_comp42_rep_0000000000000008
  rof_1__cr
  (
    .i({ i[165:158], i[115:108], i[65:58], i[15:8] }),
    .cr_i(carries[1]),
    .cl_o(carries[2]),
    .c_o(c_o[15:8]),
    .s_o(s_o[15:8])
  );


  bsg_mul_comp42_rep_0000000000000005
  rof_2__cr
  (
    .i({ i[170:166], i[120:116], i[70:66], i[20:16] }),
    .cr_i(carries[2]),
    .cl_o(carries[3]),
    .c_o(c_o[20:16]),
    .s_o(s_o[20:16])
  );


  bsg_mul_comp42_rep_0000000000000006
  rof_3__cr
  (
    .i({ i[176:171], i[126:121], i[76:71], i[26:21] }),
    .cr_i(carries[3]),
    .cl_o(carries[4]),
    .c_o(c_o[26:21]),
    .s_o(s_o[26:21])
  );


  bsg_mul_comp42_rep_0000000000000008
  rof_4__cr
  (
    .i({ i[184:177], i[134:127], i[84:77], i[34:27] }),
    .cr_i(carries[4]),
    .cl_o(carries[5]),
    .c_o(c_o[34:27]),
    .s_o(s_o[34:27])
  );


  bsg_mul_comp42_rep_0000000000000008
  rof_5__cr
  (
    .i({ i[192:185], i[142:135], i[92:85], i[42:35] }),
    .cr_i(carries[5]),
    .cl_o(carries[6]),
    .c_o(c_o[42:35]),
    .s_o(s_o[42:35])
  );


  bsg_mul_comp42_rep_0000000000000007
  rof_6__cr
  (
    .i({ i[199:193], i[149:143], i[99:93], i[49:43] }),
    .cr_i(carries[6]),
    .cl_o(cl_o),
    .c_o(c_o[49:43]),
    .s_o(s_o[49:43])
  );


endmodule



module bsg_transpose_width_p50_els_p2
(
  i,
  o
);

  input [99:0] i;
  output [99:0] o;
  wire [99:0] o;
  assign o[99] = i[99];
  assign o[98] = i[49];
  assign o[97] = i[98];
  assign o[96] = i[48];
  assign o[95] = i[97];
  assign o[94] = i[47];
  assign o[93] = i[96];
  assign o[92] = i[46];
  assign o[91] = i[95];
  assign o[90] = i[45];
  assign o[89] = i[94];
  assign o[88] = i[44];
  assign o[87] = i[93];
  assign o[86] = i[43];
  assign o[85] = i[92];
  assign o[84] = i[42];
  assign o[83] = i[91];
  assign o[82] = i[41];
  assign o[81] = i[90];
  assign o[80] = i[40];
  assign o[79] = i[89];
  assign o[78] = i[39];
  assign o[77] = i[88];
  assign o[76] = i[38];
  assign o[75] = i[87];
  assign o[74] = i[37];
  assign o[73] = i[86];
  assign o[72] = i[36];
  assign o[71] = i[85];
  assign o[70] = i[35];
  assign o[69] = i[84];
  assign o[68] = i[34];
  assign o[67] = i[83];
  assign o[66] = i[33];
  assign o[65] = i[82];
  assign o[64] = i[32];
  assign o[63] = i[81];
  assign o[62] = i[31];
  assign o[61] = i[80];
  assign o[60] = i[30];
  assign o[59] = i[79];
  assign o[58] = i[29];
  assign o[57] = i[78];
  assign o[56] = i[28];
  assign o[55] = i[77];
  assign o[54] = i[27];
  assign o[53] = i[76];
  assign o[52] = i[26];
  assign o[51] = i[75];
  assign o[50] = i[25];
  assign o[49] = i[74];
  assign o[48] = i[24];
  assign o[47] = i[73];
  assign o[46] = i[23];
  assign o[45] = i[72];
  assign o[44] = i[22];
  assign o[43] = i[71];
  assign o[42] = i[21];
  assign o[41] = i[70];
  assign o[40] = i[20];
  assign o[39] = i[69];
  assign o[38] = i[19];
  assign o[37] = i[68];
  assign o[36] = i[18];
  assign o[35] = i[67];
  assign o[34] = i[17];
  assign o[33] = i[66];
  assign o[32] = i[16];
  assign o[31] = i[65];
  assign o[30] = i[15];
  assign o[29] = i[64];
  assign o[28] = i[14];
  assign o[27] = i[63];
  assign o[26] = i[13];
  assign o[25] = i[62];
  assign o[24] = i[12];
  assign o[23] = i[61];
  assign o[22] = i[11];
  assign o[21] = i[60];
  assign o[20] = i[10];
  assign o[19] = i[59];
  assign o[18] = i[9];
  assign o[17] = i[58];
  assign o[16] = i[8];
  assign o[15] = i[57];
  assign o[14] = i[7];
  assign o[13] = i[56];
  assign o[12] = i[6];
  assign o[11] = i[55];
  assign o[10] = i[5];
  assign o[9] = i[54];
  assign o[8] = i[4];
  assign o[7] = i[53];
  assign o[6] = i[3];
  assign o[5] = i[52];
  assign o[4] = i[2];
  assign o[3] = i[51];
  assign o[2] = i[1];
  assign o[1] = i[50];
  assign o[0] = i[0];

endmodule



module bsg_dff_en_00000010_1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [15:0] data_i;
  output [15:0] data_o;
  input clk_i;
  input en_i;
  reg [15:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[15:0] } <= { data_i[15:0] };
    end 
  end


endmodule



module bsg_dff_en_0000000a_1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [9:0] data_i;
  output [9:0] data_o;
  input clk_i;
  input en_i;
  reg [9:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[9:0] } <= { data_i[9:0] };
    end 
  end


endmodule



module bsg_dff_en_0000000c_1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [11:0] data_i;
  output [11:0] data_o;
  input clk_i;
  input en_i;
  reg [11:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[11:0] } <= { data_i[11:0] };
    end 
  end


endmodule



module bsg_dff_en_0000000e_1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [13:0] data_i;
  output [13:0] data_o;
  input clk_i;
  input en_i;
  reg [13:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[13:0] } <= { data_i[13:0] };
    end 
  end


endmodule



module bsg_dff_en_rep_rep_7_100_645646362a201000_1
(
  clk_i,
  en_i,
  data_i,
  data_o
);

  input [99:0] data_i;
  output [99:0] data_o;
  input clk_i;
  input en_i;
  wire [99:0] data_o;

  bsg_dff_en_00000010_1
  rof_0__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[15:0]),
    .en_i(en_i),
    .data_o(data_o[15:0])
  );


  bsg_dff_en_00000010_1
  rof_1__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[31:16]),
    .en_i(en_i),
    .data_o(data_o[31:16])
  );


  bsg_dff_en_0000000a_1
  rof_2__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[41:32]),
    .en_i(en_i),
    .data_o(data_o[41:32])
  );


  bsg_dff_en_0000000c_1
  rof_3__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[53:42]),
    .en_i(en_i),
    .data_o(data_o[53:42])
  );


  bsg_dff_en_00000010_1
  rof_4__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[69:54]),
    .en_i(en_i),
    .data_o(data_o[69:54])
  );


  bsg_dff_en_00000010_1
  rof_5__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[85:70]),
    .en_i(en_i),
    .data_o(data_o[85:70])
  );


  bsg_dff_en_0000000e_1
  rof_6__bde
  (
    .clk_i(clk_i),
    .data_i(data_i[99:86]),
    .en_i(en_i),
    .data_o(data_o[99:86])
  );


endmodule



module bsg_transpose_width_p2_els_p50
(
  i,
  o
);

  input [99:0] i;
  output [99:0] o;
  wire [99:0] o;
  assign o[99] = i[99];
  assign o[98] = i[97];
  assign o[97] = i[95];
  assign o[96] = i[93];
  assign o[95] = i[91];
  assign o[94] = i[89];
  assign o[93] = i[87];
  assign o[92] = i[85];
  assign o[91] = i[83];
  assign o[90] = i[81];
  assign o[89] = i[79];
  assign o[88] = i[77];
  assign o[87] = i[75];
  assign o[86] = i[73];
  assign o[85] = i[71];
  assign o[84] = i[69];
  assign o[83] = i[67];
  assign o[82] = i[65];
  assign o[81] = i[63];
  assign o[80] = i[61];
  assign o[79] = i[59];
  assign o[78] = i[57];
  assign o[77] = i[55];
  assign o[76] = i[53];
  assign o[75] = i[51];
  assign o[74] = i[49];
  assign o[73] = i[47];
  assign o[72] = i[45];
  assign o[71] = i[43];
  assign o[70] = i[41];
  assign o[69] = i[39];
  assign o[68] = i[37];
  assign o[67] = i[35];
  assign o[66] = i[33];
  assign o[65] = i[31];
  assign o[64] = i[29];
  assign o[63] = i[27];
  assign o[62] = i[25];
  assign o[61] = i[23];
  assign o[60] = i[21];
  assign o[59] = i[19];
  assign o[58] = i[17];
  assign o[57] = i[15];
  assign o[56] = i[13];
  assign o[55] = i[11];
  assign o[54] = i[9];
  assign o[53] = i[7];
  assign o[52] = i[5];
  assign o[51] = i[3];
  assign o[50] = i[1];
  assign o[49] = i[98];
  assign o[48] = i[96];
  assign o[47] = i[94];
  assign o[46] = i[92];
  assign o[45] = i[90];
  assign o[44] = i[88];
  assign o[43] = i[86];
  assign o[42] = i[84];
  assign o[41] = i[82];
  assign o[40] = i[80];
  assign o[39] = i[78];
  assign o[38] = i[76];
  assign o[37] = i[74];
  assign o[36] = i[72];
  assign o[35] = i[70];
  assign o[34] = i[68];
  assign o[33] = i[66];
  assign o[32] = i[64];
  assign o[31] = i[62];
  assign o[30] = i[60];
  assign o[29] = i[58];
  assign o[28] = i[56];
  assign o[27] = i[54];
  assign o[26] = i[52];
  assign o[25] = i[50];
  assign o[24] = i[48];
  assign o[23] = i[46];
  assign o[22] = i[44];
  assign o[21] = i[42];
  assign o[20] = i[40];
  assign o[19] = i[38];
  assign o[18] = i[36];
  assign o[17] = i[34];
  assign o[16] = i[32];
  assign o[15] = i[30];
  assign o[14] = i[28];
  assign o[13] = i[26];
  assign o[12] = i[24];
  assign o[11] = i[22];
  assign o[10] = i[20];
  assign o[9] = i[18];
  assign o[8] = i[16];
  assign o[7] = i[14];
  assign o[6] = i[12];
  assign o[5] = i[10];
  assign o[4] = i[8];
  assign o[3] = i[6];
  assign o[2] = i[4];
  assign o[1] = i[2];
  assign o[0] = i[0];

endmodule



module bsg_mul_B4B_rep_00000005_0000010000000e_32_00000_00000_00000_00000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000005_00000_00000_00000_00000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[12:11], y_i[14:13], y_i[16:15], y_i[18:17], y_i[11:10], y_i[13:12], y_i[15:14], y_i[17:16], y_i[10:9], y_i[12:11], y_i[14:13], y_i[16:15], y_i[9:8], y_i[11:10], y_i[13:12], y_i[15:14], y_i[8:7], y_i[10:9], y_i[12:11], y_i[14:13] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000006_00000100000013_32_000000_000000_000000_000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000006_000000_000000_000000_000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[18:17], y_i[20:19], y_i[22:21], y_i[24:23], y_i[17:16], y_i[19:18], y_i[21:20], y_i[23:22], y_i[16:15], y_i[18:17], y_i[20:19], y_i[22:21], y_i[15:14], y_i[17:16], y_i[19:18], y_i[21:20], y_i[14:13], y_i[16:15], y_i[18:17], y_i[20:19], y_i[13:12], y_i[15:14], y_i[17:16], y_i[19:18] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000100000019_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;
  wire [41:41] y_pad;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[26:25], y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_i[25:24], y_i[27:26], y_i[29:28], y_i[31:30], y_i[24:23], y_i[26:25], y_i[28:27], y_i[30:29], y_i[23:22], y_i[25:24], y_i[27:26], y_i[29:28], y_i[22:21], y_i[24:23], y_i[26:25], y_i[28:27], y_i[21:20], y_i[23:22], y_i[25:24], y_i[27:26], y_i[20:19], y_i[22:21], y_i[24:23], y_i[26:25], y_i[19:18], y_i[21:20], y_i[23:22], y_i[25:24] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_B4B_rep_rep_6_43_2b231b15100800_n2_32_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [42:0] c_o;
  output [42:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [42:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_B4B_rep_00000008_000000fffffffe_32_08040201_00000000_80c8ecfe_00000000_1
  rof_0__br
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_B4B_rep_00000008_00000100000006_32_00000000_00000000_00000000_00000000_1
  rof_1__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[1]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[2]),
    .c_o(c_o[15:8]),
    .s_o(s_o[15:8])
  );


  bsg_mul_B4B_rep_00000005_0000010000000e_32_00000_00000_00000_00000_1
  rof_2__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[2]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[3]),
    .c_o(c_o[20:16]),
    .s_o(s_o[20:16])
  );


  bsg_mul_B4B_rep_00000006_00000100000013_32_000000_000000_000000_000000_1
  rof_3__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[3]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[4]),
    .c_o(c_o[26:21]),
    .s_o(s_o[26:21])
  );


  bsg_mul_B4B_rep_00000008_00000100000019_32_00000000_00000000_00000000_00000000_1
  rof_4__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[4]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[5]),
    .c_o(c_o[34:27]),
    .s_o(s_o[34:27])
  );


  bsg_mul_B4B_rep_00000008_00000100000021_32_00000000_08040201_77331100_80402010_1
  rof_5__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[5]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(cl_o),
    .c_o(c_o[42:35]),
    .s_o(s_o[42:35])
  );


endmodule



module bsg_mul_comp42_rep_00000000000007
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [27:0] i;
  output [6:0] c_o;
  output [6:0] s_o;
  input cr_i;
  output cl_o;
  wire [6:0] c_o,s_o;
  wire cl_o;
  wire [6:1] ci_local;

  bsg_mul_comp42
  rof_0__c
  (
    .i({ i[21:21], i[14:14], i[7:7], i[0:0] }),
    .cr_i(cr_i),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_comp42
  rof_1__c
  (
    .i({ i[22:22], i[15:15], i[8:8], i[1:1] }),
    .cr_i(ci_local[1]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_comp42
  rof_2__c
  (
    .i({ i[23:23], i[16:16], i[9:9], i[2:2] }),
    .cr_i(ci_local[2]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_comp42
  rof_3__c
  (
    .i({ i[24:24], i[17:17], i[10:10], i[3:3] }),
    .cr_i(ci_local[3]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_comp42
  rof_4__c
  (
    .i({ i[25:25], i[18:18], i[11:11], i[4:4] }),
    .cr_i(ci_local[4]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_comp42
  rof_5__c
  (
    .i({ i[26:26], i[19:19], i[12:12], i[5:5] }),
    .cr_i(ci_local[5]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_comp42
  rof_6__c
  (
    .i({ i[27:27], i[20:20], i[13:13], i[6:6] }),
    .cr_i(ci_local[6]),
    .cl_o(cl_o),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


endmodule



module bsg_mul_comp42_rep_rep_6_42_2a231b130d0800
(
  i,
  cr_i,
  cl_o,
  c_o,
  s_o
);

  input [167:0] i;
  output [41:0] c_o;
  output [41:0] s_o;
  input cr_i;
  output cl_o;
  wire [41:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_comp42_rep_00000000000008
  rof_0__cr
  (
    .i({ i[133:126], i[91:84], i[49:42], i[7:0] }),
    .cr_i(cr_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_comp42_rep_00000000000005
  rof_1__cr
  (
    .i({ i[138:134], i[96:92], i[54:50], i[12:8] }),
    .cr_i(carries[1]),
    .cl_o(carries[2]),
    .c_o(c_o[12:8]),
    .s_o(s_o[12:8])
  );


  bsg_mul_comp42_rep_00000000000006
  rof_2__cr
  (
    .i({ i[144:139], i[102:97], i[60:55], i[18:13] }),
    .cr_i(carries[2]),
    .cl_o(carries[3]),
    .c_o(c_o[18:13]),
    .s_o(s_o[18:13])
  );


  bsg_mul_comp42_rep_00000000000008
  rof_3__cr
  (
    .i({ i[152:145], i[110:103], i[68:61], i[26:19] }),
    .cr_i(carries[3]),
    .cl_o(carries[4]),
    .c_o(c_o[26:19]),
    .s_o(s_o[26:19])
  );


  bsg_mul_comp42_rep_00000000000008
  rof_4__cr
  (
    .i({ i[160:153], i[118:111], i[76:69], i[34:27] }),
    .cr_i(carries[4]),
    .cl_o(carries[5]),
    .c_o(c_o[34:27]),
    .s_o(s_o[34:27])
  );


  bsg_mul_comp42_rep_00000000000007
  rof_5__cr
  (
    .i({ i[167:161], i[125:119], i[83:77], i[41:35] }),
    .cr_i(carries[5]),
    .cl_o(cl_o),
    .c_o(c_o[41:35]),
    .s_o(s_o[41:35])
  );


endmodule



module bsg_mul_B4B_rep_00000005_00000100000006_32_00000_00000_00000_00000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [4:0] c_o;
  output [4:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [4:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000005_00000_00000_00000_00000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[4:3], y_i[6:5], y_i[8:7], y_i[10:9], y_i[3:2], y_i[5:4], y_i[7:6], y_i[9:8], y_i[2:1], y_i[4:3], y_i[6:5], y_i[8:7], y_i[1:0], y_i[3:2], y_i[5:4], y_i[7:6], y_i[0:0], 1'b0, y_i[2:1], y_i[4:3], y_i[6:5] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000006_0000010000000b_32_000000_000000_000000_000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [5:0] c_o;
  output [5:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [5:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000006_000000_000000_000000_000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[10:9], y_i[12:11], y_i[14:13], y_i[16:15], y_i[9:8], y_i[11:10], y_i[13:12], y_i[15:14], y_i[8:7], y_i[10:9], y_i[12:11], y_i[14:13], y_i[7:6], y_i[9:8], y_i[11:10], y_i[13:12], y_i[6:5], y_i[8:7], y_i[10:9], y_i[12:11], y_i[5:4], y_i[7:6], y_i[9:8], y_i[11:10] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_B4B_rep_00000008_00000100000011_32_00000000_00000000_00000000_00000000_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [7:0] c_o;
  output [7:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [7:0] c_o,s_o;
  wire cl_o;

  bsg_mul_booth_4_block_rep_00000008_00000000_00000000_00000000_00000000
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_i[18:17], y_i[20:19], y_i[22:21], y_i[24:23], y_i[17:16], y_i[19:18], y_i[21:20], y_i[23:22], y_i[16:15], y_i[18:17], y_i[20:19], y_i[22:21], y_i[15:14], y_i[17:16], y_i[19:18], y_i[21:20], y_i[14:13], y_i[16:15], y_i[18:17], y_i[20:19], y_i[13:12], y_i[15:14], y_i[17:16], y_i[19:18], y_i[12:11], y_i[14:13], y_i[16:15], y_i[18:17], y_i[11:10], y_i[13:12], y_i[15:14], y_i[17:16] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );


endmodule



module bsg_mul_booth_4_block_0000000_0000001_0000000_0000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12;
  wire [3:0] dot_vals;

  bsg_mul_comp42
  c
  (
    .i(dot_vals),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[3];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[5] & y_i[1];
  assign N2 = SDN_i[4] & y_i[0];
  assign dot_vals[0] = ~N0;
  assign dot_vals[1] = N6 ^ SDN_i[6];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[8] & y_i[3];
  assign N5 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N9 ^ SDN_i[9];
  assign N9 = N7 | N8;
  assign N7 = SDN_i[11] & y_i[5];
  assign N8 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N12 ^ SDN_i[12];
  assign N12 = N10 | N11;
  assign N10 = SDN_i[14] & y_i[7];
  assign N11 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000000_0000000_0000001
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8;
  wire [3:1] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b1 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[1] = N2 ^ SDN_i[6];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[8] & y_i[3];
  assign N1 = SDN_i[7] & y_i[2];
  assign dot_vals[2] = N5 ^ SDN_i[9];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[11] & y_i[5];
  assign N4 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N8 ^ SDN_i[12];
  assign N8 = N6 | N7;
  assign N6 = SDN_i[14] & y_i[7];
  assign N7 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000002_0000001_0000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9;
  wire [3:1] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[6];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[8] & y_i[3];
  assign N2 = SDN_i[7] & y_i[2];
  assign dot_vals[1] = ~N0;
  assign dot_vals[2] = N6 ^ SDN_i[9];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[11] & y_i[5];
  assign N5 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N9 ^ SDN_i[12];
  assign N9 = N7 | N8;
  assign N7 = SDN_i[14] & y_i[7];
  assign N8 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000000_0000001_0000002
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b1, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[2] = N2 ^ SDN_i[9];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[11] & y_i[5];
  assign N1 = SDN_i[10] & y_i[4];
  assign dot_vals[3] = N5 ^ SDN_i[12];
  assign N5 = N3 | N4;
  assign N3 = SDN_i[14] & y_i[7];
  assign N4 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000004_0000003_0000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3,N4,N5,N6;
  wire [3:2] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[9];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[11] & y_i[5];
  assign N2 = SDN_i[10] & y_i[4];
  assign dot_vals[2] = ~N0;
  assign dot_vals[3] = N6 ^ SDN_i[12];
  assign N6 = N4 | N5;
  assign N4 = SDN_i[14] & y_i[7];
  assign N5 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000000_0000003_0000004
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b1, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign dot_vals[3] = N2 ^ SDN_i[12];
  assign N2 = N0 | N1;
  assign N0 = SDN_i[14] & y_i[7];
  assign N1 = SDN_i[13] & y_i[6];

endmodule



module bsg_mul_booth_4_block_0000000_0000008_0000007_0000000
(
  SDN_i,
  cr_i,
  y_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [7:0] y_i;
  input cr_i;
  output cl_o;
  output c_o;
  output s_o;
  wire cl_o,c_o,s_o,N0,N1,N2,N3;
  wire [3:3] dot_vals;

  bsg_mul_comp42
  c
  (
    .i({ dot_vals[3:3], 1'b0, 1'b0, 1'b0 }),
    .cr_i(cr_i),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign N0 = N3 ^ SDN_i[12];
  assign N3 = N1 | N2;
  assign N1 = SDN_i[14] & y_i[7];
  assign N2 = SDN_i[13] & y_i[6];
  assign dot_vals[3] = ~N0;

endmodule



module bsg_mul_booth_4_block_rep_00000007_0000000_8040201_7331100_0402010
(
  SDN_i,
  cr_i,
  y_vec_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [55:0] y_vec_i;
  output [6:0] c_o;
  output [6:0] s_o;
  input cr_i;
  output cl_o;
  wire [6:0] c_o,s_o;
  wire cl_o;
  wire [6:1] ci_local;

  bsg_mul_booth_4_block_0000000_0000001_0000000_0000000
  rof_0__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_vec_i[7:0]),
    .cl_o(ci_local[1]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_booth_4_block_0000000_0000000_0000000_0000001
  rof_1__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[1]),
    .y_i(y_vec_i[15:8]),
    .cl_o(ci_local[2]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_booth_4_block_0000000_0000002_0000001_0000000
  rof_2__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[2]),
    .y_i(y_vec_i[23:16]),
    .cl_o(ci_local[3]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_booth_4_block_0000000_0000000_0000001_0000002
  rof_3__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[3]),
    .y_i(y_vec_i[31:24]),
    .cl_o(ci_local[4]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_booth_4_block_0000000_0000004_0000003_0000000
  rof_4__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[4]),
    .y_i(y_vec_i[39:32]),
    .cl_o(ci_local[5]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_booth_4_block_0000000_0000000_0000003_0000004
  rof_5__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[5]),
    .y_i(y_vec_i[47:40]),
    .cl_o(ci_local[6]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_booth_4_block_0000000_0000008_0000007_0000000
  rof_6__b4b
  (
    .SDN_i(SDN_i),
    .cr_i(ci_local[6]),
    .y_i(y_vec_i[55:48]),
    .cl_o(cl_o),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


endmodule



module bsg_mul_B4B_rep_00000007_00000100000021_32_0000000_8040201_7331100_0402010_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [6:0] c_o;
  output [6:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [6:0] c_o,s_o;
  wire cl_o;
  wire [48:41] y_pad;

  bsg_mul_booth_4_block_rep_00000007_0000000_8040201_7331100_0402010
  bb4bh
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_vec_i({ y_pad[42:41], y_pad[44:43], y_pad[46:45], y_pad[48:47], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_pad[47:46], y_i[31:30], y_pad[42:41], y_pad[44:43], y_pad[46:45], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_pad[45:44], y_i[29:28], y_i[31:30], y_pad[42:41], y_pad[44:43], y_i[28:27], y_i[30:29], y_pad[41:41], y_i[31:31], y_pad[43:42], y_i[27:26], y_i[29:28], y_i[31:30], y_pad[42:41] }),
    .cl_o(cl_o),
    .c_o(c_o),
    .s_o(s_o)
  );

  assign y_pad[48] = y_i[31] & signed_i;
  assign y_pad[47] = y_i[31] & signed_i;
  assign y_pad[46] = y_i[31] & signed_i;
  assign y_pad[45] = y_i[31] & signed_i;
  assign y_pad[44] = y_i[31] & signed_i;
  assign y_pad[43] = y_i[31] & signed_i;
  assign y_pad[42] = y_i[31] & signed_i;
  assign y_pad[41] = y_i[31] & signed_i;

endmodule



module bsg_mul_B4B_rep_rep_6_42_2a231b130d0800_n2_32_1
(
  SDN_i,
  cr_i,
  y_i,
  signed_i,
  cl_o,
  c_o,
  s_o
);

  input [14:0] SDN_i;
  input [31:0] y_i;
  output [41:0] c_o;
  output [41:0] s_o;
  input cr_i;
  input signed_i;
  output cl_o;
  wire [41:0] c_o,s_o;
  wire cl_o;
  wire [5:1] carries;

  bsg_mul_B4B_rep_00000008_000000fffffffe_32_08040201_00000000_80c8ecfe_00000000_1
  rof_0__br
  (
    .SDN_i(SDN_i),
    .cr_i(cr_i),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[1]),
    .c_o(c_o[7:0]),
    .s_o(s_o[7:0])
  );


  bsg_mul_B4B_rep_00000005_00000100000006_32_00000_00000_00000_00000_1
  rof_1__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[1]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[2]),
    .c_o(c_o[12:8]),
    .s_o(s_o[12:8])
  );


  bsg_mul_B4B_rep_00000006_0000010000000b_32_000000_000000_000000_000000_1
  rof_2__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[2]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[3]),
    .c_o(c_o[18:13]),
    .s_o(s_o[18:13])
  );


  bsg_mul_B4B_rep_00000008_00000100000011_32_00000000_00000000_00000000_00000000_1
  rof_3__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[3]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[4]),
    .c_o(c_o[26:19]),
    .s_o(s_o[26:19])
  );


  bsg_mul_B4B_rep_00000008_00000100000019_32_00000000_00000000_00000000_00000000_1
  rof_4__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[4]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(carries[5]),
    .c_o(c_o[34:27]),
    .s_o(s_o[34:27])
  );


  bsg_mul_B4B_rep_00000007_00000100000021_32_0000000_8040201_7331100_0402010_1
  rof_5__br
  (
    .SDN_i(SDN_i),
    .cr_i(carries[5]),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(cl_o),
    .c_o(c_o[41:35]),
    .s_o(s_o[41:35])
  );


endmodule



module bsg_dff_en_width_p11_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [10:0] data_i;
  output [10:0] data_o;
  input clk_i;
  input en_i;
  reg [10:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[10:0] } <= { data_i[10:0] };
    end 
  end


endmodule



module bsg_dff_en_width_p8_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [7:0] data_i;
  output [7:0] data_o;
  input clk_i;
  input en_i;
  reg [7:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[7:0] } <= { data_i[7:0] };
    end 
  end


endmodule



module bsg_dff_en_width_p7_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [6:0] data_i;
  output [6:0] data_o;
  input clk_i;
  input en_i;
  reg [6:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[6:0] } <= { data_i[6:0] };
    end 
  end


endmodule



module bsg_dff_en_width_p6_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [5:0] data_i;
  output [5:0] data_o;
  input clk_i;
  input en_i;
  reg [5:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[5:0] } <= { data_i[5:0] };
    end 
  end


endmodule



module bsg_dff_en_width_p5_harden_p1
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [4:0] data_i;
  output [4:0] data_o;
  input clk_i;
  input en_i;
  reg [4:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[4:0] } <= { data_i[4:0] };
    end 
  end


endmodule



module bsg_mul_csa_rep_34_5_221b130b0500_1
(
  a_i,
  b_i,
  c_i,
  c_o,
  s_o
);

  input [33:0] a_i;
  input [33:0] b_i;
  input [33:0] c_i;
  output [33:0] c_o;
  output [33:0] s_o;
  wire [33:0] c_o,s_o;

  bsg_mul_csa
  rof_0__rof_0__csa
  (
    .x_i(a_i[0]),
    .y_i(b_i[0]),
    .z_i(c_i[0]),
    .c_o(c_o[0]),
    .s_o(s_o[0])
  );


  bsg_mul_csa
  rof_0__rof_1__csa
  (
    .x_i(a_i[1]),
    .y_i(b_i[1]),
    .z_i(c_i[1]),
    .c_o(c_o[1]),
    .s_o(s_o[1])
  );


  bsg_mul_csa
  rof_0__rof_2__csa
  (
    .x_i(a_i[2]),
    .y_i(b_i[2]),
    .z_i(c_i[2]),
    .c_o(c_o[2]),
    .s_o(s_o[2])
  );


  bsg_mul_csa
  rof_0__rof_3__csa
  (
    .x_i(a_i[3]),
    .y_i(b_i[3]),
    .z_i(c_i[3]),
    .c_o(c_o[3]),
    .s_o(s_o[3])
  );


  bsg_mul_csa
  rof_0__rof_4__csa
  (
    .x_i(a_i[4]),
    .y_i(b_i[4]),
    .z_i(c_i[4]),
    .c_o(c_o[4]),
    .s_o(s_o[4])
  );


  bsg_mul_csa
  rof_1__rof_0__csa
  (
    .x_i(a_i[5]),
    .y_i(b_i[5]),
    .z_i(c_i[5]),
    .c_o(c_o[5]),
    .s_o(s_o[5])
  );


  bsg_mul_csa
  rof_1__rof_1__csa
  (
    .x_i(a_i[6]),
    .y_i(b_i[6]),
    .z_i(c_i[6]),
    .c_o(c_o[6]),
    .s_o(s_o[6])
  );


  bsg_mul_csa
  rof_1__rof_2__csa
  (
    .x_i(a_i[7]),
    .y_i(b_i[7]),
    .z_i(c_i[7]),
    .c_o(c_o[7]),
    .s_o(s_o[7])
  );


  bsg_mul_csa
  rof_1__rof_3__csa
  (
    .x_i(a_i[8]),
    .y_i(b_i[8]),
    .z_i(c_i[8]),
    .c_o(c_o[8]),
    .s_o(s_o[8])
  );


  bsg_mul_csa
  rof_1__rof_4__csa
  (
    .x_i(a_i[9]),
    .y_i(b_i[9]),
    .z_i(c_i[9]),
    .c_o(c_o[9]),
    .s_o(s_o[9])
  );


  bsg_mul_csa
  rof_1__rof_5__csa
  (
    .x_i(a_i[10]),
    .y_i(b_i[10]),
    .z_i(c_i[10]),
    .c_o(c_o[10]),
    .s_o(s_o[10])
  );


  bsg_mul_csa
  rof_2__rof_0__csa
  (
    .x_i(a_i[11]),
    .y_i(b_i[11]),
    .z_i(c_i[11]),
    .c_o(c_o[11]),
    .s_o(s_o[11])
  );


  bsg_mul_csa
  rof_2__rof_1__csa
  (
    .x_i(a_i[12]),
    .y_i(b_i[12]),
    .z_i(c_i[12]),
    .c_o(c_o[12]),
    .s_o(s_o[12])
  );


  bsg_mul_csa
  rof_2__rof_2__csa
  (
    .x_i(a_i[13]),
    .y_i(b_i[13]),
    .z_i(c_i[13]),
    .c_o(c_o[13]),
    .s_o(s_o[13])
  );


  bsg_mul_csa
  rof_2__rof_3__csa
  (
    .x_i(a_i[14]),
    .y_i(b_i[14]),
    .z_i(c_i[14]),
    .c_o(c_o[14]),
    .s_o(s_o[14])
  );


  bsg_mul_csa
  rof_2__rof_4__csa
  (
    .x_i(a_i[15]),
    .y_i(b_i[15]),
    .z_i(c_i[15]),
    .c_o(c_o[15]),
    .s_o(s_o[15])
  );


  bsg_mul_csa
  rof_2__rof_5__csa
  (
    .x_i(a_i[16]),
    .y_i(b_i[16]),
    .z_i(c_i[16]),
    .c_o(c_o[16]),
    .s_o(s_o[16])
  );


  bsg_mul_csa
  rof_2__rof_6__csa
  (
    .x_i(a_i[17]),
    .y_i(b_i[17]),
    .z_i(c_i[17]),
    .c_o(c_o[17]),
    .s_o(s_o[17])
  );


  bsg_mul_csa
  rof_2__rof_7__csa
  (
    .x_i(a_i[18]),
    .y_i(b_i[18]),
    .z_i(c_i[18]),
    .c_o(c_o[18]),
    .s_o(s_o[18])
  );


  bsg_mul_csa
  rof_3__rof_0__csa
  (
    .x_i(a_i[19]),
    .y_i(b_i[19]),
    .z_i(c_i[19]),
    .c_o(c_o[19]),
    .s_o(s_o[19])
  );


  bsg_mul_csa
  rof_3__rof_1__csa
  (
    .x_i(a_i[20]),
    .y_i(b_i[20]),
    .z_i(c_i[20]),
    .c_o(c_o[20]),
    .s_o(s_o[20])
  );


  bsg_mul_csa
  rof_3__rof_2__csa
  (
    .x_i(a_i[21]),
    .y_i(b_i[21]),
    .z_i(c_i[21]),
    .c_o(c_o[21]),
    .s_o(s_o[21])
  );


  bsg_mul_csa
  rof_3__rof_3__csa
  (
    .x_i(a_i[22]),
    .y_i(b_i[22]),
    .z_i(c_i[22]),
    .c_o(c_o[22]),
    .s_o(s_o[22])
  );


  bsg_mul_csa
  rof_3__rof_4__csa
  (
    .x_i(a_i[23]),
    .y_i(b_i[23]),
    .z_i(c_i[23]),
    .c_o(c_o[23]),
    .s_o(s_o[23])
  );


  bsg_mul_csa
  rof_3__rof_5__csa
  (
    .x_i(a_i[24]),
    .y_i(b_i[24]),
    .z_i(c_i[24]),
    .c_o(c_o[24]),
    .s_o(s_o[24])
  );


  bsg_mul_csa
  rof_3__rof_6__csa
  (
    .x_i(a_i[25]),
    .y_i(b_i[25]),
    .z_i(c_i[25]),
    .c_o(c_o[25]),
    .s_o(s_o[25])
  );


  bsg_mul_csa
  rof_3__rof_7__csa
  (
    .x_i(a_i[26]),
    .y_i(b_i[26]),
    .z_i(c_i[26]),
    .c_o(c_o[26]),
    .s_o(s_o[26])
  );


  bsg_mul_csa
  rof_4__rof_0__csa
  (
    .x_i(a_i[27]),
    .y_i(b_i[27]),
    .z_i(c_i[27]),
    .c_o(c_o[27]),
    .s_o(s_o[27])
  );


  bsg_mul_csa
  rof_4__rof_1__csa
  (
    .x_i(a_i[28]),
    .y_i(b_i[28]),
    .z_i(c_i[28]),
    .c_o(c_o[28]),
    .s_o(s_o[28])
  );


  bsg_mul_csa
  rof_4__rof_2__csa
  (
    .x_i(a_i[29]),
    .y_i(b_i[29]),
    .z_i(c_i[29]),
    .c_o(c_o[29]),
    .s_o(s_o[29])
  );


  bsg_mul_csa
  rof_4__rof_3__csa
  (
    .x_i(a_i[30]),
    .y_i(b_i[30]),
    .z_i(c_i[30]),
    .c_o(c_o[30]),
    .s_o(s_o[30])
  );


  bsg_mul_csa
  rof_4__rof_4__csa
  (
    .x_i(a_i[31]),
    .y_i(b_i[31]),
    .z_i(c_i[31]),
    .c_o(c_o[31]),
    .s_o(s_o[31])
  );


  bsg_mul_csa
  rof_4__rof_5__csa
  (
    .x_i(a_i[32]),
    .y_i(b_i[32]),
    .z_i(c_i[32]),
    .c_o(c_o[32]),
    .s_o(s_o[32])
  );


  bsg_mul_csa
  rof_4__rof_6__csa
  (
    .x_i(a_i[33]),
    .y_i(b_i[33]),
    .z_i(c_i[33]),
    .c_o(c_o[33]),
    .s_o(s_o[33])
  );


endmodule



module bsg_mul_32_32_harden_p1_pipeline_p1
(
  clk_i,
  en_i,
  x_i,
  y_i,
  signed_i,
  z_o
);

  input [31:0] x_i;
  input [31:0] y_i;
  output [63:0] z_o;
  input clk_i;
  input en_i;
  input signed_i;
  wire [63:0] z_o;
  wire crr01_cl_o_tmp;
  wire [50:0] SDN;
  wire [2:0] verify_zero;
  wire [40:0] c30,s30;
  wire [33:0] gb_dot,gb_c,gb_s;
  wire [43:0] c42_01c,c42_01s;
  wire [42:0] c74,s74,cB8,sB8;
  wire [49:0] c42_03c,c42_03s;
  wire [41:0] c42_23c,c42_23s,cFC,sFC;
  wire [99:0] pipe_c42_03_trans,pipe_c42_03_trans_r;
  wire [49:15] c42_03c_r;
  wire [49:16] c42_03s_r;
  wire [10:0] gb_dot_r;
  wire [7:0] c42_01s_r;
  wire [6:0] c42_01c_r;
  wire [5:0] s30_r;
  wire [4:0] c30_r;
  wire [29:14] sum_a;
  wire [29:15] sum_b;

  bsg_mul_SDN_width_p32
  sdn
  (
    .x_i(x_i),
    .signed_i(signed_i),
    .SDN_o(SDN)
  );


  bsg_mul_B4B_rep_rep_6_41_29231e160e0600_0_32_1
  brr0
  (
    .SDN_i({ SDN[11:0], 1'b0, 1'b0, 1'b0 }),
    .cr_i(1'b0),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(verify_zero[0]),
    .c_o(c30),
    .s_o(s30)
  );


  bsg_mul_green_booth_dots_32_1_5_221b130b0500
  gbd
  (
    .SDN_i(SDN[50:45]),
    .y_i(y_i),
    .dot_o(gb_dot)
  );


  bsg_mul_comp42_rep_rep_6_43_2b231d18100800
  crr01
  (
    .i({ c74[41:0], 1'b0, s74, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, c30[40:5], gb_dot[18:11], s30[40:6] }),
    .cr_i(1'b0),
    .cl_o(crr01_cl_o_tmp),
    .c_o(c42_01c[42:0]),
    .s_o(c42_01s[42:0])
  );


  bsg_mul_B4B_rep_rep_6_43_2b231d18100800_n2_32_1
  brr1
  (
    .SDN_i(SDN[23:9]),
    .cr_i(1'b0),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(verify_zero[1]),
    .c_o(c74),
    .s_o(s74)
  );


  bsg_mul_comp42_rep_rep_7_50_322b231b15100800
  crr03
  (
    .i({ c42_23c[40:0], 1'b0, cB8[6:0], 1'b0, c42_23s, sB8[7:0], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, c42_01c[43:7], gb_dot[33:20], c42_01s[43:8] }),
    .cr_i(1'b0),
    .c_o(c42_03c),
    .s_o(c42_03s)
  );


  bsg_transpose_width_p50_els_p2
  pipe_bt
  (
    .i({ c42_03c, c42_03s }),
    .o(pipe_c42_03_trans)
  );


  bsg_dff_en_rep_rep_7_100_645646362a201000_1
  pipe_dffe_c42_03_r
  (
    .clk_i(clk_i),
    .en_i(en_i),
    .data_i(pipe_c42_03_trans),
    .data_o(pipe_c42_03_trans_r)
  );


  bsg_transpose_width_p2_els_p50
  pipe_bt2
  (
    .i(pipe_c42_03_trans_r),
    .o({ c42_03c_r, sum_b, c42_03s_r, sum_a })
  );


  bsg_mul_B4B_rep_rep_6_43_2b231b15100800_n2_32_1
  brr2
  (
    .SDN_i(SDN[35:21]),
    .cr_i(1'b0),
    .y_i(y_i),
    .signed_i(signed_i),
    .cl_o(verify_zero[2]),
    .c_o(cB8),
    .s_o(sB8)
  );


  bsg_mul_comp42_rep_rep_6_42_2a231b130d0800
  crr23
  (
    .i({ cFC[40:0], 1'b0, sFC, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, cB8[42:7], 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, sB8[42:8] }),
    .cr_i(1'b0),
    .c_o(c42_23c),
    .s_o(c42_23s)
  );


  bsg_mul_B4B_rep_rep_6_42_2a231b130d0800_n2_32_1
  brr3
  (
    .SDN_i(SDN[47:33]),
    .cr_i(1'b0),
    .y_i(y_i),
    .signed_i(signed_i),
    .c_o(cFC),
    .s_o(sFC)
  );


  bsg_dff_en_width_p11_harden_p1
  pipe0_dffe_gb_dot_r
  (
    .clk_i(clk_i),
    .data_i(gb_dot[10:0]),
    .en_i(en_i),
    .data_o(gb_dot_r)
  );


  bsg_dff_en_width_p8_harden_p1
  pipe0_dffe_c42_01s_r
  (
    .clk_i(clk_i),
    .data_i(c42_01s[7:0]),
    .en_i(en_i),
    .data_o(c42_01s_r)
  );


  bsg_dff_en_width_p7_harden_p1
  pipe0_dffe_c42_01c_r
  (
    .clk_i(clk_i),
    .data_i(c42_01c[6:0]),
    .en_i(en_i),
    .data_o(c42_01c_r)
  );


  bsg_dff_en_width_p6_harden_p1
  pipe0_dffe_s30_r
  (
    .clk_i(clk_i),
    .data_i(s30[5:0]),
    .en_i(en_i),
    .data_o(s30_r)
  );


  bsg_dff_en_width_p5_harden_p1
  pipe0_dffe_c30_r
  (
    .clk_i(clk_i),
    .data_i(c30[4:0]),
    .en_i(en_i),
    .data_o(c30_r)
  );


  bsg_mul_csa_rep_34_5_221b130b0500_1
  gb
  (
    .a_i({ 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, gb_dot_r }),
    .b_i(c42_03s_r),
    .c_i(c42_03c_r[48:15]),
    .c_o(gb_c),
    .s_o(gb_s)
  );

  assign z_o = { gb_s, sum_a, c42_01s_r, s30_r } + { gb_c[32:0], 1'b0, sum_b, 1'b0, c42_01c_r, 1'b0, c30_r, 1'b0 };
  assign c42_01c[43] = gb_dot[19] & crr01_cl_o_tmp;
  assign c42_01s[43] = gb_dot[19] ^ crr01_cl_o_tmp;

endmodule



module bsg_mul_pipelined
(
  clk_i,
  en_i,
  x_i,
  y_i,
  signed_i,
  z_o
);

  input [31:0] x_i;
  input [31:0] y_i;
  output [63:0] z_o;
  input clk_i;
  input en_i;
  input signed_i;
  wire [63:0] z_o;

  bsg_mul_32_32_harden_p1_pipeline_p1
  fi32_m32
  (
    .clk_i(clk_i),
    .en_i(en_i),
    .x_i(x_i),
    .y_i(y_i),
    .signed_i(signed_i),
    .z_o(z_o)
  );


endmodule

