

module bsg_counter_clear_up_max_val_p64_init_val_p0
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [6:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [6:0] count_o;
  wire N0,N1,N4,N5,N6,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N2,N3,N7,N30,N20;
  reg count_o_6_sv2v_reg,count_o_5_sv2v_reg,count_o_4_sv2v_reg,count_o_3_sv2v_reg,
  count_o_2_sv2v_reg,count_o_1_sv2v_reg,count_o_0_sv2v_reg;
  assign count_o[6] = count_o_6_sv2v_reg;
  assign count_o[5] = count_o_5_sv2v_reg;
  assign count_o[4] = count_o_4_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N20 = reset_i | clear_i;
  assign { N12, N11, N10, N9, N8, N6, N5 } = count_o + 1'b1;
  assign N13 = (N0)? 1'b1 : 
               (N7)? 1'b1 : 
               (N3)? 1'b0 : 1'b0;
  assign N0 = clear_i;
  assign N15 = (N1)? 1'b1 : 
               (N30)? 1'b0 : 1'b0;
  assign N1 = up_i;
  assign N14 = (N0)? up_i : 
               (N7)? N5 : 1'b0;
  assign N4 = N19;
  assign N16 = ~reset_i;
  assign N17 = ~clear_i;
  assign N18 = N16 & N17;
  assign N19 = up_i & N18;
  assign N2 = up_i | clear_i;
  assign N3 = ~N2;
  assign N7 = up_i & N17;
  assign N30 = ~up_i;

  always @(posedge clk_i) begin
    if(N20) begin
      count_o_6_sv2v_reg <= 1'b0;
      count_o_5_sv2v_reg <= 1'b0;
      count_o_4_sv2v_reg <= 1'b0;
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(N15) begin
      count_o_6_sv2v_reg <= N12;
      count_o_5_sv2v_reg <= N11;
      count_o_4_sv2v_reg <= N10;
      count_o_3_sv2v_reg <= N9;
      count_o_2_sv2v_reg <= N8;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(N13) begin
      count_o_0_sv2v_reg <= N14;
    end 
  end


endmodule



module bsg_mem_1r1w_sync_width_p50_els_p64_latch_last_read_p1
(
  clk_i,
  reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [5:0] w_addr_i;
  input [49:0] w_data_i;
  input [5:0] r_addr_i;
  output [49:0] r_data_o;
  input clk_i;
  input reset_i;
  input w_v_i;
  input r_v_i;
  wire [49:0] r_data_o;

  bsg_mem_1r1w_sync_synth
   #(.width_p(50), .els_p(1<<6))
  synth
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_dff_reset_set_clear_width_p1
(
  clk_i,
  reset_i,
  set_i,
  clear_i,
  data_o
);

  input [0:0] set_i;
  input [0:0] clear_i;
  output [0:0] data_o;
  input clk_i;
  input reset_i;
  wire [0:0] data_o;
  wire N0,N1,N2;
  reg data_o_0_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;
  assign N0 = N2 | set_i[0];
  assign N2 = data_o[0] & N1;
  assign N1 = ~clear_i[0];

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      data_o_0_sv2v_reg <= N0;
    end 
  end


endmodule



module bsg_dff_reset_en_0000000f
(
  clk_i,
  reset_i,
  en_i,
  data_i,
  data_o
);

  input [14:0] data_i;
  output [14:0] data_o;
  input clk_i;
  input reset_i;
  input en_i;
  wire [14:0] data_o;
  wire N0,N1,N2;
  reg data_o_14_sv2v_reg,data_o_13_sv2v_reg,data_o_12_sv2v_reg,data_o_11_sv2v_reg,
  data_o_10_sv2v_reg,data_o_9_sv2v_reg,data_o_8_sv2v_reg,data_o_7_sv2v_reg,
  data_o_6_sv2v_reg,data_o_5_sv2v_reg,data_o_4_sv2v_reg,data_o_3_sv2v_reg,data_o_2_sv2v_reg,
  data_o_1_sv2v_reg,data_o_0_sv2v_reg;
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
  assign N2 = (N0)? 1'b1 : 
              (N1)? 1'b0 : 1'b0;
  assign N0 = en_i;
  assign N1 = ~en_i;

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_14_sv2v_reg <= 1'b0;
      data_o_13_sv2v_reg <= 1'b0;
      data_o_12_sv2v_reg <= 1'b0;
      data_o_11_sv2v_reg <= 1'b0;
      data_o_10_sv2v_reg <= 1'b0;
      data_o_9_sv2v_reg <= 1'b0;
      data_o_8_sv2v_reg <= 1'b0;
      data_o_7_sv2v_reg <= 1'b0;
      data_o_6_sv2v_reg <= 1'b0;
      data_o_5_sv2v_reg <= 1'b0;
      data_o_4_sv2v_reg <= 1'b0;
      data_o_3_sv2v_reg <= 1'b0;
      data_o_2_sv2v_reg <= 1'b0;
      data_o_1_sv2v_reg <= 1'b0;
      data_o_0_sv2v_reg <= 1'b0;
    end else if(N2) begin
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



module bp_fe_btb_00
(
  clk_i,
  reset_i,
  init_done_o,
  r_addr_i,
  r_v_i,
  r_tag_o,
  r_idx_o,
  r_tgt_o,
  r_tgt_v_o,
  r_tgt_jmp_o,
  w_v_i,
  w_force_i,
  w_clr_i,
  w_jmp_i,
  w_tag_i,
  w_idx_i,
  w_tgt_i,
  w_yumi_o
);

  input [38:0] r_addr_i;
  output [8:0] r_tag_o;
  output [5:0] r_idx_o;
  output [38:0] r_tgt_o;
  input [8:0] w_tag_i;
  input [5:0] w_idx_i;
  input [38:0] w_tgt_i;
  input clk_i;
  input reset_i;
  input r_v_i;
  input w_v_i;
  input w_force_i;
  input w_clr_i;
  input w_jmp_i;
  output init_done_o;
  output r_tgt_v_o;
  output r_tgt_jmp_o;
  output w_yumi_o;
  wire [8:0] r_tag_o;
  wire [5:0] r_idx_o,w_addr_li;
  wire [38:0] r_tgt_o;
  wire init_done_o,r_tgt_v_o,r_tgt_jmp_o,w_yumi_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,
  N11,N12,rw_same_addr,suppress_read,suppress_write,w_v_li,N13,N14,N15,N16,r_v_li,
  N17,r_data_lo_v_,r_data_lo_jmp_,r_data_lo_tag__8_,r_data_lo_tag__7_,
  r_data_lo_tag__6_,r_data_lo_tag__5_,r_data_lo_tag__4_,r_data_lo_tag__3_,r_data_lo_tag__2_,
  r_data_lo_tag__1_,r_data_lo_tag__0_,r_v_r,N18,N19,N20,N22,N23,N24,N25,N26,N27,N28,
  N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,N42,N43,N44,N45;
  wire [1:0] state_r,state_n;
  wire [6:0] init_cnt;
  wire [49:0] w_data_li;
  wire [0:0] r_idx_li;
  reg state_r_1_sv2v_reg,state_r_0_sv2v_reg;
  assign state_r[1] = state_r_1_sv2v_reg;
  assign state_r[0] = state_r_0_sv2v_reg;

  bsg_counter_clear_up_max_val_p64_init_val_p0
  init_counter
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(1'b0),
    .up_i(N24),
    .count_o(init_cnt)
  );

  assign N6 = state_r[1] | N22;
  assign N8 = N19 | state_r[0];
  assign N10 = state_r[1] & state_r[0];
  assign N11 = N19 & N22;
  assign N17 = { r_addr_i[7:3], r_idx_li[0:0] } == w_idx_i;

  bsg_mem_1r1w_sync_width_p50_els_p64_latch_last_read_p1
  btb_mem
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(w_v_li),
    .w_addr_i(w_addr_li),
    .w_data_i(w_data_li),
    .r_v_i(r_v_li),
    .r_addr_i({ r_addr_i[7:3], r_idx_li[0:0] }),
    .r_data_o({ r_data_lo_v_, r_data_lo_jmp_, r_data_lo_tag__8_, r_data_lo_tag__7_, r_data_lo_tag__6_, r_data_lo_tag__5_, r_data_lo_tag__4_, r_data_lo_tag__3_, r_data_lo_tag__2_, r_data_lo_tag__1_, r_data_lo_tag__0_, r_tgt_o })
  );


  bsg_dff_reset_set_clear_width_p1
  r_v_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .set_i(r_v_li),
    .clear_i(r_v_i),
    .data_o(r_v_r)
  );


  bsg_dff_reset_en_0000000f
  tag_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .en_i(r_v_i),
    .data_i({ r_addr_i[7:3], r_idx_li[0:0], r_addr_i[16:8] }),
    .data_o({ r_idx_o, r_tag_o })
  );

  assign N18 = { r_data_lo_tag__8_, r_data_lo_tag__7_, r_data_lo_tag__6_, r_data_lo_tag__5_, r_data_lo_tag__4_, r_data_lo_tag__3_, r_data_lo_tag__2_, r_data_lo_tag__1_, r_data_lo_tag__0_ } == r_tag_o;
  assign N19 = ~state_r[1];
  assign N20 = state_r[0] | N19;
  assign init_done_o = ~N20;
  assign N22 = ~state_r[0];
  assign N23 = N22 | state_r[1];
  assign N24 = ~N23;
  assign N25 = ~init_cnt[5];
  assign N26 = ~init_cnt[4];
  assign N27 = ~init_cnt[3];
  assign N28 = ~init_cnt[2];
  assign N29 = ~init_cnt[1];
  assign N30 = ~init_cnt[0];
  assign N31 = N25 | init_cnt[6];
  assign N32 = N26 | N31;
  assign N33 = N27 | N32;
  assign N34 = N28 | N33;
  assign N35 = N29 | N34;
  assign N36 = N30 | N35;
  assign N37 = ~N36;
  assign state_n = (N0)? { N37, N36 } : 
                   (N1)? { 1'b1, 1'b0 } : 
                   (N2)? { 1'b0, 1'b1 } : 1'b0;
  assign N0 = N7;
  assign N1 = N9;
  assign N2 = N12;
  assign w_addr_li = (N3)? init_cnt[5:0] : 
                     (N4)? w_idx_i : 1'b0;
  assign N3 = N14;
  assign N4 = N13;
  assign w_data_li[49] = ~N15;
  assign w_data_li[48:0] = (N5)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 
                           (N16)? { w_jmp_i, w_tag_i, w_tgt_i } : 1'b0;
  assign N5 = N15;
  assign N7 = ~N6;
  assign N9 = ~N8;
  assign N12 = N10 | N11;
  assign suppress_read = rw_same_addr & w_force_i;
  assign suppress_write = rw_same_addr & N38;
  assign N38 = ~w_force_i;
  assign w_v_li = N24 | N40;
  assign N40 = w_v_i & N39;
  assign N39 = ~suppress_write;
  assign N13 = ~N24;
  assign N14 = N24;
  assign N15 = N24 | N41;
  assign N41 = w_v_i & w_clr_i;
  assign N16 = ~N15;
  assign r_v_li = r_v_i & N42;
  assign N42 = ~suppress_read;
  assign r_idx_li[0] = r_addr_i[2] ^ r_addr_i[1];
  assign rw_same_addr = N43 & N17;
  assign N43 = r_v_i & w_v_i;
  assign w_yumi_o = init_done_o & w_v_li;
  assign r_tgt_v_o = N44 & N18;
  assign N44 = r_v_r & r_data_lo_v_;
  assign r_tgt_jmp_o = N45 & r_data_lo_jmp_;
  assign N45 = r_v_r & r_data_lo_v_;

  always @(posedge clk_i) begin
    if(reset_i) begin
      state_r_1_sv2v_reg <= 1'b0;
      state_r_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      state_r_1_sv2v_reg <= state_n[1];
      state_r_0_sv2v_reg <= state_n[0];
    end 
  end


