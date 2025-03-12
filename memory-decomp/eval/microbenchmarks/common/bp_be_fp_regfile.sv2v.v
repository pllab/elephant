

module bsg_mem_3r1w_sync_width_p66_els_p32
(
  clk_i,
  reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r0_v_i,
  r0_addr_i,
  r0_data_o,
  r1_v_i,
  r1_addr_i,
  r1_data_o,
  r2_v_i,
  r2_addr_i,
  r2_data_o
);

  input [4:0] w_addr_i;
  input [65:0] w_data_i;
  input [4:0] r0_addr_i;
  output [65:0] r0_data_o;
  input [4:0] r1_addr_i;
  output [65:0] r1_data_o;
  input [4:0] r2_addr_i;
  output [65:0] r2_data_o;
  input clk_i;
  input reset_i;
  input w_v_i;
  input r0_v_i;
  input r1_v_i;
  input r2_v_i;
  wire [65:0] r0_data_o,r1_data_o,r2_data_o;

  bsg_mem_3r1w_sync_synth
  synth
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i),
    .w_data_i(w_data_i),
    .r0_v_i(r0_v_i),
    .r0_addr_i(r0_addr_i),
    .r0_data_o(r0_data_o),
    .r1_v_i(r1_v_i),
    .r1_addr_i(r1_addr_i),
    .r1_data_o(r1_data_o),
    .r2_v_i(r2_v_i),
    .r2_addr_i(r2_addr_i),
    .r2_data_o(r2_data_o)
  );


endmodule



