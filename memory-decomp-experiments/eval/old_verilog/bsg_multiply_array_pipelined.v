

module top
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  o
);

  input [15:0] a_i;
  input [15:0] b_i;
  output [31:0] o;
  input clk_i;
  input rst_i;
  input v_i;

  bsg_mul_array
  wrapper
  (
    .a_i(a_i),
    .b_i(b_i),
    .o(o),
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i)
  );


endmodule



module bsg_and_width_p16
(
  a_i,
  b_i,
  o
);

  input [15:0] a_i;
  input [15:0] b_i;
  output [15:0] o;
  wire [15:0] o;
  assign o[15] = a_i[15] & b_i[15];
  assign o[14] = a_i[14] & b_i[14];
  assign o[13] = a_i[13] & b_i[13];
  assign o[12] = a_i[12] & b_i[12];
  assign o[11] = a_i[11] & b_i[11];
  assign o[10] = a_i[10] & b_i[10];
  assign o[9] = a_i[9] & b_i[9];
  assign o[8] = a_i[8] & b_i[8];
  assign o[7] = a_i[7] & b_i[7];
  assign o[6] = a_i[6] & b_i[6];
  assign o[5] = a_i[5] & b_i[5];
  assign o[4] = a_i[4] & b_i[4];
  assign o[3] = a_i[3] & b_i[3];
  assign o[2] = a_i[2] & b_i[2];
  assign o[1] = a_i[1] & b_i[1];
  assign o[0] = a_i[0] & b_i[0];

endmodule



