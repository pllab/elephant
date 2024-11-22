

module top
(
  clk_i,
  reset_i,
  data_i,
  v_i,
  ready_o,
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

  bsg_fifo_1r1w_narrowed
  wrapper
  (
    .data_i(data_i),
    .data_o(data_o),
    .clk_i(clk_i),
    .reset_i(reset_i),
    .v_i(v_i),
    .yumi_i(yumi_i),
    .ready_o(ready_o),
    .v_o(v_o)
  );


endmodule



module bsg_channel_narrow_width_in_p64_width_out_p64_lsb_to_msb_p1
(
  clk_i,
  reset_i,
  data_i,
  deque_o,
  data_o,
  deque_i
);

  input [63:0] data_i;
  output [63:0] data_o;
  input clk_i;
  input reset_i;
  input deque_i;
  output deque_o;
  wire [63:0] data_o;
  wire deque_o;
  assign deque_o = deque_i;
  assign data_o[63] = data_i[63];
  assign data_o[62] = data_i[62];
  assign data_o[61] = data_i[61];
  assign data_o[60] = data_i[60];
  assign data_o[59] = data_i[59];
  assign data_o[58] = data_i[58];
  assign data_o[57] = data_i[57];
  assign data_o[56] = data_i[56];
  assign data_o[55] = data_i[55];
  assign data_o[54] = data_i[54];
  assign data_o[53] = data_i[53];
  assign data_o[52] = data_i[52];
  assign data_o[51] = data_i[51];
  assign data_o[50] = data_i[50];
  assign data_o[49] = data_i[49];
  assign data_o[48] = data_i[48];
  assign data_o[47] = data_i[47];
  assign data_o[46] = data_i[46];
  assign data_o[45] = data_i[45];
  assign data_o[44] = data_i[44];
  assign data_o[43] = data_i[43];
  assign data_o[42] = data_i[42];
  assign data_o[41] = data_i[41];
  assign data_o[40] = data_i[40];
  assign data_o[39] = data_i[39];
  assign data_o[38] = data_i[38];
  assign data_o[37] = data_i[37];
  assign data_o[36] = data_i[36];
  assign data_o[35] = data_i[35];
  assign data_o[34] = data_i[34];
  assign data_o[33] = data_i[33];
  assign data_o[32] = data_i[32];
  assign data_o[31] = data_i[31];
  assign data_o[30] = data_i[30];
  assign data_o[29] = data_i[29];
  assign data_o[28] = data_i[28];
  assign data_o[27] = data_i[27];
  assign data_o[26] = data_i[26];
  assign data_o[25] = data_i[25];
  assign data_o[24] = data_i[24];
  assign data_o[23] = data_i[23];
  assign data_o[22] = data_i[22];
  assign data_o[21] = data_i[21];
  assign data_o[20] = data_i[20];
  assign data_o[19] = data_i[19];
  assign data_o[18] = data_i[18];
  assign data_o[17] = data_i[17];
  assign data_o[16] = data_i[16];
  assign data_o[15] = data_i[15];
  assign data_o[14] = data_i[14];
  assign data_o[13] = data_i[13];
  assign data_o[12] = data_i[12];
  assign data_o[11] = data_i[11];
  assign data_o[10] = data_i[10];
  assign data_o[9] = data_i[9];
  assign data_o[8] = data_i[8];
  assign data_o[7] = data_i[7];
  assign data_o[6] = data_i[6];
  assign data_o[5] = data_i[5];
  assign data_o[4] = data_i[4];
  assign data_o[3] = data_i[3];
  assign data_o[2] = data_i[2];
  assign data_o[1] = data_i[1];
  assign data_o[0] = data_i[0];

endmodule



module bsg_fifo_1r1w_narrowed
(
  clk_i,
  reset_i,
  data_i,
  v_i,
  ready_o,
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
  wire [63:0] data_o,data;
  wire ready_o,v_o,yumi;

  bsg_fifo_1r1w_small
  main_fifo
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .data_i(data_i),
    .v_i(v_i),
    .ready_o(ready_o),
    .v_o(v_o),
    .data_o(data),
    .yumi_i(yumi)
  );


  bsg_channel_narrow_width_in_p64_width_out_p64_lsb_to_msb_p1
  output_narrower
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .data_i(data),
    .deque_o(yumi),
    .data_o(data_o),
    .deque_i(yumi_i)
  );


