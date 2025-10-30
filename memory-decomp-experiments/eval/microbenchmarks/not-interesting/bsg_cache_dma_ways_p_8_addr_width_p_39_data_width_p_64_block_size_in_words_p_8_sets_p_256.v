

module top
(
  clk_i,
  reset_i,
  dma_cmd_i,
  dma_way_i,
  dma_addr_i,
  done_o,
  snoop_word_o,
  dma_pkt_o,
  dma_pkt_v_o,
  dma_pkt_yumi_i,
  dma_data_i,
  dma_data_v_i,
  dma_data_ready_o,
  dma_data_o,
  dma_data_v_o,
  dma_data_yumi_i,
  data_mem_v_o,
  data_mem_w_o,
  data_mem_addr_o,
  data_mem_w_mask_o,
  data_mem_data_o,
  data_mem_data_i,
  dma_evict_o
);

  input [3:0] dma_cmd_i;
  input [2:0] dma_way_i;
  input [38:0] dma_addr_i;
  output [63:0] snoop_word_o;
  output [39:0] dma_pkt_o;
  input [63:0] dma_data_i;
  output [63:0] dma_data_o;
  output [10:0] data_mem_addr_o;
  output [63:0] data_mem_w_mask_o;
  output [511:0] data_mem_data_o;
  input [511:0] data_mem_data_i;
  input clk_i;
  input reset_i;
  input dma_pkt_yumi_i;
  input dma_data_v_i;
  input dma_data_yumi_i;
  output done_o;
  output dma_pkt_v_o;
  output dma_data_ready_o;
  output dma_data_v_o;
  output data_mem_v_o;
  output data_mem_w_o;
  output dma_evict_o;

  bsg_cache_dma
  wrapper
  (
    .dma_cmd_i(dma_cmd_i),
    .dma_way_i(dma_way_i),
    .dma_addr_i(dma_addr_i),
    .snoop_word_o(snoop_word_o),
    .dma_pkt_o(dma_pkt_o),
    .dma_data_i(dma_data_i),
    .dma_data_o(dma_data_o),
    .data_mem_addr_o(data_mem_addr_o),
    .data_mem_w_mask_o(data_mem_w_mask_o),
    .data_mem_data_o(data_mem_data_o),
    .data_mem_data_i(data_mem_data_i),
    .clk_i(clk_i),
    .reset_i(reset_i),
    .dma_pkt_yumi_i(dma_pkt_yumi_i),
    .dma_data_v_i(dma_data_v_i),
    .dma_data_yumi_i(dma_data_yumi_i),
    .done_o(done_o),
    .dma_pkt_v_o(dma_pkt_v_o),
    .dma_data_ready_o(dma_data_ready_o),
    .dma_data_v_o(dma_data_v_o),
    .data_mem_v_o(data_mem_v_o),
    .data_mem_w_o(data_mem_w_o),
    .dma_evict_o(dma_evict_o)
  );


endmodule