module bsg_adder_ripple_carry_width_p16
(
  a_i,
  b_i,
  s_o,
  c_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  output [15:0] s_o;
  output c_o;
  wire [15:0] s_o;
  wire c_o;
  assign { c_o, s_o } = a_i + b_i;

endmodule



module bsg_mul_array_row_16_0_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [0:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [1:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [1:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[1] = s_o[0];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1], b_i[1:1] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_1_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [1:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [2:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [2:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[2] = s_o[0];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2], b_i[2:2] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_2_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [2:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [3:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [3:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[3] = s_o[0];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3], b_i[3:3] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_3_1
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [3:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [4:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire N0,N1,pc,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,
  N21,N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,
  N41,N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59;
  wire [15:0] pp,ps;
  reg [4:0] prod_accum_o;
  reg [15:0] a_o,b_o,s_o;
  reg c_o;

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4], b_i[4:4] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(ps),
    .c_o(pc)
  );

  assign { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                       (N1)? a_i : 1'b0;
  assign N0 = rst_i;
  assign N1 = N2;
  assign { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? b_i : 1'b0;
  assign { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? ps : 1'b0;
  assign N51 = (N0)? 1'b0 : 
               (N1)? pc : 1'b0;
  assign { N56, N55, N54, N53, N52 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                       (N1)? { ps[0:0], prod_accum_i } : 1'b0;
  assign N2 = ~rst_i;
  assign N57 = ~v_i;
  assign N58 = N57 & N2;
  assign N59 = ~N58;

  always @(posedge clk_i) begin
    if(N59) begin
      { prod_accum_o[4:0] } <= { N56, N55, N54, N53, N52 };
      { a_o[15:0] } <= { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 };
      { b_o[15:0] } <= { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 };
      { s_o[15:0] } <= { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 };
      c_o <= N51;
    end 
  end


endmodule



module bsg_mul_array_row_16_4_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [4:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [5:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [5:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[5] = s_o[0];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5], b_i[5:5] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_5_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [5:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [6:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [6:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[6] = s_o[0];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6], b_i[6:6] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_6_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [6:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [7:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [7:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[7] = s_o[0];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7], b_i[7:7] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_7_1
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [7:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [8:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire N0,N1,pc,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,
  N21,N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,
  N41,N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,
  N61,N62,N63;
  wire [15:0] pp,ps;
  reg [8:0] prod_accum_o;
  reg [15:0] a_o,b_o,s_o;
  reg c_o;

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8], b_i[8:8] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(ps),
    .c_o(pc)
  );

  assign { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                       (N1)? a_i : 1'b0;
  assign N0 = rst_i;
  assign N1 = N2;
  assign { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? b_i : 1'b0;
  assign { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? ps : 1'b0;
  assign N51 = (N0)? 1'b0 : 
               (N1)? pc : 1'b0;
  assign { N60, N59, N58, N57, N56, N55, N54, N53, N52 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                           (N1)? { ps[0:0], prod_accum_i } : 1'b0;
  assign N2 = ~rst_i;
  assign N61 = ~v_i;
  assign N62 = N61 & N2;
  assign N63 = ~N62;

  always @(posedge clk_i) begin
    if(N63) begin
      { prod_accum_o[8:0] } <= { N60, N59, N58, N57, N56, N55, N54, N53, N52 };
      { a_o[15:0] } <= { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 };
      { b_o[15:0] } <= { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 };
      { s_o[15:0] } <= { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 };
      c_o <= N51;
    end 
  end


endmodule



module bsg_mul_array_row_16_8_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [8:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [9:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [9:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[9] = s_o[0];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9], b_i[9:9] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_9_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [9:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [10:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [10:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[10] = s_o[0];
  assign prod_accum_o[9] = prod_accum_i[9];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10], b_i[10:10] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_10_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [10:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [11:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [11:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[11] = s_o[0];
  assign prod_accum_o[10] = prod_accum_i[10];
  assign prod_accum_o[9] = prod_accum_i[9];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11], b_i[11:11] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_11_1
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [11:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [12:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire N0,N1,pc,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,
  N21,N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,
  N41,N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,
  N61,N62,N63,N64,N65,N66,N67;
  wire [15:0] pp,ps;
  reg [12:0] prod_accum_o;
  reg [15:0] a_o,b_o,s_o;
  reg c_o;

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12], b_i[12:12] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(ps),
    .c_o(pc)
  );

  assign { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                       (N1)? a_i : 1'b0;
  assign N0 = rst_i;
  assign N1 = N2;
  assign { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? b_i : 1'b0;
  assign { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                                              (N1)? ps : 1'b0;
  assign N51 = (N0)? 1'b0 : 
               (N1)? pc : 1'b0;
  assign { N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                                                               (N1)? { ps[0:0], prod_accum_i } : 1'b0;
  assign N2 = ~rst_i;
  assign N65 = ~v_i;
  assign N66 = N65 & N2;
  assign N67 = ~N66;

  always @(posedge clk_i) begin
    if(N67) begin
      { prod_accum_o[12:0] } <= { N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52 };
      { a_o[15:0] } <= { N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3 };
      { b_o[15:0] } <= { N34, N33, N32, N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19 };
      { s_o[15:0] } <= { N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35 };
      c_o <= N51;
    end 
  end


endmodule



module bsg_mul_array_row_16_12_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [12:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [13:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [13:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[13] = s_o[0];
  assign prod_accum_o[12] = prod_accum_i[12];
  assign prod_accum_o[11] = prod_accum_i[11];
  assign prod_accum_o[10] = prod_accum_i[10];
  assign prod_accum_o[9] = prod_accum_i[9];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13], b_i[13:13] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_13_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [13:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [14:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,pp;
  wire [14:0] prod_accum_o;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[14] = s_o[0];
  assign prod_accum_o[13] = prod_accum_i[13];
  assign prod_accum_o[12] = prod_accum_i[12];
  assign prod_accum_o[11] = prod_accum_i[11];
  assign prod_accum_o[10] = prod_accum_i[10];
  assign prod_accum_o[9] = prod_accum_i[9];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14], b_i[14:14] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array_row_16_14_0
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  s_i,
  c_i,
  prod_accum_i,
  a_o,
  b_o,
  s_o,
  c_o,
  prod_accum_o
);

  input [15:0] a_i;
  input [15:0] b_i;
  input [15:0] s_i;
  input [14:0] prod_accum_i;
  output [15:0] a_o;
  output [15:0] b_o;
  output [15:0] s_o;
  output [15:0] prod_accum_o;
  input clk_i;
  input rst_i;
  input v_i;
  input c_i;
  output c_o;
  wire [15:0] a_o,b_o,s_o,prod_accum_o,pp;
  wire c_o;
  assign a_o[15] = a_i[15];
  assign a_o[14] = a_i[14];
  assign a_o[13] = a_i[13];
  assign a_o[12] = a_i[12];
  assign a_o[11] = a_i[11];
  assign a_o[10] = a_i[10];
  assign a_o[9] = a_i[9];
  assign a_o[8] = a_i[8];
  assign a_o[7] = a_i[7];
  assign a_o[6] = a_i[6];
  assign a_o[5] = a_i[5];
  assign a_o[4] = a_i[4];
  assign a_o[3] = a_i[3];
  assign a_o[2] = a_i[2];
  assign a_o[1] = a_i[1];
  assign a_o[0] = a_i[0];
  assign b_o[15] = b_i[15];
  assign b_o[14] = b_i[14];
  assign b_o[13] = b_i[13];
  assign b_o[12] = b_i[12];
  assign b_o[11] = b_i[11];
  assign b_o[10] = b_i[10];
  assign b_o[9] = b_i[9];
  assign b_o[8] = b_i[8];
  assign b_o[7] = b_i[7];
  assign b_o[6] = b_i[6];
  assign b_o[5] = b_i[5];
  assign b_o[4] = b_i[4];
  assign b_o[3] = b_i[3];
  assign b_o[2] = b_i[2];
  assign b_o[1] = b_i[1];
  assign b_o[0] = b_i[0];
  assign prod_accum_o[15] = s_o[0];
  assign prod_accum_o[14] = prod_accum_i[14];
  assign prod_accum_o[13] = prod_accum_i[13];
  assign prod_accum_o[12] = prod_accum_i[12];
  assign prod_accum_o[11] = prod_accum_i[11];
  assign prod_accum_o[10] = prod_accum_i[10];
  assign prod_accum_o[9] = prod_accum_i[9];
  assign prod_accum_o[8] = prod_accum_i[8];
  assign prod_accum_o[7] = prod_accum_i[7];
  assign prod_accum_o[6] = prod_accum_i[6];
  assign prod_accum_o[5] = prod_accum_i[5];
  assign prod_accum_o[4] = prod_accum_i[4];
  assign prod_accum_o[3] = prod_accum_i[3];
  assign prod_accum_o[2] = prod_accum_i[2];
  assign prod_accum_o[1] = prod_accum_i[1];
  assign prod_accum_o[0] = prod_accum_i[0];

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15], b_i[15:15] }),
    .o(pp)
  );


  bsg_adder_ripple_carry_width_p16
  adder0
  (
    .a_i(pp),
    .b_i({ c_i, s_i[15:1] }),
    .s_o(s_o),
    .c_o(c_o)
  );


endmodule



module bsg_mul_array
(
  clk_i,
  rst_i,
  v_i,
  a_i,
  b_i,
  o
);

  input [15:0] a_i;
  input [15:0] b_i;
  output [31:0] o;
  input clk_i;
  input rst_i;
  input v_i;
  wire [31:0] o;
  wire s_r_13__15_,s_r_13__14_,s_r_13__13_,s_r_13__12_,s_r_13__11_,s_r_13__10_,
  s_r_13__9_,s_r_13__8_,s_r_13__7_,s_r_13__6_,s_r_13__5_,s_r_13__4_,s_r_13__3_,s_r_13__2_,
  s_r_13__1_,s_r_13__0_,s_r_12__15_,s_r_12__14_,s_r_12__13_,s_r_12__12_,
  s_r_12__11_,s_r_12__10_,s_r_12__9_,s_r_12__8_,s_r_12__7_,s_r_12__6_,s_r_12__5_,s_r_12__4_,
  s_r_12__3_,s_r_12__2_,s_r_12__1_,s_r_12__0_,s_r_11__15_,s_r_11__14_,s_r_11__13_,
  s_r_11__12_,s_r_11__11_,s_r_11__10_,s_r_11__9_,s_r_11__8_,s_r_11__7_,s_r_11__6_,
  s_r_11__5_,s_r_11__4_,s_r_11__3_,s_r_11__2_,s_r_11__1_,s_r_11__0_,s_r_10__15_,
  s_r_10__14_,s_r_10__13_,s_r_10__12_,s_r_10__11_,s_r_10__10_,s_r_10__9_,s_r_10__8_,
  s_r_10__7_,s_r_10__6_,s_r_10__5_,s_r_10__4_,s_r_10__3_,s_r_10__2_,s_r_10__1_,
  s_r_10__0_,s_r_9__15_,s_r_9__14_,s_r_9__13_,s_r_9__12_,s_r_9__11_,s_r_9__10_,
  s_r_9__9_,s_r_9__8_,s_r_9__7_,s_r_9__6_,s_r_9__5_,s_r_9__4_,s_r_9__3_,s_r_9__2_,
  s_r_9__1_,s_r_9__0_,s_r_8__15_,s_r_8__14_,s_r_8__13_,s_r_8__12_,s_r_8__11_,s_r_8__10_,
  s_r_8__9_,s_r_8__8_,s_r_8__7_,s_r_8__6_,s_r_8__5_,s_r_8__4_,s_r_8__3_,s_r_8__2_,
  s_r_8__1_,s_r_8__0_,s_r_7__15_,s_r_7__14_,s_r_7__13_,s_r_7__12_,s_r_7__11_,
  s_r_7__10_,s_r_7__9_,s_r_7__8_,s_r_7__7_,s_r_7__6_,s_r_7__5_,s_r_7__4_,s_r_7__3_,
  s_r_7__2_,s_r_7__1_,s_r_7__0_,s_r_6__15_,s_r_6__14_,s_r_6__13_,s_r_6__12_,
  s_r_6__11_,s_r_6__10_,s_r_6__9_,s_r_6__8_,s_r_6__7_,s_r_6__6_,s_r_6__5_,s_r_6__4_,
  s_r_6__3_,s_r_6__2_,s_r_6__1_,s_r_6__0_,s_r_5__15_,s_r_5__14_,s_r_5__13_,s_r_5__12_,
  s_r_5__11_,s_r_5__10_,s_r_5__9_,s_r_5__8_,s_r_5__7_,s_r_5__6_,s_r_5__5_,s_r_5__4_,
  s_r_5__3_,s_r_5__2_,s_r_5__1_,s_r_5__0_,s_r_4__15_,s_r_4__14_,s_r_4__13_,
  s_r_4__12_,s_r_4__11_,s_r_4__10_,s_r_4__9_,s_r_4__8_,s_r_4__7_,s_r_4__6_,s_r_4__5_,
  s_r_4__4_,s_r_4__3_,s_r_4__2_,s_r_4__1_,s_r_4__0_,s_r_3__15_,s_r_3__14_,s_r_3__13_,
  s_r_3__12_,s_r_3__11_,s_r_3__10_,s_r_3__9_,s_r_3__8_,s_r_3__7_,s_r_3__6_,s_r_3__5_,
  s_r_3__4_,s_r_3__3_,s_r_3__2_,s_r_3__1_,s_r_3__0_,s_r_2__15_,s_r_2__14_,
  s_r_2__13_,s_r_2__12_,s_r_2__11_,s_r_2__10_,s_r_2__9_,s_r_2__8_,s_r_2__7_,s_r_2__6_,
  s_r_2__5_,s_r_2__4_,s_r_2__3_,s_r_2__2_,s_r_2__1_,s_r_2__0_,s_r_1__15_,s_r_1__14_,
  s_r_1__13_,s_r_1__12_,s_r_1__11_,s_r_1__10_,s_r_1__9_,s_r_1__8_,s_r_1__7_,
  s_r_1__6_,s_r_1__5_,s_r_1__4_,s_r_1__3_,s_r_1__2_,s_r_1__1_,s_r_1__0_,s_r_0__15_,
  s_r_0__14_,s_r_0__13_,s_r_0__12_,s_r_0__11_,s_r_0__10_,s_r_0__9_,s_r_0__8_,s_r_0__7_,
  s_r_0__6_,s_r_0__5_,s_r_0__4_,s_r_0__3_,s_r_0__2_,s_r_0__1_,s_r_0__0_,
  prod_accum_14__15_,prod_accum_13__14_,prod_accum_13__13_,prod_accum_13__12_,
  prod_accum_13__11_,prod_accum_13__10_,prod_accum_13__9_,prod_accum_13__8_,prod_accum_13__7_,
  prod_accum_13__6_,prod_accum_13__5_,prod_accum_13__4_,prod_accum_13__3_,
  prod_accum_13__2_,prod_accum_13__1_,prod_accum_13__0_,prod_accum_12__13_,prod_accum_12__12_,
  prod_accum_12__11_,prod_accum_12__10_,prod_accum_12__9_,prod_accum_12__8_,
  prod_accum_12__7_,prod_accum_12__6_,prod_accum_12__5_,prod_accum_12__4_,
  prod_accum_12__3_,prod_accum_12__2_,prod_accum_12__1_,prod_accum_12__0_,prod_accum_11__12_,
  prod_accum_11__11_,prod_accum_11__10_,prod_accum_11__9_,prod_accum_11__8_,
  prod_accum_11__7_,prod_accum_11__6_,prod_accum_11__5_,prod_accum_11__4_,
  prod_accum_11__3_,prod_accum_11__2_,prod_accum_11__1_,prod_accum_11__0_,prod_accum_10__11_,
  prod_accum_10__10_,prod_accum_10__9_,prod_accum_10__8_,prod_accum_10__7_,
  prod_accum_10__6_,prod_accum_10__5_,prod_accum_10__4_,prod_accum_10__3_,prod_accum_10__2_,
  prod_accum_10__1_,prod_accum_10__0_,prod_accum_9__10_,prod_accum_9__9_,
  prod_accum_9__8_,prod_accum_9__7_,prod_accum_9__6_,prod_accum_9__5_,prod_accum_9__4_,
  prod_accum_9__3_,prod_accum_9__2_,prod_accum_9__1_,prod_accum_9__0_,prod_accum_8__9_,
  prod_accum_8__8_,prod_accum_8__7_,prod_accum_8__6_,prod_accum_8__5_,
  prod_accum_8__4_,prod_accum_8__3_,prod_accum_8__2_,prod_accum_8__1_,prod_accum_8__0_,
  prod_accum_7__8_,prod_accum_7__7_,prod_accum_7__6_,prod_accum_7__5_,prod_accum_7__4_,
  prod_accum_7__3_,prod_accum_7__2_,prod_accum_7__1_,prod_accum_7__0_,
  prod_accum_6__7_,prod_accum_6__6_,prod_accum_6__5_,prod_accum_6__4_,prod_accum_6__3_,
  prod_accum_6__2_,prod_accum_6__1_,prod_accum_6__0_,prod_accum_5__6_,prod_accum_5__5_,
  prod_accum_5__4_,prod_accum_5__3_,prod_accum_5__2_,prod_accum_5__1_,prod_accum_5__0_,
  prod_accum_4__5_,prod_accum_4__4_,prod_accum_4__3_,prod_accum_4__2_,
  prod_accum_4__1_,prod_accum_4__0_,prod_accum_3__4_,prod_accum_3__3_,prod_accum_3__2_,
  prod_accum_3__1_,prod_accum_3__0_,prod_accum_2__3_,prod_accum_2__2_,prod_accum_2__1_,
  prod_accum_2__0_,prod_accum_1__2_,prod_accum_1__1_,prod_accum_1__0_,
  prod_accum_0__1_,prod_accum_0__0_,SYNOPSYS_UNCONNECTED_1,SYNOPSYS_UNCONNECTED_2,
  SYNOPSYS_UNCONNECTED_3,SYNOPSYS_UNCONNECTED_4,SYNOPSYS_UNCONNECTED_5,SYNOPSYS_UNCONNECTED_6,
  SYNOPSYS_UNCONNECTED_7,SYNOPSYS_UNCONNECTED_8,SYNOPSYS_UNCONNECTED_9,
  SYNOPSYS_UNCONNECTED_10,SYNOPSYS_UNCONNECTED_11,SYNOPSYS_UNCONNECTED_12,
  SYNOPSYS_UNCONNECTED_13,SYNOPSYS_UNCONNECTED_14,SYNOPSYS_UNCONNECTED_15,SYNOPSYS_UNCONNECTED_16,
  SYNOPSYS_UNCONNECTED_17,SYNOPSYS_UNCONNECTED_18,SYNOPSYS_UNCONNECTED_19,
  SYNOPSYS_UNCONNECTED_20,SYNOPSYS_UNCONNECTED_21,SYNOPSYS_UNCONNECTED_22,
  SYNOPSYS_UNCONNECTED_23,SYNOPSYS_UNCONNECTED_24,SYNOPSYS_UNCONNECTED_25,SYNOPSYS_UNCONNECTED_26,
  SYNOPSYS_UNCONNECTED_27,SYNOPSYS_UNCONNECTED_28,SYNOPSYS_UNCONNECTED_29,
  SYNOPSYS_UNCONNECTED_30,SYNOPSYS_UNCONNECTED_31,SYNOPSYS_UNCONNECTED_32;
  wire [15:0] pp0;
  wire [223:0] a_r,b_r;
  wire [13:0] c_r;

  bsg_and_width_p16
  and0
  (
    .a_i(a_i),
    .b_i({ b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0], b_i[0:0] }),
    .o(pp0)
  );


  bsg_mul_array_row_16_0_0
  genblk1_0__genblk1_first_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_i),
    .b_i(b_i),
    .s_i(pp0),
    .c_i(1'b0),
    .prod_accum_i(pp0[0]),
    .a_o(a_r[15:0]),
    .b_o(b_r[15:0]),
    .s_o({ s_r_0__15_, s_r_0__14_, s_r_0__13_, s_r_0__12_, s_r_0__11_, s_r_0__10_, s_r_0__9_, s_r_0__8_, s_r_0__7_, s_r_0__6_, s_r_0__5_, s_r_0__4_, s_r_0__3_, s_r_0__2_, s_r_0__1_, s_r_0__0_ }),
    .c_o(c_r[0]),
    .prod_accum_o({ prod_accum_0__1_, prod_accum_0__0_ })
  );


  bsg_mul_array_row_16_1_0
  genblk1_1__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[15:0]),
    .b_i(b_r[15:0]),
    .s_i({ s_r_0__15_, s_r_0__14_, s_r_0__13_, s_r_0__12_, s_r_0__11_, s_r_0__10_, s_r_0__9_, s_r_0__8_, s_r_0__7_, s_r_0__6_, s_r_0__5_, s_r_0__4_, s_r_0__3_, s_r_0__2_, s_r_0__1_, s_r_0__0_ }),
    .c_i(c_r[0]),
    .prod_accum_i({ prod_accum_0__1_, prod_accum_0__0_ }),
    .a_o(a_r[31:16]),
    .b_o(b_r[31:16]),
    .s_o({ s_r_1__15_, s_r_1__14_, s_r_1__13_, s_r_1__12_, s_r_1__11_, s_r_1__10_, s_r_1__9_, s_r_1__8_, s_r_1__7_, s_r_1__6_, s_r_1__5_, s_r_1__4_, s_r_1__3_, s_r_1__2_, s_r_1__1_, s_r_1__0_ }),
    .c_o(c_r[1]),
    .prod_accum_o({ prod_accum_1__2_, prod_accum_1__1_, prod_accum_1__0_ })
  );


  bsg_mul_array_row_16_2_0
  genblk1_2__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[31:16]),
    .b_i(b_r[31:16]),
    .s_i({ s_r_1__15_, s_r_1__14_, s_r_1__13_, s_r_1__12_, s_r_1__11_, s_r_1__10_, s_r_1__9_, s_r_1__8_, s_r_1__7_, s_r_1__6_, s_r_1__5_, s_r_1__4_, s_r_1__3_, s_r_1__2_, s_r_1__1_, s_r_1__0_ }),
    .c_i(c_r[1]),
    .prod_accum_i({ prod_accum_1__2_, prod_accum_1__1_, prod_accum_1__0_ }),
    .a_o(a_r[47:32]),
    .b_o(b_r[47:32]),
    .s_o({ s_r_2__15_, s_r_2__14_, s_r_2__13_, s_r_2__12_, s_r_2__11_, s_r_2__10_, s_r_2__9_, s_r_2__8_, s_r_2__7_, s_r_2__6_, s_r_2__5_, s_r_2__4_, s_r_2__3_, s_r_2__2_, s_r_2__1_, s_r_2__0_ }),
    .c_o(c_r[2]),
    .prod_accum_o({ prod_accum_2__3_, prod_accum_2__2_, prod_accum_2__1_, prod_accum_2__0_ })
  );


  bsg_mul_array_row_16_3_1
  genblk1_3__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[47:32]),
    .b_i(b_r[47:32]),
    .s_i({ s_r_2__15_, s_r_2__14_, s_r_2__13_, s_r_2__12_, s_r_2__11_, s_r_2__10_, s_r_2__9_, s_r_2__8_, s_r_2__7_, s_r_2__6_, s_r_2__5_, s_r_2__4_, s_r_2__3_, s_r_2__2_, s_r_2__1_, s_r_2__0_ }),
    .c_i(c_r[2]),
    .prod_accum_i({ prod_accum_2__3_, prod_accum_2__2_, prod_accum_2__1_, prod_accum_2__0_ }),
    .a_o(a_r[63:48]),
    .b_o(b_r[63:48]),
    .s_o({ s_r_3__15_, s_r_3__14_, s_r_3__13_, s_r_3__12_, s_r_3__11_, s_r_3__10_, s_r_3__9_, s_r_3__8_, s_r_3__7_, s_r_3__6_, s_r_3__5_, s_r_3__4_, s_r_3__3_, s_r_3__2_, s_r_3__1_, s_r_3__0_ }),
    .c_o(c_r[3]),
    .prod_accum_o({ prod_accum_3__4_, prod_accum_3__3_, prod_accum_3__2_, prod_accum_3__1_, prod_accum_3__0_ })
  );


  bsg_mul_array_row_16_4_0
  genblk1_4__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[63:48]),
    .b_i(b_r[63:48]),
    .s_i({ s_r_3__15_, s_r_3__14_, s_r_3__13_, s_r_3__12_, s_r_3__11_, s_r_3__10_, s_r_3__9_, s_r_3__8_, s_r_3__7_, s_r_3__6_, s_r_3__5_, s_r_3__4_, s_r_3__3_, s_r_3__2_, s_r_3__1_, s_r_3__0_ }),
    .c_i(c_r[3]),
    .prod_accum_i({ prod_accum_3__4_, prod_accum_3__3_, prod_accum_3__2_, prod_accum_3__1_, prod_accum_3__0_ }),
    .a_o(a_r[79:64]),
    .b_o(b_r[79:64]),
    .s_o({ s_r_4__15_, s_r_4__14_, s_r_4__13_, s_r_4__12_, s_r_4__11_, s_r_4__10_, s_r_4__9_, s_r_4__8_, s_r_4__7_, s_r_4__6_, s_r_4__5_, s_r_4__4_, s_r_4__3_, s_r_4__2_, s_r_4__1_, s_r_4__0_ }),
    .c_o(c_r[4]),
    .prod_accum_o({ prod_accum_4__5_, prod_accum_4__4_, prod_accum_4__3_, prod_accum_4__2_, prod_accum_4__1_, prod_accum_4__0_ })
  );


  bsg_mul_array_row_16_5_0
  genblk1_5__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[79:64]),
    .b_i(b_r[79:64]),
    .s_i({ s_r_4__15_, s_r_4__14_, s_r_4__13_, s_r_4__12_, s_r_4__11_, s_r_4__10_, s_r_4__9_, s_r_4__8_, s_r_4__7_, s_r_4__6_, s_r_4__5_, s_r_4__4_, s_r_4__3_, s_r_4__2_, s_r_4__1_, s_r_4__0_ }),
    .c_i(c_r[4]),
    .prod_accum_i({ prod_accum_4__5_, prod_accum_4__4_, prod_accum_4__3_, prod_accum_4__2_, prod_accum_4__1_, prod_accum_4__0_ }),
    .a_o(a_r[95:80]),
    .b_o(b_r[95:80]),
    .s_o({ s_r_5__15_, s_r_5__14_, s_r_5__13_, s_r_5__12_, s_r_5__11_, s_r_5__10_, s_r_5__9_, s_r_5__8_, s_r_5__7_, s_r_5__6_, s_r_5__5_, s_r_5__4_, s_r_5__3_, s_r_5__2_, s_r_5__1_, s_r_5__0_ }),
    .c_o(c_r[5]),
    .prod_accum_o({ prod_accum_5__6_, prod_accum_5__5_, prod_accum_5__4_, prod_accum_5__3_, prod_accum_5__2_, prod_accum_5__1_, prod_accum_5__0_ })
  );


  bsg_mul_array_row_16_6_0
  genblk1_6__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[95:80]),
    .b_i(b_r[95:80]),
    .s_i({ s_r_5__15_, s_r_5__14_, s_r_5__13_, s_r_5__12_, s_r_5__11_, s_r_5__10_, s_r_5__9_, s_r_5__8_, s_r_5__7_, s_r_5__6_, s_r_5__5_, s_r_5__4_, s_r_5__3_, s_r_5__2_, s_r_5__1_, s_r_5__0_ }),
    .c_i(c_r[5]),
    .prod_accum_i({ prod_accum_5__6_, prod_accum_5__5_, prod_accum_5__4_, prod_accum_5__3_, prod_accum_5__2_, prod_accum_5__1_, prod_accum_5__0_ }),
    .a_o(a_r[111:96]),
    .b_o(b_r[111:96]),
    .s_o({ s_r_6__15_, s_r_6__14_, s_r_6__13_, s_r_6__12_, s_r_6__11_, s_r_6__10_, s_r_6__9_, s_r_6__8_, s_r_6__7_, s_r_6__6_, s_r_6__5_, s_r_6__4_, s_r_6__3_, s_r_6__2_, s_r_6__1_, s_r_6__0_ }),
    .c_o(c_r[6]),
    .prod_accum_o({ prod_accum_6__7_, prod_accum_6__6_, prod_accum_6__5_, prod_accum_6__4_, prod_accum_6__3_, prod_accum_6__2_, prod_accum_6__1_, prod_accum_6__0_ })
  );


  bsg_mul_array_row_16_7_1
  genblk1_7__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[111:96]),
    .b_i(b_r[111:96]),
    .s_i({ s_r_6__15_, s_r_6__14_, s_r_6__13_, s_r_6__12_, s_r_6__11_, s_r_6__10_, s_r_6__9_, s_r_6__8_, s_r_6__7_, s_r_6__6_, s_r_6__5_, s_r_6__4_, s_r_6__3_, s_r_6__2_, s_r_6__1_, s_r_6__0_ }),
    .c_i(c_r[6]),
    .prod_accum_i({ prod_accum_6__7_, prod_accum_6__6_, prod_accum_6__5_, prod_accum_6__4_, prod_accum_6__3_, prod_accum_6__2_, prod_accum_6__1_, prod_accum_6__0_ }),
    .a_o(a_r[127:112]),
    .b_o(b_r[127:112]),
    .s_o({ s_r_7__15_, s_r_7__14_, s_r_7__13_, s_r_7__12_, s_r_7__11_, s_r_7__10_, s_r_7__9_, s_r_7__8_, s_r_7__7_, s_r_7__6_, s_r_7__5_, s_r_7__4_, s_r_7__3_, s_r_7__2_, s_r_7__1_, s_r_7__0_ }),
    .c_o(c_r[7]),
    .prod_accum_o({ prod_accum_7__8_, prod_accum_7__7_, prod_accum_7__6_, prod_accum_7__5_, prod_accum_7__4_, prod_accum_7__3_, prod_accum_7__2_, prod_accum_7__1_, prod_accum_7__0_ })
  );


  bsg_mul_array_row_16_8_0
  genblk1_8__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[127:112]),
    .b_i(b_r[127:112]),
    .s_i({ s_r_7__15_, s_r_7__14_, s_r_7__13_, s_r_7__12_, s_r_7__11_, s_r_7__10_, s_r_7__9_, s_r_7__8_, s_r_7__7_, s_r_7__6_, s_r_7__5_, s_r_7__4_, s_r_7__3_, s_r_7__2_, s_r_7__1_, s_r_7__0_ }),
    .c_i(c_r[7]),
    .prod_accum_i({ prod_accum_7__8_, prod_accum_7__7_, prod_accum_7__6_, prod_accum_7__5_, prod_accum_7__4_, prod_accum_7__3_, prod_accum_7__2_, prod_accum_7__1_, prod_accum_7__0_ }),
    .a_o(a_r[143:128]),
    .b_o(b_r[143:128]),
    .s_o({ s_r_8__15_, s_r_8__14_, s_r_8__13_, s_r_8__12_, s_r_8__11_, s_r_8__10_, s_r_8__9_, s_r_8__8_, s_r_8__7_, s_r_8__6_, s_r_8__5_, s_r_8__4_, s_r_8__3_, s_r_8__2_, s_r_8__1_, s_r_8__0_ }),
    .c_o(c_r[8]),
    .prod_accum_o({ prod_accum_8__9_, prod_accum_8__8_, prod_accum_8__7_, prod_accum_8__6_, prod_accum_8__5_, prod_accum_8__4_, prod_accum_8__3_, prod_accum_8__2_, prod_accum_8__1_, prod_accum_8__0_ })
  );


  bsg_mul_array_row_16_9_0
  genblk1_9__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[143:128]),
    .b_i(b_r[143:128]),
    .s_i({ s_r_8__15_, s_r_8__14_, s_r_8__13_, s_r_8__12_, s_r_8__11_, s_r_8__10_, s_r_8__9_, s_r_8__8_, s_r_8__7_, s_r_8__6_, s_r_8__5_, s_r_8__4_, s_r_8__3_, s_r_8__2_, s_r_8__1_, s_r_8__0_ }),
    .c_i(c_r[8]),
    .prod_accum_i({ prod_accum_8__9_, prod_accum_8__8_, prod_accum_8__7_, prod_accum_8__6_, prod_accum_8__5_, prod_accum_8__4_, prod_accum_8__3_, prod_accum_8__2_, prod_accum_8__1_, prod_accum_8__0_ }),
    .a_o(a_r[159:144]),
    .b_o(b_r[159:144]),
    .s_o({ s_r_9__15_, s_r_9__14_, s_r_9__13_, s_r_9__12_, s_r_9__11_, s_r_9__10_, s_r_9__9_, s_r_9__8_, s_r_9__7_, s_r_9__6_, s_r_9__5_, s_r_9__4_, s_r_9__3_, s_r_9__2_, s_r_9__1_, s_r_9__0_ }),
    .c_o(c_r[9]),
    .prod_accum_o({ prod_accum_9__10_, prod_accum_9__9_, prod_accum_9__8_, prod_accum_9__7_, prod_accum_9__6_, prod_accum_9__5_, prod_accum_9__4_, prod_accum_9__3_, prod_accum_9__2_, prod_accum_9__1_, prod_accum_9__0_ })
  );


  bsg_mul_array_row_16_10_0
  genblk1_10__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[159:144]),
    .b_i(b_r[159:144]),
    .s_i({ s_r_9__15_, s_r_9__14_, s_r_9__13_, s_r_9__12_, s_r_9__11_, s_r_9__10_, s_r_9__9_, s_r_9__8_, s_r_9__7_, s_r_9__6_, s_r_9__5_, s_r_9__4_, s_r_9__3_, s_r_9__2_, s_r_9__1_, s_r_9__0_ }),
    .c_i(c_r[9]),
    .prod_accum_i({ prod_accum_9__10_, prod_accum_9__9_, prod_accum_9__8_, prod_accum_9__7_, prod_accum_9__6_, prod_accum_9__5_, prod_accum_9__4_, prod_accum_9__3_, prod_accum_9__2_, prod_accum_9__1_, prod_accum_9__0_ }),
    .a_o(a_r[175:160]),
    .b_o(b_r[175:160]),
    .s_o({ s_r_10__15_, s_r_10__14_, s_r_10__13_, s_r_10__12_, s_r_10__11_, s_r_10__10_, s_r_10__9_, s_r_10__8_, s_r_10__7_, s_r_10__6_, s_r_10__5_, s_r_10__4_, s_r_10__3_, s_r_10__2_, s_r_10__1_, s_r_10__0_ }),
    .c_o(c_r[10]),
    .prod_accum_o({ prod_accum_10__11_, prod_accum_10__10_, prod_accum_10__9_, prod_accum_10__8_, prod_accum_10__7_, prod_accum_10__6_, prod_accum_10__5_, prod_accum_10__4_, prod_accum_10__3_, prod_accum_10__2_, prod_accum_10__1_, prod_accum_10__0_ })
  );


  bsg_mul_array_row_16_11_1
  genblk1_11__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[175:160]),
    .b_i(b_r[175:160]),
    .s_i({ s_r_10__15_, s_r_10__14_, s_r_10__13_, s_r_10__12_, s_r_10__11_, s_r_10__10_, s_r_10__9_, s_r_10__8_, s_r_10__7_, s_r_10__6_, s_r_10__5_, s_r_10__4_, s_r_10__3_, s_r_10__2_, s_r_10__1_, s_r_10__0_ }),
    .c_i(c_r[10]),
    .prod_accum_i({ prod_accum_10__11_, prod_accum_10__10_, prod_accum_10__9_, prod_accum_10__8_, prod_accum_10__7_, prod_accum_10__6_, prod_accum_10__5_, prod_accum_10__4_, prod_accum_10__3_, prod_accum_10__2_, prod_accum_10__1_, prod_accum_10__0_ }),
    .a_o(a_r[191:176]),
    .b_o(b_r[191:176]),
    .s_o({ s_r_11__15_, s_r_11__14_, s_r_11__13_, s_r_11__12_, s_r_11__11_, s_r_11__10_, s_r_11__9_, s_r_11__8_, s_r_11__7_, s_r_11__6_, s_r_11__5_, s_r_11__4_, s_r_11__3_, s_r_11__2_, s_r_11__1_, s_r_11__0_ }),
    .c_o(c_r[11]),
    .prod_accum_o({ prod_accum_11__12_, prod_accum_11__11_, prod_accum_11__10_, prod_accum_11__9_, prod_accum_11__8_, prod_accum_11__7_, prod_accum_11__6_, prod_accum_11__5_, prod_accum_11__4_, prod_accum_11__3_, prod_accum_11__2_, prod_accum_11__1_, prod_accum_11__0_ })
  );


  bsg_mul_array_row_16_12_0
  genblk1_12__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[191:176]),
    .b_i(b_r[191:176]),
    .s_i({ s_r_11__15_, s_r_11__14_, s_r_11__13_, s_r_11__12_, s_r_11__11_, s_r_11__10_, s_r_11__9_, s_r_11__8_, s_r_11__7_, s_r_11__6_, s_r_11__5_, s_r_11__4_, s_r_11__3_, s_r_11__2_, s_r_11__1_, s_r_11__0_ }),
    .c_i(c_r[11]),
    .prod_accum_i({ prod_accum_11__12_, prod_accum_11__11_, prod_accum_11__10_, prod_accum_11__9_, prod_accum_11__8_, prod_accum_11__7_, prod_accum_11__6_, prod_accum_11__5_, prod_accum_11__4_, prod_accum_11__3_, prod_accum_11__2_, prod_accum_11__1_, prod_accum_11__0_ }),
    .a_o(a_r[207:192]),
    .b_o(b_r[207:192]),
    .s_o({ s_r_12__15_, s_r_12__14_, s_r_12__13_, s_r_12__12_, s_r_12__11_, s_r_12__10_, s_r_12__9_, s_r_12__8_, s_r_12__7_, s_r_12__6_, s_r_12__5_, s_r_12__4_, s_r_12__3_, s_r_12__2_, s_r_12__1_, s_r_12__0_ }),
    .c_o(c_r[12]),
    .prod_accum_o({ prod_accum_12__13_, prod_accum_12__12_, prod_accum_12__11_, prod_accum_12__10_, prod_accum_12__9_, prod_accum_12__8_, prod_accum_12__7_, prod_accum_12__6_, prod_accum_12__5_, prod_accum_12__4_, prod_accum_12__3_, prod_accum_12__2_, prod_accum_12__1_, prod_accum_12__0_ })
  );


  bsg_mul_array_row_16_13_0
  genblk1_13__genblk1_mid_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[207:192]),
    .b_i(b_r[207:192]),
    .s_i({ s_r_12__15_, s_r_12__14_, s_r_12__13_, s_r_12__12_, s_r_12__11_, s_r_12__10_, s_r_12__9_, s_r_12__8_, s_r_12__7_, s_r_12__6_, s_r_12__5_, s_r_12__4_, s_r_12__3_, s_r_12__2_, s_r_12__1_, s_r_12__0_ }),
    .c_i(c_r[12]),
    .prod_accum_i({ prod_accum_12__13_, prod_accum_12__12_, prod_accum_12__11_, prod_accum_12__10_, prod_accum_12__9_, prod_accum_12__8_, prod_accum_12__7_, prod_accum_12__6_, prod_accum_12__5_, prod_accum_12__4_, prod_accum_12__3_, prod_accum_12__2_, prod_accum_12__1_, prod_accum_12__0_ }),
    .a_o(a_r[223:208]),
    .b_o(b_r[223:208]),
    .s_o({ s_r_13__15_, s_r_13__14_, s_r_13__13_, s_r_13__12_, s_r_13__11_, s_r_13__10_, s_r_13__9_, s_r_13__8_, s_r_13__7_, s_r_13__6_, s_r_13__5_, s_r_13__4_, s_r_13__3_, s_r_13__2_, s_r_13__1_, s_r_13__0_ }),
    .c_o(c_r[13]),
    .prod_accum_o({ prod_accum_13__14_, prod_accum_13__13_, prod_accum_13__12_, prod_accum_13__11_, prod_accum_13__10_, prod_accum_13__9_, prod_accum_13__8_, prod_accum_13__7_, prod_accum_13__6_, prod_accum_13__5_, prod_accum_13__4_, prod_accum_13__3_, prod_accum_13__2_, prod_accum_13__1_, prod_accum_13__0_ })
  );


  bsg_mul_array_row_16_14_0
  genblk1_14__genblk1_last_row
  (
    .clk_i(clk_i),
    .rst_i(rst_i),
    .v_i(v_i),
    .a_i(a_r[223:208]),
    .b_i(b_r[223:208]),
    .s_i({ s_r_13__15_, s_r_13__14_, s_r_13__13_, s_r_13__12_, s_r_13__11_, s_r_13__10_, s_r_13__9_, s_r_13__8_, s_r_13__7_, s_r_13__6_, s_r_13__5_, s_r_13__4_, s_r_13__3_, s_r_13__2_, s_r_13__1_, s_r_13__0_ }),
    .c_i(c_r[13]),
    .prod_accum_i({ prod_accum_13__14_, prod_accum_13__13_, prod_accum_13__12_, prod_accum_13__11_, prod_accum_13__10_, prod_accum_13__9_, prod_accum_13__8_, prod_accum_13__7_, prod_accum_13__6_, prod_accum_13__5_, prod_accum_13__4_, prod_accum_13__3_, prod_accum_13__2_, prod_accum_13__1_, prod_accum_13__0_ }),
    .a_o({ SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, SYNOPSYS_UNCONNECTED_8, SYNOPSYS_UNCONNECTED_9, SYNOPSYS_UNCONNECTED_10, SYNOPSYS_UNCONNECTED_11, SYNOPSYS_UNCONNECTED_12, SYNOPSYS_UNCONNECTED_13, SYNOPSYS_UNCONNECTED_14, SYNOPSYS_UNCONNECTED_15, SYNOPSYS_UNCONNECTED_16 }),
    .b_o({ SYNOPSYS_UNCONNECTED_17, SYNOPSYS_UNCONNECTED_18, SYNOPSYS_UNCONNECTED_19, SYNOPSYS_UNCONNECTED_20, SYNOPSYS_UNCONNECTED_21, SYNOPSYS_UNCONNECTED_22, SYNOPSYS_UNCONNECTED_23, SYNOPSYS_UNCONNECTED_24, SYNOPSYS_UNCONNECTED_25, SYNOPSYS_UNCONNECTED_26, SYNOPSYS_UNCONNECTED_27, SYNOPSYS_UNCONNECTED_28, SYNOPSYS_UNCONNECTED_29, SYNOPSYS_UNCONNECTED_30, SYNOPSYS_UNCONNECTED_31, SYNOPSYS_UNCONNECTED_32 }),
    .s_o(o[30:15]),
    .c_o(o[31]),
    .prod_accum_o({ prod_accum_14__15_, o[14:0] })
  );


endmodule

