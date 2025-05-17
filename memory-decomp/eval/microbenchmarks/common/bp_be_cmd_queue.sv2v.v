

module bsg_circular_ptr_00000004_1
(
  clk,
  reset_i,
  add_i,
  o,
  n_o
);

  input [0:0] add_i;
  output [1:0] o;
  output [1:0] n_o;
  input clk;
  input reset_i;
  wire [1:0] o,n_o,\genblk1.genblk1.ptr_r_p1 ;
  wire N0,N1,N2;
  reg o_1_sv2v_reg,o_0_sv2v_reg;
  assign o[1] = o_1_sv2v_reg;
  assign o[0] = o_0_sv2v_reg;
  assign \genblk1.genblk1.ptr_r_p1  = o + 1'b1;
  assign n_o = (N0)? \genblk1.genblk1.ptr_r_p1  : 
               (N1)? o : 1'b0;
  assign N0 = add_i[0];
  assign N1 = N2;
  assign N2 = ~add_i[0];

  always @(posedge clk) begin
    if(reset_i) begin
      o_1_sv2v_reg <= 1'b0;
      o_0_sv2v_reg <= 1'b0;
    end else if(1'b1) begin
      o_1_sv2v_reg <= n_o[1];
      o_0_sv2v_reg <= n_o[0];
    end 
  end


endmodule



module bsg_fifo_tracker_00000004
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

  output [1:0] wptr_r_o;
  output [1:0] rptr_r_o;
  output [1:0] rptr_n_o;
  input clk_i;
  input reset_i;
  input enq_i;
  input deq_i;
  output full_o;
  output empty_o;
  wire [1:0] wptr_r_o,rptr_r_o,rptr_n_o;
  wire full_o,empty_o,enq_r,deq_r,N0,equal_ptrs,sv2v_dc_1,sv2v_dc_2;
  reg deq_r_sv2v_reg,enq_r_sv2v_reg;
  assign deq_r = deq_r_sv2v_reg;
  assign enq_r = enq_r_sv2v_reg;

  bsg_circular_ptr_00000004_1
  rptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(deq_i),
    .o(rptr_r_o),
    .n_o(rptr_n_o)
  );


  bsg_circular_ptr_00000004_1
  wptr
  (
    .clk(clk_i),
    .reset_i(reset_i),
    .add_i(enq_i),
    .o(wptr_r_o),
    .n_o({ sv2v_dc_1, sv2v_dc_2 })
  );

  assign equal_ptrs = rptr_r_o == wptr_r_o;
  assign N0 = enq_i | deq_i;
  assign empty_o = equal_ptrs & deq_r;
  assign full_o = equal_ptrs & enq_r;

  always @(posedge clk_i) begin
    if(reset_i) begin
      deq_r_sv2v_reg <= 1'b1;
      enq_r_sv2v_reg <= 1'b0;
    end else if(N0) begin
      deq_r_sv2v_reg <= deq_i;
      enq_r_sv2v_reg <= enq_i;
    end 
  end


endmodule



module bp_be_cmd_queue
(
  clk_i,
  reset_i,
  fe_cmd_i,
  fe_cmd_v_i,
  fe_cmd_o,
  fe_cmd_v_o,
  fe_cmd_yumi_i,
  empty_n_o,
  empty_r_o,
  full_n_o,
  full_r_o
);

  input [113:0] fe_cmd_i;
  output [113:0] fe_cmd_o;
  input clk_i;
  input reset_i;
  input fe_cmd_v_i;
  input fe_cmd_yumi_i;
  output fe_cmd_v_o;
  output empty_n_o;
  output empty_r_o;
  output full_n_o;
  output full_r_o;
  wire [113:0] fe_cmd_o;
  wire fe_cmd_v_o,empty_n_o,empty_r_o,full_n_o,full_r_o,N0,N1,almost_full,N2,N3,
  almost_empty,N4,N5,N6,N7,N8,N9;
  wire [1:0] wptr_r,rptr_r,rptr_n;

  bsg_fifo_tracker_00000004
  ft
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .enq_i(fe_cmd_v_i),
    .deq_i(fe_cmd_yumi_i),
    .wptr_r_o(wptr_r),
    .rptr_r_o(rptr_r),
    .rptr_n_o(rptr_n),
    .full_o(full_r_o),
    .empty_o(empty_r_o)
  );


  bsg_mem_1r1w
  #(.width_p(114), .els_p(4))
  fifo_mem
  (
    .w_clk_i(clk_i),
    .w_reset_i(reset_i),
    .w_v_i(fe_cmd_v_i),
    .w_addr_i(wptr_r),
    .w_data_i(fe_cmd_i),
    .r_v_i(fe_cmd_v_o),
    .r_addr_i(rptr_r),
    .r_data_o(fe_cmd_o)
  );

  assign almost_full = rptr_r == { N1, N0 };
  assign almost_empty = rptr_r == { N3, N2 };
  assign { N1, N0 } = wptr_r + 1'b1;
  assign { N3, N2 } = wptr_r - 1'b1;
  assign fe_cmd_v_o = ~empty_r_o;
  assign empty_n_o = N5 & N6;
  assign N5 = empty_r_o | N4;
  assign N4 = almost_empty & fe_cmd_yumi_i;
  assign N6 = ~fe_cmd_v_i;
  assign full_n_o = N8 & N9;
  assign N8 = full_r_o | N7;
  assign N7 = almost_full & fe_cmd_v_i;
  assign N9 = ~fe_cmd_yumi_i;

endmodule