module bsg_dff_width_p66
(
  clk_i,
  data_i,
  data_o
);

  input [65:0] data_i;
  output [65:0] data_o;
  input clk_i;
  wire [65:0] data_o;
  reg data_o_65_sv2v_reg,data_o_64_sv2v_reg,data_o_63_sv2v_reg,data_o_62_sv2v_reg,
  data_o_61_sv2v_reg,data_o_60_sv2v_reg,data_o_59_sv2v_reg,data_o_58_sv2v_reg,
  data_o_57_sv2v_reg,data_o_56_sv2v_reg,data_o_55_sv2v_reg,data_o_54_sv2v_reg,
  data_o_53_sv2v_reg,data_o_52_sv2v_reg,data_o_51_sv2v_reg,data_o_50_sv2v_reg,
  data_o_49_sv2v_reg,data_o_48_sv2v_reg,data_o_47_sv2v_reg,data_o_46_sv2v_reg,data_o_45_sv2v_reg,
  data_o_44_sv2v_reg,data_o_43_sv2v_reg,data_o_42_sv2v_reg,data_o_41_sv2v_reg,
  data_o_40_sv2v_reg,data_o_39_sv2v_reg,data_o_38_sv2v_reg,data_o_37_sv2v_reg,
  data_o_36_sv2v_reg,data_o_35_sv2v_reg,data_o_34_sv2v_reg,data_o_33_sv2v_reg,
  data_o_32_sv2v_reg,data_o_31_sv2v_reg,data_o_30_sv2v_reg,data_o_29_sv2v_reg,
  data_o_28_sv2v_reg,data_o_27_sv2v_reg,data_o_26_sv2v_reg,data_o_25_sv2v_reg,data_o_24_sv2v_reg,
  data_o_23_sv2v_reg,data_o_22_sv2v_reg,data_o_21_sv2v_reg,data_o_20_sv2v_reg,
  data_o_19_sv2v_reg,data_o_18_sv2v_reg,data_o_17_sv2v_reg,data_o_16_sv2v_reg,
  data_o_15_sv2v_reg,data_o_14_sv2v_reg,data_o_13_sv2v_reg,data_o_12_sv2v_reg,
  data_o_11_sv2v_reg,data_o_10_sv2v_reg,data_o_9_sv2v_reg,data_o_8_sv2v_reg,data_o_7_sv2v_reg,
  data_o_6_sv2v_reg,data_o_5_sv2v_reg,data_o_4_sv2v_reg,data_o_3_sv2v_reg,
  data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[65] = data_o_65_sv2v_reg;
  assign data_o[64] = data_o_64_sv2v_reg;
  assign data_o[63] = data_o_63_sv2v_reg;
  assign data_o[62] = data_o_62_sv2v_reg;
  assign data_o[61] = data_o_61_sv2v_reg;
  assign data_o[60] = data_o_60_sv2v_reg;
  assign data_o[59] = data_o_59_sv2v_reg;
  assign data_o[58] = data_o_58_sv2v_reg;
  assign data_o[57] = data_o_57_sv2v_reg;
  assign data_o[56] = data_o_56_sv2v_reg;
  assign data_o[55] = data_o_55_sv2v_reg;
  assign data_o[54] = data_o_54_sv2v_reg;
  assign data_o[53] = data_o_53_sv2v_reg;
  assign data_o[52] = data_o_52_sv2v_reg;
  assign data_o[51] = data_o_51_sv2v_reg;
  assign data_o[50] = data_o_50_sv2v_reg;
  assign data_o[49] = data_o_49_sv2v_reg;
  assign data_o[48] = data_o_48_sv2v_reg;
  assign data_o[47] = data_o_47_sv2v_reg;
  assign data_o[46] = data_o_46_sv2v_reg;
  assign data_o[45] = data_o_45_sv2v_reg;
  assign data_o[44] = data_o_44_sv2v_reg;
  assign data_o[43] = data_o_43_sv2v_reg;
  assign data_o[42] = data_o_42_sv2v_reg;
  assign data_o[41] = data_o_41_sv2v_reg;
  assign data_o[40] = data_o_40_sv2v_reg;
  assign data_o[39] = data_o_39_sv2v_reg;
  assign data_o[38] = data_o_38_sv2v_reg;
  assign data_o[37] = data_o_37_sv2v_reg;
  assign data_o[36] = data_o_36_sv2v_reg;
  assign data_o[35] = data_o_35_sv2v_reg;
  assign data_o[34] = data_o_34_sv2v_reg;
  assign data_o[33] = data_o_33_sv2v_reg;
  assign data_o[32] = data_o_32_sv2v_reg;
  assign data_o[31] = data_o_31_sv2v_reg;
  assign data_o[30] = data_o_30_sv2v_reg;
  assign data_o[29] = data_o_29_sv2v_reg;
  assign data_o[28] = data_o_28_sv2v_reg;
  assign data_o[27] = data_o_27_sv2v_reg;
  assign data_o[26] = data_o_26_sv2v_reg;
  assign data_o[25] = data_o_25_sv2v_reg;
  assign data_o[24] = data_o_24_sv2v_reg;
  assign data_o[23] = data_o_23_sv2v_reg;
  assign data_o[22] = data_o_22_sv2v_reg;
  assign data_o[21] = data_o_21_sv2v_reg;
  assign data_o[20] = data_o_20_sv2v_reg;
  assign data_o[19] = data_o_19_sv2v_reg;
  assign data_o[18] = data_o_18_sv2v_reg;
  assign data_o[17] = data_o_17_sv2v_reg;
  assign data_o[16] = data_o_16_sv2v_reg;
  assign data_o[15] = data_o_15_sv2v_reg;
  assign data_o[14] = data_o_14_sv2v_reg;
  assign data_o[13] = data_o_13_sv2v_reg;
  assign data_o[12] = data_o_12_sv2v_reg;
  assign data_o[11] = data_o_11_sv2v_reg;
  assign data_o[10] = data_o_10_sv2v_reg;
  assign data_o[9] = data_o_9_sv2v_reg;
  assign data_o[8] = data_o_8_sv2v_reg;
  assign data_o[7] = data_o_7_sv2v_reg;
  assign data_o[6] = data_o_6_sv2v_reg;
  assign data_o[5] = data_o_5_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_65_sv2v_reg <= data_i[65];
      data_o_64_sv2v_reg <= data_i[64];
      data_o_63_sv2v_reg <= data_i[63];
      data_o_62_sv2v_reg <= data_i[62];
      data_o_61_sv2v_reg <= data_i[61];
      data_o_60_sv2v_reg <= data_i[60];
      data_o_59_sv2v_reg <= data_i[59];
      data_o_58_sv2v_reg <= data_i[58];
      data_o_57_sv2v_reg <= data_i[57];
      data_o_56_sv2v_reg <= data_i[56];
      data_o_55_sv2v_reg <= data_i[55];
      data_o_54_sv2v_reg <= data_i[54];
      data_o_53_sv2v_reg <= data_i[53];
      data_o_52_sv2v_reg <= data_i[52];
      data_o_51_sv2v_reg <= data_i[51];
      data_o_50_sv2v_reg <= data_i[50];
      data_o_49_sv2v_reg <= data_i[49];
      data_o_48_sv2v_reg <= data_i[48];
      data_o_47_sv2v_reg <= data_i[47];
      data_o_46_sv2v_reg <= data_i[46];
      data_o_45_sv2v_reg <= data_i[45];
      data_o_44_sv2v_reg <= data_i[44];
      data_o_43_sv2v_reg <= data_i[43];
      data_o_42_sv2v_reg <= data_i[42];
      data_o_41_sv2v_reg <= data_i[41];
      data_o_40_sv2v_reg <= data_i[40];
      data_o_39_sv2v_reg <= data_i[39];
      data_o_38_sv2v_reg <= data_i[38];
      data_o_37_sv2v_reg <= data_i[37];
      data_o_36_sv2v_reg <= data_i[36];
      data_o_35_sv2v_reg <= data_i[35];
      data_o_34_sv2v_reg <= data_i[34];
      data_o_33_sv2v_reg <= data_i[33];
      data_o_32_sv2v_reg <= data_i[32];
      data_o_31_sv2v_reg <= data_i[31];
      data_o_30_sv2v_reg <= data_i[30];
      data_o_29_sv2v_reg <= data_i[29];
      data_o_28_sv2v_reg <= data_i[28];
      data_o_27_sv2v_reg <= data_i[27];
      data_o_26_sv2v_reg <= data_i[26];
      data_o_25_sv2v_reg <= data_i[25];
      data_o_24_sv2v_reg <= data_i[24];
      data_o_23_sv2v_reg <= data_i[23];
      data_o_22_sv2v_reg <= data_i[22];
      data_o_21_sv2v_reg <= data_i[21];
      data_o_20_sv2v_reg <= data_i[20];
      data_o_19_sv2v_reg <= data_i[19];
      data_o_18_sv2v_reg <= data_i[18];
      data_o_17_sv2v_reg <= data_i[17];
      data_o_16_sv2v_reg <= data_i[16];
      data_o_15_sv2v_reg <= data_i[15];
      data_o_14_sv2v_reg <= data_i[14];
      data_o_13_sv2v_reg <= data_i[13];
      data_o_12_sv2v_reg <= data_i[12];
      data_o_11_sv2v_reg <= data_i[11];
      data_o_10_sv2v_reg <= data_i[10];
      data_o_9_sv2v_reg <= data_i[9];
      data_o_8_sv2v_reg <= data_i[8];
      data_o_7_sv2v_reg <= data_i[7];
      data_o_6_sv2v_reg <= data_i[6];
      data_o_5_sv2v_reg <= data_i[5];
      data_o_4_sv2v_reg <= data_i[4];
      data_o_3_sv2v_reg <= data_i[3];
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_dff_width_p3
(
  clk_i,
  data_i,
  data_o
);

  input [2:0] data_i;
  output [2:0] data_o;
  input clk_i;
  wire [2:0] data_o;
  reg data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(1'b1) begin
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_dff_en_width_p5
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
  wire [4:0] data_o;
  reg data_o_4_sv2v_reg,data_o_3_sv2v_reg,data_o_2_sv2v_reg,data_o_1_sv2v_reg,
  data_o_0_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(en_i) begin
      data_o_4_sv2v_reg <= data_i[4];
      data_o_3_sv2v_reg <= data_i[3];
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bsg_dff_en_width_p66
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [65:0] data_i;
  output [65:0] data_o;
  input clk_i;
  input en_i;
  wire [65:0] data_o;
  reg data_o_65_sv2v_reg,data_o_64_sv2v_reg,data_o_63_sv2v_reg,data_o_62_sv2v_reg,
  data_o_61_sv2v_reg,data_o_60_sv2v_reg,data_o_59_sv2v_reg,data_o_58_sv2v_reg,
  data_o_57_sv2v_reg,data_o_56_sv2v_reg,data_o_55_sv2v_reg,data_o_54_sv2v_reg,
  data_o_53_sv2v_reg,data_o_52_sv2v_reg,data_o_51_sv2v_reg,data_o_50_sv2v_reg,
  data_o_49_sv2v_reg,data_o_48_sv2v_reg,data_o_47_sv2v_reg,data_o_46_sv2v_reg,data_o_45_sv2v_reg,
  data_o_44_sv2v_reg,data_o_43_sv2v_reg,data_o_42_sv2v_reg,data_o_41_sv2v_reg,
  data_o_40_sv2v_reg,data_o_39_sv2v_reg,data_o_38_sv2v_reg,data_o_37_sv2v_reg,
  data_o_36_sv2v_reg,data_o_35_sv2v_reg,data_o_34_sv2v_reg,data_o_33_sv2v_reg,
  data_o_32_sv2v_reg,data_o_31_sv2v_reg,data_o_30_sv2v_reg,data_o_29_sv2v_reg,
  data_o_28_sv2v_reg,data_o_27_sv2v_reg,data_o_26_sv2v_reg,data_o_25_sv2v_reg,data_o_24_sv2v_reg,
  data_o_23_sv2v_reg,data_o_22_sv2v_reg,data_o_21_sv2v_reg,data_o_20_sv2v_reg,
  data_o_19_sv2v_reg,data_o_18_sv2v_reg,data_o_17_sv2v_reg,data_o_16_sv2v_reg,
  data_o_15_sv2v_reg,data_o_14_sv2v_reg,data_o_13_sv2v_reg,data_o_12_sv2v_reg,
  data_o_11_sv2v_reg,data_o_10_sv2v_reg,data_o_9_sv2v_reg,data_o_8_sv2v_reg,data_o_7_sv2v_reg,
  data_o_6_sv2v_reg,data_o_5_sv2v_reg,data_o_4_sv2v_reg,data_o_3_sv2v_reg,
  data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[65] = data_o_65_sv2v_reg;
  assign data_o[64] = data_o_64_sv2v_reg;
  assign data_o[63] = data_o_63_sv2v_reg;
  assign data_o[62] = data_o_62_sv2v_reg;
  assign data_o[61] = data_o_61_sv2v_reg;
  assign data_o[60] = data_o_60_sv2v_reg;
  assign data_o[59] = data_o_59_sv2v_reg;
  assign data_o[58] = data_o_58_sv2v_reg;
  assign data_o[57] = data_o_57_sv2v_reg;
  assign data_o[56] = data_o_56_sv2v_reg;
  assign data_o[55] = data_o_55_sv2v_reg;
  assign data_o[54] = data_o_54_sv2v_reg;
  assign data_o[53] = data_o_53_sv2v_reg;
  assign data_o[52] = data_o_52_sv2v_reg;
  assign data_o[51] = data_o_51_sv2v_reg;
  assign data_o[50] = data_o_50_sv2v_reg;
  assign data_o[49] = data_o_49_sv2v_reg;
  assign data_o[48] = data_o_48_sv2v_reg;
  assign data_o[47] = data_o_47_sv2v_reg;
  assign data_o[46] = data_o_46_sv2v_reg;
  assign data_o[45] = data_o_45_sv2v_reg;
  assign data_o[44] = data_o_44_sv2v_reg;
  assign data_o[43] = data_o_43_sv2v_reg;
  assign data_o[42] = data_o_42_sv2v_reg;
  assign data_o[41] = data_o_41_sv2v_reg;
  assign data_o[40] = data_o_40_sv2v_reg;
  assign data_o[39] = data_o_39_sv2v_reg;
  assign data_o[38] = data_o_38_sv2v_reg;
  assign data_o[37] = data_o_37_sv2v_reg;
  assign data_o[36] = data_o_36_sv2v_reg;
  assign data_o[35] = data_o_35_sv2v_reg;
  assign data_o[34] = data_o_34_sv2v_reg;
  assign data_o[33] = data_o_33_sv2v_reg;
  assign data_o[32] = data_o_32_sv2v_reg;
  assign data_o[31] = data_o_31_sv2v_reg;
  assign data_o[30] = data_o_30_sv2v_reg;
  assign data_o[29] = data_o_29_sv2v_reg;
  assign data_o[28] = data_o_28_sv2v_reg;
  assign data_o[27] = data_o_27_sv2v_reg;
  assign data_o[26] = data_o_26_sv2v_reg;
  assign data_o[25] = data_o_25_sv2v_reg;
  assign data_o[24] = data_o_24_sv2v_reg;
  assign data_o[23] = data_o_23_sv2v_reg;
  assign data_o[22] = data_o_22_sv2v_reg;
  assign data_o[21] = data_o_21_sv2v_reg;
  assign data_o[20] = data_o_20_sv2v_reg;
  assign data_o[19] = data_o_19_sv2v_reg;
  assign data_o[18] = data_o_18_sv2v_reg;
  assign data_o[17] = data_o_17_sv2v_reg;
  assign data_o[16] = data_o_16_sv2v_reg;
  assign data_o[15] = data_o_15_sv2v_reg;
  assign data_o[14] = data_o_14_sv2v_reg;
  assign data_o[13] = data_o_13_sv2v_reg;
  assign data_o[12] = data_o_12_sv2v_reg;
  assign data_o[11] = data_o_11_sv2v_reg;
  assign data_o[10] = data_o_10_sv2v_reg;
  assign data_o[9] = data_o_9_sv2v_reg;
  assign data_o[8] = data_o_8_sv2v_reg;
  assign data_o[7] = data_o_7_sv2v_reg;
  assign data_o[6] = data_o_6_sv2v_reg;
  assign data_o[5] = data_o_5_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(en_i) begin
      data_o_65_sv2v_reg <= data_i[65];
      data_o_64_sv2v_reg <= data_i[64];
      data_o_63_sv2v_reg <= data_i[63];
      data_o_62_sv2v_reg <= data_i[62];
      data_o_61_sv2v_reg <= data_i[61];
      data_o_60_sv2v_reg <= data_i[60];
      data_o_59_sv2v_reg <= data_i[59];
      data_o_58_sv2v_reg <= data_i[58];
      data_o_57_sv2v_reg <= data_i[57];
      data_o_56_sv2v_reg <= data_i[56];
      data_o_55_sv2v_reg <= data_i[55];
      data_o_54_sv2v_reg <= data_i[54];
      data_o_53_sv2v_reg <= data_i[53];
      data_o_52_sv2v_reg <= data_i[52];
      data_o_51_sv2v_reg <= data_i[51];
      data_o_50_sv2v_reg <= data_i[50];
      data_o_49_sv2v_reg <= data_i[49];
      data_o_48_sv2v_reg <= data_i[48];
      data_o_47_sv2v_reg <= data_i[47];
      data_o_46_sv2v_reg <= data_i[46];
      data_o_45_sv2v_reg <= data_i[45];
      data_o_44_sv2v_reg <= data_i[44];
      data_o_43_sv2v_reg <= data_i[43];
      data_o_42_sv2v_reg <= data_i[42];
      data_o_41_sv2v_reg <= data_i[41];
      data_o_40_sv2v_reg <= data_i[40];
      data_o_39_sv2v_reg <= data_i[39];
      data_o_38_sv2v_reg <= data_i[38];
      data_o_37_sv2v_reg <= data_i[37];
      data_o_36_sv2v_reg <= data_i[36];
      data_o_35_sv2v_reg <= data_i[35];
      data_o_34_sv2v_reg <= data_i[34];
      data_o_33_sv2v_reg <= data_i[33];
      data_o_32_sv2v_reg <= data_i[32];
      data_o_31_sv2v_reg <= data_i[31];
      data_o_30_sv2v_reg <= data_i[30];
      data_o_29_sv2v_reg <= data_i[29];
      data_o_28_sv2v_reg <= data_i[28];
      data_o_27_sv2v_reg <= data_i[27];
      data_o_26_sv2v_reg <= data_i[26];
      data_o_25_sv2v_reg <= data_i[25];
      data_o_24_sv2v_reg <= data_i[24];
      data_o_23_sv2v_reg <= data_i[23];
      data_o_22_sv2v_reg <= data_i[22];
      data_o_21_sv2v_reg <= data_i[21];
      data_o_20_sv2v_reg <= data_i[20];
      data_o_19_sv2v_reg <= data_i[19];
      data_o_18_sv2v_reg <= data_i[18];
      data_o_17_sv2v_reg <= data_i[17];
      data_o_16_sv2v_reg <= data_i[16];
      data_o_15_sv2v_reg <= data_i[15];
      data_o_14_sv2v_reg <= data_i[14];
      data_o_13_sv2v_reg <= data_i[13];
      data_o_12_sv2v_reg <= data_i[12];
      data_o_11_sv2v_reg <= data_i[11];
      data_o_10_sv2v_reg <= data_i[10];
      data_o_9_sv2v_reg <= data_i[9];
      data_o_8_sv2v_reg <= data_i[8];
      data_o_7_sv2v_reg <= data_i[7];
      data_o_6_sv2v_reg <= data_i[6];
      data_o_5_sv2v_reg <= data_i[5];
      data_o_4_sv2v_reg <= data_i[4];
      data_o_3_sv2v_reg <= data_i[3];
      data_o_2_sv2v_reg <= data_i[2];
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bp_be_regfile_00_66_3_0
(
  clk_i,
  reset_i,
  rs_r_v_i,
  rs_addr_i,
  rs_data_o,
  rd_w_v_i,
  rd_addr_i,
  rd_data_i
);

  input [2:0] rs_r_v_i;
  input [14:0] rs_addr_i;
  output [197:0] rs_data_o;
  input [4:0] rd_addr_i;
  input [65:0] rd_data_i;
  input clk_i;
  input reset_i;
  input rd_w_v_i;
  wire [197:0] rs_data_o,rs_data_lo;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,\bypass_0_.fwd_rs ,
  \bypass_0_.zero_rs_r ,\bypass_0_.fwd_rs_r ,\bypass_0_.rs_r_v_r ,N16,N17,N18,N19,N20,
  \bypass_0_.replace_rs ,N21,_2_net_,N22,N23,\bypass_1_.fwd_rs ,
  \bypass_1_.zero_rs_r ,\bypass_1_.fwd_rs_r ,\bypass_1_.rs_r_v_r ,N24,N25,N26,N27,N28,
  \bypass_1_.replace_rs ,N29,_5_net_,N30,N31,\bypass_2_.fwd_rs ,\bypass_2_.zero_rs_r ,
  \bypass_2_.fwd_rs_r ,\bypass_2_.rs_r_v_r ,N32,N33,N34,N35,N36,\bypass_2_.replace_rs ,N37,
  _8_net_,N38,N39,N40,N41,N42,N43,N44;
  wire [2:0] rs_v_li;
  wire [65:0] rd_data_r,\bypass_0_.fwd_data_lo ,\bypass_0_.rs_data_n ,\bypass_0_.rs_data_r ,
  \bypass_1_.fwd_data_lo ,\bypass_1_.rs_data_n ,\bypass_1_.rs_data_r ,
  \bypass_2_.fwd_data_lo ,\bypass_2_.rs_data_n ,\bypass_2_.rs_data_r ;
  wire [4:0] \bypass_0_.rs_addr_r ,\bypass_1_.rs_addr_r ,\bypass_2_.rs_addr_r ;

  bsg_mem_3r1w_sync_width_p66_els_p32
  \threeronew.rf 
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(rd_w_v_i),
    .w_addr_i(rd_addr_i),
    .w_data_i(rd_data_i),
    .r0_v_i(rs_v_li[0]),
    .r0_addr_i(rs_addr_i[4:0]),
    .r0_data_o(rs_data_lo[65:0]),
    .r1_v_i(rs_v_li[1]),
    .r1_addr_i(rs_addr_i[9:5]),
    .r1_data_o(rs_data_lo[131:66]),
    .r2_v_i(rs_v_li[2]),
    .r2_addr_i(rs_addr_i[14:10]),
    .r2_data_o(rs_data_lo[197:132])
  );


  bsg_dff_width_p66
  rd_reg
  (
    .clk_i(clk_i),
    .data_i(rd_data_i),
    .data_o(rd_data_r)
  );

  assign N15 = rd_addr_i == rs_addr_i[4:0];

  bsg_dff_width_p3
  \bypass_0_.rs_r_v_reg 
  (
    .clk_i(clk_i),
    .data_i({ 1'b0, \bypass_0_.fwd_rs , rs_r_v_i[0:0] }),
    .data_o({ \bypass_0_.zero_rs_r , \bypass_0_.fwd_rs_r , \bypass_0_.rs_r_v_r  })
  );


  bsg_dff_en_width_p5
  \bypass_0_.rs_addr_reg 
  (
    .clk_i(clk_i),
    .data_i(rs_addr_i[4:0]),
    .en_i(rs_r_v_i[0]),
    .data_o(\bypass_0_.rs_addr_r )
  );

  assign N20 = \bypass_0_.rs_addr_r  == rd_addr_i;

  bsg_dff_en_width_p66
  \bypass_0_.rs_data_reg 
  (
    .clk_i(clk_i),
    .data_i(\bypass_0_.rs_data_n ),
    .en_i(_2_net_),
    .data_o(\bypass_0_.rs_data_r )
  );

  assign N23 = rd_addr_i == rs_addr_i[9:5];

  bsg_dff_width_p3
  \bypass_1_.rs_r_v_reg 
  (
    .clk_i(clk_i),
    .data_i({ 1'b0, \bypass_1_.fwd_rs , rs_r_v_i[1:1] }),
    .data_o({ \bypass_1_.zero_rs_r , \bypass_1_.fwd_rs_r , \bypass_1_.rs_r_v_r  })
  );


  bsg_dff_en_width_p5
  \bypass_1_.rs_addr_reg 
  (
    .clk_i(clk_i),
    .data_i(rs_addr_i[9:5]),
    .en_i(rs_r_v_i[1]),
    .data_o(\bypass_1_.rs_addr_r )
  );

  assign N28 = \bypass_1_.rs_addr_r  == rd_addr_i;

  bsg_dff_en_width_p66
  \bypass_1_.rs_data_reg 
  (
    .clk_i(clk_i),
    .data_i(\bypass_1_.rs_data_n ),
    .en_i(_5_net_),
    .data_o(\bypass_1_.rs_data_r )
  );

  assign N31 = rd_addr_i == rs_addr_i[14:10];

  bsg_dff_width_p3
  \bypass_2_.rs_r_v_reg 
  (
    .clk_i(clk_i),
    .data_i({ 1'b0, \bypass_2_.fwd_rs , rs_r_v_i[2:2] }),
    .data_o({ \bypass_2_.zero_rs_r , \bypass_2_.fwd_rs_r , \bypass_2_.rs_r_v_r  })
  );


  bsg_dff_en_width_p5
  \bypass_2_.rs_addr_reg 
  (
    .clk_i(clk_i),
    .data_i(rs_addr_i[14:10]),
    .en_i(rs_r_v_i[2]),
    .data_o(\bypass_2_.rs_addr_r )
  );

  assign N36 = \bypass_2_.rs_addr_r  == rd_addr_i;

  bsg_dff_en_width_p66
  \bypass_2_.rs_data_reg 
  (
    .clk_i(clk_i),
    .data_i(\bypass_2_.rs_data_n ),
    .en_i(_8_net_),
    .data_o(\bypass_2_.rs_data_r )
  );

  assign \bypass_0_.fwd_data_lo  = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                   (N19)? rd_data_r : 
                                   (N17)? rs_data_lo[65:0] : 1'b0;
  assign N0 = \bypass_0_.zero_rs_r ;
  assign \bypass_0_.rs_data_n  = (N1)? rd_data_i : 
                                 (N2)? \bypass_0_.fwd_data_lo  : 1'b0;
  assign N1 = \bypass_0_.replace_rs ;
  assign N2 = N21;
  assign rs_data_o[65:0] = (N3)? \bypass_0_.fwd_data_lo  : 
                           (N4)? \bypass_0_.rs_data_r  : 1'b0;
  assign N3 = \bypass_0_.rs_r_v_r ;
  assign N4 = N22;
  assign \bypass_1_.fwd_data_lo  = (N5)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                   (N27)? rd_data_r : 
                                   (N25)? rs_data_lo[131:66] : 1'b0;
  assign N5 = \bypass_1_.zero_rs_r ;
  assign \bypass_1_.rs_data_n  = (N6)? rd_data_i : 
                                 (N7)? \bypass_1_.fwd_data_lo  : 1'b0;
  assign N6 = \bypass_1_.replace_rs ;
  assign N7 = N29;
  assign rs_data_o[131:66] = (N8)? \bypass_1_.fwd_data_lo  : 
                             (N9)? \bypass_1_.rs_data_r  : 1'b0;
  assign N8 = \bypass_1_.rs_r_v_r ;
  assign N9 = N30;
  assign \bypass_2_.fwd_data_lo  = (N10)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                   (N35)? rd_data_r : 
                                   (N33)? rs_data_lo[197:132] : 1'b0;
  assign N10 = \bypass_2_.zero_rs_r ;
  assign \bypass_2_.rs_data_n  = (N11)? rd_data_i : 
                                 (N12)? \bypass_2_.fwd_data_lo  : 1'b0;
  assign N11 = \bypass_2_.replace_rs ;
  assign N12 = N37;
  assign rs_data_o[197:132] = (N13)? \bypass_2_.fwd_data_lo  : 
                              (N14)? \bypass_2_.rs_data_r  : 1'b0;
  assign N13 = \bypass_2_.rs_r_v_r ;
  assign N14 = N38;
  assign \bypass_0_.fwd_rs  = N39 & N15;
  assign N39 = rd_w_v_i & rs_r_v_i[0];
  assign N16 = \bypass_0_.fwd_rs_r  | \bypass_0_.zero_rs_r ;
  assign N17 = ~N16;
  assign N18 = ~\bypass_0_.zero_rs_r ;
  assign N19 = \bypass_0_.fwd_rs_r  & N18;
  assign \bypass_0_.replace_rs  = rd_w_v_i & N20;
  assign N21 = ~\bypass_0_.replace_rs ;
  assign _2_net_ = \bypass_0_.rs_r_v_r  | \bypass_0_.replace_rs ;
  assign rs_v_li[0] = rs_r_v_i[0] & N40;
  assign N40 = ~\bypass_0_.fwd_rs ;
  assign N22 = ~\bypass_0_.rs_r_v_r ;
  assign \bypass_1_.fwd_rs  = N41 & N23;
  assign N41 = rd_w_v_i & rs_r_v_i[1];
  assign N24 = \bypass_1_.fwd_rs_r  | \bypass_1_.zero_rs_r ;
  assign N25 = ~N24;
  assign N26 = ~\bypass_1_.zero_rs_r ;
  assign N27 = \bypass_1_.fwd_rs_r  & N26;
  assign \bypass_1_.replace_rs  = rd_w_v_i & N28;
  assign N29 = ~\bypass_1_.replace_rs ;
  assign _5_net_ = \bypass_1_.rs_r_v_r  | \bypass_1_.replace_rs ;
  assign rs_v_li[1] = rs_r_v_i[1] & N42;
  assign N42 = ~\bypass_1_.fwd_rs ;
  assign N30 = ~\bypass_1_.rs_r_v_r ;
  assign \bypass_2_.fwd_rs  = N43 & N31;
  assign N43 = rd_w_v_i & rs_r_v_i[2];
  assign N32 = \bypass_2_.fwd_rs_r  | \bypass_2_.zero_rs_r ;
  assign N33 = ~N32;
  assign N34 = ~\bypass_2_.zero_rs_r ;
  assign N35 = \bypass_2_.fwd_rs_r  & N34;
  assign \bypass_2_.replace_rs  = rd_w_v_i & N36;
  assign N37 = ~\bypass_2_.replace_rs ;
  assign _8_net_ = \bypass_2_.rs_r_v_r  | \bypass_2_.replace_rs ;
  assign rs_v_li[2] = rs_r_v_i[2] & N44;
  assign N44 = ~\bypass_2_.fwd_rs ;
  assign N38 = ~\bypass_2_.rs_r_v_r ;

endmodule



module bp_be_fp_regfile
(
  clk_i,
  reset_i,
  rs_r_v_i,
  rs_addr_i,
  rs_data_o,
  rd_w_v_i,
  rd_addr_i,
  rd_data_i
);

  input [2:0] rs_r_v_i;
  input [14:0] rs_addr_i;
  output [197:0] rs_data_o;
  input [4:0] rd_addr_i;
  input [65:0] rd_data_i;
  input clk_i;
  input reset_i;
  input rd_w_v_i;
  wire [197:0] rs_data_o;

  bp_be_regfile_00_66_3_0
  regfile
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .rs_r_v_i(rs_r_v_i),
    .rs_addr_i(rs_addr_i),
    .rs_data_o(rs_data_o),
    .rd_w_v_i(rd_w_v_i),
    .rd_addr_i(rd_addr_i),
    .rd_data_i(rd_data_i)
  );


endmodule

