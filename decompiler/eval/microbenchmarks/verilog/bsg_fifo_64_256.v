
`define BSG_MAX(x,y) (((x)>(y)) ? (x) : (y))
`define BSG_MIN(x,y) (((x)<(y)) ? (x) : (y))

`define BSG_SIGN_EXTEND(sig, width) \
  ({{`BSG_MAX(width-$bits(sig),0){sig[$bits(sig)-1]}}, sig[0+:`BSG_MIN(width, $bits(sig))]})
`define BSG_ZERO_EXTEND(sig, width) \
  ({{`BSG_MAX(width-$bits(sig),0){1'b0}}, sig[0+:`BSG_MIN(width, $bits(sig))]})

// place this macro at the end of a verilog module file if that module has invalid parameters
// that must be specified by the user. this will prevent that module from becoming a top-level
// module per the discussion here: https://github.com/SymbiFlow/sv-tests/issues/1160 and the
// SystemVerilog Standard

//    "Top-level modules are modules that are included in the SystemVerilog
//    source text, but do not appear in any module instantiation statement, as
//    described in 23.3.2. This applies even if the module instantiation appears
//    in a generate block that is not itself instantiated (see 27.3). A design
//    shall contain at least one top-level module. A top-level module is
//    implicitly instantiated once, and its instance name is the same as the
//    module name. Such an instance is called a top-level instance."
//  

`define BSG_ABSTRACT_MODULE(fn) \
    /*verilator lint_off DECLFILENAME*/ \
    /*verilator lint_off PINMISSING*/ \
    module fn``__abstract(); if (0) fn not_used(); endmodule \
    /*verilator lint_on PINMISSING*/ \
    /*verilator lint_on DECLFILENAME*/

// macro for defining invalid parameter; with the abstract module declaration
// it should be sufficient to omit the "inv" but we include this for tool portability
// if later we find that all tools are compatible, we can remove the use of this from BaseJump STL

`ifdef XCELIUM // Bare default parameters are incompatible as of 20.09.012
               // = "inv" causes type inference mismatch as of 20.09.012
`define BSG_INV_PARAM(param) param = -1
`elsif YOSYS // Bare default parameters are incompatible as of 0.9
`define BSG_INV_PARAM(param) param = "inv"
`else // VIVADO, DC, VERILATOR, GENUS, SURELOG
`define BSG_INV_PARAM(param) param
`endif


// maps 1 --> 1 instead of to 0
`define BSG_SAFE_CLOG2(x) ( (((x)==1) || ((x)==0))? 1 : $clog2((x)))
`define BSG_IS_POW2(x) ( (1 << $clog2(x)) == (x))
`define BSG_WIDTH(x) ($clog2(x+1))
`define BSG_SAFE_MINUS(x, y) (((x)<(y))) ? 0 : ((x)-(y))

// calculate ceil(x/y) 
`define BSG_CDIV(x,y) (((x)+(y)-1)/(y))

`ifdef SYNTHESIS
`define BSG_UNDEFINED_IN_SIM(val) (val)
`else
`define BSG_UNDEFINED_IN_SIM(val) ('X)
`endif

`ifdef VERILATOR
`define BSG_HIDE_FROM_VERILATOR(val)
`else
`define BSG_HIDE_FROM_VERILATOR(val) val
`endif

`ifdef SYNTHESIS
`define BSG_DISCONNECTED_IN_SIM(val) (val)
`elsif VERILATOR
`define BSG_DISCONNECTED_IN_SIM(val) (val)
`else
`define BSG_DISCONNECTED_IN_SIM(val) ('z)
`endif

// Ufortunately per the Xilinx forums, Xilinx does not define
// any variable that indicates that Vivado Synthesis is running
// so as a result we identify Vivado merely as the exclusion of
// Synopsys Design Compiler (DC). Support beyond DC and Vivado
// will require modification of this macro.

`ifdef SYNTHESIS
  `ifdef DC
  `define BSG_VIVADO_SYNTH_FAILS
  `elsif CDS_TOOL_DEFINE
  `define BSG_VIVADO_SYNTH_FAILS
  `elsif SURELOG
  `define BSG_VIVADO_SYNTH_FAILS
  `elsif YOSYS
  `define BSG_VIVADO_SYNTH_FAILS
  `else
  `define BSG_VIVADO_SYNTH_FAILS this_module_is_not_synthesizeable_in_vivado
  `endif
`else
`define BSG_VIVADO_SYNTH_FAILS
`endif

// macro for denoting that a code snippet is unsynthesiable

`ifdef SYNTHESIS
  `define BSG_HIDE_FROM_SYNTHESIS
`endif

`define BSG_STRINGIFY(x) `"x`"


// For the modules that must be hardened, add this macro at the top.
`ifdef SYNTHESIS
`define BSG_SYNTH_MUST_HARDEN this_module_must_be_hardened
`else
`define BSG_SYNTH_MUST_HARDEN
`endif


// using C-style shifts instead of a[i] allows the parameter of BSG_GET_BIT to be a parameter subrange                                                                                                                                                                               
// e.g., parameter[4:1][1], which DC 2016.12 does not allow                                                                                                                                                                                                                          

`define BSG_GET_BIT(X,NUM) (((X)>>(NUM))&1'b1)

// This version of countones works in synthesis, but only up to 64 bits                                                                                                                                                                                                              
// we do a funny thing where we propagate X's in simulation if it is more than 64 bits                                                                                                                                                                                               
// and in synthesis, go ahead and ignore the high bits                                                                                                                                                                      

`define BSG_COUNTONES_SYNTH(y) (($bits(y) < 65) ? 1'b0 : `BSG_UNDEFINED_IN_SIM(1'b0)) + (`BSG_GET_BIT(y,0) +`BSG_GET_BIT(y,1) +`BSG_GET_BIT(y,2) +`BSG_GET_BIT(y,3) +`BSG_GET_BIT(y,4) +`BSG_GET_BIT(y,5) +`BSG_GET_BIT(y,6)+`BSG_GET_BIT(y,7) +`BSG_GET_BIT(y,8)+`BSG_GET_BIT(y,9) \
                                                                                       +`BSG_GET_BIT(y,10)+`BSG_GET_BIT(y,11)+`BSG_GET_BIT(y,12)+`BSG_GET_BIT(y,13)+`BSG_GET_BIT(y,14)+`BSG_GET_BIT(y,15)+`BSG_GET_BIT(y,16)+`BSG_GET_BIT(y,17)+`BSG_GET_BIT(y,18)+`BSG_GET_BIT(y,19) \
                                                                                       +`BSG_GET_BIT(y,20)+`BSG_GET_BIT(y,21)+`BSG_GET_BIT(y,22)+`BSG_GET_BIT(y,23)+`BSG_GET_BIT(y,24)+`BSG_GET_BIT(y,25)+`BSG_GET_BIT(y,26)+`BSG_GET_BIT(y,27)+`BSG_GET_BIT(y,28)+`BSG_GET_BIT(y,29) \
                                                                                       +`BSG_GET_BIT(y,30)+`BSG_GET_BIT(y,31)+`BSG_GET_BIT(y,32)+`BSG_GET_BIT(y,33)+`BSG_GET_BIT(y,34)+`BSG_GET_BIT(y,35)+`BSG_GET_BIT(y,36)+`BSG_GET_BIT(y,37)+`BSG_GET_BIT(y,38)+`BSG_GET_BIT(y,39) \
                                                                                       +`BSG_GET_BIT(y,40)+`BSG_GET_BIT(y,41)+`BSG_GET_BIT(y,42)+`BSG_GET_BIT(y,43)+`BSG_GET_BIT(y,44)+`BSG_GET_BIT(y,45)+`BSG_GET_BIT(y,46)+`BSG_GET_BIT(y,47)+`BSG_GET_BIT(y,48)+`BSG_GET_BIT(y,49) \
                                                                                       +`BSG_GET_BIT(y,50)+`BSG_GET_BIT(y,51)+`BSG_GET_BIT(y,52)+`BSG_GET_BIT(y,53)+`BSG_GET_BIT(y,54)+`BSG_GET_BIT(y,55)+`BSG_GET_BIT(y,56)+`BSG_GET_BIT(y,57)+`BSG_GET_BIT(y,58)+`BSG_GET_BIT(y,59) \
                                                                                       +`BSG_GET_BIT(y,60)+`BSG_GET_BIT(y,61)+`BSG_GET_BIT(y,62)+`BSG_GET_BIT(y,63))

// nullify rpgroups
`ifndef rpgroup
`define rpgroup(x)
`endif

// verilog preprocessing -> if defined(A) && defined(B) then define C
`define BSG_DEFIF_A_AND_B(A,B,C) \
    `undef C \
    `ifdef A \
        `ifdef B \
            `define C \
        `endif \
    `endif

// verilog preprocessing -> if defined(A) && !defined(B) then define C
`define BSG_DEFIF_A_AND_NOT_B(A,B,C) \
    `undef C \
    `ifdef A \
        `ifndef B \
            `define C \
        `endif \
    `endif

// verilog preprocessing -> if !defined(A) && defined(B) then define C
`define BSG_DEFIF_NOT_A_AND_B(A,B,C) `BSG_DEFIF_A_AND_NOT_B(B,A,C)

// verilog preprocessing -> if !defined(A) && !defined(B) then define C
`define BSG_DEFIF_NOT_A_AND_NOT_B(A,B,C) \
    `undef C \
    `ifndef A \
        `ifndef B \
            `define C \
        `endif \
    `endif

// verilog preprocessing -> if defined(A) || defined(B) then define C
`define BSG_DEFIF_A_OR_B(A,B,C) \
    `undef C \
    `ifdef A \
        `define C \
    `endif \
    `ifdef B \
        `define C \
    `endif

// verilog preprocessing -> if defined(A) || !defined(B) then define C
`define BSG_DEFIF_A_OR_NOT_B(A,B,C) \
    `undef C \
    `ifdef A \
        `define C \
    `endif \
    `ifndef B \
        `define C \
    `endif

// verilog preprocessing -> if !defined(A) || defined(B) then define C
`define BSG_DEFIF_NOT_A_OR_B(A,B,C) `BSG_DEFIF_A_OR_NOT_B(B,A,C)

// verilog preprocessing -> if !defined(A) || !defined(B) then define C
`define BSG_DEFIF_NOT_A_OR_NOT_B(A,B,C) \
    `undef C \
    `ifndef A \
        `define C \
    `endif \
    `ifndef B \
        `define C \
    `endif

`define WIDTH 64
`define WIDTH_OUT 64
`define ELS 256
module top
 (input clk_i
  , input reset_i
  , input [`WIDTH-1:0] data_i
  , input v_i
  , output ready_param_o

  , output [`WIDTH_OUT-1:0] data_o
  , output v_o
  , input yumi_i
  );

  bsg_fifo_1r1w_narrowed
   #(.width_p(`WIDTH), .els_p(`ELS), .width_out_p(`WIDTH_OUT))
   dut
    (.*);

endmodule

module bsg_dff_en #(parameter `BSG_INV_PARAM(width_p)
                   ,parameter harden_p=1   // mbt fixme: maybe this should not be a default
                   ,parameter strength_p=1)