endmodule

module bsg_fifo_1r1w_small (
	clk_i,
	reset_i,
	v_i,
	ready_o,
	data_i,
	v_o,
	data_o,
	yumi_i
);
	parameter width_p = 64;
	parameter els_p = 256;
	parameter harden_p = 0;
	parameter ready_THEN_valid_p = 0;
	input clk_i;
	input reset_i;
	input v_i;
	output ready_o;
	input [width_p - 1:0] data_i;
	output v_o;
	output [width_p - 1:0] data_o;
	input yumi_i;
	generate
		if (harden_p == 0) begin : unhardened
			if (els_p == 2) begin : tf
				bsg_two_fifo #(
					.width_p(width_p),
					.ready_THEN_valid_p(ready_THEN_valid_p)
				) twof(
					.clk_i(clk_i),
					.reset_i(reset_i),
					.ready_o(ready_o),
					.data_i(data_i),
					.v_i(v_i),
					.v_o(v_o),
					.data_o(data_o),
					.yumi_i(yumi_i)
				);
			end
			else begin : un
				bsg_fifo_1r1w_small_unhardened #(
					.width_p(width_p),
					.els_p(els_p),
					.ready_THEN_valid_p(ready_THEN_valid_p)
				) fifo(
					.clk_i(clk_i),
					.reset_i(reset_i),
					.v_i(v_i),
					.ready_o(ready_o),
					.data_i(data_i),
					.v_o(v_o),
					.data_o(data_o),
					.yumi_i(yumi_i)
				);
			end
		end
		else begin : hardened
			bsg_fifo_1r1w_small_hardened #(
				.width_p(width_p),
				.els_p(els_p),
				.ready_THEN_valid_p(ready_THEN_valid_p)
			) fifo(
				.clk_i(clk_i),
				.reset_i(reset_i),
				.v_i(v_i),
				.ready_o(ready_o),
				.data_i(data_i),
				.v_o(v_o),
				.data_o(data_o),
				.yumi_i(yumi_i)
			);
		end
	endgenerate
endmodule
module bsg_fifo_1r1w_small_unhardened (
	clk_i,
	reset_i,
	v_i,
	ready_o,
	data_i,
	v_o,
	data_o,
	yumi_i
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter ready_THEN_valid_p = 0;
	input clk_i;
	input reset_i;
	input v_i;
	output ready_o;
	input [width_p - 1:0] data_i;
	output v_o;
	output [width_p - 1:0] data_o;
	input yumi_i;
	wire deque = yumi_i;
	wire v_o_tmp;
	assign v_o = v_o_tmp;
	wire enque;
	wire ready_lo;
	generate
		if (ready_THEN_valid_p) begin : rtv
			assign enque = v_i;
		end
		else begin : rav
			assign enque = v_i & ready_lo;
		end
	endgenerate
	localparam ptr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	wire [ptr_width_lp - 1:0] rptr_r;
	wire [ptr_width_lp - 1:0] wptr_r;
	wire full;
	wire empty;
	bsg_fifo_tracker #(.els_p(els_p)) ft(
		.clk_i(clk_i),
		.reset_i(reset_i),
		.enq_i(enque),
		.deq_i(deque),
		.wptr_r_o(wptr_r),
		.rptr_r_o(rptr_r),
		.rptr_n_o(),
		.full_o(full),
		.empty_o(empty)
	);
	bsg_mem_1r1w #(
		.width_p(width_p),
		.els_p(els_p),
		.read_write_same_addr_p(0)
	) mem_1r1w(
		.w_clk_i(clk_i),
		.w_reset_i(reset_i),
		.w_v_i(enque),
		.w_addr_i(wptr_r),
		.w_data_i(data_i),
		.r_v_i(v_o_tmp),
		.r_addr_i(rptr_r),
		.r_data_o(data_o)
	);
	assign ready_lo = ~full;
	assign ready_o = ready_lo;
	assign v_o_tmp = ~empty;