endmodule



module bsg_counter_clear_up_max_val_p512_init_val_p0
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [9:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [9:0] count_o;
  wire N0,N1,N4,N5,N6,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,N22,N2,N3,
  N7,N30,N23;
  reg count_o_9_sv2v_reg,count_o_8_sv2v_reg,count_o_7_sv2v_reg,count_o_6_sv2v_reg,
  count_o_5_sv2v_reg,count_o_4_sv2v_reg,count_o_3_sv2v_reg,count_o_2_sv2v_reg,
  count_o_1_sv2v_reg,count_o_0_sv2v_reg;
  assign count_o[9] = count_o_9_sv2v_reg;
  assign count_o[8] = count_o_8_sv2v_reg;
  assign count_o[7] = count_o_7_sv2v_reg;
  assign count_o[6] = count_o_6_sv2v_reg;
  assign count_o[5] = count_o_5_sv2v_reg;
  assign count_o[4] = count_o_4_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N23 = reset_i | clear_i;
  assign { N15, N14, N13, N12, N11, N10, N9, N8, N6, N5 } = count_o + 1'b1;
  assign N16 = (N0)? 1'b1 : 
               (N7)? 1'b1 : 
               (N3)? 1'b0 : 1'b0;
  assign N0 = clear_i;
  assign N18 = (N1)? 1'b1 : 
               (N30)? 1'b0 : 1'b0;
  assign N1 = up_i;
  assign N17 = (N0)? up_i : 
               (N7)? N5 : 1'b0;
  assign N4 = N22;
  assign N19 = ~reset_i;
  assign N20 = ~clear_i;
  assign N21 = N19 & N20;
  assign N22 = up_i & N21;
  assign N2 = up_i | clear_i;
  assign N3 = ~N2;
  assign N7 = up_i & N20;
  assign N30 = ~up_i;

  always @(posedge clk_i) begin
    if(N23) begin
      count_o_9_sv2v_reg <= 1'b0;
      count_o_8_sv2v_reg <= 1'b0;
      count_o_7_sv2v_reg <= 1'b0;
      count_o_6_sv2v_reg <= 1'b0;
      count_o_5_sv2v_reg <= 1'b0;
      count_o_4_sv2v_reg <= 1'b0;
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(N18) begin
      count_o_9_sv2v_reg <= N15;
      count_o_8_sv2v_reg <= N14;
      count_o_7_sv2v_reg <= N13;
      count_o_6_sv2v_reg <= N12;
      count_o_5_sv2v_reg <= N11;
      count_o_4_sv2v_reg <= N10;
      count_o_3_sv2v_reg <= N9;
      count_o_2_sv2v_reg <= N8;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(N16) begin
      count_o_0_sv2v_reg <= N17;
    end 
  end


endmodule



module bsg_mem_1r1w_sync_00000008_512_1
(
  clk_i,
  reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [8:0] w_addr_i;
  input [7:0] w_data_i;
  input [8:0] r_addr_i;
  output [7:0] r_data_o;
  input clk_i;
  input reset_i;
  input w_v_i;
  input r_v_i;
  wire [7:0] r_data_o;

  bsg_mem_1r1w_sync_synth
   #(.width_p(8), .els_p(1<<9))
  synth
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_dff_en_00000009
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [8:0] data_i;
  output [8:0] data_o;
  input clk_i;
  input en_i;
  wire [8:0] data_o;
  reg data_o_8_sv2v_reg,data_o_7_sv2v_reg,data_o_6_sv2v_reg,data_o_5_sv2v_reg,
  data_o_4_sv2v_reg,data_o_3_sv2v_reg,data_o_2_sv2v_reg,data_o_1_sv2v_reg,
  data_o_0_sv2v_reg;
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



module bp_fe_bht_00
(
  clk_i,
  reset_i,
  init_done_o,
  w_v_i,
  w_force_i,
  w_idx_i,
  w_offset_i,
  w_ghist_i,
  w_val_i,
  w_correct_i,
  w_yumi_o,
  r_v_i,
  r_addr_i,
  r_ghist_i,
  r_val_o,
  r_pred_o,
  r_idx_o,
  r_offset_o
);

  input [6:0] w_idx_i;
  input [1:0] w_offset_i;
  input [1:0] w_ghist_i;
  input [7:0] w_val_i;
  input [38:0] r_addr_i;
  input [1:0] r_ghist_i;
  output [7:0] r_val_o;
  output [6:0] r_idx_o;
  output [1:0] r_offset_o;
  input clk_i;
  input reset_i;
  input w_v_i;
  input w_force_i;
  input w_correct_i;
  input r_v_i;
  output init_done_o;
  output w_yumi_o;
  output r_pred_o;
  wire [7:0] r_val_o,w_data_li;
  wire [6:0] r_idx_o;
  wire [1:0] r_offset_o,state_r,state_n;
  wire init_done_o,w_yumi_o,r_pred_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,
  rw_same_addr,suppress_read,suppress_write,w_v_li,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45,N46,N47,r_v_li,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,
  N61,N62,N63,N64,N65,N67,N68,N69,N70,N71,N72,N73,N74,N75,N76,N77,N78,N79,N80,N81,
  N82,N83,N84,N85,N86,N87,N88,N89,N90,N91,N92,N93,N94,N95,N96,N97;
  wire [9:0] init_cnt;
  wire [8:0] w_addr_li;
  wire [3:0] w_mask_li;
  wire [0:0] r_idx_li;
  wire [2:0] pred_bit_lo;
  reg state_r_1_sv2v_reg,state_r_0_sv2v_reg;
  assign state_r[1] = state_r_1_sv2v_reg;
  assign state_r[0] = state_r_0_sv2v_reg;

  bsg_counter_clear_up_max_val_p512_init_val_p0
  init_counter
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(1'b0),
    .up_i(N88),
    .count_o(init_cnt)
  );

  assign N5 = state_r[1] | N86;
  assign N7 = N64 | state_r[0];
  assign N9 = state_r[1] & state_r[0];
  assign N10 = N64 & N86;
  assign { N17, N16, N15, N14 } = { 1'b0, 1'b0, 1'b0, 1'b1 } << w_offset_i;
  assign N48 = { r_ghist_i, r_addr_i[8:3], r_idx_li[0:0] } == w_addr_li;

  bsg_mem_1r1w_sync_00000008_512_1
  bht_mem
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .w_v_i(w_v_li),
    .w_addr_i(w_addr_li),
    .w_data_i(w_data_li),
    .r_v_i(r_v_li),
    .r_addr_i({ r_ghist_i, r_addr_i[8:3], r_idx_li[0:0] }),
    .r_data_o(r_val_o)
  );


  bsg_dff_en_00000009
  pred_idx_reg
  (
    .clk_i(clk_i),
    .data_i({ r_addr_i[10:3], r_idx_li[0:0] }),
    .en_i(r_v_i),
    .data_o({ r_offset_o, r_idx_o })
  );

  assign r_pred_o = (N56)? r_val_o[0] : 
                    (N58)? r_val_o[1] : 
                    (N60)? r_val_o[2] : 
                    (N62)? r_val_o[3] : 
                    (N57)? r_val_o[4] : 
                    (N59)? r_val_o[5] : 
                    (N61)? r_val_o[6] : 
                    (N63)? r_val_o[7] : 1'b0;
  assign N64 = ~state_r[1];
  assign N65 = state_r[0] | N64;
  assign init_done_o = ~N65;
  assign N67 = ~init_cnt[8];
  assign N68 = ~init_cnt[7];
  assign N69 = ~init_cnt[6];
  assign N70 = ~init_cnt[5];
  assign N71 = ~init_cnt[4];
  assign N72 = ~init_cnt[3];
  assign N73 = ~init_cnt[2];
  assign N74 = ~init_cnt[1];
  assign N75 = ~init_cnt[0];
  assign N76 = N67 | init_cnt[9];
  assign N77 = N68 | N76;
  assign N78 = N69 | N77;
  assign N79 = N70 | N78;
  assign N80 = N71 | N79;
  assign N81 = N72 | N80;
  assign N82 = N73 | N81;
  assign N83 = N74 | N82;
  assign N84 = N75 | N83;
  assign N85 = ~N84;
  assign N86 = ~state_r[0];
  assign N87 = N86 | state_r[1];
  assign N88 = ~N87;
  assign pred_bit_lo = { r_offset_o, 1'b0 } + 1'b1;
  assign state_n = (N0)? { N85, N84 } : 
                   (N1)? { 1'b1, 1'b0 } : 
                   (N2)? { 1'b0, 1'b1 } : 1'b0;
  assign N0 = N6;
  assign N1 = N8;
  assign N2 = N11;
  assign w_addr_li = (N3)? init_cnt[8:0] : 
                     (N4)? { w_ghist_i, w_idx_i } : 1'b0;
  assign N3 = N13;
  assign N4 = N12;
  assign w_mask_li = (N3)? { 1'b1, 1'b1, 1'b1, 1'b1 } : 
                     (N4)? { N17, N16, N15, N14 } : 1'b0;
  assign w_data_li[0] = (N3)? 1'b1 : 
                        (N22)? N20 : 
                        (N19)? w_val_i[0] : 1'b0;
  assign w_data_li[1] = (N3)? 1'b0 : 
                        (N26)? N25 : 
                        (N24)? w_val_i[1] : 1'b0;
  assign w_data_li[2] = (N3)? 1'b1 : 
                        (N29)? N20 : 
                        (N28)? w_val_i[2] : 1'b0;
  assign w_data_li[3] = (N3)? 1'b0 : 
                        (N33)? N32 : 
                        (N31)? w_val_i[3] : 1'b0;
  assign w_data_li[4] = (N3)? 1'b1 : 
                        (N36)? N20 : 
                        (N35)? w_val_i[4] : 1'b0;
  assign w_data_li[5] = (N3)? 1'b0 : 
                        (N40)? N39 : 
                        (N38)? w_val_i[5] : 1'b0;
  assign w_data_li[6] = (N3)? 1'b1 : 
                        (N43)? N20 : 
                        (N42)? w_val_i[6] : 1'b0;
  assign w_data_li[7] = (N3)? 1'b0 : 
                        (N47)? N46 : 
                        (N45)? w_val_i[7] : 1'b0;
  assign N6 = ~N5;
  assign N8 = ~N7;
  assign N11 = N9 | N10;
  assign suppress_read = rw_same_addr & w_force_i;
  assign suppress_write = rw_same_addr & N89;
  assign N89 = ~w_force_i;
  assign w_v_li = N88 | N91;
  assign N91 = w_v_i & N90;
  assign N90 = ~suppress_write;
  assign N12 = ~N88;
  assign N13 = N88;
  assign N18 = w_mask_li[0] | N13;
  assign N19 = ~N18;
  assign N20 = ~w_correct_i;
  assign N21 = ~N13;
  assign N22 = w_mask_li[0] & N21;
  assign N23 = w_mask_li[0] | N13;
  assign N24 = ~N23;
  assign N25 = w_val_i[1] ^ N92;
  assign N92 = N20 & w_val_i[0];
  assign N26 = w_mask_li[0] & N21;
  assign N27 = w_mask_li[1] | N13;
  assign N28 = ~N27;
  assign N29 = w_mask_li[1] & N21;
  assign N30 = w_mask_li[1] | N13;
  assign N31 = ~N30;
  assign N32 = w_val_i[3] ^ N93;
  assign N93 = N20 & w_val_i[2];
  assign N33 = w_mask_li[1] & N21;
  assign N34 = w_mask_li[2] | N13;
  assign N35 = ~N34;
  assign N36 = w_mask_li[2] & N21;
  assign N37 = w_mask_li[2] | N13;
  assign N38 = ~N37;
  assign N39 = w_val_i[5] ^ N94;
  assign N94 = N20 & w_val_i[4];
  assign N40 = w_mask_li[2] & N21;
  assign N41 = w_mask_li[3] | N13;
  assign N42 = ~N41;
  assign N43 = w_mask_li[3] & N21;
  assign N44 = w_mask_li[3] | N13;
  assign N45 = ~N44;
  assign N46 = w_val_i[7] ^ N95;
  assign N95 = N20 & w_val_i[6];
  assign N47 = w_mask_li[3] & N21;
  assign r_v_li = r_v_i & N96;
  assign N96 = ~suppress_read;
  assign r_idx_li[0] = r_addr_i[2] ^ r_addr_i[1];
  assign rw_same_addr = N97 & N48;
  assign N97 = r_v_i & w_v_i;
  assign w_yumi_o = init_done_o & w_v_li;
  assign N49 = ~pred_bit_lo[0];
  assign N50 = ~pred_bit_lo[1];
  assign N51 = N49 & N50;
  assign N52 = N49 & pred_bit_lo[1];
  assign N53 = pred_bit_lo[0] & N50;
  assign N54 = pred_bit_lo[0] & pred_bit_lo[1];
  assign N55 = ~pred_bit_lo[2];
  assign N56 = N51 & N55;
  assign N57 = N51 & pred_bit_lo[2];
  assign N58 = N53 & N55;
  assign N59 = N53 & pred_bit_lo[2];
  assign N60 = N52 & N55;
  assign N61 = N52 & pred_bit_lo[2];
  assign N62 = N54 & N55;
  assign N63 = N54 & pred_bit_lo[2];

  always @(posedge clk_i) begin
    if(reset_i) begin
      state_r_1_sv2v_reg <= 1'b0;
      state_r_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      state_r_1_sv2v_reg <= state_n[1];
      state_r_0_sv2v_reg <= state_n[0];
    end 
  end


endmodule



module bsg_dff_reset_en_0000005a
(
  clk_i,
  reset_i,
  en_i,
  data_i,
  data_o
);

  input [89:0] data_i;
  output [89:0] data_o;
  input clk_i;
  input reset_i;
  input en_i;
  wire [89:0] data_o;
  wire N0,N1,N2;
  reg data_o_89_sv2v_reg,data_o_88_sv2v_reg,data_o_87_sv2v_reg,data_o_86_sv2v_reg,
  data_o_85_sv2v_reg,data_o_84_sv2v_reg,data_o_83_sv2v_reg,data_o_82_sv2v_reg,
  data_o_81_sv2v_reg,data_o_80_sv2v_reg,data_o_79_sv2v_reg,data_o_78_sv2v_reg,
  data_o_77_sv2v_reg,data_o_76_sv2v_reg,data_o_75_sv2v_reg,data_o_74_sv2v_reg,
  data_o_73_sv2v_reg,data_o_72_sv2v_reg,data_o_71_sv2v_reg,data_o_70_sv2v_reg,data_o_69_sv2v_reg,
  data_o_68_sv2v_reg,data_o_67_sv2v_reg,data_o_66_sv2v_reg,data_o_65_sv2v_reg,
  data_o_64_sv2v_reg,data_o_63_sv2v_reg,data_o_62_sv2v_reg,data_o_61_sv2v_reg,
  data_o_60_sv2v_reg,data_o_59_sv2v_reg,data_o_58_sv2v_reg,data_o_57_sv2v_reg,
  data_o_56_sv2v_reg,data_o_55_sv2v_reg,data_o_54_sv2v_reg,data_o_53_sv2v_reg,
  data_o_52_sv2v_reg,data_o_51_sv2v_reg,data_o_50_sv2v_reg,data_o_49_sv2v_reg,data_o_48_sv2v_reg,
  data_o_47_sv2v_reg,data_o_46_sv2v_reg,data_o_45_sv2v_reg,data_o_44_sv2v_reg,
  data_o_43_sv2v_reg,data_o_42_sv2v_reg,data_o_41_sv2v_reg,data_o_40_sv2v_reg,
  data_o_39_sv2v_reg,data_o_38_sv2v_reg,data_o_37_sv2v_reg,data_o_36_sv2v_reg,
  data_o_35_sv2v_reg,data_o_34_sv2v_reg,data_o_33_sv2v_reg,data_o_32_sv2v_reg,
  data_o_31_sv2v_reg,data_o_30_sv2v_reg,data_o_29_sv2v_reg,data_o_28_sv2v_reg,data_o_27_sv2v_reg,
  data_o_26_sv2v_reg,data_o_25_sv2v_reg,data_o_24_sv2v_reg,data_o_23_sv2v_reg,
  data_o_22_sv2v_reg,data_o_21_sv2v_reg,data_o_20_sv2v_reg,data_o_19_sv2v_reg,
  data_o_18_sv2v_reg,data_o_17_sv2v_reg,data_o_16_sv2v_reg,data_o_15_sv2v_reg,
  data_o_14_sv2v_reg,data_o_13_sv2v_reg,data_o_12_sv2v_reg,data_o_11_sv2v_reg,data_o_10_sv2v_reg,
  data_o_9_sv2v_reg,data_o_8_sv2v_reg,data_o_7_sv2v_reg,data_o_6_sv2v_reg,
  data_o_5_sv2v_reg,data_o_4_sv2v_reg,data_o_3_sv2v_reg,data_o_2_sv2v_reg,
  data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[89] = data_o_89_sv2v_reg;
  assign data_o[88] = data_o_88_sv2v_reg;
  assign data_o[87] = data_o_87_sv2v_reg;
  assign data_o[86] = data_o_86_sv2v_reg;
  assign data_o[85] = data_o_85_sv2v_reg;
  assign data_o[84] = data_o_84_sv2v_reg;
  assign data_o[83] = data_o_83_sv2v_reg;
  assign data_o[82] = data_o_82_sv2v_reg;
  assign data_o[81] = data_o_81_sv2v_reg;
  assign data_o[80] = data_o_80_sv2v_reg;
  assign data_o[79] = data_o_79_sv2v_reg;
  assign data_o[78] = data_o_78_sv2v_reg;
  assign data_o[77] = data_o_77_sv2v_reg;
  assign data_o[76] = data_o_76_sv2v_reg;
  assign data_o[75] = data_o_75_sv2v_reg;
  assign data_o[74] = data_o_74_sv2v_reg;
  assign data_o[73] = data_o_73_sv2v_reg;
  assign data_o[72] = data_o_72_sv2v_reg;
  assign data_o[71] = data_o_71_sv2v_reg;
  assign data_o[70] = data_o_70_sv2v_reg;
  assign data_o[69] = data_o_69_sv2v_reg;
  assign data_o[68] = data_o_68_sv2v_reg;
  assign data_o[67] = data_o_67_sv2v_reg;
  assign data_o[66] = data_o_66_sv2v_reg;
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
  assign N2 = (N0)? 1'b1 : 
              (N1)? 1'b0 : 1'b0;
  assign N0 = en_i;
  assign N1 = ~en_i;

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_89_sv2v_reg <= 1'b0;
      data_o_88_sv2v_reg <= 1'b0;
      data_o_87_sv2v_reg <= 1'b0;
      data_o_86_sv2v_reg <= 1'b0;
      data_o_85_sv2v_reg <= 1'b0;
      data_o_84_sv2v_reg <= 1'b0;
      data_o_83_sv2v_reg <= 1'b0;
      data_o_82_sv2v_reg <= 1'b0;
      data_o_81_sv2v_reg <= 1'b0;
      data_o_80_sv2v_reg <= 1'b0;
      data_o_79_sv2v_reg <= 1'b0;
      data_o_78_sv2v_reg <= 1'b0;
      data_o_77_sv2v_reg <= 1'b0;
      data_o_76_sv2v_reg <= 1'b0;
      data_o_75_sv2v_reg <= 1'b0;
      data_o_74_sv2v_reg <= 1'b0;
      data_o_73_sv2v_reg <= 1'b0;
      data_o_72_sv2v_reg <= 1'b0;
      data_o_71_sv2v_reg <= 1'b0;
      data_o_70_sv2v_reg <= 1'b0;
      data_o_69_sv2v_reg <= 1'b0;
      data_o_68_sv2v_reg <= 1'b0;
      data_o_67_sv2v_reg <= 1'b0;
      data_o_66_sv2v_reg <= 1'b0;
      data_o_65_sv2v_reg <= 1'b0;
      data_o_64_sv2v_reg <= 1'b0;
      data_o_63_sv2v_reg <= 1'b0;
      data_o_62_sv2v_reg <= 1'b0;
      data_o_61_sv2v_reg <= 1'b0;
      data_o_60_sv2v_reg <= 1'b0;
      data_o_59_sv2v_reg <= 1'b0;
      data_o_58_sv2v_reg <= 1'b0;
      data_o_57_sv2v_reg <= 1'b0;
      data_o_56_sv2v_reg <= 1'b0;
      data_o_55_sv2v_reg <= 1'b0;
      data_o_54_sv2v_reg <= 1'b0;
      data_o_53_sv2v_reg <= 1'b0;
      data_o_52_sv2v_reg <= 1'b0;
      data_o_51_sv2v_reg <= 1'b0;
      data_o_50_sv2v_reg <= 1'b0;
      data_o_49_sv2v_reg <= 1'b0;
      data_o_48_sv2v_reg <= 1'b0;
      data_o_47_sv2v_reg <= 1'b0;
      data_o_46_sv2v_reg <= 1'b0;
      data_o_45_sv2v_reg <= 1'b0;
      data_o_44_sv2v_reg <= 1'b0;
      data_o_43_sv2v_reg <= 1'b0;
      data_o_42_sv2v_reg <= 1'b0;
      data_o_41_sv2v_reg <= 1'b0;
      data_o_40_sv2v_reg <= 1'b0;
      data_o_39_sv2v_reg <= 1'b0;
      data_o_38_sv2v_reg <= 1'b0;
      data_o_37_sv2v_reg <= 1'b0;
      data_o_36_sv2v_reg <= 1'b0;
      data_o_35_sv2v_reg <= 1'b0;
      data_o_34_sv2v_reg <= 1'b0;
      data_o_33_sv2v_reg <= 1'b0;
      data_o_32_sv2v_reg <= 1'b0;
      data_o_31_sv2v_reg <= 1'b0;
      data_o_30_sv2v_reg <= 1'b0;
      data_o_29_sv2v_reg <= 1'b0;
      data_o_28_sv2v_reg <= 1'b0;
      data_o_27_sv2v_reg <= 1'b0;
      data_o_26_sv2v_reg <= 1'b0;
      data_o_25_sv2v_reg <= 1'b0;
      data_o_24_sv2v_reg <= 1'b0;
      data_o_23_sv2v_reg <= 1'b0;
      data_o_22_sv2v_reg <= 1'b0;
      data_o_21_sv2v_reg <= 1'b0;
      data_o_20_sv2v_reg <= 1'b0;
      data_o_19_sv2v_reg <= 1'b0;
      data_o_18_sv2v_reg <= 1'b0;
      data_o_17_sv2v_reg <= 1'b0;
      data_o_16_sv2v_reg <= 1'b0;
      data_o_15_sv2v_reg <= 1'b0;
      data_o_14_sv2v_reg <= 1'b0;
      data_o_13_sv2v_reg <= 1'b0;
      data_o_12_sv2v_reg <= 1'b0;
      data_o_11_sv2v_reg <= 1'b0;
      data_o_10_sv2v_reg <= 1'b0;
      data_o_9_sv2v_reg <= 1'b0;
      data_o_8_sv2v_reg <= 1'b0;
      data_o_7_sv2v_reg <= 1'b0;
      data_o_6_sv2v_reg <= 1'b0;
      data_o_5_sv2v_reg <= 1'b0;
      data_o_4_sv2v_reg <= 1'b0;
      data_o_3_sv2v_reg <= 1'b0;
      data_o_2_sv2v_reg <= 1'b0;
      data_o_1_sv2v_reg <= 1'b0;
      data_o_0_sv2v_reg <= 1'b0;
    end else if(N2) begin
      data_o_89_sv2v_reg <= data_i[89];
      data_o_88_sv2v_reg <= data_i[88];
      data_o_87_sv2v_reg <= data_i[87];
      data_o_86_sv2v_reg <= data_i[86];
      data_o_85_sv2v_reg <= data_i[85];
      data_o_84_sv2v_reg <= data_i[84];
      data_o_83_sv2v_reg <= data_i[83];
      data_o_82_sv2v_reg <= data_i[82];
      data_o_81_sv2v_reg <= data_i[81];
      data_o_80_sv2v_reg <= data_i[80];
      data_o_79_sv2v_reg <= data_i[79];
      data_o_78_sv2v_reg <= data_i[78];
      data_o_77_sv2v_reg <= data_i[77];
      data_o_76_sv2v_reg <= data_i[76];
      data_o_75_sv2v_reg <= data_i[75];
      data_o_74_sv2v_reg <= data_i[74];
      data_o_73_sv2v_reg <= data_i[73];
      data_o_72_sv2v_reg <= data_i[72];
      data_o_71_sv2v_reg <= data_i[71];
      data_o_70_sv2v_reg <= data_i[70];
      data_o_69_sv2v_reg <= data_i[69];
      data_o_68_sv2v_reg <= data_i[68];
      data_o_67_sv2v_reg <= data_i[67];
      data_o_66_sv2v_reg <= data_i[66];
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



module bsg_counter_clear_up_max_val_p16_init_val_p0
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [4:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire [4:0] count_o;
  wire N0,N1,N4,N5,N6,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N2,N3,N7,N30,N18;
  reg count_o_4_sv2v_reg,count_o_3_sv2v_reg,count_o_2_sv2v_reg,count_o_1_sv2v_reg,
  count_o_0_sv2v_reg;
  assign count_o[4] = count_o_4_sv2v_reg;
  assign count_o[3] = count_o_3_sv2v_reg;
  assign count_o[2] = count_o_2_sv2v_reg;
  assign count_o[1] = count_o_1_sv2v_reg;
  assign count_o[0] = count_o_0_sv2v_reg;
  assign N18 = reset_i | clear_i;
  assign { N10, N9, N8, N6, N5 } = count_o + 1'b1;
  assign N11 = (N0)? 1'b1 : 
               (N7)? 1'b1 : 
               (N3)? 1'b0 : 1'b0;
  assign N0 = clear_i;
  assign N13 = (N1)? 1'b1 : 
               (N30)? 1'b0 : 1'b0;
  assign N1 = up_i;
  assign N12 = (N0)? up_i : 
               (N7)? N5 : 1'b0;
  assign N4 = N17;
  assign N14 = ~reset_i;
  assign N15 = ~clear_i;
  assign N16 = N14 & N15;
  assign N17 = up_i & N16;
  assign N2 = up_i | clear_i;
  assign N3 = ~N2;
  assign N7 = up_i & N15;
  assign N30 = ~up_i;

  always @(posedge clk_i) begin
    if(N18) begin
      count_o_4_sv2v_reg <= 1'b0;
      count_o_3_sv2v_reg <= 1'b0;
      count_o_2_sv2v_reg <= 1'b0;
      count_o_1_sv2v_reg <= 1'b0;
    end else if(N13) begin
      count_o_4_sv2v_reg <= N10;
      count_o_3_sv2v_reg <= N9;
      count_o_2_sv2v_reg <= N8;
      count_o_1_sv2v_reg <= N6;
    end 
    if(reset_i) begin
      count_o_0_sv2v_reg <= 1'b0;
    end else if(N11) begin
      count_o_0_sv2v_reg <= N12;
    end 
  end


endmodule



module bsg_dff_reset_00000008
(
  clk_i,
  reset_i,
  data_i,
  data_o
);

  input [7:0] data_i;
  output [7:0] data_o;
  input clk_i;
  input reset_i;
  wire [7:0] data_o;
  reg data_o_7_sv2v_reg,data_o_6_sv2v_reg,data_o_5_sv2v_reg,data_o_4_sv2v_reg,
  data_o_3_sv2v_reg,data_o_2_sv2v_reg,data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[7] = data_o_7_sv2v_reg;
  assign data_o[6] = data_o_6_sv2v_reg;
  assign data_o[5] = data_o_5_sv2v_reg;
  assign data_o[4] = data_o_4_sv2v_reg;
  assign data_o[3] = data_o_3_sv2v_reg;
  assign data_o[2] = data_o_2_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_7_sv2v_reg <= 1'b0;
      data_o_6_sv2v_reg <= 1'b0;
      data_o_5_sv2v_reg <= 1'b0;
      data_o_4_sv2v_reg <= 1'b0;
      data_o_3_sv2v_reg <= 1'b0;
      data_o_2_sv2v_reg <= 1'b0;
      data_o_1_sv2v_reg <= 1'b0;
      data_o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
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



module bp_fe_ras_00
(
  clk_i,
  reset_i,
  init_done_o,
  restore_i,
  w_next_i,
  w_tos_i,
  call_i,
  addr_i,
  v_o,
  tgt_o,
  next_o,
  tos_o,
  return_i
);

  input [3:0] w_next_i;
  input [3:0] w_tos_i;
  input [38:0] addr_i;
  output [38:0] tgt_o;
  output [3:0] next_o;
  output [3:0] tos_o;
  input clk_i;
  input reset_i;
  input restore_i;
  input call_i;
  input return_i;
  output init_done_o;
  output v_o;
  wire [38:0] tgt_o;
  wire [3:0] next_o,tos_o,next_n,tos_n,nos_lo,w_addr_li;
  wire init_done_o,v_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,
  N18,N19,N20,N21,N22,N23,N24,N25,N26,N27,N28,N29,w_v_li,N30,N31,N32,N33,N34,N36,
  N37,N38,N39,N40,N41,N42,N43,N44;
  wire [1:0] state_r,state_n;
  wire [4:0] init_cnt;
  wire [42:0] w_data_li;
  reg state_r_1_sv2v_reg,state_r_0_sv2v_reg;
  assign state_r[1] = state_r_1_sv2v_reg;
  assign state_r[0] = state_r_0_sv2v_reg;
  assign v_o = 1'b1;

  bsg_counter_clear_up_max_val_p16_init_val_p0
  init_counter
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(1'b0),
    .up_i(N32),
    .count_o(init_cnt)
  );

  assign N6 = state_r[1] | N30;
  assign N8 = N33 | state_r[0];
  assign N10 = state_r[1] & state_r[0];
  assign N11 = N33 & N30;

  bsg_dff_reset_00000008
  ptr_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .data_i({ next_n, tos_n }),
    .data_o({ next_o, tos_o })
  );


  bsg_mem_1r1w
  #(.width_p(43), .els_p(1<<4))
  mem
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(w_v_li),
    .w_addr_i(w_addr_li),
    .w_data_i(w_data_li),
    .r_v_i(return_i),
    .r_addr_i(tos_o),
    .r_data_o({ nos_lo, tgt_o })
  );

  assign N30 = ~state_r[0];
  assign N31 = N30 | state_r[1];
  assign N32 = ~N31;
  assign N33 = ~state_r[1];
  assign N34 = state_r[0] | N33;
  assign init_done_o = ~N34;
  assign N36 = ~init_cnt[3];
  assign N37 = ~init_cnt[2];
  assign N38 = ~init_cnt[1];
  assign N39 = ~init_cnt[0];
  assign N40 = N36 | init_cnt[4];
  assign N41 = N37 | N40;
  assign N42 = N38 | N41;
  assign N43 = N39 | N42;
  assign N44 = ~N43;
  assign { N19, N18, N17, N16 } = next_o + 1'b1;
  assign state_n = (N0)? { N44, N43 } : 
                   (N1)? { 1'b1, 1'b0 } : 
                   (N2)? { 1'b0, 1'b1 } : 1'b0;
  assign N0 = N7;
  assign N1 = N9;
  assign N2 = N12;
  assign next_n = (N3)? w_next_i : 
                  (N21)? { N19, N18, N17, N16 } : 
                  (N14)? next_o : 1'b0;
  assign N3 = restore_i;
  assign tos_n = (N3)? w_tos_i : 
                 (N26)? next_o : 
                 (N29)? nos_lo : 
                 (N25)? tos_o : 1'b0;
  assign w_v_li = (N4)? call_i : 
                  (N5)? 1'b1 : 1'b0;
  assign N4 = init_done_o;
  assign N5 = N34;
  assign w_addr_li = (N4)? next_o : 
                     (N5)? init_cnt[3:0] : 1'b0;
  assign w_data_li = (N4)? { tos_o, addr_i } : 
                     (N5)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N7 = ~N6;
  assign N9 = ~N8;
  assign N12 = N10 | N11;
  assign N13 = call_i | restore_i;
  assign N14 = ~N13;
  assign N15 = N21;
  assign N20 = ~restore_i;
  assign N21 = call_i & N20;
  assign N22 = return_i;
  assign N23 = call_i | restore_i;
  assign N24 = N22 | N23;
  assign N25 = ~N24;
  assign N26 = call_i & N20;
  assign N27 = ~call_i;
  assign N28 = N20 & N27;
  assign N29 = N22 & N28;

  always @(posedge clk_i) begin
    if(reset_i) begin
      state_r_1_sv2v_reg <= 1'b0;
      state_r_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      state_r_1_sv2v_reg <= state_n[1];
      state_r_0_sv2v_reg <= state_n[0];
    end 
  end


endmodule



module bsg_dff_reset_en_00000002
(
  clk_i,
  reset_i,
  en_i,
  data_i,
  data_o
);

  input [1:0] data_i;
  output [1:0] data_o;
  input clk_i;
  input reset_i;
  input en_i;
  wire [1:0] data_o;
  wire N0,N1,N2;
  reg data_o_1_sv2v_reg,data_o_0_sv2v_reg;
  assign data_o[1] = data_o_1_sv2v_reg;
  assign data_o[0] = data_o_0_sv2v_reg;
  assign N2 = (N0)? 1'b1 : 
              (N1)? 1'b0 : 1'b0;
  assign N0 = en_i;
  assign N1 = ~en_i;

  always @(posedge clk_i) begin
    if(reset_i) begin
      data_o_1_sv2v_reg <= 1'b0;
      data_o_0_sv2v_reg <= 1'b0;
    end else if(N2) begin
      data_o_1_sv2v_reg <= data_i[1];
      data_o_0_sv2v_reg <= data_i[0];
    end 
  end


endmodule



module bp_fe_pc_gen
(
  clk_i,
  reset_i,
  init_done_o,
  attaboy_v_i,
  attaboy_force_i,
  attaboy_pc_i,
  attaboy_br_metadata_fwd_i,
  attaboy_taken_i,
  attaboy_ntaken_i,
  attaboy_yumi_o,
  redirect_v_i,
  redirect_pc_i,
  redirect_npc_i,
  redirect_br_v_i,
  redirect_br_metadata_fwd_i,
  redirect_br_taken_i,
  redirect_br_ntaken_i,
  redirect_br_nonbr_i,
  next_pc_o,
  icache_yumi_i,
  ovr_o,
  icache_tv_we_i,
  icache_hit_v_i,
  icache_miss_v_i,
  icache_hit_yumi_o,
  icache_data_i,
  if2_hit_v_o,
  if2_miss_v_o,
  if2_pc_o,
  if2_data_o,
  if2_br_metadata_fwd_o,
  if2_yumi_i,
  fetch_yumi_i,
  fetch_scan_i,
  fetch_pc_i,
  fetch_count_i,
  fetch_startup_i,
  fetch_catchup_i,
  fetch_rebase_i,
  fetch_linear_i,
  fetch_taken_o
);

  input [38:0] attaboy_pc_i;
  input [48:0] attaboy_br_metadata_fwd_i;
  input [38:0] redirect_pc_i;
  input [38:0] redirect_npc_i;
  input [48:0] redirect_br_metadata_fwd_i;
  output [38:0] next_pc_o;
  input [63:0] icache_data_i;
  output [38:0] if2_pc_o;
  output [63:0] if2_data_o;
  output [48:0] if2_br_metadata_fwd_o;
  input [124:0] fetch_scan_i;
  input [38:0] fetch_pc_i;
  input [2:0] fetch_count_i;
  input clk_i;
  input reset_i;
  input attaboy_v_i;
  input attaboy_force_i;
  input attaboy_taken_i;
  input attaboy_ntaken_i;
  input redirect_v_i;
  input redirect_br_v_i;
  input redirect_br_taken_i;
  input redirect_br_ntaken_i;
  input redirect_br_nonbr_i;
  input icache_yumi_i;
  input icache_tv_we_i;
  input icache_hit_v_i;
  input icache_miss_v_i;
  input if2_yumi_i;
  input fetch_yumi_i;
  input fetch_startup_i;
  input fetch_catchup_i;
  input fetch_rebase_i;
  input fetch_linear_i;
  output init_done_o;
  output attaboy_yumi_o;
  output ovr_o;
  output icache_hit_yumi_o;
  output if2_hit_v_o;
  output if2_miss_v_o;
  output fetch_taken_o;
  wire [38:0] next_pc_o,if2_pc_o,ras_tgt_lo,taken_tgt_lo,ntaken_tgt_lo,linear_tgt_lo,
  btb_br_tgt_lo,pc_plus,btb_tgt_li,pc_if1;
  wire [63:0] if2_data_o;
  wire [48:0] if2_br_metadata_fwd_o,next_metadata,metadata_if1,metadata_if2_n;
  wire init_done_o,attaboy_yumi_o,ovr_o,icache_hit_yumi_o,if2_hit_v_o,if2_miss_v_o,
  fetch_taken_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,
  N20,N21,N22,N23,N24,N25,N26,N27,N28,next_pred,next_taken,ovr_btaken,ovr_ret,
  ovr_jmp,N29,N30,ovr_rebase,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,N42,N43,N44,
  N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,N61,N62,N63,N64,
  N65,N66,N67,N68,N69,N70,N71,N72,bht_pred_lo,btb_taken,N73,N74,N75,N76,N77,N78,
  N79,N80,N81,N82,N83,N84,N85,N86,N87,N88,N89,N90,N91,N92,N93,N94,N95,N96,N97,N98,
  N99,N100,N101,N102,N103,N104,N105,N106,N107,N108,N109,N110,N111,N112,
  btb_br_tgt_v_lo,N113,N114,N115,N116,N117,N118,N119,btb_w_v_li,btb_w_force_li,btb_clr_li,N120,
  N121,N122,btb_jmp_li,N123,N124,N125,N126,N127,N128,N129,btb_br_tgt_jmp_lo,
  btb_w_yumi_lo,btb_init_done_lo,bht_w_v_li,bht_w_force_li,N130,N131,N132,N133,N134,N135,
  N136,N137,bht_w_yumi_lo,bht_init_done_lo,metadata_if1_r_site_br_,
  metadata_if1_r_site_jal_,metadata_if1_r_site_jalr_,metadata_if1_r_site_call_,
  metadata_if1_r_site_return_,pred_if1_r,N138,N139,N140,_2_net_,metadata_if2_r_ras_next__3_,
  metadata_if2_r_ras_next__2_,metadata_if2_r_ras_next__1_,metadata_if2_r_ras_next__0_,
  metadata_if2_r_ras_tos__3_,metadata_if2_r_ras_tos__2_,metadata_if2_r_ras_tos__1_,
  metadata_if2_r_ras_tos__0_,pred_if2_r,taken_if2_r,ras_init_done_lo,ras_call_li,
  ras_valid_lo,ras_return_li,btb_miss_ras,btb_miss_br,rebase_miss,linear_miss,
  ovr_linear,N141,N142,N143,N144,N145,N146,ghistory_w_v,N147,N148,N149,N150,N151,N152,
  N153,N154,N155,N156,N157,N158,N159,N160,N161,N162,N163,N164,N165,N166,N167,N168,
  N169,N170,N171,N172,N173,N174,N175,N176,N177,N178,N179,N180,N181,N182,N183,N184,
  N185,N186,N187,N188,N189;
  wire [7:0] bht_row_lo,bht_row_li;
  wire [1:0] ghistory_r,bht_offset,bht_r_ghist_li,bht_w_offset_li,bht_w_ghist_li;
  wire [8:0] btb_tag,btb_tag_li;
  wire [5:0] btb_idx,btb_idx_li;
  wire [6:0] bht_idx,bht_w_idx_li;
  wire [2:0] pc_if1_r;
  wire [38:3] pc_if1_aligned;
  assign if2_hit_v_o = icache_hit_v_i;
  assign if2_miss_v_o = icache_miss_v_i;
  assign if2_data_o[63] = icache_data_i[63];
  assign if2_data_o[62] = icache_data_i[62];
  assign if2_data_o[61] = icache_data_i[61];
  assign if2_data_o[60] = icache_data_i[60];
  assign if2_data_o[59] = icache_data_i[59];
  assign if2_data_o[58] = icache_data_i[58];
  assign if2_data_o[57] = icache_data_i[57];
  assign if2_data_o[56] = icache_data_i[56];
  assign if2_data_o[55] = icache_data_i[55];
  assign if2_data_o[54] = icache_data_i[54];
  assign if2_data_o[53] = icache_data_i[53];
  assign if2_data_o[52] = icache_data_i[52];
  assign if2_data_o[51] = icache_data_i[51];
  assign if2_data_o[50] = icache_data_i[50];
  assign if2_data_o[49] = icache_data_i[49];
  assign if2_data_o[48] = icache_data_i[48];
  assign if2_data_o[47] = icache_data_i[47];
  assign if2_data_o[46] = icache_data_i[46];
  assign if2_data_o[45] = icache_data_i[45];
  assign if2_data_o[44] = icache_data_i[44];
  assign if2_data_o[43] = icache_data_i[43];
  assign if2_data_o[42] = icache_data_i[42];
  assign if2_data_o[41] = icache_data_i[41];
  assign if2_data_o[40] = icache_data_i[40];
  assign if2_data_o[39] = icache_data_i[39];
  assign if2_data_o[38] = icache_data_i[38];
  assign if2_data_o[37] = icache_data_i[37];
  assign if2_data_o[36] = icache_data_i[36];
  assign if2_data_o[35] = icache_data_i[35];
  assign if2_data_o[34] = icache_data_i[34];
  assign if2_data_o[33] = icache_data_i[33];
  assign if2_data_o[32] = icache_data_i[32];
  assign if2_data_o[31] = icache_data_i[31];
  assign if2_data_o[30] = icache_data_i[30];
  assign if2_data_o[29] = icache_data_i[29];
  assign if2_data_o[28] = icache_data_i[28];
  assign if2_data_o[27] = icache_data_i[27];
  assign if2_data_o[26] = icache_data_i[26];
  assign if2_data_o[25] = icache_data_i[25];
  assign if2_data_o[24] = icache_data_i[24];
  assign if2_data_o[23] = icache_data_i[23];
  assign if2_data_o[22] = icache_data_i[22];
  assign if2_data_o[21] = icache_data_i[21];
  assign if2_data_o[20] = icache_data_i[20];
  assign if2_data_o[19] = icache_data_i[19];
  assign if2_data_o[18] = icache_data_i[18];
  assign if2_data_o[17] = icache_data_i[17];
  assign if2_data_o[16] = icache_data_i[16];
  assign if2_data_o[15] = icache_data_i[15];
  assign if2_data_o[14] = icache_data_i[14];
  assign if2_data_o[13] = icache_data_i[13];
  assign if2_data_o[12] = icache_data_i[12];
  assign if2_data_o[11] = icache_data_i[11];
  assign if2_data_o[10] = icache_data_i[10];
  assign if2_data_o[9] = icache_data_i[9];
  assign if2_data_o[8] = icache_data_i[8];
  assign if2_data_o[7] = icache_data_i[7];
  assign if2_data_o[6] = icache_data_i[6];
  assign if2_data_o[5] = icache_data_i[5];
  assign if2_data_o[4] = icache_data_i[4];
  assign if2_data_o[3] = icache_data_i[3];
  assign if2_data_o[2] = icache_data_i[2];
  assign if2_data_o[1] = icache_data_i[1];
  assign if2_data_o[0] = icache_data_i[0];

  bp_fe_btb_00
  btb
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .init_done_o(btb_init_done_lo),
    .r_addr_i(next_pc_o),
    .r_v_i(icache_yumi_i),
    .r_tag_o(btb_tag),
    .r_idx_o(btb_idx),
    .r_tgt_o(btb_br_tgt_lo),
    .r_tgt_v_o(btb_br_tgt_v_lo),
    .r_tgt_jmp_o(btb_br_tgt_jmp_lo),
    .w_v_i(btb_w_v_li),
    .w_force_i(btb_w_force_li),
    .w_clr_i(btb_clr_li),
    .w_jmp_i(btb_jmp_li),
    .w_tag_i(btb_tag_li),
    .w_idx_i(btb_idx_li),
    .w_tgt_i(btb_tgt_li),
    .w_yumi_o(btb_w_yumi_lo)
  );


  bp_fe_bht_00
  bht
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .init_done_o(bht_init_done_lo),
    .w_v_i(bht_w_v_li),
    .w_force_i(bht_w_force_li),
    .w_idx_i(bht_w_idx_li),
    .w_offset_i(bht_w_offset_li),
    .w_ghist_i(bht_w_ghist_li),
    .w_val_i(bht_row_li),
    .w_correct_i(attaboy_yumi_o),
    .w_yumi_o(bht_w_yumi_lo),
    .r_v_i(icache_yumi_i),
    .r_addr_i(next_pc_o),
    .r_ghist_i(bht_r_ghist_li),
    .r_val_o(bht_row_lo),
    .r_pred_o(bht_pred_lo),
    .r_idx_o(bht_idx),
    .r_offset_o(bht_offset)
  );


  bsg_dff_reset_en_0000005a
  if1_stage_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .en_i(icache_yumi_i),
    .data_i({ next_pred, next_taken, next_metadata, next_pc_o }),
    .data_o({ pred_if1_r, linear_miss, metadata_if1_r_site_br_, metadata_if1_r_site_jal_, metadata_if1_r_site_jalr_, metadata_if1_r_site_call_, metadata_if1_r_site_return_, metadata_if1[43:0], pc_if1_aligned, pc_if1_r })
  );


  bsg_dff_reset_en_0000005a
  if2_stage_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .en_i(_2_net_),
    .data_i({ pred_if1_r, linear_miss, pc_if1, metadata_if2_n }),
    .data_o({ pred_if2_r, taken_if2_r, if2_pc_o, if2_br_metadata_fwd_o[48:42], metadata_if2_r_ras_next__3_, metadata_if2_r_ras_next__2_, metadata_if2_r_ras_next__1_, metadata_if2_r_ras_next__0_, metadata_if2_r_ras_tos__3_, metadata_if2_r_ras_tos__2_, metadata_if2_r_ras_tos__1_, metadata_if2_r_ras_tos__0_, if2_br_metadata_fwd_o[33:0] })
  );


  bp_fe_ras_00
  ras
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .init_done_o(ras_init_done_lo),
    .restore_i(redirect_br_v_i),
    .w_next_i(redirect_br_metadata_fwd_i[41:38]),
    .w_tos_i(redirect_br_metadata_fwd_i[37:34]),
    .call_i(ras_call_li),
    .addr_i(ntaken_tgt_lo),
    .v_o(ras_valid_lo),
    .tgt_o(ras_tgt_lo),
    .next_o(if2_br_metadata_fwd_o[41:38]),
    .tos_o(if2_br_metadata_fwd_o[37:34]),
    .return_i(ras_return_li)
  );

  assign btb_miss_ras = { pc_if1_aligned, pc_if1_r } != ras_tgt_lo;
  assign btb_miss_br = { pc_if1_aligned, pc_if1_r } != taken_tgt_lo;

  bsg_dff_reset_en_00000002
  ghist_reg
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .en_i(ghistory_w_v),
    .data_i(bht_r_ghist_li),
    .data_o(ghistory_r)
  );

  assign ntaken_tgt_lo = fetch_pc_i + fetch_scan_i[77:39];
  assign linear_tgt_lo = fetch_pc_i + fetch_scan_i[116:78];
  assign taken_tgt_lo = fetch_pc_i + fetch_scan_i[38:0];
  assign pc_plus = { pc_if1_aligned, 1'b0, 1'b0, 1'b0 } + { 1'b1, 1'b0, 1'b0, 1'b0 };
  assign { N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, N34 } = (N0)? ras_tgt_lo : 
                                                                                                                                                                                                                 (N116)? taken_tgt_lo : 
                                                                                                                                                                                                                 (N119)? ntaken_tgt_lo : 
                                                                                                                                                                                                                 (N33)? linear_tgt_lo : 1'b0;
  assign N0 = ovr_ret;
  assign { N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74 } = (N1)? btb_br_tgt_lo : 
                                                                                                                                                                                                                              (N2)? pc_plus : 1'b0;
  assign N1 = btb_taken;
  assign N2 = N73;
  assign next_pred = (N3)? 1'b0 : 
                     (N114)? ovr_btaken : 
                     (N28)? bht_pred_lo : 1'b0;
  assign N3 = redirect_v_i;
  assign next_taken = (N3)? redirect_br_taken_i : 
                      (N114)? N29 : 
                      (N28)? btb_taken : 1'b0;
  assign next_pc_o = (N3)? redirect_npc_i : 
                     (N114)? { N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, N34 } : 
                     (N28)? { N112, N111, N110, N109, N108, N107, N106, N105, N104, N103, N102, N101, N100, N99, N98, N97, N96, N95, N94, N93, N92, N91, N90, N89, N88, N87, N86, N85, N84, N83, N82, N81, N80, N79, N78, N77, N76, N75, N74 } : 1'b0;
  assign next_metadata = (N3)? redirect_br_metadata_fwd_i : 
                         (N114)? { metadata_if1[48:44], ovr_ret, metadata_if1[42:0] } : 
                         (N28)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, btb_br_tgt_v_lo, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, btb_tag, btb_idx, bht_idx, bht_row_lo, bht_offset, ghistory_r } : 1'b0;
  assign btb_jmp_li = (N4)? N122 : 
                      (N5)? N123 : 1'b0;
  assign N4 = N121;
  assign N5 = N120;
  assign btb_tag_li = (N6)? redirect_br_metadata_fwd_i[33:25] : 
                      (N7)? attaboy_br_metadata_fwd_i[33:25] : 1'b0;
  assign N6 = N125;
  assign N7 = N124;
  assign btb_idx_li = (N8)? redirect_br_metadata_fwd_i[24:19] : 
                      (N9)? attaboy_br_metadata_fwd_i[24:19] : 1'b0;
  assign N8 = N127;
  assign N9 = N126;
  assign btb_tgt_li = (N10)? redirect_pc_i : 
                      (N11)? attaboy_pc_i : 1'b0;
  assign N10 = N129;
  assign N11 = N128;
  assign bht_w_idx_li = (N12)? redirect_br_metadata_fwd_i[18:12] : 
                        (N13)? attaboy_br_metadata_fwd_i[18:12] : 1'b0;
  assign N12 = N131;
  assign N13 = N130;
  assign bht_w_offset_li = (N14)? redirect_br_metadata_fwd_i[3:2] : 
                           (N15)? attaboy_br_metadata_fwd_i[3:2] : 1'b0;
  assign N14 = N133;
  assign N15 = N132;
  assign bht_w_ghist_li = (N16)? redirect_br_metadata_fwd_i[1:0] : 
                          (N17)? attaboy_br_metadata_fwd_i[1:0] : 1'b0;
  assign N16 = N135;
  assign N17 = N134;
  assign bht_row_li = (N18)? redirect_br_metadata_fwd_i[11:4] : 
                      (N19)? attaboy_br_metadata_fwd_i[11:4] : 1'b0;
  assign N18 = N137;
  assign N19 = N136;
  assign metadata_if1[48:44] = (N20)? fetch_scan_i[121:117] : 
                               (N21)? { metadata_if1_r_site_br_, metadata_if1_r_site_jal_, metadata_if1_r_site_jalr_, metadata_if1_r_site_call_, metadata_if1_r_site_return_ } : 1'b0;
  assign N20 = fetch_yumi_i;
  assign N21 = N138;
  assign pc_if1 = (N22)? ntaken_tgt_lo : 
                  (N23)? { pc_if1_aligned, pc_if1_r } : 1'b0;
  assign N22 = fetch_catchup_i;
  assign N23 = N139;
  assign metadata_if2_n = (N24)? if2_br_metadata_fwd_o : 
                          (N25)? metadata_if1 : 1'b0;
  assign N24 = fetch_startup_i;
  assign N25 = N140;
  assign bht_r_ghist_li = (N26)? redirect_br_metadata_fwd_i[1:0] : 
                          (N146)? { ghistory_r[0:0], linear_miss } : 
                          (N144)? ghistory_r : 1'b0;
  assign N26 = N142;
  assign N27 = ovr_o | redirect_v_i;
  assign N28 = ~N27;
  assign N29 = N147 | ovr_jmp;
  assign N147 = ovr_ret | ovr_btaken;
  assign N30 = ovr_btaken | ovr_jmp;
  assign N31 = N30 | ovr_ret;
  assign N32 = ovr_rebase | N31;
  assign N33 = ~N32;
  assign N73 = ~btb_taken;
  assign N113 = ~redirect_v_i;
  assign N114 = ovr_o & N113;
  assign N115 = ~ovr_ret;
  assign N116 = N30 & N115;
  assign N117 = ~N30;
  assign N118 = N115 & N117;
  assign N119 = ovr_rebase & N118;
  assign btb_w_v_li = N163 | N165;
  assign N163 = N161 | N162;
  assign N161 = N155 | N160;
  assign N155 = N152 | N154;
  assign N152 = N150 & N151;
  assign N150 = N148 & N149;
  assign N148 = redirect_br_v_i & redirect_br_taken_i;
  assign N149 = ~redirect_br_metadata_fwd_i[42];
  assign N151 = ~redirect_br_metadata_fwd_i[43];
  assign N154 = N153 & N151;
  assign N153 = N148 & redirect_br_metadata_fwd_i[42];
  assign N160 = N158 & N159;
  assign N158 = N156 & N157;
  assign N156 = attaboy_v_i & attaboy_taken_i;
  assign N157 = ~attaboy_br_metadata_fwd_i[42];
  assign N159 = ~attaboy_br_metadata_fwd_i[43];
  assign N162 = N153 & redirect_br_metadata_fwd_i[43];
  assign N165 = N164 & redirect_br_metadata_fwd_i[42];
  assign N164 = redirect_br_v_i & redirect_br_nonbr_i;
  assign btb_w_force_li = redirect_br_v_i | attaboy_force_i;
  assign btb_clr_li = N168 | N170;
  assign N168 = N167 & redirect_br_metadata_fwd_i[43];
  assign N167 = N166 & redirect_br_metadata_fwd_i[42];
  assign N166 = redirect_br_v_i & redirect_br_taken_i;
  assign N170 = N169 & redirect_br_metadata_fwd_i[42];
  assign N169 = redirect_br_v_i & redirect_br_nonbr_i;
  assign N120 = ~redirect_br_v_i;
  assign N121 = redirect_br_v_i;
  assign N122 = redirect_br_metadata_fwd_i[47] | redirect_br_metadata_fwd_i[46];
  assign N123 = attaboy_br_metadata_fwd_i[47] | attaboy_br_metadata_fwd_i[46];
  assign N124 = ~redirect_br_v_i;
  assign N125 = redirect_br_v_i;
  assign N126 = ~redirect_br_v_i;
  assign N127 = redirect_br_v_i;
  assign N128 = ~redirect_br_v_i;
  assign N129 = redirect_br_v_i;
  assign bht_w_v_li = N171 | N172;
  assign N171 = redirect_br_v_i & redirect_br_metadata_fwd_i[48];
  assign N172 = attaboy_v_i & attaboy_br_metadata_fwd_i[48];
  assign bht_w_force_li = redirect_br_v_i | attaboy_force_i;
  assign N130 = ~redirect_br_v_i;
  assign N131 = redirect_br_v_i;
  assign N132 = ~redirect_br_v_i;
  assign N133 = redirect_br_v_i;
  assign N134 = ~redirect_br_v_i;
  assign N135 = redirect_br_v_i;
  assign N136 = ~redirect_br_v_i;
  assign N137 = redirect_br_v_i;
  assign N138 = ~fetch_yumi_i;
  assign N139 = ~fetch_catchup_i;
  assign btb_taken = btb_br_tgt_v_lo & N173;
  assign N173 = bht_pred_lo | btb_br_tgt_jmp_lo;
  assign N140 = ~fetch_startup_i;
  assign _2_net_ = icache_tv_we_i | fetch_catchup_i;
  assign icache_hit_yumi_o = if2_hit_v_o & if2_yumi_i;
  assign ras_call_li = fetch_yumi_i & fetch_scan_i[118];
  assign ras_return_li = fetch_yumi_i & fetch_scan_i[117];
  assign rebase_miss = ~linear_miss;
  assign ovr_ret = N174 & ras_valid_lo;
  assign N174 = btb_miss_ras & fetch_scan_i[117];
  assign ovr_btaken = N175 & pred_if1_r;
  assign N175 = btb_miss_br & fetch_scan_i[121];
  assign ovr_jmp = btb_miss_br & fetch_scan_i[120];
  assign ovr_linear = linear_miss & fetch_linear_i;
  assign ovr_rebase = rebase_miss & fetch_rebase_i;
  assign ovr_o = N178 | ovr_rebase;
  assign N178 = N177 | ovr_linear;
  assign N177 = N176 | ovr_ret;
  assign N176 = ovr_btaken | ovr_jmp;
  assign fetch_taken_o = N180 | ovr_jmp;
  assign N180 = N179 | ovr_btaken;
  assign N179 = linear_miss | ovr_ret;
  assign attaboy_yumi_o = N184 & N187;
  assign N184 = attaboy_v_i & N183;
  assign N183 = ~N182;
  assign N182 = bht_w_v_li & N181;
  assign N181 = ~bht_w_yumi_lo;
  assign N187 = ~N186;
  assign N186 = btb_w_v_li & N185;
  assign N185 = ~btb_w_yumi_lo;
  assign init_done_o = N188 & ras_init_done_lo;
  assign N188 = bht_init_done_lo & btb_init_done_lo;
  assign N141 = metadata_if1[48] & N189;
  assign N189 = ~ovr_o;
  assign N142 = redirect_br_v_i;
  assign N143 = N141 | N142;
  assign N144 = ~N143;
  assign N145 = ~N142;
  assign N146 = N141 & N145;
  assign ghistory_w_v = redirect_br_v_i | icache_tv_we_i;

endmodule