(
  input clk_i
  ,input [width_p-1:0] data_i
  ,input en_i
  ,output logic [width_p-1:0] data_o
);

  logic [width_p-1:0] data_r;

  assign data_o = data_r;

  always_ff @ (posedge clk_i) begin
    if (en_i) begin
      data_r <= data_i;
    end
  end

endmodule

module bsg_dff_en_bypass
  #(parameter `BSG_INV_PARAM(width_p)
    , parameter harden_p=0
    , parameter strength_p=0
  )
  (
    input clk_i
    , input en_i
    , input [width_p-1:0] data_i
    , output logic [width_p-1:0] data_o
  );

  logic [width_p-1:0] data_r;

  bsg_dff_en #(
    .width_p(width_p)
    ,.harden_p(harden_p)
    ,.strength_p(strength_p)
  ) dff (
    .clk_i(clk_i)
    ,.en_i(en_i)
    ,.data_i(data_i)
    ,.data_o(data_r)
  );

  assign data_o = en_i
    ? data_i
    : data_r;



endmodule


module bsg_mem_1r1w_sync_synth #(parameter `BSG_INV_PARAM(width_p)
                 , parameter `BSG_INV_PARAM(els_p)
                 , parameter read_write_same_addr_p=0
                 , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                                 , parameter latch_last_read_p=0
                 , parameter verbose_p=1
                 )
   (input   clk_i
    , input reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r_v_i
    , input [addr_width_lp-1:0]  r_addr_i

    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
    );

   wire                   unused = reset_i;

   if (width_p == 0 || els_p == 0)
    begin: z
      wire unused0 = &{clk_i, w_v_i, w_addr_i, r_v_i, r_addr_i};
      assign r_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];
   logic read_en;
   logic [width_p-1:0] data_out;

   // this treats the ram as an array of registers for which the
   // read addr is latched on the clock, the write
   // is done on the clock edge, and actually multiplexing
   // of the registers for reading is done after the clock edge.

   // logically, this means that reads happen in time after
   // the writes, and "simultaneous" reads and writes to the
   // register file are allowed -- IF read_write_same_addr is set.

   // note that this behavior is generally incompatible with
   // hardened 1r1w rams, so it's better not to take advantage
   // of it if not necessary

   // we explicitly 'X out the read address if valid is not set
   // to avoid accidental use of data when the valid signal was not
   // asserted. without this, the output of the register file would
   // "auto-update" based on new writes to the ram, a spooky behavior
   // that would never correspond to that of a hardened ram.

   logic [addr_width_lp-1:0] r_addr_r;
   wire [addr_width_lp-1:0] r_addr_li = (els_p > 1) ? r_addr_i:'0;
   wire [addr_width_lp-1:0] w_addr_li = (els_p > 1) ? w_addr_i:'0;

   assign read_en = r_v_i;
   assign data_out = mem[r_addr_r];

   always_ff @(posedge clk_i)
     if (r_v_i)
       r_addr_r <= r_addr_li;
     else
       r_addr_r <= 'X;

  if (latch_last_read_p)
    begin: llr
      logic read_en_r; 

      bsg_dff #(
        .width_p(1)
      ) read_en_dff (
        .clk_i(clk_i)
        ,.data_i(read_en)
        ,.data_o(read_en_r)
      );

      bsg_dff_en_bypass #(
        .width_p(width_p)
      ) dff_bypass (
        .clk_i(clk_i)
        ,.en_i(read_en_r)
        ,.data_i(data_out)
        ,.data_o(r_data_o)
      );
    end
  else
    begin: no_llr
      assign r_data_o = data_out;
    end

   always_ff @(posedge clk_i)
     if (w_v_i)
       mem[w_addr_li] <= w_data_i;

   end

endmodule

module bsg_circular_ptr #(parameter `BSG_INV_PARAM(slots_p)
                          , parameter `BSG_INV_PARAM(max_add_p)
                          // local param
                          , parameter ptr_width_lp = `BSG_SAFE_CLOG2(slots_p)
              )
   (input clk
    , input reset_i
    , input  [$clog2(max_add_p+1)-1:0] add_i
    , output [ptr_width_lp-1:0] o
    , output [ptr_width_lp-1:0] n_o
    );

   logic [ptr_width_lp-1:0] ptr_r, ptr_n, ptr_nowrap;
   logic [ptr_width_lp:0]   ptr_wrap;

   assign o = ptr_r;
   assign n_o = ptr_n;

   // increment round robin pointers

   // synopsys sync_set_reset "reset_i"
   always_ff @(posedge clk)
     if (reset_i) ptr_r <= 0;
     else       ptr_r <= ptr_n;

   if (slots_p == 1)
     begin
    assign ptr_n = 1'b0;
    wire ignore = |add_i;
     end
   else
   
     // fixme performance optimization:
     // we should handle add-by-1 and non-power-of-two
     // in the same way as power-of-two and add-by-1
     // with a compare of ptr_r to slots_p-1 to check for
     // zeroing the ptr_r_p1 value.
     
    if (`BSG_IS_POW2(slots_p))
       begin
      // reduce critical path on add_i signal
      if (max_add_p == 1)
        begin
           wire [ptr_width_lp-1:0] ptr_r_p1 = ptr_r + 1'b1;
           assign  ptr_n = add_i ? ptr_r_p1 : ptr_r;
        end
      else
        assign  ptr_n = ptr_width_lp ' (ptr_r + add_i);
       end
     else
       begin: notpow2
          // compute wrapped and non-wrap cases
          // in parallel
          assign ptr_wrap = (ptr_width_lp+1)'({ 1'b0, ptr_r } - slots_p + add_i);
          assign ptr_nowrap = ptr_r + add_i;

          // if (ptr_r + add_i - slots_p >= 0)
          // then we have wrapped around
          assign ptr_n = ~ptr_wrap[ptr_width_lp] ? ptr_wrap[0+:ptr_width_lp] : ptr_nowrap;

`ifndef BSG_HIDE_FROM_SYNTHESIS
          always_comb
            begin
              assert final( (ptr_n < slots_p) || (|ptr_n === 'X) || reset_i || (add_i > slots_p))
                else $error("bsg_circular_ptr counter overflow (ptr_r=%b/add_i=%b/ptr_wrap=%b/ptr_n=%b)",ptr_r,add_i,ptr_wrap,ptr_n, slots_p);
            end
`endif
end
endmodule // bsg_circular_ptr

module bsg_fifo_tracker #(parameter `BSG_INV_PARAM(els_p           )
                          , ptr_width_lp = `BSG_SAFE_CLOG2(els_p)
                          )
   (input   clk_i
    , input reset_i

    , input enq_i
    , input deq_i

    , output [ptr_width_lp-1:0] wptr_r_o
    , output [ptr_width_lp-1:0] rptr_r_o
    , output [ptr_width_lp-1:0] rptr_n_o

    , output full_o
    , output empty_o
    );

   // one read pointer, one write pointer;
   logic [ptr_width_lp-1:0] rptr_r, rptr_n, wptr_r;

   assign wptr_r_o = wptr_r;
   assign rptr_r_o = rptr_r;
   assign rptr_n_o = rptr_n;

   // Used to latch last operation, to determine fifo full or empty
   logic                    enq_r, deq_r;

   // internal signals
   logic                    empty, full, equal_ptrs;

   bsg_circular_ptr #(.slots_p   (els_p)
                      ,.max_add_p(1    )
                      ) rptr
     ( .clk      (clk_i  )
       , .reset_i(reset_i)
       , .add_i  (deq_i )
       , .o      (rptr_r )
       , .n_o    (rptr_n)
       );

   bsg_circular_ptr #(.slots_p   (els_p)
                      ,.max_add_p(1    )
                      ) wptr
     ( .clk      (clk_i  )
       , .reset_i(reset_i)
       , .add_i  (enq_i  )
       , .o      (wptr_r )
       , .n_o    ()
       );

   // registering last operation
   // for reset, last op is deque, so
   // equal w and r pointers signal empty FIFO

   // synopsys sync_set_reset "reset_i"
   always_ff @(posedge clk_i)
     if (reset_i)
       begin
          enq_r <= 1'b0;
          deq_r <= 1'b1;
       end
     else
       begin
          // update "last operation" when
          // either enque or dequing
          if (enq_i | deq_i)
            begin
               enq_r <= enq_i;
               deq_r <= deq_i;
            end
       end // else: !if(reset_i)

   // if read and write pointers are equal
   // empty or fullness is determined by whether
   // the last request was a deque or enque.

   // no need to check both enque and deque for each of the
   // empty and full signals, since during full or empty state one
   // of the enque or deque cannot be asserted (no enque when it is
   // not ready and no yumi when no data is valid to be sent out)
   // Moreover, other than full or empty state only one of deque or
   // enque signals would not make the counters equal

   assign equal_ptrs = (rptr_r == wptr_r);
   assign empty      = equal_ptrs & deq_r;
   assign full       = equal_ptrs & enq_r;
   
   assign full_o = full;
   assign empty_o = empty;

endmodule // bsg_fifo_tracker



module bsg_fifo_1r1w_small_hardened #(parameter `BSG_INV_PARAM(width_p)
                            , parameter `BSG_INV_PARAM(els_p)
                            , parameter ready_THEN_valid_p = 0
                            )
    ( input                clk_i
    , input                reset_i

    , input                v_i
    , output               ready_param_o
    , input [width_p-1:0]  data_i

    , output               v_o
    , output [width_p-1:0] data_o
    , input                yumi_i
    );

   wire deque = yumi_i;
   wire v_o_tmp;

   assign v_o = v_o_tmp;

   // vivado bug prohibits declaring wire inside of generate block
   wire enque;
   logic ready_param_lo;

   if (ready_THEN_valid_p)
     begin: rtv
        assign enque = v_i;
     end
   else
     begin: rav
        assign enque = v_i & ready_param_lo;
     end

   localparam ptr_width_lp = `BSG_SAFE_CLOG2(els_p);

   // one read pointer, one write pointer;
   logic [ptr_width_lp-1:0] rptr_r, wptr_r;
   logic                    full, empty;
   // rptr_n is one cycle earlier than rptr_r
   logic [ptr_width_lp-1:0] rptr_n;
   // avoid reading and writing same address in mem_1r1w_sync
   logic [width_p-1:0] data_o_mem, data_o_reg;
   logic read_write_same_addr_r, read_write_same_addr_n;
  
   bsg_fifo_tracker #(.els_p(els_p)
                          ) fts
     (.clk_i
      ,.reset_i
      ,.enq_i    (enque)
      ,.deq_i    (deque)
      ,.wptr_r_o (wptr_r)
      ,.rptr_r_o (rptr_r)
      ,.rptr_n_o (rptr_n)
      ,.full_o   (full)
      ,.empty_o  (empty)
      );

   // sync read
   // Prioritize write when reading/writing same address
   bsg_mem_1r1w_sync_synth #(.width_p (width_p)
                      ,.els_p   (els_p  )
                      // MBT: this should be zero
                      ,.read_write_same_addr_p(0)
                      ) mem_1r1w_sync
     (.clk_i
      ,.reset_i
      ,.w_v_i    (enque     )
      ,.w_addr_i (wptr_r    )
      ,.w_data_i (data_i    )
      ,.r_v_i    (~read_write_same_addr_n)
      ,.r_addr_i (rptr_n    )
      ,.r_data_o (data_o_mem)
      );
      
   // w_data bypass register, enable when read_write_same_addr happens
   bsg_dff_en #(.width_p(width_p)) bypass_reg
     (.clk_i
      ,.data_i(data_i)
      ,.en_i  (read_write_same_addr_n)
      ,.data_o(data_o_reg)
      );
   
   // Read from bypass register when read_write_same_addr happens in previous cycle
   assign data_o = (read_write_same_addr_r)? data_o_reg : data_o_mem;
   always_ff @(posedge clk_i)
     read_write_same_addr_r <= read_write_same_addr_n;
   
   // When enque==1 and read/write address are same, stop reading
   // A copy of data is written into bypass register in same cycle
   assign read_write_same_addr_n = enque & (wptr_r == rptr_n);

   // during reset, we keep ready low
   // even though fifo is empty

   //assign ready_param_lo = ~full & ~reset_i;
   assign ready_param_lo = ~full;
   assign ready_param_o = ready_param_lo;
   assign v_o_tmp = ~empty;

`ifndef BSG_HIDE_FROM_SYNTHESIS
   always_ff @ (negedge clk_i)
     begin
        if (ready_THEN_valid_p & full  & v_i    & ~reset_i)
          $display("%m error: enque full fifo at time %t", $time);
        if (empty & yumi_i & ~reset_i)
          $display("%m error: deque empty fifo at time %t", $time);
     end
`endif

endmodule

module bsg_fifo_1r1w_narrowed 
                   #( parameter `BSG_INV_PARAM(width_p            )
                    , parameter `BSG_INV_PARAM(els_p              )
                    , parameter `BSG_INV_PARAM(width_out_p        )

                    , parameter lsb_to_msb_p       = 1
                    , parameter ready_THEN_valid_p = 0
                    )
                    ( input                    clk_i
                    , input                    reset_i
                
                    , input [width_p-1:0]      data_i
                    , input                    v_i
                    , output                   ready_param_o
                
                    , output                   v_o
                    , output [width_out_p-1:0] data_o
                    , input                    yumi_i
                
                    );

  // Internal signals
  logic [width_p-1:0] data;
  logic               yumi;


  // FIFO of els_p elements of width width_p
  bsg_fifo_1r1w_small_hardened #(.width_p(width_p)
                       ,.els_p(els_p) 
                       ,.ready_THEN_valid_p(ready_THEN_valid_p)
                       ) main_fifo
    
    ( .clk_i(clk_i)
    , .reset_i(reset_i)

    , .data_i(data_i)
    , .v_i(v_i)
    , .ready_param_o(ready_param_o)

    , .v_o(v_o)
    , .data_o(data)
    , .yumi_i(yumi)
    );


  // selecting from two FIFO outputs and sending one out at a time
  bsg_channel_narrow #( .width_in_p(width_p)
                      , .width_out_p(width_out_p)
                      , .lsb_to_msb_p(lsb_to_msb_p)
                      ) output_narrower
       ( .clk_i(clk_i)
       , .reset_i(reset_i)
  
       , .data_i(data)
       , .deque_o(yumi)
  
       , .data_o(data_o)
       , .deque_i(yumi_i)
       
       );
  