module bsg_counter_clear_up_max_val_p8
(
  clk_i,
  reset_i,
  clear_i,
  up_i,
  count_o
);

  output [3:0] count_o;
  input clk_i;
  input reset_i;
  input clear_i;
  input up_i;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17;
  reg [3:0] count_o;
  assign { N9, N8, N7, N6 } = { N17, N16, N15, N14 } + up_i;
  assign { N13, N12, N11, N10 } = (N0)? { 1'b0, 1'b0, 1'b0, 1'b0 } : 
                                  (N1)? { N9, N8, N7, N6 } : 1'b0;
  assign N0 = reset_i;
  assign N1 = N2;
  assign { N17, N16, N15, N14 } = count_o * N4;
  assign N2 = ~reset_i;
  assign N3 = N2;
  assign N4 = ~clear_i;
  assign N5 = N3 & N4;

  always @(posedge clk_i) begin
    if(1'b1) begin
      { count_o[3:0] } <= { N13, N12, N11, N10 };
    end 
  end


endmodule



module bsg_circular_ptr_slots_p8_max_add_p1
(
  clk,
  reset_i,
  add_i,
  o,
  n_o
);

  input [0:0] add_i;
  output [2:0] o;
  output [2:0] n_o;
  input clk;
  input reset_i;
  wire [2:0] n_o,genblk1_genblk1_ptr_r_p1;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8;
  reg [2:0] o;
  assign genblk1_genblk1_ptr_r_p1 = o + 1'b1;
  assign { N7, N6, N5 } = (N0)? { 1'b0, 1'b0, 1'b0 } : 
                          (N1)? n_o : 1'b0;
  assign N0 = reset_i;
  assign N1 = N4;
  assign n_o = (N2)? genblk1_genblk1_ptr_r_p1 : 
               (N3)? o : 1'b0;
  assign N2 = add_i[0];
  assign N3 = N8;
  assign N4 = ~reset_i;
  assign N8 = ~add_i[0];

  always @(posedge clk) begin
    if(1'b1) begin
      { o[2:0] } <= { N7, N6, N5 };
    end 
  end


endmodule



module bsg_fifo_tracker_els_p8
(
  clk_i,
  reset_i,
  enq_i,
  deq_i,
  wptr_r_o,
  rptr_r_o,
  rptr_n_o,
  full_o,
  empty_o
);

  output [2:0] wptr_r_o;
  output [2:0] rptr_r_o;
  output [2:0] rptr_n_o;
  input clk_i;
  input reset_i;
  input enq_i;
  input deq_i;
  output full_o;
  output empty_o;
  wire [2:0] wptr_r_o,rptr_r_o,rptr_n_o;
  wire full_o,empty_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,equal_ptrs,SYNOPSYS_UNCONNECTED_1,
  SYNOPSYS_UNCONNECTED_2,SYNOPSYS_UNCONNECTED_3;
  reg deq_r,enq_r;

  bsg_circular_ptr_slots_p8_max_add_p1
  rptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(deq_i),
    .o(rptr_r_o),
    .n_o(rptr_n_o)
  );


  bsg_circular_ptr_slots_p8_max_add_p1
  wptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(enq_i),
    .o(wptr_r_o),
    .n_o({ SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3 })
  );

  assign equal_ptrs = rptr_r_o == wptr_r_o;
  assign N5 = (N0)? 1'b1 : 
              (N9)? 1'b1 : 
              (N4)? 1'b0 : 1'b0;
  assign N0 = N2;
  assign N6 = (N0)? 1'b0 : 
              (N9)? enq_i : 1'b0;
  assign N7 = (N0)? 1'b1 : 
              (N9)? deq_i : 1'b0;
  assign N1 = enq_i | deq_i;
  assign N2 = reset_i;
  assign N3 = N1 | N2;
  assign N4 = ~N3;
  assign N8 = ~N2;
  assign N9 = N1 & N8;
  assign empty_o = equal_ptrs & deq_r;
  assign full_o = equal_ptrs & enq_r;

  always @(posedge clk_i) begin
    if(N5) begin
      deq_r <= N7;
      enq_r <= N6;
    end 
  end


endmodule



module bsg_mem_1r1w_synth_width_p64_els_p8_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [2:0] w_addr_i;
  input [63:0] w_data_i;
  input [2:0] r_addr_i;
  output [63:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [63:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45;
  reg [511:0] mem;
  assign r_data_o[63] = (N17)? mem[63] : 
                        (N19)? mem[127] : 
                        (N21)? mem[191] : 
                        (N23)? mem[255] : 
                        (N18)? mem[319] : 
                        (N20)? mem[383] : 
                        (N22)? mem[447] : 
                        (N24)? mem[511] : 1'b0;
  assign r_data_o[62] = (N17)? mem[62] : 
                        (N19)? mem[126] : 
                        (N21)? mem[190] : 
                        (N23)? mem[254] : 
                        (N18)? mem[318] : 
                        (N20)? mem[382] : 
                        (N22)? mem[446] : 
                        (N24)? mem[510] : 1'b0;
  assign r_data_o[61] = (N17)? mem[61] : 
                        (N19)? mem[125] : 
                        (N21)? mem[189] : 
                        (N23)? mem[253] : 
                        (N18)? mem[317] : 
                        (N20)? mem[381] : 
                        (N22)? mem[445] : 
                        (N24)? mem[509] : 1'b0;
  assign r_data_o[60] = (N17)? mem[60] : 
                        (N19)? mem[124] : 
                        (N21)? mem[188] : 
                        (N23)? mem[252] : 
                        (N18)? mem[316] : 
                        (N20)? mem[380] : 
                        (N22)? mem[444] : 
                        (N24)? mem[508] : 1'b0;
  assign r_data_o[59] = (N17)? mem[59] : 
                        (N19)? mem[123] : 
                        (N21)? mem[187] : 
                        (N23)? mem[251] : 
                        (N18)? mem[315] : 
                        (N20)? mem[379] : 
                        (N22)? mem[443] : 
                        (N24)? mem[507] : 1'b0;
  assign r_data_o[58] = (N17)? mem[58] : 
                        (N19)? mem[122] : 
                        (N21)? mem[186] : 
                        (N23)? mem[250] : 
                        (N18)? mem[314] : 
                        (N20)? mem[378] : 
                        (N22)? mem[442] : 
                        (N24)? mem[506] : 1'b0;
  assign r_data_o[57] = (N17)? mem[57] : 
                        (N19)? mem[121] : 
                        (N21)? mem[185] : 
                        (N23)? mem[249] : 
                        (N18)? mem[313] : 
                        (N20)? mem[377] : 
                        (N22)? mem[441] : 
                        (N24)? mem[505] : 1'b0;
  assign r_data_o[56] = (N17)? mem[56] : 
                        (N19)? mem[120] : 
                        (N21)? mem[184] : 
                        (N23)? mem[248] : 
                        (N18)? mem[312] : 
                        (N20)? mem[376] : 
                        (N22)? mem[440] : 
                        (N24)? mem[504] : 1'b0;
  assign r_data_o[55] = (N17)? mem[55] : 
                        (N19)? mem[119] : 
                        (N21)? mem[183] : 
                        (N23)? mem[247] : 
                        (N18)? mem[311] : 
                        (N20)? mem[375] : 
                        (N22)? mem[439] : 
                        (N24)? mem[503] : 1'b0;
  assign r_data_o[54] = (N17)? mem[54] : 
                        (N19)? mem[118] : 
                        (N21)? mem[182] : 
                        (N23)? mem[246] : 
                        (N18)? mem[310] : 
                        (N20)? mem[374] : 
                        (N22)? mem[438] : 
                        (N24)? mem[502] : 1'b0;
  assign r_data_o[53] = (N17)? mem[53] : 
                        (N19)? mem[117] : 
                        (N21)? mem[181] : 
                        (N23)? mem[245] : 
                        (N18)? mem[309] : 
                        (N20)? mem[373] : 
                        (N22)? mem[437] : 
                        (N24)? mem[501] : 1'b0;
  assign r_data_o[52] = (N17)? mem[52] : 
                        (N19)? mem[116] : 
                        (N21)? mem[180] : 
                        (N23)? mem[244] : 
                        (N18)? mem[308] : 
                        (N20)? mem[372] : 
                        (N22)? mem[436] : 
                        (N24)? mem[500] : 1'b0;
  assign r_data_o[51] = (N17)? mem[51] : 
                        (N19)? mem[115] : 
                        (N21)? mem[179] : 
                        (N23)? mem[243] : 
                        (N18)? mem[307] : 
                        (N20)? mem[371] : 
                        (N22)? mem[435] : 
                        (N24)? mem[499] : 1'b0;
  assign r_data_o[50] = (N17)? mem[50] : 
                        (N19)? mem[114] : 
                        (N21)? mem[178] : 
                        (N23)? mem[242] : 
                        (N18)? mem[306] : 
                        (N20)? mem[370] : 
                        (N22)? mem[434] : 
                        (N24)? mem[498] : 1'b0;
  assign r_data_o[49] = (N17)? mem[49] : 
                        (N19)? mem[113] : 
                        (N21)? mem[177] : 
                        (N23)? mem[241] : 
                        (N18)? mem[305] : 
                        (N20)? mem[369] : 
                        (N22)? mem[433] : 
                        (N24)? mem[497] : 1'b0;
  assign r_data_o[48] = (N17)? mem[48] : 
                        (N19)? mem[112] : 
                        (N21)? mem[176] : 
                        (N23)? mem[240] : 
                        (N18)? mem[304] : 
                        (N20)? mem[368] : 
                        (N22)? mem[432] : 
                        (N24)? mem[496] : 1'b0;
  assign r_data_o[47] = (N17)? mem[47] : 
                        (N19)? mem[111] : 
                        (N21)? mem[175] : 
                        (N23)? mem[239] : 
                        (N18)? mem[303] : 
                        (N20)? mem[367] : 
                        (N22)? mem[431] : 
                        (N24)? mem[495] : 1'b0;
  assign r_data_o[46] = (N17)? mem[46] : 
                        (N19)? mem[110] : 
                        (N21)? mem[174] : 
                        (N23)? mem[238] : 
                        (N18)? mem[302] : 
                        (N20)? mem[366] : 
                        (N22)? mem[430] : 
                        (N24)? mem[494] : 1'b0;
  assign r_data_o[45] = (N17)? mem[45] : 
                        (N19)? mem[109] : 
                        (N21)? mem[173] : 
                        (N23)? mem[237] : 
                        (N18)? mem[301] : 
                        (N20)? mem[365] : 
                        (N22)? mem[429] : 
                        (N24)? mem[493] : 1'b0;
  assign r_data_o[44] = (N17)? mem[44] : 
                        (N19)? mem[108] : 
                        (N21)? mem[172] : 
                        (N23)? mem[236] : 
                        (N18)? mem[300] : 
                        (N20)? mem[364] : 
                        (N22)? mem[428] : 
                        (N24)? mem[492] : 1'b0;
  assign r_data_o[43] = (N17)? mem[43] : 
                        (N19)? mem[107] : 
                        (N21)? mem[171] : 
                        (N23)? mem[235] : 
                        (N18)? mem[299] : 
                        (N20)? mem[363] : 
                        (N22)? mem[427] : 
                        (N24)? mem[491] : 1'b0;
  assign r_data_o[42] = (N17)? mem[42] : 
                        (N19)? mem[106] : 
                        (N21)? mem[170] : 
                        (N23)? mem[234] : 
                        (N18)? mem[298] : 
                        (N20)? mem[362] : 
                        (N22)? mem[426] : 
                        (N24)? mem[490] : 1'b0;
  assign r_data_o[41] = (N17)? mem[41] : 
                        (N19)? mem[105] : 
                        (N21)? mem[169] : 
                        (N23)? mem[233] : 
                        (N18)? mem[297] : 
                        (N20)? mem[361] : 
                        (N22)? mem[425] : 
                        (N24)? mem[489] : 1'b0;
  assign r_data_o[40] = (N17)? mem[40] : 
                        (N19)? mem[104] : 
                        (N21)? mem[168] : 
                        (N23)? mem[232] : 
                        (N18)? mem[296] : 
                        (N20)? mem[360] : 
                        (N22)? mem[424] : 
                        (N24)? mem[488] : 1'b0;
  assign r_data_o[39] = (N17)? mem[39] : 
                        (N19)? mem[103] : 
                        (N21)? mem[167] : 
                        (N23)? mem[231] : 
                        (N18)? mem[295] : 
                        (N20)? mem[359] : 
                        (N22)? mem[423] : 
                        (N24)? mem[487] : 1'b0;
  assign r_data_o[38] = (N17)? mem[38] : 
                        (N19)? mem[102] : 
                        (N21)? mem[166] : 
                        (N23)? mem[230] : 
                        (N18)? mem[294] : 
                        (N20)? mem[358] : 
                        (N22)? mem[422] : 
                        (N24)? mem[486] : 1'b0;
  assign r_data_o[37] = (N17)? mem[37] : 
                        (N19)? mem[101] : 
                        (N21)? mem[165] : 
                        (N23)? mem[229] : 
                        (N18)? mem[293] : 
                        (N20)? mem[357] : 
                        (N22)? mem[421] : 
                        (N24)? mem[485] : 1'b0;
  assign r_data_o[36] = (N17)? mem[36] : 
                        (N19)? mem[100] : 
                        (N21)? mem[164] : 
                        (N23)? mem[228] : 
                        (N18)? mem[292] : 
                        (N20)? mem[356] : 
                        (N22)? mem[420] : 
                        (N24)? mem[484] : 1'b0;
  assign r_data_o[35] = (N17)? mem[35] : 
                        (N19)? mem[99] : 
                        (N21)? mem[163] : 
                        (N23)? mem[227] : 
                        (N18)? mem[291] : 
                        (N20)? mem[355] : 
                        (N22)? mem[419] : 
                        (N24)? mem[483] : 1'b0;
  assign r_data_o[34] = (N17)? mem[34] : 
                        (N19)? mem[98] : 
                        (N21)? mem[162] : 
                        (N23)? mem[226] : 
                        (N18)? mem[290] : 
                        (N20)? mem[354] : 
                        (N22)? mem[418] : 
                        (N24)? mem[482] : 1'b0;
  assign r_data_o[33] = (N17)? mem[33] : 
                        (N19)? mem[97] : 
                        (N21)? mem[161] : 
                        (N23)? mem[225] : 
                        (N18)? mem[289] : 
                        (N20)? mem[353] : 
                        (N22)? mem[417] : 
                        (N24)? mem[481] : 1'b0;
  assign r_data_o[32] = (N17)? mem[32] : 
                        (N19)? mem[96] : 
                        (N21)? mem[160] : 
                        (N23)? mem[224] : 
                        (N18)? mem[288] : 
                        (N20)? mem[352] : 
                        (N22)? mem[416] : 
                        (N24)? mem[480] : 1'b0;
  assign r_data_o[31] = (N17)? mem[31] : 
                        (N19)? mem[95] : 
                        (N21)? mem[159] : 
                        (N23)? mem[223] : 
                        (N18)? mem[287] : 
                        (N20)? mem[351] : 
                        (N22)? mem[415] : 
                        (N24)? mem[479] : 1'b0;
  assign r_data_o[30] = (N17)? mem[30] : 
                        (N19)? mem[94] : 
                        (N21)? mem[158] : 
                        (N23)? mem[222] : 
                        (N18)? mem[286] : 
                        (N20)? mem[350] : 
                        (N22)? mem[414] : 
                        (N24)? mem[478] : 1'b0;
  assign r_data_o[29] = (N17)? mem[29] : 
                        (N19)? mem[93] : 
                        (N21)? mem[157] : 
                        (N23)? mem[221] : 
                        (N18)? mem[285] : 
                        (N20)? mem[349] : 
                        (N22)? mem[413] : 
                        (N24)? mem[477] : 1'b0;
  assign r_data_o[28] = (N17)? mem[28] : 
                        (N19)? mem[92] : 
                        (N21)? mem[156] : 
                        (N23)? mem[220] : 
                        (N18)? mem[284] : 
                        (N20)? mem[348] : 
                        (N22)? mem[412] : 
                        (N24)? mem[476] : 1'b0;
  assign r_data_o[27] = (N17)? mem[27] : 
                        (N19)? mem[91] : 
                        (N21)? mem[155] : 
                        (N23)? mem[219] : 
                        (N18)? mem[283] : 
                        (N20)? mem[347] : 
                        (N22)? mem[411] : 
                        (N24)? mem[475] : 1'b0;
  assign r_data_o[26] = (N17)? mem[26] : 
                        (N19)? mem[90] : 
                        (N21)? mem[154] : 
                        (N23)? mem[218] : 
                        (N18)? mem[282] : 
                        (N20)? mem[346] : 
                        (N22)? mem[410] : 
                        (N24)? mem[474] : 1'b0;
  assign r_data_o[25] = (N17)? mem[25] : 
                        (N19)? mem[89] : 
                        (N21)? mem[153] : 
                        (N23)? mem[217] : 
                        (N18)? mem[281] : 
                        (N20)? mem[345] : 
                        (N22)? mem[409] : 
                        (N24)? mem[473] : 1'b0;
  assign r_data_o[24] = (N17)? mem[24] : 
                        (N19)? mem[88] : 
                        (N21)? mem[152] : 
                        (N23)? mem[216] : 
                        (N18)? mem[280] : 
                        (N20)? mem[344] : 
                        (N22)? mem[408] : 
                        (N24)? mem[472] : 1'b0;
  assign r_data_o[23] = (N17)? mem[23] : 
                        (N19)? mem[87] : 
                        (N21)? mem[151] : 
                        (N23)? mem[215] : 
                        (N18)? mem[279] : 
                        (N20)? mem[343] : 
                        (N22)? mem[407] : 
                        (N24)? mem[471] : 1'b0;
  assign r_data_o[22] = (N17)? mem[22] : 
                        (N19)? mem[86] : 
                        (N21)? mem[150] : 
                        (N23)? mem[214] : 
                        (N18)? mem[278] : 
                        (N20)? mem[342] : 
                        (N22)? mem[406] : 
                        (N24)? mem[470] : 1'b0;
  assign r_data_o[21] = (N17)? mem[21] : 
                        (N19)? mem[85] : 
                        (N21)? mem[149] : 
                        (N23)? mem[213] : 
                        (N18)? mem[277] : 
                        (N20)? mem[341] : 
                        (N22)? mem[405] : 
                        (N24)? mem[469] : 1'b0;
  assign r_data_o[20] = (N17)? mem[20] : 
                        (N19)? mem[84] : 
                        (N21)? mem[148] : 
                        (N23)? mem[212] : 
                        (N18)? mem[276] : 
                        (N20)? mem[340] : 
                        (N22)? mem[404] : 
                        (N24)? mem[468] : 1'b0;
  assign r_data_o[19] = (N17)? mem[19] : 
                        (N19)? mem[83] : 
                        (N21)? mem[147] : 
                        (N23)? mem[211] : 
                        (N18)? mem[275] : 
                        (N20)? mem[339] : 
                        (N22)? mem[403] : 
                        (N24)? mem[467] : 1'b0;
  assign r_data_o[18] = (N17)? mem[18] : 
                        (N19)? mem[82] : 
                        (N21)? mem[146] : 
                        (N23)? mem[210] : 
                        (N18)? mem[274] : 
                        (N20)? mem[338] : 
                        (N22)? mem[402] : 
                        (N24)? mem[466] : 1'b0;
  assign r_data_o[17] = (N17)? mem[17] : 
                        (N19)? mem[81] : 
                        (N21)? mem[145] : 
                        (N23)? mem[209] : 
                        (N18)? mem[273] : 
                        (N20)? mem[337] : 
                        (N22)? mem[401] : 
                        (N24)? mem[465] : 1'b0;
  assign r_data_o[16] = (N17)? mem[16] : 
                        (N19)? mem[80] : 
                        (N21)? mem[144] : 
                        (N23)? mem[208] : 
                        (N18)? mem[272] : 
                        (N20)? mem[336] : 
                        (N22)? mem[400] : 
                        (N24)? mem[464] : 1'b0;
  assign r_data_o[15] = (N17)? mem[15] : 
                        (N19)? mem[79] : 
                        (N21)? mem[143] : 
                        (N23)? mem[207] : 
                        (N18)? mem[271] : 
                        (N20)? mem[335] : 
                        (N22)? mem[399] : 
                        (N24)? mem[463] : 1'b0;
  assign r_data_o[14] = (N17)? mem[14] : 
                        (N19)? mem[78] : 
                        (N21)? mem[142] : 
                        (N23)? mem[206] : 
                        (N18)? mem[270] : 
                        (N20)? mem[334] : 
                        (N22)? mem[398] : 
                        (N24)? mem[462] : 1'b0;
  assign r_data_o[13] = (N17)? mem[13] : 
                        (N19)? mem[77] : 
                        (N21)? mem[141] : 
                        (N23)? mem[205] : 
                        (N18)? mem[269] : 
                        (N20)? mem[333] : 
                        (N22)? mem[397] : 
                        (N24)? mem[461] : 1'b0;
  assign r_data_o[12] = (N17)? mem[12] : 
                        (N19)? mem[76] : 
                        (N21)? mem[140] : 
                        (N23)? mem[204] : 
                        (N18)? mem[268] : 
                        (N20)? mem[332] : 
                        (N22)? mem[396] : 
                        (N24)? mem[460] : 1'b0;
  assign r_data_o[11] = (N17)? mem[11] : 
                        (N19)? mem[75] : 
                        (N21)? mem[139] : 
                        (N23)? mem[203] : 
                        (N18)? mem[267] : 
                        (N20)? mem[331] : 
                        (N22)? mem[395] : 
                        (N24)? mem[459] : 1'b0;
  assign r_data_o[10] = (N17)? mem[10] : 
                        (N19)? mem[74] : 
                        (N21)? mem[138] : 
                        (N23)? mem[202] : 
                        (N18)? mem[266] : 
                        (N20)? mem[330] : 
                        (N22)? mem[394] : 
                        (N24)? mem[458] : 1'b0;
  assign r_data_o[9] = (N17)? mem[9] : 
                       (N19)? mem[73] : 
                       (N21)? mem[137] : 
                       (N23)? mem[201] : 
                       (N18)? mem[265] : 
                       (N20)? mem[329] : 
                       (N22)? mem[393] : 
                       (N24)? mem[457] : 1'b0;
  assign r_data_o[8] = (N17)? mem[8] : 
                       (N19)? mem[72] : 
                       (N21)? mem[136] : 
                       (N23)? mem[200] : 
                       (N18)? mem[264] : 
                       (N20)? mem[328] : 
                       (N22)? mem[392] : 
                       (N24)? mem[456] : 1'b0;
  assign r_data_o[7] = (N17)? mem[7] : 
                       (N19)? mem[71] : 
                       (N21)? mem[135] : 
                       (N23)? mem[199] : 
                       (N18)? mem[263] : 
                       (N20)? mem[327] : 
                       (N22)? mem[391] : 
                       (N24)? mem[455] : 1'b0;
  assign r_data_o[6] = (N17)? mem[6] : 
                       (N19)? mem[70] : 
                       (N21)? mem[134] : 
                       (N23)? mem[198] : 
                       (N18)? mem[262] : 
                       (N20)? mem[326] : 
                       (N22)? mem[390] : 
                       (N24)? mem[454] : 1'b0;
  assign r_data_o[5] = (N17)? mem[5] : 
                       (N19)? mem[69] : 
                       (N21)? mem[133] : 
                       (N23)? mem[197] : 
                       (N18)? mem[261] : 
                       (N20)? mem[325] : 
                       (N22)? mem[389] : 
                       (N24)? mem[453] : 1'b0;
  assign r_data_o[4] = (N17)? mem[4] : 
                       (N19)? mem[68] : 
                       (N21)? mem[132] : 
                       (N23)? mem[196] : 
                       (N18)? mem[260] : 
                       (N20)? mem[324] : 
                       (N22)? mem[388] : 
                       (N24)? mem[452] : 1'b0;
  assign r_data_o[3] = (N17)? mem[3] : 
                       (N19)? mem[67] : 
                       (N21)? mem[131] : 
                       (N23)? mem[195] : 
                       (N18)? mem[259] : 
                       (N20)? mem[323] : 
                       (N22)? mem[387] : 
                       (N24)? mem[451] : 1'b0;
  assign r_data_o[2] = (N17)? mem[2] : 
                       (N19)? mem[66] : 
                       (N21)? mem[130] : 
                       (N23)? mem[194] : 
                       (N18)? mem[258] : 
                       (N20)? mem[322] : 
                       (N22)? mem[386] : 
                       (N24)? mem[450] : 1'b0;
  assign r_data_o[1] = (N17)? mem[1] : 
                       (N19)? mem[65] : 
                       (N21)? mem[129] : 
                       (N23)? mem[193] : 
                       (N18)? mem[257] : 
                       (N20)? mem[321] : 
                       (N22)? mem[385] : 
                       (N24)? mem[449] : 1'b0;
  assign r_data_o[0] = (N17)? mem[0] : 
                       (N19)? mem[64] : 
                       (N21)? mem[128] : 
                       (N23)? mem[192] : 
                       (N18)? mem[256] : 
                       (N20)? mem[320] : 
                       (N22)? mem[384] : 
                       (N24)? mem[448] : 1'b0;
  assign N42 = w_addr_i[0] & w_addr_i[1];
  assign N33 = N42 & w_addr_i[2];
  assign N43 = N0 & w_addr_i[1];
  assign N0 = ~w_addr_i[0];
  assign N32 = N43 & w_addr_i[2];
  assign N44 = w_addr_i[0] & N1;
  assign N1 = ~w_addr_i[1];
  assign N31 = N44 & w_addr_i[2];
  assign N45 = N2 & N3;
  assign N2 = ~w_addr_i[0];
  assign N3 = ~w_addr_i[1];
  assign N30 = N45 & w_addr_i[2];
  assign N29 = N42 & N4;
  assign N4 = ~w_addr_i[2];
  assign N28 = N43 & N5;
  assign N5 = ~w_addr_i[2];
  assign N27 = N44 & N6;
  assign N6 = ~w_addr_i[2];
  assign N26 = N45 & N7;
  assign N7 = ~w_addr_i[2];
  assign { N41, N40, N39, N38, N37, N36, N35, N34 } = (N8)? { N33, N32, N31, N30, N29, N28, N27, N26 } : 
                                                      (N9)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N8 = w_v_i;
  assign N9 = N25;
  assign N10 = ~r_addr_i[0];
  assign N11 = ~r_addr_i[1];
  assign N12 = N10 & N11;
  assign N13 = N10 & r_addr_i[1];
  assign N14 = r_addr_i[0] & N11;
  assign N15 = r_addr_i[0] & r_addr_i[1];
  assign N16 = ~r_addr_i[2];
  assign N17 = N12 & N16;
  assign N18 = N12 & r_addr_i[2];
  assign N19 = N14 & N16;
  assign N20 = N14 & r_addr_i[2];
  assign N21 = N13 & N16;
  assign N22 = N13 & r_addr_i[2];
  assign N23 = N15 & N16;
  assign N24 = N15 & r_addr_i[2];
  assign N25 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N41) begin
      { mem[511:448] } <= { w_data_i[63:0] };
    end 
    if(N40) begin
      { mem[447:384] } <= { w_data_i[63:0] };
    end 
    if(N39) begin
      { mem[383:320] } <= { w_data_i[63:0] };
    end 
    if(N38) begin
      { mem[319:256] } <= { w_data_i[63:0] };
    end 
    if(N37) begin
      { mem[255:192] } <= { w_data_i[63:0] };
    end 
    if(N36) begin
      { mem[191:128] } <= { w_data_i[63:0] };
    end 
    if(N35) begin
      { mem[127:64] } <= { w_data_i[63:0] };
    end 
    if(N34) begin
      { mem[63:0] } <= { w_data_i[63:0] };
    end 
  end


endmodule



module bsg_mem_1r1w_width_p64_els_p8_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [2:0] w_addr_i;
  input [63:0] w_data_i;
  input [2:0] r_addr_i;
  output [63:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [63:0] r_data_o;

  bsg_mem_1r1w_synth_width_p64_els_p8_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_fifo_1r1w_small_unhardened_width_p64_els_p8_ready_THEN_valid_p0
(
  clk_i,
  reset_i,
  v_i,
  ready_o,
  data_i,
  v_o,
  data_o,
  yumi_i
);

  input [63:0] data_i;
  output [63:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [63:0] data_o;
  wire ready_o,v_o,enque,full,empty,SYNOPSYS_UNCONNECTED_1,SYNOPSYS_UNCONNECTED_2,
  SYNOPSYS_UNCONNECTED_3;
  wire [2:0] wptr_r,rptr_r;

  bsg_fifo_tracker_els_p8
  ft
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .enq_i(enque),
    .deq_i(yumi_i),
    .wptr_r_o(wptr_r),
    .rptr_r_o(rptr_r),
    .rptr_n_o({ SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3 }),
    .full_o(full),
    .empty_o(empty)
  );


  bsg_mem_1r1w_width_p64_els_p8_read_write_same_addr_p0
  mem_1r1w
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enque),
    .w_addr_i(wptr_r),
    .w_data_i(data_i),
    .r_v_i(v_o),
    .r_addr_i(rptr_r),
    .r_data_o(data_o)
  );

  assign enque = v_i & ready_o;
  assign ready_o = ~full;
  assign v_o = ~empty;

endmodule



module bsg_fifo_1r1w_small_width_p64_els_p8
(
  clk_i,
  reset_i,
  v_i,
  ready_o,
  data_i,
  v_o,
  data_o,
  yumi_i
);

  input [63:0] data_i;
  output [63:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [63:0] data_o;
  wire ready_o,v_o;

  bsg_fifo_1r1w_small_unhardened_width_p64_els_p8_ready_THEN_valid_p0
  unhardened_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(v_i),
    .ready_o(ready_o),
    .data_i(data_i),
    .v_o(v_o),
    .data_o(data_o),
    .yumi_i(yumi_i)
  );


endmodule



module bsg_mem_1r1w_synth_width_p64_els_p2_read_write_same_addr_p0_harden_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [63:0] w_data_i;
  input [0:0] r_addr_i;
  output [63:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [63:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N7,N8;
  reg [127:0] mem;
  assign r_data_o[63] = (N3)? mem[63] : 
                        (N0)? mem[127] : 1'b0;
  assign N0 = r_addr_i[0];
  assign r_data_o[62] = (N3)? mem[62] : 
                        (N0)? mem[126] : 1'b0;
  assign r_data_o[61] = (N3)? mem[61] : 
                        (N0)? mem[125] : 1'b0;
  assign r_data_o[60] = (N3)? mem[60] : 
                        (N0)? mem[124] : 1'b0;
  assign r_data_o[59] = (N3)? mem[59] : 
                        (N0)? mem[123] : 1'b0;
  assign r_data_o[58] = (N3)? mem[58] : 
                        (N0)? mem[122] : 1'b0;
  assign r_data_o[57] = (N3)? mem[57] : 
                        (N0)? mem[121] : 1'b0;
  assign r_data_o[56] = (N3)? mem[56] : 
                        (N0)? mem[120] : 1'b0;
  assign r_data_o[55] = (N3)? mem[55] : 
                        (N0)? mem[119] : 1'b0;
  assign r_data_o[54] = (N3)? mem[54] : 
                        (N0)? mem[118] : 1'b0;
  assign r_data_o[53] = (N3)? mem[53] : 
                        (N0)? mem[117] : 1'b0;
  assign r_data_o[52] = (N3)? mem[52] : 
                        (N0)? mem[116] : 1'b0;
  assign r_data_o[51] = (N3)? mem[51] : 
                        (N0)? mem[115] : 1'b0;
  assign r_data_o[50] = (N3)? mem[50] : 
                        (N0)? mem[114] : 1'b0;
  assign r_data_o[49] = (N3)? mem[49] : 
                        (N0)? mem[113] : 1'b0;
  assign r_data_o[48] = (N3)? mem[48] : 
                        (N0)? mem[112] : 1'b0;
  assign r_data_o[47] = (N3)? mem[47] : 
                        (N0)? mem[111] : 1'b0;
  assign r_data_o[46] = (N3)? mem[46] : 
                        (N0)? mem[110] : 1'b0;
  assign r_data_o[45] = (N3)? mem[45] : 
                        (N0)? mem[109] : 1'b0;
  assign r_data_o[44] = (N3)? mem[44] : 
                        (N0)? mem[108] : 1'b0;
  assign r_data_o[43] = (N3)? mem[43] : 
                        (N0)? mem[107] : 1'b0;
  assign r_data_o[42] = (N3)? mem[42] : 
                        (N0)? mem[106] : 1'b0;
  assign r_data_o[41] = (N3)? mem[41] : 
                        (N0)? mem[105] : 1'b0;
  assign r_data_o[40] = (N3)? mem[40] : 
                        (N0)? mem[104] : 1'b0;
  assign r_data_o[39] = (N3)? mem[39] : 
                        (N0)? mem[103] : 1'b0;
  assign r_data_o[38] = (N3)? mem[38] : 
                        (N0)? mem[102] : 1'b0;
  assign r_data_o[37] = (N3)? mem[37] : 
                        (N0)? mem[101] : 1'b0;
  assign r_data_o[36] = (N3)? mem[36] : 
                        (N0)? mem[100] : 1'b0;
  assign r_data_o[35] = (N3)? mem[35] : 
                        (N0)? mem[99] : 1'b0;
  assign r_data_o[34] = (N3)? mem[34] : 
                        (N0)? mem[98] : 1'b0;
  assign r_data_o[33] = (N3)? mem[33] : 
                        (N0)? mem[97] : 1'b0;
  assign r_data_o[32] = (N3)? mem[32] : 
                        (N0)? mem[96] : 1'b0;
  assign r_data_o[31] = (N3)? mem[31] : 
                        (N0)? mem[95] : 1'b0;
  assign r_data_o[30] = (N3)? mem[30] : 
                        (N0)? mem[94] : 1'b0;
  assign r_data_o[29] = (N3)? mem[29] : 
                        (N0)? mem[93] : 1'b0;
  assign r_data_o[28] = (N3)? mem[28] : 
                        (N0)? mem[92] : 1'b0;
  assign r_data_o[27] = (N3)? mem[27] : 
                        (N0)? mem[91] : 1'b0;
  assign r_data_o[26] = (N3)? mem[26] : 
                        (N0)? mem[90] : 1'b0;
  assign r_data_o[25] = (N3)? mem[25] : 
                        (N0)? mem[89] : 1'b0;
  assign r_data_o[24] = (N3)? mem[24] : 
                        (N0)? mem[88] : 1'b0;
  assign r_data_o[23] = (N3)? mem[23] : 
                        (N0)? mem[87] : 1'b0;
  assign r_data_o[22] = (N3)? mem[22] : 
                        (N0)? mem[86] : 1'b0;
  assign r_data_o[21] = (N3)? mem[21] : 
                        (N0)? mem[85] : 1'b0;
  assign r_data_o[20] = (N3)? mem[20] : 
                        (N0)? mem[84] : 1'b0;
  assign r_data_o[19] = (N3)? mem[19] : 
                        (N0)? mem[83] : 1'b0;
  assign r_data_o[18] = (N3)? mem[18] : 
                        (N0)? mem[82] : 1'b0;
  assign r_data_o[17] = (N3)? mem[17] : 
                        (N0)? mem[81] : 1'b0;
  assign r_data_o[16] = (N3)? mem[16] : 
                        (N0)? mem[80] : 1'b0;
  assign r_data_o[15] = (N3)? mem[15] : 
                        (N0)? mem[79] : 1'b0;
  assign r_data_o[14] = (N3)? mem[14] : 
                        (N0)? mem[78] : 1'b0;
  assign r_data_o[13] = (N3)? mem[13] : 
                        (N0)? mem[77] : 1'b0;
  assign r_data_o[12] = (N3)? mem[12] : 
                        (N0)? mem[76] : 1'b0;
  assign r_data_o[11] = (N3)? mem[11] : 
                        (N0)? mem[75] : 1'b0;
  assign r_data_o[10] = (N3)? mem[10] : 
                        (N0)? mem[74] : 1'b0;
  assign r_data_o[9] = (N3)? mem[9] : 
                       (N0)? mem[73] : 1'b0;
  assign r_data_o[8] = (N3)? mem[8] : 
                       (N0)? mem[72] : 1'b0;
  assign r_data_o[7] = (N3)? mem[7] : 
                       (N0)? mem[71] : 1'b0;
  assign r_data_o[6] = (N3)? mem[6] : 
                       (N0)? mem[70] : 1'b0;
  assign r_data_o[5] = (N3)? mem[5] : 
                       (N0)? mem[69] : 1'b0;
  assign r_data_o[4] = (N3)? mem[4] : 
                       (N0)? mem[68] : 1'b0;
  assign r_data_o[3] = (N3)? mem[3] : 
                       (N0)? mem[67] : 1'b0;
  assign r_data_o[2] = (N3)? mem[2] : 
                       (N0)? mem[66] : 1'b0;
  assign r_data_o[1] = (N3)? mem[1] : 
                       (N0)? mem[65] : 1'b0;
  assign r_data_o[0] = (N3)? mem[0] : 
                       (N0)? mem[64] : 1'b0;
  assign N5 = ~w_addr_i[0];
  assign { N8, N7 } = (N1)? { w_addr_i[0:0], N5 } : 
                      (N2)? { 1'b0, 1'b0 } : 1'b0;
  assign N1 = w_v_i;
  assign N2 = N4;
  assign N3 = ~r_addr_i[0];
  assign N4 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N8) begin
      { mem[127:64] } <= { w_data_i[63:0] };
    end 
    if(N7) begin
      { mem[63:0] } <= { w_data_i[63:0] };
    end 
  end


endmodule



module bsg_mem_1r1w_width_p64_els_p2_read_write_same_addr_p0
(
  w_clk_i,
  w_reset_i,
  w_v_i,
  w_addr_i,
  w_data_i,
  r_v_i,
  r_addr_i,
  r_data_o
);

  input [0:0] w_addr_i;
  input [63:0] w_data_i;
  input [0:0] r_addr_i;
  output [63:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [63:0] r_data_o;

  bsg_mem_1r1w_synth_width_p64_els_p2_read_write_same_addr_p0_harden_p0
  synth
  (
    .w_clk_i(w_clk_i),
    .w_reset_i(w_reset_i),
    .w_v_i(w_v_i),
    .w_addr_i(w_addr_i[0]),
    .w_data_i(w_data_i),
    .r_v_i(r_v_i),
    .r_addr_i(r_addr_i[0]),
    .r_data_o(r_data_o)
  );


endmodule



module bsg_two_fifo_width_p64
(
  clk_i,
  reset_i,
  ready_o,
  data_i,
  v_i,
  v_o,
  data_o,
  yumi_i
);

  input [63:0] data_i;
  output [63:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [63:0] data_o;
  wire ready_o,v_o,N0,N1,enq_i,n_0_net_,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,
  N15,N16,N17,N18,N19,N20,N21,N22,N23,N24;
  reg full_r,tail_r,head_r,empty_r;

  bsg_mem_1r1w_width_p64_els_p2_read_write_same_addr_p0
  mem_1r1w
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(enq_i),
    .w_addr_i(tail_r),
    .w_data_i(data_i),
    .r_v_i(n_0_net_),
    .r_addr_i(head_r),
    .r_data_o(data_o)
  );

  assign N9 = (N0)? 1'b1 : 
              (N1)? N5 : 1'b0;
  assign N0 = N3;
  assign N1 = N2;
  assign N10 = (N0)? 1'b0 : 
               (N1)? N4 : 1'b0;
  assign N11 = (N0)? 1'b1 : 
               (N1)? yumi_i : 1'b0;
  assign N12 = (N0)? 1'b0 : 
               (N1)? N6 : 1'b0;
  assign N13 = (N0)? 1'b1 : 
               (N1)? N7 : 1'b0;
  assign N14 = (N0)? 1'b0 : 
               (N1)? N8 : 1'b0;
  assign n_0_net_ = ~empty_r;
  assign v_o = ~empty_r;
  assign ready_o = ~full_r;
  assign enq_i = v_i & N15;
  assign N15 = ~full_r;
  assign N2 = ~reset_i;
  assign N3 = reset_i;
  assign N5 = enq_i;
  assign N4 = ~tail_r;
  assign N6 = ~head_r;
  assign N7 = N17 | N19;
  assign N17 = empty_r & N16;
  assign N16 = ~enq_i;
  assign N19 = N18 & N16;
  assign N18 = N15 & yumi_i;
  assign N8 = N23 | N24;
  assign N23 = N21 & N22;
  assign N21 = N20 & enq_i;
  assign N20 = ~empty_r;
  assign N22 = ~yumi_i;
  assign N24 = full_r & N22;

  always @(posedge clk_i) begin
    if(1'b1) begin
      full_r <= N14;
      empty_r <= N13;
    end 
    if(N9) begin
      tail_r <= N10;
    end 
    if(N11) begin
      head_r <= N12;
    end 
  end


endmodule



module bsg_decode_num_out_p8
(
  i,
  o
);

  input [2:0] i;
  output [7:0] o;
  wire [7:0] o;
  assign o = { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b1 } << i;

endmodule



module bsg_mux_width_p64_els_p8
(
  data_i,
  sel_i,
  data_o
);

  input [511:0] data_i;
  input [2:0] sel_i;
  output [63:0] data_o;
  wire [63:0] data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14;
  assign data_o[63] = (N7)? data_i[63] : 
                      (N9)? data_i[127] : 
                      (N11)? data_i[191] : 
                      (N13)? data_i[255] : 
                      (N8)? data_i[319] : 
                      (N10)? data_i[383] : 
                      (N12)? data_i[447] : 
                      (N14)? data_i[511] : 1'b0;
  assign data_o[62] = (N7)? data_i[62] : 
                      (N9)? data_i[126] : 
                      (N11)? data_i[190] : 
                      (N13)? data_i[254] : 
                      (N8)? data_i[318] : 
                      (N10)? data_i[382] : 
                      (N12)? data_i[446] : 
                      (N14)? data_i[510] : 1'b0;
  assign data_o[61] = (N7)? data_i[61] : 
                      (N9)? data_i[125] : 
                      (N11)? data_i[189] : 
                      (N13)? data_i[253] : 
                      (N8)? data_i[317] : 
                      (N10)? data_i[381] : 
                      (N12)? data_i[445] : 
                      (N14)? data_i[509] : 1'b0;
  assign data_o[60] = (N7)? data_i[60] : 
                      (N9)? data_i[124] : 
                      (N11)? data_i[188] : 
                      (N13)? data_i[252] : 
                      (N8)? data_i[316] : 
                      (N10)? data_i[380] : 
                      (N12)? data_i[444] : 
                      (N14)? data_i[508] : 1'b0;
  assign data_o[59] = (N7)? data_i[59] : 
                      (N9)? data_i[123] : 
                      (N11)? data_i[187] : 
                      (N13)? data_i[251] : 
                      (N8)? data_i[315] : 
                      (N10)? data_i[379] : 
                      (N12)? data_i[443] : 
                      (N14)? data_i[507] : 1'b0;
  assign data_o[58] = (N7)? data_i[58] : 
                      (N9)? data_i[122] : 
                      (N11)? data_i[186] : 
                      (N13)? data_i[250] : 
                      (N8)? data_i[314] : 
                      (N10)? data_i[378] : 
                      (N12)? data_i[442] : 
                      (N14)? data_i[506] : 1'b0;
  assign data_o[57] = (N7)? data_i[57] : 
                      (N9)? data_i[121] : 
                      (N11)? data_i[185] : 
                      (N13)? data_i[249] : 
                      (N8)? data_i[313] : 
                      (N10)? data_i[377] : 
                      (N12)? data_i[441] : 
                      (N14)? data_i[505] : 1'b0;
  assign data_o[56] = (N7)? data_i[56] : 
                      (N9)? data_i[120] : 
                      (N11)? data_i[184] : 
                      (N13)? data_i[248] : 
                      (N8)? data_i[312] : 
                      (N10)? data_i[376] : 
                      (N12)? data_i[440] : 
                      (N14)? data_i[504] : 1'b0;
  assign data_o[55] = (N7)? data_i[55] : 
                      (N9)? data_i[119] : 
                      (N11)? data_i[183] : 
                      (N13)? data_i[247] : 
                      (N8)? data_i[311] : 
                      (N10)? data_i[375] : 
                      (N12)? data_i[439] : 
                      (N14)? data_i[503] : 1'b0;
  assign data_o[54] = (N7)? data_i[54] : 
                      (N9)? data_i[118] : 
                      (N11)? data_i[182] : 
                      (N13)? data_i[246] : 
                      (N8)? data_i[310] : 
                      (N10)? data_i[374] : 
                      (N12)? data_i[438] : 
                      (N14)? data_i[502] : 1'b0;
  assign data_o[53] = (N7)? data_i[53] : 
                      (N9)? data_i[117] : 
                      (N11)? data_i[181] : 
                      (N13)? data_i[245] : 
                      (N8)? data_i[309] : 
                      (N10)? data_i[373] : 
                      (N12)? data_i[437] : 
                      (N14)? data_i[501] : 1'b0;
  assign data_o[52] = (N7)? data_i[52] : 
                      (N9)? data_i[116] : 
                      (N11)? data_i[180] : 
                      (N13)? data_i[244] : 
                      (N8)? data_i[308] : 
                      (N10)? data_i[372] : 
                      (N12)? data_i[436] : 
                      (N14)? data_i[500] : 1'b0;
  assign data_o[51] = (N7)? data_i[51] : 
                      (N9)? data_i[115] : 
                      (N11)? data_i[179] : 
                      (N13)? data_i[243] : 
                      (N8)? data_i[307] : 
                      (N10)? data_i[371] : 
                      (N12)? data_i[435] : 
                      (N14)? data_i[499] : 1'b0;
  assign data_o[50] = (N7)? data_i[50] : 
                      (N9)? data_i[114] : 
                      (N11)? data_i[178] : 
                      (N13)? data_i[242] : 
                      (N8)? data_i[306] : 
                      (N10)? data_i[370] : 
                      (N12)? data_i[434] : 
                      (N14)? data_i[498] : 1'b0;
  assign data_o[49] = (N7)? data_i[49] : 
                      (N9)? data_i[113] : 
                      (N11)? data_i[177] : 
                      (N13)? data_i[241] : 
                      (N8)? data_i[305] : 
                      (N10)? data_i[369] : 
                      (N12)? data_i[433] : 
                      (N14)? data_i[497] : 1'b0;
  assign data_o[48] = (N7)? data_i[48] : 
                      (N9)? data_i[112] : 
                      (N11)? data_i[176] : 
                      (N13)? data_i[240] : 
                      (N8)? data_i[304] : 
                      (N10)? data_i[368] : 
                      (N12)? data_i[432] : 
                      (N14)? data_i[496] : 1'b0;
  assign data_o[47] = (N7)? data_i[47] : 
                      (N9)? data_i[111] : 
                      (N11)? data_i[175] : 
                      (N13)? data_i[239] : 
                      (N8)? data_i[303] : 
                      (N10)? data_i[367] : 
                      (N12)? data_i[431] : 
                      (N14)? data_i[495] : 1'b0;
  assign data_o[46] = (N7)? data_i[46] : 
                      (N9)? data_i[110] : 
                      (N11)? data_i[174] : 
                      (N13)? data_i[238] : 
                      (N8)? data_i[302] : 
                      (N10)? data_i[366] : 
                      (N12)? data_i[430] : 
                      (N14)? data_i[494] : 1'b0;
  assign data_o[45] = (N7)? data_i[45] : 
                      (N9)? data_i[109] : 
                      (N11)? data_i[173] : 
                      (N13)? data_i[237] : 
                      (N8)? data_i[301] : 
                      (N10)? data_i[365] : 
                      (N12)? data_i[429] : 
                      (N14)? data_i[493] : 1'b0;
  assign data_o[44] = (N7)? data_i[44] : 
                      (N9)? data_i[108] : 
                      (N11)? data_i[172] : 
                      (N13)? data_i[236] : 
                      (N8)? data_i[300] : 
                      (N10)? data_i[364] : 
                      (N12)? data_i[428] : 
                      (N14)? data_i[492] : 1'b0;
  assign data_o[43] = (N7)? data_i[43] : 
                      (N9)? data_i[107] : 
                      (N11)? data_i[171] : 
                      (N13)? data_i[235] : 
                      (N8)? data_i[299] : 
                      (N10)? data_i[363] : 
                      (N12)? data_i[427] : 
                      (N14)? data_i[491] : 1'b0;
  assign data_o[42] = (N7)? data_i[42] : 
                      (N9)? data_i[106] : 
                      (N11)? data_i[170] : 
                      (N13)? data_i[234] : 
                      (N8)? data_i[298] : 
                      (N10)? data_i[362] : 
                      (N12)? data_i[426] : 
                      (N14)? data_i[490] : 1'b0;
  assign data_o[41] = (N7)? data_i[41] : 
                      (N9)? data_i[105] : 
                      (N11)? data_i[169] : 
                      (N13)? data_i[233] : 
                      (N8)? data_i[297] : 
                      (N10)? data_i[361] : 
                      (N12)? data_i[425] : 
                      (N14)? data_i[489] : 1'b0;
  assign data_o[40] = (N7)? data_i[40] : 
                      (N9)? data_i[104] : 
                      (N11)? data_i[168] : 
                      (N13)? data_i[232] : 
                      (N8)? data_i[296] : 
                      (N10)? data_i[360] : 
                      (N12)? data_i[424] : 
                      (N14)? data_i[488] : 1'b0;
  assign data_o[39] = (N7)? data_i[39] : 
                      (N9)? data_i[103] : 
                      (N11)? data_i[167] : 
                      (N13)? data_i[231] : 
                      (N8)? data_i[295] : 
                      (N10)? data_i[359] : 
                      (N12)? data_i[423] : 
                      (N14)? data_i[487] : 1'b0;
  assign data_o[38] = (N7)? data_i[38] : 
                      (N9)? data_i[102] : 
                      (N11)? data_i[166] : 
                      (N13)? data_i[230] : 
                      (N8)? data_i[294] : 
                      (N10)? data_i[358] : 
                      (N12)? data_i[422] : 
                      (N14)? data_i[486] : 1'b0;
  assign data_o[37] = (N7)? data_i[37] : 
                      (N9)? data_i[101] : 
                      (N11)? data_i[165] : 
                      (N13)? data_i[229] : 
                      (N8)? data_i[293] : 
                      (N10)? data_i[357] : 
                      (N12)? data_i[421] : 
                      (N14)? data_i[485] : 1'b0;
  assign data_o[36] = (N7)? data_i[36] : 
                      (N9)? data_i[100] : 
                      (N11)? data_i[164] : 
                      (N13)? data_i[228] : 
                      (N8)? data_i[292] : 
                      (N10)? data_i[356] : 
                      (N12)? data_i[420] : 
                      (N14)? data_i[484] : 1'b0;
  assign data_o[35] = (N7)? data_i[35] : 
                      (N9)? data_i[99] : 
                      (N11)? data_i[163] : 
                      (N13)? data_i[227] : 
                      (N8)? data_i[291] : 
                      (N10)? data_i[355] : 
                      (N12)? data_i[419] : 
                      (N14)? data_i[483] : 1'b0;
  assign data_o[34] = (N7)? data_i[34] : 
                      (N9)? data_i[98] : 
                      (N11)? data_i[162] : 
                      (N13)? data_i[226] : 
                      (N8)? data_i[290] : 
                      (N10)? data_i[354] : 
                      (N12)? data_i[418] : 
                      (N14)? data_i[482] : 1'b0;
  assign data_o[33] = (N7)? data_i[33] : 
                      (N9)? data_i[97] : 
                      (N11)? data_i[161] : 
                      (N13)? data_i[225] : 
                      (N8)? data_i[289] : 
                      (N10)? data_i[353] : 
                      (N12)? data_i[417] : 
                      (N14)? data_i[481] : 1'b0;
  assign data_o[32] = (N7)? data_i[32] : 
                      (N9)? data_i[96] : 
                      (N11)? data_i[160] : 
                      (N13)? data_i[224] : 
                      (N8)? data_i[288] : 
                      (N10)? data_i[352] : 
                      (N12)? data_i[416] : 
                      (N14)? data_i[480] : 1'b0;
  assign data_o[31] = (N7)? data_i[31] : 
                      (N9)? data_i[95] : 
                      (N11)? data_i[159] : 
                      (N13)? data_i[223] : 
                      (N8)? data_i[287] : 
                      (N10)? data_i[351] : 
                      (N12)? data_i[415] : 
                      (N14)? data_i[479] : 1'b0;
  assign data_o[30] = (N7)? data_i[30] : 
                      (N9)? data_i[94] : 
                      (N11)? data_i[158] : 
                      (N13)? data_i[222] : 
                      (N8)? data_i[286] : 
                      (N10)? data_i[350] : 
                      (N12)? data_i[414] : 
                      (N14)? data_i[478] : 1'b0;
  assign data_o[29] = (N7)? data_i[29] : 
                      (N9)? data_i[93] : 
                      (N11)? data_i[157] : 
                      (N13)? data_i[221] : 
                      (N8)? data_i[285] : 
                      (N10)? data_i[349] : 
                      (N12)? data_i[413] : 
                      (N14)? data_i[477] : 1'b0;
  assign data_o[28] = (N7)? data_i[28] : 
                      (N9)? data_i[92] : 
                      (N11)? data_i[156] : 
                      (N13)? data_i[220] : 
                      (N8)? data_i[284] : 
                      (N10)? data_i[348] : 
                      (N12)? data_i[412] : 
                      (N14)? data_i[476] : 1'b0;
  assign data_o[27] = (N7)? data_i[27] : 
                      (N9)? data_i[91] : 
                      (N11)? data_i[155] : 
                      (N13)? data_i[219] : 
                      (N8)? data_i[283] : 
                      (N10)? data_i[347] : 
                      (N12)? data_i[411] : 
                      (N14)? data_i[475] : 1'b0;
  assign data_o[26] = (N7)? data_i[26] : 
                      (N9)? data_i[90] : 
                      (N11)? data_i[154] : 
                      (N13)? data_i[218] : 
                      (N8)? data_i[282] : 
                      (N10)? data_i[346] : 
                      (N12)? data_i[410] : 
                      (N14)? data_i[474] : 1'b0;
  assign data_o[25] = (N7)? data_i[25] : 
                      (N9)? data_i[89] : 
                      (N11)? data_i[153] : 
                      (N13)? data_i[217] : 
                      (N8)? data_i[281] : 
                      (N10)? data_i[345] : 
                      (N12)? data_i[409] : 
                      (N14)? data_i[473] : 1'b0;
  assign data_o[24] = (N7)? data_i[24] : 
                      (N9)? data_i[88] : 
                      (N11)? data_i[152] : 
                      (N13)? data_i[216] : 
                      (N8)? data_i[280] : 
                      (N10)? data_i[344] : 
                      (N12)? data_i[408] : 
                      (N14)? data_i[472] : 1'b0;
  assign data_o[23] = (N7)? data_i[23] : 
                      (N9)? data_i[87] : 
                      (N11)? data_i[151] : 
                      (N13)? data_i[215] : 
                      (N8)? data_i[279] : 
                      (N10)? data_i[343] : 
                      (N12)? data_i[407] : 
                      (N14)? data_i[471] : 1'b0;
  assign data_o[22] = (N7)? data_i[22] : 
                      (N9)? data_i[86] : 
                      (N11)? data_i[150] : 
                      (N13)? data_i[214] : 
                      (N8)? data_i[278] : 
                      (N10)? data_i[342] : 
                      (N12)? data_i[406] : 
                      (N14)? data_i[470] : 1'b0;
  assign data_o[21] = (N7)? data_i[21] : 
                      (N9)? data_i[85] : 
                      (N11)? data_i[149] : 
                      (N13)? data_i[213] : 
                      (N8)? data_i[277] : 
                      (N10)? data_i[341] : 
                      (N12)? data_i[405] : 
                      (N14)? data_i[469] : 1'b0;
  assign data_o[20] = (N7)? data_i[20] : 
                      (N9)? data_i[84] : 
                      (N11)? data_i[148] : 
                      (N13)? data_i[212] : 
                      (N8)? data_i[276] : 
                      (N10)? data_i[340] : 
                      (N12)? data_i[404] : 
                      (N14)? data_i[468] : 1'b0;
  assign data_o[19] = (N7)? data_i[19] : 
                      (N9)? data_i[83] : 
                      (N11)? data_i[147] : 
                      (N13)? data_i[211] : 
                      (N8)? data_i[275] : 
                      (N10)? data_i[339] : 
                      (N12)? data_i[403] : 
                      (N14)? data_i[467] : 1'b0;
  assign data_o[18] = (N7)? data_i[18] : 
                      (N9)? data_i[82] : 
                      (N11)? data_i[146] : 
                      (N13)? data_i[210] : 
                      (N8)? data_i[274] : 
                      (N10)? data_i[338] : 
                      (N12)? data_i[402] : 
                      (N14)? data_i[466] : 1'b0;
  assign data_o[17] = (N7)? data_i[17] : 
                      (N9)? data_i[81] : 
                      (N11)? data_i[145] : 
                      (N13)? data_i[209] : 
                      (N8)? data_i[273] : 
                      (N10)? data_i[337] : 
                      (N12)? data_i[401] : 
                      (N14)? data_i[465] : 1'b0;
  assign data_o[16] = (N7)? data_i[16] : 
                      (N9)? data_i[80] : 
                      (N11)? data_i[144] : 
                      (N13)? data_i[208] : 
                      (N8)? data_i[272] : 
                      (N10)? data_i[336] : 
                      (N12)? data_i[400] : 
                      (N14)? data_i[464] : 1'b0;
  assign data_o[15] = (N7)? data_i[15] : 
                      (N9)? data_i[79] : 
                      (N11)? data_i[143] : 
                      (N13)? data_i[207] : 
                      (N8)? data_i[271] : 
                      (N10)? data_i[335] : 
                      (N12)? data_i[399] : 
                      (N14)? data_i[463] : 1'b0;
  assign data_o[14] = (N7)? data_i[14] : 
                      (N9)? data_i[78] : 
                      (N11)? data_i[142] : 
                      (N13)? data_i[206] : 
                      (N8)? data_i[270] : 
                      (N10)? data_i[334] : 
                      (N12)? data_i[398] : 
                      (N14)? data_i[462] : 1'b0;
  assign data_o[13] = (N7)? data_i[13] : 
                      (N9)? data_i[77] : 
                      (N11)? data_i[141] : 
                      (N13)? data_i[205] : 
                      (N8)? data_i[269] : 
                      (N10)? data_i[333] : 
                      (N12)? data_i[397] : 
                      (N14)? data_i[461] : 1'b0;
  assign data_o[12] = (N7)? data_i[12] : 
                      (N9)? data_i[76] : 
                      (N11)? data_i[140] : 
                      (N13)? data_i[204] : 
                      (N8)? data_i[268] : 
                      (N10)? data_i[332] : 
                      (N12)? data_i[396] : 
                      (N14)? data_i[460] : 1'b0;
  assign data_o[11] = (N7)? data_i[11] : 
                      (N9)? data_i[75] : 
                      (N11)? data_i[139] : 
                      (N13)? data_i[203] : 
                      (N8)? data_i[267] : 
                      (N10)? data_i[331] : 
                      (N12)? data_i[395] : 
                      (N14)? data_i[459] : 1'b0;
  assign data_o[10] = (N7)? data_i[10] : 
                      (N9)? data_i[74] : 
                      (N11)? data_i[138] : 
                      (N13)? data_i[202] : 
                      (N8)? data_i[266] : 
                      (N10)? data_i[330] : 
                      (N12)? data_i[394] : 
                      (N14)? data_i[458] : 1'b0;
  assign data_o[9] = (N7)? data_i[9] : 
                     (N9)? data_i[73] : 
                     (N11)? data_i[137] : 
                     (N13)? data_i[201] : 
                     (N8)? data_i[265] : 
                     (N10)? data_i[329] : 
                     (N12)? data_i[393] : 
                     (N14)? data_i[457] : 1'b0;
  assign data_o[8] = (N7)? data_i[8] : 
                     (N9)? data_i[72] : 
                     (N11)? data_i[136] : 
                     (N13)? data_i[200] : 
                     (N8)? data_i[264] : 
                     (N10)? data_i[328] : 
                     (N12)? data_i[392] : 
                     (N14)? data_i[456] : 1'b0;
  assign data_o[7] = (N7)? data_i[7] : 
                     (N9)? data_i[71] : 
                     (N11)? data_i[135] : 
                     (N13)? data_i[199] : 
                     (N8)? data_i[263] : 
                     (N10)? data_i[327] : 
                     (N12)? data_i[391] : 
                     (N14)? data_i[455] : 1'b0;
  assign data_o[6] = (N7)? data_i[6] : 
                     (N9)? data_i[70] : 
                     (N11)? data_i[134] : 
                     (N13)? data_i[198] : 
                     (N8)? data_i[262] : 
                     (N10)? data_i[326] : 
                     (N12)? data_i[390] : 
                     (N14)? data_i[454] : 1'b0;
  assign data_o[5] = (N7)? data_i[5] : 
                     (N9)? data_i[69] : 
                     (N11)? data_i[133] : 
                     (N13)? data_i[197] : 
                     (N8)? data_i[261] : 
                     (N10)? data_i[325] : 
                     (N12)? data_i[389] : 
                     (N14)? data_i[453] : 1'b0;
  assign data_o[4] = (N7)? data_i[4] : 
                     (N9)? data_i[68] : 
                     (N11)? data_i[132] : 
                     (N13)? data_i[196] : 
                     (N8)? data_i[260] : 
                     (N10)? data_i[324] : 
                     (N12)? data_i[388] : 
                     (N14)? data_i[452] : 1'b0;
  assign data_o[3] = (N7)? data_i[3] : 
                     (N9)? data_i[67] : 
                     (N11)? data_i[131] : 
                     (N13)? data_i[195] : 
                     (N8)? data_i[259] : 
                     (N10)? data_i[323] : 
                     (N12)? data_i[387] : 
                     (N14)? data_i[451] : 1'b0;
  assign data_o[2] = (N7)? data_i[2] : 
                     (N9)? data_i[66] : 
                     (N11)? data_i[130] : 
                     (N13)? data_i[194] : 
                     (N8)? data_i[258] : 
                     (N10)? data_i[322] : 
                     (N12)? data_i[386] : 
                     (N14)? data_i[450] : 1'b0;
  assign data_o[1] = (N7)? data_i[1] : 
                     (N9)? data_i[65] : 
                     (N11)? data_i[129] : 
                     (N13)? data_i[193] : 
                     (N8)? data_i[257] : 
                     (N10)? data_i[321] : 
                     (N12)? data_i[385] : 
                     (N14)? data_i[449] : 1'b0;
  assign data_o[0] = (N7)? data_i[0] : 
                     (N9)? data_i[64] : 
                     (N11)? data_i[128] : 
                     (N13)? data_i[192] : 
                     (N8)? data_i[256] : 
                     (N10)? data_i[320] : 
                     (N12)? data_i[384] : 
                     (N14)? data_i[448] : 1'b0;
  assign N0 = ~sel_i[0];
  assign N1 = ~sel_i[1];
  assign N2 = N0 & N1;
  assign N3 = N0 & sel_i[1];
  assign N4 = sel_i[0] & N1;
  assign N5 = sel_i[0] & sel_i[1];
  assign N6 = ~sel_i[2];
  assign N7 = N2 & N6;
  assign N8 = N2 & sel_i[2];
  assign N9 = N4 & N6;
  assign N10 = N4 & sel_i[2];
  assign N11 = N3 & N6;
  assign N12 = N3 & sel_i[2];
  assign N13 = N5 & N6;
  assign N14 = N5 & sel_i[2];

endmodule



module bsg_cache_dma
(
  clk_i,
  reset_i,
  dma_cmd_i,
  dma_way_i,
  dma_addr_i,
  done_o,
  snoop_word_o,
  dma_pkt_o,
  dma_pkt_v_o,
  dma_pkt_yumi_i,
  dma_data_i,
  dma_data_v_i,
  dma_data_ready_o,
  dma_data_o,
  dma_data_v_o,
  dma_data_yumi_i,
  data_mem_v_o,
  data_mem_w_o,
  data_mem_addr_o,
  data_mem_w_mask_o,
  data_mem_data_o,
  data_mem_data_i,
  dma_evict_o
);

  input [3:0] dma_cmd_i;
  input [2:0] dma_way_i;
  input [38:0] dma_addr_i;
  output [63:0] snoop_word_o;
  output [39:0] dma_pkt_o;
  input [63:0] dma_data_i;
  output [63:0] dma_data_o;
  output [10:0] data_mem_addr_o;
  output [63:0] data_mem_w_mask_o;
  output [511:0] data_mem_data_o;
  input [511:0] data_mem_data_i;
  input clk_i;
  input reset_i;
  input dma_pkt_yumi_i;
  input dma_data_v_i;
  input dma_data_yumi_i;
  output done_o;
  output dma_pkt_v_o;
  output dma_data_ready_o;
  output dma_data_v_o;
  output data_mem_v_o;
  output data_mem_w_o;
  output dma_evict_o;
  wire [39:0] dma_pkt_o;
  wire [63:0] dma_data_o,data_mem_w_mask_o,out_fifo_data_li;
  wire [10:0] data_mem_addr_o;
  wire [511:0] data_mem_data_o;
  wire done_o,dma_pkt_v_o,dma_data_ready_o,dma_data_v_o,data_mem_v_o,data_mem_w_o,
  dma_evict_o,N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,counter_clear,counter_up,in_fifo_v_lo,
  in_fifo_yumi_li,out_fifo_v_li,out_fifo_ready_lo,N11,N12,N13,N14,N15,N16,N17,N18,
  N19,N20,N21,N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,
  N39,N40,N41,N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,
  N59,N60,snoop_word_we,N61,N62,N63,N64,N65,N66,N67,N68,N69,N70,N71,N72,N73,N74,
  N75,N76,N77,N78,N79;
  wire [3:3] counter_r;
  wire [1:0] dma_state_n;
  reg [63:0] snoop_word_o;
  reg [1:0] dma_state_r;
  assign dma_pkt_o[0] = 1'b0;
  assign dma_pkt_o[1] = 1'b0;
  assign dma_pkt_o[2] = 1'b0;
  assign dma_pkt_o[3] = 1'b0;
  assign dma_pkt_o[4] = 1'b0;
  assign dma_pkt_o[5] = 1'b0;
  assign dma_pkt_o[38] = dma_addr_i[38];
  assign dma_pkt_o[37] = dma_addr_i[37];
  assign dma_pkt_o[36] = dma_addr_i[36];
  assign dma_pkt_o[35] = dma_addr_i[35];
  assign dma_pkt_o[34] = dma_addr_i[34];
  assign dma_pkt_o[33] = dma_addr_i[33];
  assign dma_pkt_o[32] = dma_addr_i[32];
  assign dma_pkt_o[31] = dma_addr_i[31];
  assign dma_pkt_o[30] = dma_addr_i[30];
  assign dma_pkt_o[29] = dma_addr_i[29];
  assign dma_pkt_o[28] = dma_addr_i[28];
  assign dma_pkt_o[27] = dma_addr_i[27];
  assign dma_pkt_o[26] = dma_addr_i[26];
  assign dma_pkt_o[25] = dma_addr_i[25];
  assign dma_pkt_o[24] = dma_addr_i[24];
  assign dma_pkt_o[23] = dma_addr_i[23];
  assign dma_pkt_o[22] = dma_addr_i[22];
  assign dma_pkt_o[21] = dma_addr_i[21];
  assign dma_pkt_o[20] = dma_addr_i[20];
  assign dma_pkt_o[19] = dma_addr_i[19];
  assign dma_pkt_o[18] = dma_addr_i[18];
  assign dma_pkt_o[17] = dma_addr_i[17];
  assign dma_pkt_o[16] = dma_addr_i[16];
  assign dma_pkt_o[15] = dma_addr_i[15];
  assign dma_pkt_o[14] = dma_addr_i[14];
  assign data_mem_addr_o[10] = dma_addr_i[13];
  assign dma_pkt_o[13] = dma_addr_i[13];
  assign data_mem_addr_o[9] = dma_addr_i[12];
  assign dma_pkt_o[12] = dma_addr_i[12];
  assign data_mem_addr_o[8] = dma_addr_i[11];
  assign dma_pkt_o[11] = dma_addr_i[11];
  assign data_mem_addr_o[7] = dma_addr_i[10];
  assign dma_pkt_o[10] = dma_addr_i[10];
  assign data_mem_addr_o[6] = dma_addr_i[9];
  assign dma_pkt_o[9] = dma_addr_i[9];
  assign data_mem_addr_o[5] = dma_addr_i[8];
  assign dma_pkt_o[8] = dma_addr_i[8];
  assign data_mem_addr_o[4] = dma_addr_i[7];
  assign dma_pkt_o[7] = dma_addr_i[7];
  assign data_mem_addr_o[3] = dma_addr_i[6];
  assign dma_pkt_o[6] = dma_addr_i[6];
  assign data_mem_w_mask_o[56] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[57] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[58] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[59] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[60] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[61] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[62] = data_mem_w_mask_o[63];
  assign data_mem_w_mask_o[48] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[49] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[50] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[51] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[52] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[53] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[54] = data_mem_w_mask_o[55];
  assign data_mem_w_mask_o[40] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[41] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[42] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[43] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[44] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[45] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[46] = data_mem_w_mask_o[47];
  assign data_mem_w_mask_o[32] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[33] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[34] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[35] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[36] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[37] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[38] = data_mem_w_mask_o[39];
  assign data_mem_w_mask_o[24] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[25] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[26] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[27] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[28] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[29] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[30] = data_mem_w_mask_o[31];
  assign data_mem_w_mask_o[16] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[17] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[18] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[19] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[20] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[21] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[22] = data_mem_w_mask_o[23];
  assign data_mem_w_mask_o[8] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[9] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[10] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[11] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[12] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[13] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[14] = data_mem_w_mask_o[15];
  assign data_mem_w_mask_o[0] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[1] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[2] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[3] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[4] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[5] = data_mem_w_mask_o[7];
  assign data_mem_w_mask_o[6] = data_mem_w_mask_o[7];
  assign data_mem_data_o[63] = data_mem_data_o[511];
  assign data_mem_data_o[127] = data_mem_data_o[511];
  assign data_mem_data_o[191] = data_mem_data_o[511];
  assign data_mem_data_o[255] = data_mem_data_o[511];
  assign data_mem_data_o[319] = data_mem_data_o[511];
  assign data_mem_data_o[383] = data_mem_data_o[511];
  assign data_mem_data_o[447] = data_mem_data_o[511];
  assign data_mem_data_o[62] = data_mem_data_o[510];
  assign data_mem_data_o[126] = data_mem_data_o[510];
  assign data_mem_data_o[190] = data_mem_data_o[510];
  assign data_mem_data_o[254] = data_mem_data_o[510];
  assign data_mem_data_o[318] = data_mem_data_o[510];
  assign data_mem_data_o[382] = data_mem_data_o[510];
  assign data_mem_data_o[446] = data_mem_data_o[510];
  assign data_mem_data_o[61] = data_mem_data_o[509];
  assign data_mem_data_o[125] = data_mem_data_o[509];
  assign data_mem_data_o[189] = data_mem_data_o[509];
  assign data_mem_data_o[253] = data_mem_data_o[509];
  assign data_mem_data_o[317] = data_mem_data_o[509];
  assign data_mem_data_o[381] = data_mem_data_o[509];
  assign data_mem_data_o[445] = data_mem_data_o[509];
  assign data_mem_data_o[60] = data_mem_data_o[508];
  assign data_mem_data_o[124] = data_mem_data_o[508];
  assign data_mem_data_o[188] = data_mem_data_o[508];
  assign data_mem_data_o[252] = data_mem_data_o[508];
  assign data_mem_data_o[316] = data_mem_data_o[508];
  assign data_mem_data_o[380] = data_mem_data_o[508];
  assign data_mem_data_o[444] = data_mem_data_o[508];
  assign data_mem_data_o[59] = data_mem_data_o[507];
  assign data_mem_data_o[123] = data_mem_data_o[507];
  assign data_mem_data_o[187] = data_mem_data_o[507];
  assign data_mem_data_o[251] = data_mem_data_o[507];
  assign data_mem_data_o[315] = data_mem_data_o[507];
  assign data_mem_data_o[379] = data_mem_data_o[507];
  assign data_mem_data_o[443] = data_mem_data_o[507];
  assign data_mem_data_o[58] = data_mem_data_o[506];
  assign data_mem_data_o[122] = data_mem_data_o[506];
  assign data_mem_data_o[186] = data_mem_data_o[506];
  assign data_mem_data_o[250] = data_mem_data_o[506];
  assign data_mem_data_o[314] = data_mem_data_o[506];
  assign data_mem_data_o[378] = data_mem_data_o[506];
  assign data_mem_data_o[442] = data_mem_data_o[506];
  assign data_mem_data_o[57] = data_mem_data_o[505];
  assign data_mem_data_o[121] = data_mem_data_o[505];
  assign data_mem_data_o[185] = data_mem_data_o[505];
  assign data_mem_data_o[249] = data_mem_data_o[505];
  assign data_mem_data_o[313] = data_mem_data_o[505];
  assign data_mem_data_o[377] = data_mem_data_o[505];
  assign data_mem_data_o[441] = data_mem_data_o[505];
  assign data_mem_data_o[56] = data_mem_data_o[504];
  assign data_mem_data_o[120] = data_mem_data_o[504];
  assign data_mem_data_o[184] = data_mem_data_o[504];
  assign data_mem_data_o[248] = data_mem_data_o[504];
  assign data_mem_data_o[312] = data_mem_data_o[504];
  assign data_mem_data_o[376] = data_mem_data_o[504];
  assign data_mem_data_o[440] = data_mem_data_o[504];
  assign data_mem_data_o[55] = data_mem_data_o[503];
  assign data_mem_data_o[119] = data_mem_data_o[503];
  assign data_mem_data_o[183] = data_mem_data_o[503];
  assign data_mem_data_o[247] = data_mem_data_o[503];
  assign data_mem_data_o[311] = data_mem_data_o[503];
  assign data_mem_data_o[375] = data_mem_data_o[503];
  assign data_mem_data_o[439] = data_mem_data_o[503];
  assign data_mem_data_o[54] = data_mem_data_o[502];
  assign data_mem_data_o[118] = data_mem_data_o[502];
  assign data_mem_data_o[182] = data_mem_data_o[502];
  assign data_mem_data_o[246] = data_mem_data_o[502];
  assign data_mem_data_o[310] = data_mem_data_o[502];
  assign data_mem_data_o[374] = data_mem_data_o[502];
  assign data_mem_data_o[438] = data_mem_data_o[502];
  assign data_mem_data_o[53] = data_mem_data_o[501];
  assign data_mem_data_o[117] = data_mem_data_o[501];
  assign data_mem_data_o[181] = data_mem_data_o[501];
  assign data_mem_data_o[245] = data_mem_data_o[501];
  assign data_mem_data_o[309] = data_mem_data_o[501];
  assign data_mem_data_o[373] = data_mem_data_o[501];
  assign data_mem_data_o[437] = data_mem_data_o[501];
  assign data_mem_data_o[52] = data_mem_data_o[500];
  assign data_mem_data_o[116] = data_mem_data_o[500];
  assign data_mem_data_o[180] = data_mem_data_o[500];
  assign data_mem_data_o[244] = data_mem_data_o[500];
  assign data_mem_data_o[308] = data_mem_data_o[500];
  assign data_mem_data_o[372] = data_mem_data_o[500];
  assign data_mem_data_o[436] = data_mem_data_o[500];
  assign data_mem_data_o[51] = data_mem_data_o[499];
  assign data_mem_data_o[115] = data_mem_data_o[499];
  assign data_mem_data_o[179] = data_mem_data_o[499];
  assign data_mem_data_o[243] = data_mem_data_o[499];
  assign data_mem_data_o[307] = data_mem_data_o[499];
  assign data_mem_data_o[371] = data_mem_data_o[499];
  assign data_mem_data_o[435] = data_mem_data_o[499];
  assign data_mem_data_o[50] = data_mem_data_o[498];
  assign data_mem_data_o[114] = data_mem_data_o[498];
  assign data_mem_data_o[178] = data_mem_data_o[498];
  assign data_mem_data_o[242] = data_mem_data_o[498];
  assign data_mem_data_o[306] = data_mem_data_o[498];
  assign data_mem_data_o[370] = data_mem_data_o[498];
  assign data_mem_data_o[434] = data_mem_data_o[498];
  assign data_mem_data_o[49] = data_mem_data_o[497];
  assign data_mem_data_o[113] = data_mem_data_o[497];
  assign data_mem_data_o[177] = data_mem_data_o[497];
  assign data_mem_data_o[241] = data_mem_data_o[497];
  assign data_mem_data_o[305] = data_mem_data_o[497];
  assign data_mem_data_o[369] = data_mem_data_o[497];
  assign data_mem_data_o[433] = data_mem_data_o[497];
  assign data_mem_data_o[48] = data_mem_data_o[496];
  assign data_mem_data_o[112] = data_mem_data_o[496];
  assign data_mem_data_o[176] = data_mem_data_o[496];
  assign data_mem_data_o[240] = data_mem_data_o[496];
  assign data_mem_data_o[304] = data_mem_data_o[496];
  assign data_mem_data_o[368] = data_mem_data_o[496];
  assign data_mem_data_o[432] = data_mem_data_o[496];
  assign data_mem_data_o[47] = data_mem_data_o[495];
  assign data_mem_data_o[111] = data_mem_data_o[495];
  assign data_mem_data_o[175] = data_mem_data_o[495];
  assign data_mem_data_o[239] = data_mem_data_o[495];
  assign data_mem_data_o[303] = data_mem_data_o[495];
  assign data_mem_data_o[367] = data_mem_data_o[495];
  assign data_mem_data_o[431] = data_mem_data_o[495];
  assign data_mem_data_o[46] = data_mem_data_o[494];
  assign data_mem_data_o[110] = data_mem_data_o[494];
  assign data_mem_data_o[174] = data_mem_data_o[494];
  assign data_mem_data_o[238] = data_mem_data_o[494];
  assign data_mem_data_o[302] = data_mem_data_o[494];
  assign data_mem_data_o[366] = data_mem_data_o[494];
  assign data_mem_data_o[430] = data_mem_data_o[494];
  assign data_mem_data_o[45] = data_mem_data_o[493];
  assign data_mem_data_o[109] = data_mem_data_o[493];
  assign data_mem_data_o[173] = data_mem_data_o[493];
  assign data_mem_data_o[237] = data_mem_data_o[493];
  assign data_mem_data_o[301] = data_mem_data_o[493];
  assign data_mem_data_o[365] = data_mem_data_o[493];
  assign data_mem_data_o[429] = data_mem_data_o[493];
  assign data_mem_data_o[44] = data_mem_data_o[492];
  assign data_mem_data_o[108] = data_mem_data_o[492];
  assign data_mem_data_o[172] = data_mem_data_o[492];
  assign data_mem_data_o[236] = data_mem_data_o[492];
  assign data_mem_data_o[300] = data_mem_data_o[492];
  assign data_mem_data_o[364] = data_mem_data_o[492];
  assign data_mem_data_o[428] = data_mem_data_o[492];
  assign data_mem_data_o[43] = data_mem_data_o[491];
  assign data_mem_data_o[107] = data_mem_data_o[491];
  assign data_mem_data_o[171] = data_mem_data_o[491];
  assign data_mem_data_o[235] = data_mem_data_o[491];
  assign data_mem_data_o[299] = data_mem_data_o[491];
  assign data_mem_data_o[363] = data_mem_data_o[491];
  assign data_mem_data_o[427] = data_mem_data_o[491];
  assign data_mem_data_o[42] = data_mem_data_o[490];
  assign data_mem_data_o[106] = data_mem_data_o[490];
  assign data_mem_data_o[170] = data_mem_data_o[490];
  assign data_mem_data_o[234] = data_mem_data_o[490];
  assign data_mem_data_o[298] = data_mem_data_o[490];
  assign data_mem_data_o[362] = data_mem_data_o[490];
  assign data_mem_data_o[426] = data_mem_data_o[490];
  assign data_mem_data_o[41] = data_mem_data_o[489];
  assign data_mem_data_o[105] = data_mem_data_o[489];
  assign data_mem_data_o[169] = data_mem_data_o[489];
  assign data_mem_data_o[233] = data_mem_data_o[489];
  assign data_mem_data_o[297] = data_mem_data_o[489];
  assign data_mem_data_o[361] = data_mem_data_o[489];
  assign data_mem_data_o[425] = data_mem_data_o[489];
  assign data_mem_data_o[40] = data_mem_data_o[488];
  assign data_mem_data_o[104] = data_mem_data_o[488];
  assign data_mem_data_o[168] = data_mem_data_o[488];
  assign data_mem_data_o[232] = data_mem_data_o[488];
  assign data_mem_data_o[296] = data_mem_data_o[488];
  assign data_mem_data_o[360] = data_mem_data_o[488];
  assign data_mem_data_o[424] = data_mem_data_o[488];
  assign data_mem_data_o[39] = data_mem_data_o[487];
  assign data_mem_data_o[103] = data_mem_data_o[487];
  assign data_mem_data_o[167] = data_mem_data_o[487];
  assign data_mem_data_o[231] = data_mem_data_o[487];
  assign data_mem_data_o[295] = data_mem_data_o[487];
  assign data_mem_data_o[359] = data_mem_data_o[487];
  assign data_mem_data_o[423] = data_mem_data_o[487];
  assign data_mem_data_o[38] = data_mem_data_o[486];
  assign data_mem_data_o[102] = data_mem_data_o[486];
  assign data_mem_data_o[166] = data_mem_data_o[486];
  assign data_mem_data_o[230] = data_mem_data_o[486];
  assign data_mem_data_o[294] = data_mem_data_o[486];
  assign data_mem_data_o[358] = data_mem_data_o[486];
  assign data_mem_data_o[422] = data_mem_data_o[486];
  assign data_mem_data_o[37] = data_mem_data_o[485];
  assign data_mem_data_o[101] = data_mem_data_o[485];
  assign data_mem_data_o[165] = data_mem_data_o[485];
  assign data_mem_data_o[229] = data_mem_data_o[485];
  assign data_mem_data_o[293] = data_mem_data_o[485];
  assign data_mem_data_o[357] = data_mem_data_o[485];
  assign data_mem_data_o[421] = data_mem_data_o[485];
  assign data_mem_data_o[36] = data_mem_data_o[484];
  assign data_mem_data_o[100] = data_mem_data_o[484];
  assign data_mem_data_o[164] = data_mem_data_o[484];
  assign data_mem_data_o[228] = data_mem_data_o[484];
  assign data_mem_data_o[292] = data_mem_data_o[484];
  assign data_mem_data_o[356] = data_mem_data_o[484];
  assign data_mem_data_o[420] = data_mem_data_o[484];
  assign data_mem_data_o[35] = data_mem_data_o[483];
  assign data_mem_data_o[99] = data_mem_data_o[483];
  assign data_mem_data_o[163] = data_mem_data_o[483];
  assign data_mem_data_o[227] = data_mem_data_o[483];
  assign data_mem_data_o[291] = data_mem_data_o[483];
  assign data_mem_data_o[355] = data_mem_data_o[483];
  assign data_mem_data_o[419] = data_mem_data_o[483];
  assign data_mem_data_o[34] = data_mem_data_o[482];
  assign data_mem_data_o[98] = data_mem_data_o[482];
  assign data_mem_data_o[162] = data_mem_data_o[482];
  assign data_mem_data_o[226] = data_mem_data_o[482];
  assign data_mem_data_o[290] = data_mem_data_o[482];
  assign data_mem_data_o[354] = data_mem_data_o[482];
  assign data_mem_data_o[418] = data_mem_data_o[482];
  assign data_mem_data_o[33] = data_mem_data_o[481];
  assign data_mem_data_o[97] = data_mem_data_o[481];
  assign data_mem_data_o[161] = data_mem_data_o[481];
  assign data_mem_data_o[225] = data_mem_data_o[481];
  assign data_mem_data_o[289] = data_mem_data_o[481];
  assign data_mem_data_o[353] = data_mem_data_o[481];
  assign data_mem_data_o[417] = data_mem_data_o[481];
  assign data_mem_data_o[32] = data_mem_data_o[480];
  assign data_mem_data_o[96] = data_mem_data_o[480];
  assign data_mem_data_o[160] = data_mem_data_o[480];
  assign data_mem_data_o[224] = data_mem_data_o[480];
  assign data_mem_data_o[288] = data_mem_data_o[480];
  assign data_mem_data_o[352] = data_mem_data_o[480];
  assign data_mem_data_o[416] = data_mem_data_o[480];
  assign data_mem_data_o[31] = data_mem_data_o[479];
  assign data_mem_data_o[95] = data_mem_data_o[479];
  assign data_mem_data_o[159] = data_mem_data_o[479];
  assign data_mem_data_o[223] = data_mem_data_o[479];
  assign data_mem_data_o[287] = data_mem_data_o[479];
  assign data_mem_data_o[351] = data_mem_data_o[479];
  assign data_mem_data_o[415] = data_mem_data_o[479];
  assign data_mem_data_o[30] = data_mem_data_o[478];
  assign data_mem_data_o[94] = data_mem_data_o[478];
  assign data_mem_data_o[158] = data_mem_data_o[478];
  assign data_mem_data_o[222] = data_mem_data_o[478];
  assign data_mem_data_o[286] = data_mem_data_o[478];
  assign data_mem_data_o[350] = data_mem_data_o[478];
  assign data_mem_data_o[414] = data_mem_data_o[478];
  assign data_mem_data_o[29] = data_mem_data_o[477];
  assign data_mem_data_o[93] = data_mem_data_o[477];
  assign data_mem_data_o[157] = data_mem_data_o[477];
  assign data_mem_data_o[221] = data_mem_data_o[477];
  assign data_mem_data_o[285] = data_mem_data_o[477];
  assign data_mem_data_o[349] = data_mem_data_o[477];
  assign data_mem_data_o[413] = data_mem_data_o[477];
  assign data_mem_data_o[28] = data_mem_data_o[476];
  assign data_mem_data_o[92] = data_mem_data_o[476];
  assign data_mem_data_o[156] = data_mem_data_o[476];
  assign data_mem_data_o[220] = data_mem_data_o[476];
  assign data_mem_data_o[284] = data_mem_data_o[476];
  assign data_mem_data_o[348] = data_mem_data_o[476];
  assign data_mem_data_o[412] = data_mem_data_o[476];
  assign data_mem_data_o[27] = data_mem_data_o[475];
  assign data_mem_data_o[91] = data_mem_data_o[475];
  assign data_mem_data_o[155] = data_mem_data_o[475];
  assign data_mem_data_o[219] = data_mem_data_o[475];
  assign data_mem_data_o[283] = data_mem_data_o[475];
  assign data_mem_data_o[347] = data_mem_data_o[475];
  assign data_mem_data_o[411] = data_mem_data_o[475];
  assign data_mem_data_o[26] = data_mem_data_o[474];
  assign data_mem_data_o[90] = data_mem_data_o[474];
  assign data_mem_data_o[154] = data_mem_data_o[474];
  assign data_mem_data_o[218] = data_mem_data_o[474];
  assign data_mem_data_o[282] = data_mem_data_o[474];
  assign data_mem_data_o[346] = data_mem_data_o[474];
  assign data_mem_data_o[410] = data_mem_data_o[474];
  assign data_mem_data_o[25] = data_mem_data_o[473];
  assign data_mem_data_o[89] = data_mem_data_o[473];
  assign data_mem_data_o[153] = data_mem_data_o[473];
  assign data_mem_data_o[217] = data_mem_data_o[473];
  assign data_mem_data_o[281] = data_mem_data_o[473];
  assign data_mem_data_o[345] = data_mem_data_o[473];
  assign data_mem_data_o[409] = data_mem_data_o[473];
  assign data_mem_data_o[24] = data_mem_data_o[472];
  assign data_mem_data_o[88] = data_mem_data_o[472];
  assign data_mem_data_o[152] = data_mem_data_o[472];
  assign data_mem_data_o[216] = data_mem_data_o[472];
  assign data_mem_data_o[280] = data_mem_data_o[472];
  assign data_mem_data_o[344] = data_mem_data_o[472];
  assign data_mem_data_o[408] = data_mem_data_o[472];
  assign data_mem_data_o[23] = data_mem_data_o[471];
  assign data_mem_data_o[87] = data_mem_data_o[471];
  assign data_mem_data_o[151] = data_mem_data_o[471];
  assign data_mem_data_o[215] = data_mem_data_o[471];
  assign data_mem_data_o[279] = data_mem_data_o[471];
  assign data_mem_data_o[343] = data_mem_data_o[471];
  assign data_mem_data_o[407] = data_mem_data_o[471];
  assign data_mem_data_o[22] = data_mem_data_o[470];
  assign data_mem_data_o[86] = data_mem_data_o[470];
  assign data_mem_data_o[150] = data_mem_data_o[470];
  assign data_mem_data_o[214] = data_mem_data_o[470];
  assign data_mem_data_o[278] = data_mem_data_o[470];
  assign data_mem_data_o[342] = data_mem_data_o[470];
  assign data_mem_data_o[406] = data_mem_data_o[470];
  assign data_mem_data_o[21] = data_mem_data_o[469];
  assign data_mem_data_o[85] = data_mem_data_o[469];
  assign data_mem_data_o[149] = data_mem_data_o[469];
  assign data_mem_data_o[213] = data_mem_data_o[469];
  assign data_mem_data_o[277] = data_mem_data_o[469];
  assign data_mem_data_o[341] = data_mem_data_o[469];
  assign data_mem_data_o[405] = data_mem_data_o[469];
  assign data_mem_data_o[20] = data_mem_data_o[468];
  assign data_mem_data_o[84] = data_mem_data_o[468];
  assign data_mem_data_o[148] = data_mem_data_o[468];
  assign data_mem_data_o[212] = data_mem_data_o[468];
  assign data_mem_data_o[276] = data_mem_data_o[468];
  assign data_mem_data_o[340] = data_mem_data_o[468];
  assign data_mem_data_o[404] = data_mem_data_o[468];
  assign data_mem_data_o[19] = data_mem_data_o[467];
  assign data_mem_data_o[83] = data_mem_data_o[467];
  assign data_mem_data_o[147] = data_mem_data_o[467];
  assign data_mem_data_o[211] = data_mem_data_o[467];
  assign data_mem_data_o[275] = data_mem_data_o[467];
  assign data_mem_data_o[339] = data_mem_data_o[467];
  assign data_mem_data_o[403] = data_mem_data_o[467];
  assign data_mem_data_o[18] = data_mem_data_o[466];
  assign data_mem_data_o[82] = data_mem_data_o[466];
  assign data_mem_data_o[146] = data_mem_data_o[466];
  assign data_mem_data_o[210] = data_mem_data_o[466];
  assign data_mem_data_o[274] = data_mem_data_o[466];
  assign data_mem_data_o[338] = data_mem_data_o[466];
  assign data_mem_data_o[402] = data_mem_data_o[466];
  assign data_mem_data_o[17] = data_mem_data_o[465];
  assign data_mem_data_o[81] = data_mem_data_o[465];
  assign data_mem_data_o[145] = data_mem_data_o[465];
  assign data_mem_data_o[209] = data_mem_data_o[465];
  assign data_mem_data_o[273] = data_mem_data_o[465];
  assign data_mem_data_o[337] = data_mem_data_o[465];
  assign data_mem_data_o[401] = data_mem_data_o[465];
  assign data_mem_data_o[16] = data_mem_data_o[464];
  assign data_mem_data_o[80] = data_mem_data_o[464];
  assign data_mem_data_o[144] = data_mem_data_o[464];
  assign data_mem_data_o[208] = data_mem_data_o[464];
  assign data_mem_data_o[272] = data_mem_data_o[464];
  assign data_mem_data_o[336] = data_mem_data_o[464];
  assign data_mem_data_o[400] = data_mem_data_o[464];
  assign data_mem_data_o[15] = data_mem_data_o[463];
  assign data_mem_data_o[79] = data_mem_data_o[463];
  assign data_mem_data_o[143] = data_mem_data_o[463];
  assign data_mem_data_o[207] = data_mem_data_o[463];
  assign data_mem_data_o[271] = data_mem_data_o[463];
  assign data_mem_data_o[335] = data_mem_data_o[463];
  assign data_mem_data_o[399] = data_mem_data_o[463];
  assign data_mem_data_o[14] = data_mem_data_o[462];
  assign data_mem_data_o[78] = data_mem_data_o[462];
  assign data_mem_data_o[142] = data_mem_data_o[462];
  assign data_mem_data_o[206] = data_mem_data_o[462];
  assign data_mem_data_o[270] = data_mem_data_o[462];
  assign data_mem_data_o[334] = data_mem_data_o[462];
  assign data_mem_data_o[398] = data_mem_data_o[462];
  assign data_mem_data_o[13] = data_mem_data_o[461];
  assign data_mem_data_o[77] = data_mem_data_o[461];
  assign data_mem_data_o[141] = data_mem_data_o[461];
  assign data_mem_data_o[205] = data_mem_data_o[461];
  assign data_mem_data_o[269] = data_mem_data_o[461];
  assign data_mem_data_o[333] = data_mem_data_o[461];
  assign data_mem_data_o[397] = data_mem_data_o[461];
  assign data_mem_data_o[12] = data_mem_data_o[460];
  assign data_mem_data_o[76] = data_mem_data_o[460];
  assign data_mem_data_o[140] = data_mem_data_o[460];
  assign data_mem_data_o[204] = data_mem_data_o[460];
  assign data_mem_data_o[268] = data_mem_data_o[460];
  assign data_mem_data_o[332] = data_mem_data_o[460];
  assign data_mem_data_o[396] = data_mem_data_o[460];
  assign data_mem_data_o[11] = data_mem_data_o[459];
  assign data_mem_data_o[75] = data_mem_data_o[459];
  assign data_mem_data_o[139] = data_mem_data_o[459];
  assign data_mem_data_o[203] = data_mem_data_o[459];
  assign data_mem_data_o[267] = data_mem_data_o[459];
  assign data_mem_data_o[331] = data_mem_data_o[459];
  assign data_mem_data_o[395] = data_mem_data_o[459];
  assign data_mem_data_o[10] = data_mem_data_o[458];
  assign data_mem_data_o[74] = data_mem_data_o[458];
  assign data_mem_data_o[138] = data_mem_data_o[458];
  assign data_mem_data_o[202] = data_mem_data_o[458];
  assign data_mem_data_o[266] = data_mem_data_o[458];
  assign data_mem_data_o[330] = data_mem_data_o[458];
  assign data_mem_data_o[394] = data_mem_data_o[458];
  assign data_mem_data_o[9] = data_mem_data_o[457];
  assign data_mem_data_o[73] = data_mem_data_o[457];
  assign data_mem_data_o[137] = data_mem_data_o[457];
  assign data_mem_data_o[201] = data_mem_data_o[457];
  assign data_mem_data_o[265] = data_mem_data_o[457];
  assign data_mem_data_o[329] = data_mem_data_o[457];
  assign data_mem_data_o[393] = data_mem_data_o[457];
  assign data_mem_data_o[8] = data_mem_data_o[456];
  assign data_mem_data_o[72] = data_mem_data_o[456];
  assign data_mem_data_o[136] = data_mem_data_o[456];
  assign data_mem_data_o[200] = data_mem_data_o[456];
  assign data_mem_data_o[264] = data_mem_data_o[456];
  assign data_mem_data_o[328] = data_mem_data_o[456];
  assign data_mem_data_o[392] = data_mem_data_o[456];
  assign data_mem_data_o[7] = data_mem_data_o[455];
  assign data_mem_data_o[71] = data_mem_data_o[455];
  assign data_mem_data_o[135] = data_mem_data_o[455];
  assign data_mem_data_o[199] = data_mem_data_o[455];
  assign data_mem_data_o[263] = data_mem_data_o[455];
  assign data_mem_data_o[327] = data_mem_data_o[455];
  assign data_mem_data_o[391] = data_mem_data_o[455];
  assign data_mem_data_o[6] = data_mem_data_o[454];
  assign data_mem_data_o[70] = data_mem_data_o[454];
  assign data_mem_data_o[134] = data_mem_data_o[454];
  assign data_mem_data_o[198] = data_mem_data_o[454];
  assign data_mem_data_o[262] = data_mem_data_o[454];
  assign data_mem_data_o[326] = data_mem_data_o[454];
  assign data_mem_data_o[390] = data_mem_data_o[454];
  assign data_mem_data_o[5] = data_mem_data_o[453];
  assign data_mem_data_o[69] = data_mem_data_o[453];
  assign data_mem_data_o[133] = data_mem_data_o[453];
  assign data_mem_data_o[197] = data_mem_data_o[453];
  assign data_mem_data_o[261] = data_mem_data_o[453];
  assign data_mem_data_o[325] = data_mem_data_o[453];
  assign data_mem_data_o[389] = data_mem_data_o[453];
  assign data_mem_data_o[4] = data_mem_data_o[452];
  assign data_mem_data_o[68] = data_mem_data_o[452];
  assign data_mem_data_o[132] = data_mem_data_o[452];
  assign data_mem_data_o[196] = data_mem_data_o[452];
  assign data_mem_data_o[260] = data_mem_data_o[452];
  assign data_mem_data_o[324] = data_mem_data_o[452];
  assign data_mem_data_o[388] = data_mem_data_o[452];
  assign data_mem_data_o[3] = data_mem_data_o[451];
  assign data_mem_data_o[67] = data_mem_data_o[451];
  assign data_mem_data_o[131] = data_mem_data_o[451];
  assign data_mem_data_o[195] = data_mem_data_o[451];
  assign data_mem_data_o[259] = data_mem_data_o[451];
  assign data_mem_data_o[323] = data_mem_data_o[451];
  assign data_mem_data_o[387] = data_mem_data_o[451];
  assign data_mem_data_o[2] = data_mem_data_o[450];
  assign data_mem_data_o[66] = data_mem_data_o[450];
  assign data_mem_data_o[130] = data_mem_data_o[450];
  assign data_mem_data_o[194] = data_mem_data_o[450];
  assign data_mem_data_o[258] = data_mem_data_o[450];
  assign data_mem_data_o[322] = data_mem_data_o[450];
  assign data_mem_data_o[386] = data_mem_data_o[450];
  assign data_mem_data_o[1] = data_mem_data_o[449];
  assign data_mem_data_o[65] = data_mem_data_o[449];
  assign data_mem_data_o[129] = data_mem_data_o[449];
  assign data_mem_data_o[193] = data_mem_data_o[449];
  assign data_mem_data_o[257] = data_mem_data_o[449];
  assign data_mem_data_o[321] = data_mem_data_o[449];
  assign data_mem_data_o[385] = data_mem_data_o[449];
  assign data_mem_data_o[0] = data_mem_data_o[448];
  assign data_mem_data_o[64] = data_mem_data_o[448];
  assign data_mem_data_o[128] = data_mem_data_o[448];
  assign data_mem_data_o[192] = data_mem_data_o[448];
  assign data_mem_data_o[256] = data_mem_data_o[448];
  assign data_mem_data_o[320] = data_mem_data_o[448];
  assign data_mem_data_o[384] = data_mem_data_o[448];

  bsg_counter_clear_up_max_val_p8
  dma_counter
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .clear_i(counter_clear),
    .up_i(counter_up),
    .count_o({ counter_r[3:3], data_mem_addr_o[2:0] })
  );


  bsg_fifo_1r1w_small_width_p64_els_p8
  in_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(dma_data_v_i),
    .ready_o(dma_data_ready_o),
    .data_i(dma_data_i),
    .v_o(in_fifo_v_lo),
    .data_o(data_mem_data_o[511:448]),
    .yumi_i(in_fifo_yumi_li)
  );


  bsg_two_fifo_width_p64
  out_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .ready_o(out_fifo_ready_lo),
    .data_i(out_fifo_data_li),
    .v_i(out_fifo_v_li),
    .v_o(dma_data_v_o),
    .data_o(dma_data_o),
    .yumi_i(dma_data_yumi_i)
  );


  bsg_decode_num_out_p8
  dma_way_demux
  (
    .i(dma_way_i),
    .o({ data_mem_w_mask_o[63:63], data_mem_w_mask_o[55:55], data_mem_w_mask_o[47:47], data_mem_w_mask_o[39:39], data_mem_w_mask_o[31:31], data_mem_w_mask_o[23:23], data_mem_w_mask_o[15:15], data_mem_w_mask_o[7:7] })
  );


  bsg_mux_width_p64_els_p8
  write_data_mux
  (
    .data_i(data_mem_data_i),
    .sel_i(dma_way_i),
    .data_o(out_fifo_data_li)
  );

  assign N12 = N11 & N64;
  assign N13 = dma_state_r[1] | N64;
  assign N15 = N11 | dma_state_r[0];
  assign N17 = dma_state_r[1] & dma_state_r[0];
  assign N18 = dma_cmd_i[1] | N35;
  assign N19 = N21 | N18;
  assign N21 = dma_cmd_i[3] | dma_cmd_i[2];
  assign N22 = N34 | dma_cmd_i[0];
  assign N23 = N21 | N22;
  assign N25 = dma_cmd_i[3] | N33;
  assign N26 = N25 | N29;
  assign N28 = N32 | dma_cmd_i[2];
  assign N29 = dma_cmd_i[1] | dma_cmd_i[0];
  assign N30 = N28 | N29;
  assign N36 = N32 & N33;
  assign N37 = N34 & N35;
  assign N38 = N36 & N37;
  assign N60 = dma_addr_i[5:3] == data_mem_addr_o[2:0];
  assign N64 = ~dma_state_r[0];
  assign N65 = N64 | dma_state_r[1];
  assign N66 = ~N65;
  assign N67 = ~counter_r[3];
  assign N68 = data_mem_addr_o[2] | N67;
  assign N69 = data_mem_addr_o[1] | N68;
  assign N70 = data_mem_addr_o[0] | N69;
  assign N71 = ~N70;
  assign N72 = ~data_mem_addr_o[2];
  assign N73 = ~data_mem_addr_o[1];
  assign N74 = ~data_mem_addr_o[0];
  assign N75 = N72 | counter_r[3];
  assign N76 = N73 | N75;
  assign N77 = N74 | N76;
  assign N78 = ~N77;
  assign N44 = (N0)? 1'b1 : 
               (N1)? 1'b1 : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N0 = N20;
  assign N1 = N24;
  assign N2 = N27;
  assign N3 = N31;
  assign N4 = N38;
  assign N45 = (N0)? 1'b0 : 
               (N1)? 1'b1 : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N46 = (N0)? dma_pkt_yumi_i : 
               (N1)? dma_pkt_yumi_i : 
               (N2)? 1'b0 : 
               (N3)? 1'b0 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N47 = (N0)? 1'b0 : 
               (N1)? 1'b0 : 
               (N2)? 1'b1 : 
               (N3)? 1'b1 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N48 = (N0)? 1'b0 : 
               (N1)? 1'b0 : 
               (N2)? 1'b0 : 
               (N3)? 1'b1 : 
               (N4)? 1'b0 : 
               (N43)? 1'b0 : 1'b0;
  assign N50 = ~N49;
  assign N55 = ~N54;
  assign counter_clear = (N5)? N47 : 
                         (N6)? N52 : 
                         (N7)? N57 : 
                         (N8)? 1'b0 : 1'b0;
  assign N5 = N12;
  assign N6 = N14;
  assign N7 = N16;
  assign N8 = N17;
  assign counter_up = (N5)? N48 : 
                      (N6)? N51 : 
                      (N7)? N56 : 
                      (N8)? 1'b0 : 1'b0;
  assign data_mem_v_o = (N5)? N48 : 
                        (N6)? in_fifo_v_lo : 
                        (N7)? N58 : 
                        (N8)? 1'b0 : 1'b0;
  assign dma_pkt_v_o = (N5)? N44 : 
                       (N6)? 1'b0 : 
                       (N7)? 1'b0 : 
                       (N8)? 1'b0 : 1'b0;
  assign dma_pkt_o[39] = (N5)? N45 : 
                         (N6)? 1'b0 : 
                         (N7)? 1'b0 : 
                         (N8)? 1'b0 : 1'b0;
  assign done_o = (N5)? N46 : 
                  (N6)? N53 : 
                  (N7)? N59 : 
                  (N8)? 1'b0 : 1'b0;
  assign dma_state_n = (N5)? { N31, N27 } : 
                       (N6)? { 1'b0, N50 } : 
                       (N7)? { N55, 1'b0 } : 
                       (N8)? { 1'b0, 1'b0 } : 1'b0;
  assign data_mem_w_o = (N5)? 1'b0 : 
                        (N6)? in_fifo_v_lo : 
                        (N7)? 1'b0 : 
                        (N8)? 1'b0 : 1'b0;
  assign in_fifo_yumi_li = (N5)? 1'b0 : 
                           (N6)? in_fifo_v_lo : 
                           (N7)? 1'b0 : 
                           (N8)? 1'b0 : 1'b0;
  assign out_fifo_v_li = (N5)? 1'b0 : 
                         (N6)? 1'b0 : 
                         (N7)? 1'b1 : 
                         (N8)? 1'b0 : 1'b0;
  assign dma_evict_o = (N5)? 1'b0 : 
                       (N6)? 1'b0 : 
                       (N7)? 1'b1 : 
                       (N8)? 1'b0 : 1'b0;
  assign N63 = (N9)? 1'b0 : 
               (N10)? snoop_word_we : 1'b0;
  assign N9 = N62;
  assign N10 = N61;
  assign N11 = ~dma_state_r[1];
  assign N14 = ~N13;
  assign N16 = ~N15;
  assign N20 = ~N19;
  assign N24 = ~N23;
  assign N27 = ~N26;
  assign N31 = ~N30;
  assign N32 = ~dma_cmd_i[3];
  assign N33 = ~dma_cmd_i[2];
  assign N34 = ~dma_cmd_i[1];
  assign N35 = ~dma_cmd_i[0];
  assign N39 = N24 | N20;
  assign N40 = N27 | N39;
  assign N41 = N31 | N40;
  assign N42 = N38 | N41;
  assign N43 = ~N42;
  assign N49 = N78 & in_fifo_v_lo;
  assign N51 = in_fifo_v_lo & N77;
  assign N52 = in_fifo_v_lo & N78;
  assign N53 = N78 & in_fifo_v_lo;
  assign N54 = N71 & out_fifo_ready_lo;
  assign N56 = out_fifo_ready_lo & N70;
  assign N57 = out_fifo_ready_lo & N71;
  assign N58 = out_fifo_ready_lo & N70;
  assign N59 = N71 & out_fifo_ready_lo;
  assign snoop_word_we = N79 & in_fifo_v_lo;
  assign N79 = N66 & N60;
  assign N61 = ~reset_i;
  assign N62 = reset_i;

  always @(posedge clk_i) begin
    if(N63) begin
      { snoop_word_o[63:0] } <= { data_mem_data_o[511:448] };
    end 
    if(reset_i) begin
      { dma_state_r[1:0] } <= { 1'b0, 1'b0 };
    end else if(1'b1) begin
      { dma_state_r[1:0] } <= { dma_state_n[1:0] };
    end 
  end


endmodule