endmodule
module bsg_fifo_1r1w_small_hardened (
	clk_i,
	reset_i,
	v_i,
	ready_o,
	data_i,
	v_o,
	data_o,
	yumi_i
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter ready_THEN_valid_p = 0;
	input clk_i;
	input reset_i;
	input v_i;
	output ready_o;
	input [width_p - 1:0] data_i;
	output v_o;
	output [width_p - 1:0] data_o;
	input yumi_i;
	wire deque = yumi_i;
	wire v_o_tmp;
	assign v_o = v_o_tmp;
	wire enque;
	wire ready_lo;
	generate
		if (ready_THEN_valid_p) begin : rtv
			assign enque = v_i;
		end
		else begin : rav
			assign enque = v_i & ready_lo;
		end
	endgenerate
	localparam ptr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	wire [ptr_width_lp - 1:0] rptr_r;
	wire [ptr_width_lp - 1:0] wptr_r;
	wire full;
	wire empty;
	wire [ptr_width_lp - 1:0] rptr_n;
	wire [width_p - 1:0] data_o_mem;
	wire [width_p - 1:0] data_o_reg;
	wire read_write_same_addr_n;
	reg write_bypass_r;
	wire write_bypass_n;
	bsg_fifo_tracker #(.els_p(els_p)) fts(
		.clk_i(clk_i),
		.reset_i(reset_i),
		.enq_i(enque),
		.deq_i(deque),
		.wptr_r_o(wptr_r),
		.rptr_r_o(rptr_r),
		.rptr_n_o(rptr_n),
		.full_o(full),
		.empty_o(empty)
	);
	bsg_mem_1r1w_sync #(
		.width_p(width_p),
		.els_p(els_p),
		.read_write_same_addr_p(0),
		.disable_collision_warning_p(0),
		.harden_p(1)
	) mem_1r1w_sync(
		.clk_i(clk_i),
		.reset_i(reset_i),
		.w_v_i(enque),
		.w_addr_i(wptr_r),
		.w_data_i(data_i),
		.r_v_i(~read_write_same_addr_n),
		.r_addr_i(rptr_n),
		.r_data_o(data_o_mem)
	);
	bsg_dff_en #(.width_p(width_p)) bypass_reg(
		.clk_i(clk_i),
		.data_i(data_i),
		.en_i(write_bypass_n),
		.data_o(data_o_reg)
	);
	assign data_o = (write_bypass_r ? data_o_reg : data_o_mem);
	assign read_write_same_addr_n = wptr_r == rptr_n;
	assign write_bypass_n = enque & read_write_same_addr_n;
	always @(posedge clk_i) write_bypass_r <= write_bypass_n;
	assign ready_lo = ~full;
	assign ready_o = ready_lo;
	assign v_o_tmp = ~empty;
endmodule
module bsg_fifo_tracker (
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
	parameter els_p = -1;
	parameter ptr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	input clk_i;
	input reset_i;
	input enq_i;
	input deq_i;
	output [ptr_width_lp - 1:0] wptr_r_o;
	output [ptr_width_lp - 1:0] rptr_r_o;
	output [ptr_width_lp - 1:0] rptr_n_o;
	output full_o;
	output empty_o;
	wire [ptr_width_lp - 1:0] rptr_r;
	wire [ptr_width_lp - 1:0] rptr_n;
	wire [ptr_width_lp - 1:0] wptr_r;
	assign wptr_r_o = wptr_r;
	assign rptr_r_o = rptr_r;
	assign rptr_n_o = rptr_n;
	reg enq_r;
	reg deq_r;
	wire empty;
	wire full;
	wire equal_ptrs;
	bsg_circular_ptr #(
		.slots_p(els_p),
		.max_add_p(1)
	) rptr(
		.clk(clk_i),
		.reset_i(reset_i),
		.add_i(deq_i),
		.o(rptr_r),
		.n_o(rptr_n)
	);
	bsg_circular_ptr #(
		.slots_p(els_p),
		.max_add_p(1)
	) wptr(
		.clk(clk_i),
		.reset_i(reset_i),
		.add_i(enq_i),
		.o(wptr_r),
		.n_o()
	);
	always @(posedge clk_i)
		if (reset_i) begin
			enq_r <= 1'b0;
			deq_r <= 1'b1;
		end
		else if (enq_i | deq_i) begin
			enq_r <= enq_i;
			deq_r <= deq_i;
		end
	assign equal_ptrs = rptr_r == wptr_r;
	assign empty = equal_ptrs & deq_r;
	assign full = equal_ptrs & enq_r;
	assign full_o = full;
	assign empty_o = empty;