endmodule

module bsg_channel_narrow #( parameter `BSG_INV_PARAM(width_in_p   )
                           , parameter `BSG_INV_PARAM(width_out_p  )
                           , parameter lsb_to_msb_p = 1
                           )
            ( input                          clk_i
            , input                          reset_i

            , input  [width_in_p-1:0]        data_i
            , output logic                   deque_o

            , output logic [width_out_p-1:0] data_o
            , input                          deque_i

            );

  // Calculating parameters
  localparam divisions_lp =  (width_in_p % width_out_p == 0)
                          ?  width_in_p / width_out_p
                          : (width_in_p / width_out_p) + 1;

  localparam padding_p    = width_in_p % width_out_p;

`ifndef BSG_HIDE_FROM_SYNTHESIS
   initial
    assert (width_in_p % width_out_p == 0)
      else $display ("zero is padded to the left (in=%d) vs (out=%d)", width_in_p, width_out_p);
`endif

  logic [width_out_p - 1: 0] data [divisions_lp - 1: 0];
  // in case of 2 divisions, it would be only 1 bit counter
  logic [`BSG_SAFE_CLOG2(divisions_lp) - 1: 0] count_r, count_n;
  genvar i;

  // generating ranges for data, and padding if required
  generate
    // in case of input being smaller than or equal to output
    // there would be only one data which may require padding
    if (divisions_lp == 1) begin: gen_blk_0
      assign data[0] = {{padding_p{1'b0}},data_i};

    // Range selection based on lsb_to_msb_p and if required, padding
    end else if (lsb_to_msb_p) begin: gen_blk_0
      for (i = 0; i < divisions_lp - 1; i = i + 1) begin: gen_block
        assign data[i] = data_i[width_out_p * i + width_out_p - 1:
                                width_out_p * i];
      end
      assign data[divisions_lp - 1] =
          {{padding_p {1'b0}},
          data_i[width_in_p - 1: width_out_p * (divisions_lp - 1)]};

    end else begin: gen_blk_0

      for (i = 0; i < divisions_lp - 1; i = i + 1) begin: gen_block
        assign data[divisions_lp-1-i] =
                         data_i[width_out_p * i + width_out_p - 1:
                                width_out_p * i];
      end
      assign data[0] =
          {{padding_p {1'b0}},
          data_i[width_in_p - 1: width_out_p * (divisions_lp - 1)]};
    end
  endgenerate

  if (divisions_lp != 1) begin: gen_blk_1
    // counter for selecting which part to send
    always_comb begin
      count_n = count_r + deque_i;
      if (count_n == divisions_lp)
        count_n = 0;
    end

    always_ff @(posedge clk_i)
      if (reset_i)
        count_r <= 0;
      else
        count_r <= count_n;

    // multiplexer for output data
    assign data_o = data[count_r];

    // After all data is read, same cycle as last deque the output
    // deque is asserted
    // count_n cannot be used since it could be at 0 and no deque_i
    assign deque_o = deque_i & (count_r == $unsigned(divisions_lp - 1));

  // in case of input being smaller than or equal to output,
  // this module would be just forwarding the signals
  end else begin: gen_blk_1
    assign data_o  = data[0];
    assign deque_o = deque_i;
  end

endmodule


