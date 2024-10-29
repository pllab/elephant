

module top
(
  clk,
  reset_i,
  yumi_i,
  o
);

  output [15:0] o;
  input clk;
  input reset_i;
  input yumi_i;

  bsg_lfsr
  wrapper
  (
    .o(o),
    .clk(clk),
    .reset_i(reset_i),
    .yumi_i(yumi_i)
  );


endmodule



module bsg_lfsr
(
  clk,
  reset_i,
  yumi_i,
  o
);

  output [15:0] o;
  input clk;
  input reset_i;
  input yumi_i;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36;
  wire [15:0] o_n;
  reg [15:0] o;
  assign N3 = (N0)? 1'b1 : 
              (N21)? 1'b1 : 
              (N2)? 1'b0 : 1'b0;
  assign N0 = reset_i;
  assign { N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1 } : 
                                                                                        (N21)? o_n : 1'b0;
  assign N1 = yumi_i | reset_i;
  assign N2 = ~N1;
  assign N20 = ~reset_i;
  assign N21 = yumi_i & N20;
  assign o_n[15] = o[0] & 1'b0;
  assign o_n[14] = o[15] ^ N22;
  assign N22 = o[0] & 1'b0;
  assign o_n[13] = o[14] ^ N23;
  assign N23 = o[0] & 1'b0;
  assign o_n[12] = o[13] ^ N24;
  assign N24 = o[0] & 1'b0;
  assign o_n[11] = o[12] ^ N25;
  assign N25 = o[0] & 1'b0;
  assign o_n[10] = o[11] ^ N26;
  assign N26 = o[0] & 1'b0;
  assign o_n[9] = o[10] ^ N27;
  assign N27 = o[0] & 1'b0;
  assign o_n[8] = o[9] ^ N28;
  assign N28 = o[0] & 1'b0;
  assign o_n[7] = o[8] ^ N29;
  assign N29 = o[0] & 1'b0;
  assign o_n[6] = o[7] ^ N30;
  assign N30 = o[0] & 1'b0;
  assign o_n[5] = o[6] ^ N31;
  assign N31 = o[0] & 1'b0;
  assign o_n[4] = o[5] ^ N32;
  assign N32 = o[0] & 1'b0;
  assign o_n[3] = o[4] ^ N33;
  assign N33 = o[0] & 1'b0;
  assign o_n[2] = o[3] ^ N34;
  assign N34 = o[0] & 1'b0;
  assign o_n[1] = o[2] ^ N35;
  assign N35 = o[0] & 1'b0;
  assign o_n[0] = o[1] ^ N36;
  assign N36 = o[0] & 1'b0;

  always @(posedge clk) begin
    if(N3) begin
      { o[15:0] } <= { N19, N18, N17, N16, N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4 };
    end 
  end


endmodule