endmodule
module bsg_circular_ptr (
	clk,
	reset_i,
	add_i,
	o,
	n_o
);
	parameter slots_p = -1;
	parameter max_add_p = -1;
	parameter ptr_width_lp = (slots_p == 1 ? 1 : $clog2(slots_p));
	input clk;
	input reset_i;
	input [$clog2(max_add_p + 1) - 1:0] add_i;
	output [ptr_width_lp - 1:0] o;
	output [ptr_width_lp - 1:0] n_o;
	reg [ptr_width_lp - 1:0] ptr_r;
	wire [ptr_width_lp - 1:0] ptr_n;
	wire [ptr_width_lp - 1:0] ptr_nowrap;
	wire [ptr_width_lp:0] ptr_wrap;
	assign o = ptr_r;
	assign n_o = ptr_n;
	always @(posedge clk)
		if (reset_i)
			ptr_r <= 0;
		else
			ptr_r <= ptr_n;
	generate
		if (slots_p == 1) begin
			assign ptr_n = 1'b0;
			wire ignore = |add_i;
		end
		else if ((1 << $clog2(slots_p)) == slots_p) if (max_add_p == 1) begin
			wire [ptr_width_lp - 1:0] ptr_r_p1 = ptr_r + 1'b1;
			assign ptr_n = (add_i ? ptr_r_p1 : ptr_r);
		end
		else assign ptr_n = sv2v_cast_7EC17(ptr_r + add_i);
		else begin : notpow2
			assign ptr_wrap = sv2v_cast_AB5D9(({1'b0, ptr_r} - slots_p) + add_i);
			assign ptr_nowrap = ptr_r + add_i;
			assign ptr_n = (~ptr_wrap[ptr_width_lp] ? ptr_wrap[0+:ptr_width_lp] : ptr_nowrap);
			always @(*)
				;
		end
	endgenerate
	function automatic [ptr_width_lp - 1:0] sv2v_cast_7EC17;
		input reg [ptr_width_lp - 1:0] inp;
		sv2v_cast_7EC17 = inp;
	endfunction
	function automatic [(ptr_width_lp + 1) - 1:0] sv2v_cast_AB5D9;
		input reg [(ptr_width_lp + 1) - 1:0] inp;
		sv2v_cast_AB5D9 = inp;
	endfunction
endmodule
module bsg_mem_1r1w_sync (
	clk_i,
	reset_i,
	w_v_i,
	w_addr_i,
	w_data_i,
	r_v_i,
	r_addr_i,
	r_data_o
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter read_write_same_addr_p = 0;
	parameter addr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	parameter harden_p = 0;
	parameter disable_collision_warning_p = 1;
	parameter enable_clock_gating_p = 0;
	input clk_i;
	input reset_i;
	input w_v_i;
	input [addr_width_lp - 1:0] w_addr_i;
	input [width_p - 1:0] w_data_i;
	input r_v_i;
	input [addr_width_lp - 1:0] r_addr_i;
	output wire [width_p - 1:0] r_data_o;
	wire clk_lo;
	generate
		if (enable_clock_gating_p) bsg_clkgate_optional icg(
			.clk_i(clk_i),
			.en_i(w_v_i | r_v_i),
			.bypass_i(1'b0),
			.gated_clock_o(clk_lo)
		);
		else assign clk_lo = clk_i;
	endgenerate
	bsg_mem_1r1w_sync_synth #(
		.width_p(width_p),
		.els_p(els_p),
		.read_write_same_addr_p(read_write_same_addr_p),
		.harden_p(harden_p)
	) synth(
		.clk_i(clk_lo),
		.reset_i(reset_i),
		.w_v_i(w_v_i),
		.w_addr_i(w_addr_i),
		.w_data_i(w_data_i),
		.r_v_i(r_v_i),
		.r_addr_i(r_addr_i),
		.r_data_o(r_data_o)
	);
	always @(posedge clk_lo)
		if (w_v_i)
			;
endmodule
module bsg_dff_en (
	clk_i,
	data_i,
	en_i,
	data_o
);
	parameter width_p = "inv";
	parameter harden_p = 1;
	parameter strength_p = 1;
	input clk_i;
	input [width_p - 1:0] data_i;
	input en_i;
	output wire [width_p - 1:0] data_o;
	reg [width_p - 1:0] data_r;
	assign data_o = data_r;
	always @(posedge clk_i)
		if (en_i)
			data_r <= data_i;
endmodule
module bsg_clkgate_optional (
	clk_i,
	en_i,
	bypass_i,
	gated_clock_o
);
	input clk_i;
	input en_i;
	input bypass_i;
	output gated_clock_o;
	wire latched_en_lo;
	bsg_dlatch #(
		.width_p(1),
		.i_know_this_is_a_bad_idea_p(1)
	) en_latch(
		.clk_i(~clk_i),
		.data_i(en_i),
		.data_o(latched_en_lo)
	);
	assign gated_clock_o = (latched_en_lo | bypass_i) & clk_i;
endmodule
module bsg_dlatch (
	clk_i,
	data_i,
	data_o
);
	parameter width_p = "inv";
	parameter i_know_this_is_a_bad_idea_p = 0;
	input clk_i;
	input [width_p - 1:0] data_i;
	output reg [width_p - 1:0] data_o;
	generate
		if (i_know_this_is_a_bad_idea_p == 0) ThisModuleDoesNotExist __sv2v_elab_fatal(
			1,
			"Error: you must admit this is a bad idea before you are allowed to use the bsg_dlatch module!"
		);
	endgenerate
	always @(*)
		if (clk_i)
			data_o <= data_i;
endmodule
module bsg_mem_1rw_sync_synth (
	clk_i,
	v_i,
	reset_i,
	data_i,
	addr_i,
	w_i,
	data_o
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter latch_last_read_p = 0;
	parameter addr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	input clk_i;
	input v_i;
	input reset_i;
	input [width_p - 1:0] data_i;
	input [addr_width_lp - 1:0] addr_i;
	input w_i;
	output wire [width_p - 1:0] data_o;
	wire unused = reset_i;
	reg [addr_width_lp - 1:0] addr_r;
	reg [width_p - 1:0] mem [els_p - 1:0];
	wire read_en;
	wire [width_p - 1:0] data_out;
	assign read_en = v_i & ~w_i;
	assign data_out = mem[addr_r];
	always @(posedge clk_i)
		if (read_en)
			addr_r <= addr_i;
		else
			addr_r <= 1'sbX;
	generate
		if (latch_last_read_p) begin : llr
			wire read_en_r;
			bsg_dff #(.width_p(1)) read_en_dff(
				.clk_i(clk_i),
				.data_i(read_en),
				.data_o(read_en_r)
			);
			bsg_dff_en_bypass #(.width_p(width_p)) dff_bypass(
				.clk_i(clk_i),
				.en_i(read_en_r),
				.data_i(data_out),
				.data_o(data_o)
			);
		end
		else begin : no_llr
			assign data_o = data_out;
		end
	endgenerate
	always @(posedge clk_i)
		if (v_i & w_i)
			mem[addr_i] <= data_i;
	always @(negedge clk_i)
		if (v_i)
			;
endmodule
module bsg_dff (
	clk_i,
	data_i,
	data_o
);
	parameter width_p = -1;
	parameter harden_p = 0;
	parameter strength_p = 1;
	input clk_i;
	input [width_p - 1:0] data_i;
	output [width_p - 1:0] data_o;
	reg [width_p - 1:0] data_r;
	assign data_o = data_r;
	always @(posedge clk_i) data_r <= data_i;
endmodule
module bsg_dff_en_bypass (
	clk_i,
	en_i,
	data_i,
	data_o
);
	parameter width_p = "inv";
	parameter harden_p = 0;
	parameter strength_p = 0;
	input clk_i;
	input en_i;
	input [width_p - 1:0] data_i;
	output wire [width_p - 1:0] data_o;
	wire [width_p - 1:0] data_r;
	bsg_dff_en #(
		.width_p(width_p),
		.harden_p(harden_p),
		.strength_p(strength_p)
	) dff(
		.clk_i(clk_i),
		.en_i(en_i),
		.data_i(data_i),
		.data_o(data_r)
	);
	assign data_o = (en_i ? data_i : data_r);
endmodule
module bsg_mem_1r1w (
	w_clk_i,
	w_reset_i,
	w_v_i,
	w_addr_i,
	w_data_i,
	r_v_i,
	r_addr_i,
	r_data_o
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter read_write_same_addr_p = 0;
	parameter addr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	parameter harden_p = 0;
	input w_clk_i;
	input w_reset_i;
	input w_v_i;
	input [addr_width_lp - 1:0] w_addr_i;
	input [width_p - 1:0] w_data_i;
	input r_v_i;
	input [addr_width_lp - 1:0] r_addr_i;
	output wire [width_p - 1:0] r_data_o;
	bsg_mem_1r1w_synth #(
		.width_p(width_p),
		.els_p(els_p),
		.read_write_same_addr_p(read_write_same_addr_p),
		.harden_p(harden_p)
	) synth(
		.w_clk_i(w_clk_i),
		.w_reset_i(w_reset_i),
		.w_v_i(w_v_i),
		.w_addr_i(w_addr_i),
		.w_data_i(w_data_i),
		.r_v_i(r_v_i),
		.r_addr_i(r_addr_i),
		.r_data_o(r_data_o)
	);
	always @(negedge w_clk_i)
		if (w_v_i === 1'b1)
			;
endmodule
module bsg_mem_1r1w_synth (
	w_clk_i,
	w_reset_i,
	w_v_i,
	w_addr_i,
	w_data_i,
	r_v_i,
	r_addr_i,
	r_data_o
);
	parameter width_p = -1;
	parameter els_p = -1;
	parameter read_write_same_addr_p = 0;
	parameter addr_width_lp = (els_p == 1 ? 1 : $clog2(els_p));
	parameter harden_p = 0;
	input w_clk_i;
	input w_reset_i;
	input w_v_i;
	input [addr_width_lp - 1:0] w_addr_i;
	input [width_p - 1:0] w_data_i;
	input r_v_i;
	input [addr_width_lp - 1:0] r_addr_i;
	output wire [width_p - 1:0] r_data_o;
	reg [width_p - 1:0] mem [els_p - 1:0];
	wire unused0 = w_reset_i;
	wire unused1 = r_v_i;
	assign r_data_o = mem[r_addr_i];
	always @(posedge w_clk_i)
		if (w_v_i)
			mem[w_addr_i] <= w_data_i;
endmodule
module bsg_two_fifo (
	clk_i,
	reset_i,
	ready_o,
	data_i,
	v_i,
	v_o,
	data_o,
	yumi_i
);
	parameter width_p = "inv";
	parameter verbose_p = 0;
	parameter allow_enq_deq_on_full_p = 0;
	parameter ready_THEN_valid_p = allow_enq_deq_on_full_p;
	input clk_i;
	input reset_i;
	output ready_o;
	input [width_p - 1:0] data_i;
	input v_i;
	output v_o;
	output [width_p - 1:0] data_o;
	input yumi_i;
	wire deq_i = yumi_i;
	wire enq_i;
	reg head_r;
	reg tail_r;
	reg empty_r;
	reg full_r;
	bsg_mem_1r1w #(
		.width_p(width_p),
		.els_p(2),
		.read_write_same_addr_p(allow_enq_deq_on_full_p)
	) mem_1r1w(
		.w_clk_i(clk_i),
		.w_reset_i(reset_i),
		.w_v_i(enq_i),
		.w_addr_i(tail_r),
		.w_data_i(data_i),
		.r_v_i(~empty_r),
		.r_addr_i(head_r),
		.r_data_o(data_o)
	);
	assign v_o = ~empty_r;
	assign ready_o = ~full_r;
	generate
		if (ready_THEN_valid_p) assign enq_i = v_i;
		else assign enq_i = v_i & ~full_r;
	endgenerate
	always @(posedge clk_i)
		if (reset_i) begin
			tail_r <= 1'b0;
			head_r <= 1'b0;
			empty_r <= 1'b1;
			full_r <= 1'b0;
		end
		else begin
			if (enq_i)
				tail_r <= ~tail_r;
			if (deq_i)
				head_r <= ~head_r;
			empty_r <= (empty_r & ~enq_i) | ((~full_r & deq_i) & ~enq_i);
			if (allow_enq_deq_on_full_p)
				full_r <= ((~empty_r & enq_i) & ~deq_i) | (full_r & ~(deq_i ^ enq_i));
			else
				full_r <= ((~empty_r & enq_i) & ~deq_i) | (full_r & ~deq_i);
		end
	always @(posedge clk_i)
		if (~reset_i)
			if (allow_enq_deq_on_full_p)
				;
	wire [31:0] num_elements_debug = full_r + (empty_r == 0);
endmodule
