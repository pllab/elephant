`ifndef BSG_DEFINES_V
`define BSG_DEFINES_V

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
    module fn``__abstract(); if (0) begin : abstract fn not_used(); end endmodule \
    /*verilator lint_on PINMISSING*/ \
    /*verilator lint_on DECLFILENAME*/

// macro for defining invalid parameter; with the abstract module declaration
// it should be sufficient to omit the "inv" but we include this for tool portability
// if later we find that all tools are compatible, we can remove the use of this from BaseJump STL

`ifdef XCELIUM // Bare default parameters are incompatible as of 20.09.012
               // = "inv" causes type inference mismatch as of 20.09.012
`define BSG_INV_PARAM(param) param = -1
`elsif YOSYS // Bare default parameters are incompatible as of 0.9
`define BSG_INV_PARAM(param) param = 2
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

`endif
// MBT 11/9/2014
//
// 1 read-port, 1 write-port ram
//
// reads are asynchronous
//

//`include "bsg_defines.sv"

module bsg_mem_1r1w #(parameter `BSG_INV_PARAM(width_p)
                      ,parameter `BSG_INV_PARAM(els_p)
                      , parameter read_write_same_addr_p=0
                      , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                      , parameter harden_p=0
                      )
   (input   w_clk_i
    , input w_reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r_v_i
    , input [addr_width_lp-1:0]  r_addr_i

    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
    );

   bsg_mem_1r1w_synth
     #(.width_p(width_p)
       ,.els_p(els_p)
       ,.read_write_same_addr_p(read_write_same_addr_p)
       ) synth
       (.*);

`ifndef BSG_HIDE_FROM_SYNTHESIS

   initial
     begin
	if (width_p*els_p > 256)
          $display("## %L: instantiating width_p=%d, els_p=%d, read_write_same_addr_p=%d, harden_p=%d (%m)"
                   ,width_p,els_p,read_write_same_addr_p,harden_p);
     end

   always_ff @(negedge w_clk_i)
     if (w_v_i===1'b1)
       begin
         assert ((w_reset_i === 'X) || (w_reset_i === 1'b1) || (w_addr_i < els_p) || (els_p <= 1))
            else $error("Invalid address %x to %m of size %x (w_reset_i=%b, w_v_i=%b)\n", w_addr_i, els_p, w_reset_i, w_v_i);
          assert ((w_reset_i === 'X) || (w_reset_i === 1'b1) || !(r_addr_i == w_addr_i && w_v_i && r_v_i && !read_write_same_addr_p))
            else $error("%m: Attempt to read and write same address %x (w_v_i = %b, w_reset_i = %b)",w_addr_i,w_v_i,w_reset_i);
       end

`endif

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1r1w)
// MBT 7/7/2016
//
// 1 read-port, 1 write-port ram
//
// reads are synchronous
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1r1w_sync_mask_write_bit.


//`include "bsg_defines.sv"

module bsg_mem_1r1w_sync_mask_write_bit_synth #(parameter `BSG_INV_PARAM(width_p)
						, parameter `BSG_INV_PARAM(els_p)
						, parameter read_write_same_addr_p=0
						, parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                                                , parameter latch_last_read_p=0
                                                , parameter disable_collision_warning_p=1
                                        )
   (input   clk_i
    , input reset_i

    , input                     w_v_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_mask_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r_v_i
    , input [addr_width_lp-1:0]  r_addr_i

    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
    );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, w_v_i, w_mask_i, w_addr_i, r_v_i, r_addr_i};
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

   assign read_en = r_v_i;
   assign data_out = mem[r_addr_r];


   always_ff @(posedge clk_i)
     begin
        if (r_v_i)
          r_addr_r <= r_addr_i;

`ifndef BSG_HIDE_FROM_SYNTHESIS
        else
          r_addr_r <= 'X;

        // if addresses match and this is forbidden, then nuke the read address

        if (r_addr_i == w_addr_i && w_v_i && r_v_i && !read_write_same_addr_p)
          begin
             if (!disable_collision_warning_p)
               begin
                 $error("X'ing matched read address %x (%m)",r_addr_i);
               end
             r_addr_r <= 'X;
          end
`endif

     end

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

   genvar                       i;
   for (i = 0; i < width_p; i=i+1)
     begin
	always_ff @(posedge clk_i)

	  if (w_v_i && w_mask_i[i])
            mem[w_addr_i][i] <= w_data_i[i];
     end
  end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1r1w_sync_mask_write_bit_synth)
// MBT 7/7/2016
//
// 1 read-port, 1 write-port ram
//
// reads are synchronous
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1r1w_sync_mask_write_bit.


//`include "bsg_defines.sv"

module bsg_mem_1r1w_sync_mask_write_byte_synth #(parameter `BSG_INV_PARAM(width_p)
						, parameter `BSG_INV_PARAM(els_p)
						, parameter read_write_same_addr_p=0
						, parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
                                                , parameter latch_last_read_p=0
                                                , parameter write_mask_width_lp = width_p>>3
						, parameter harden_p=0
                                                , parameter disable_collision_warning_p=1
                                        )
   (input   clk_i
    , input reset_i

    , input                     w_v_i
    // for each bit set in the mask, a byte is written
    , input [`BSG_SAFE_MINUS(write_mask_width_lp, 1):0] w_mask_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r_v_i
    , input [addr_width_lp-1:0]  r_addr_i

    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
    );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, w_v_i, w_mask_i, w_addr_i, r_v_i, r_addr_i};
      assign r_data_o = '0;
    end
   else
    begin: nz

  for(genvar i=0; i<write_mask_width_lp; i=i+1)
  begin: bk
    bsg_mem_1r1w_sync #( .width_p      (8)
                        ,.els_p        (els_p)
                        ,.addr_width_lp(addr_width_lp)
                        ,.latch_last_read_p(latch_last_read_p)
			,.verbose_if_synth_p(0) // don't print out details of ram if breaks into synth srams
                      ) mem_1r1w_sync
                      ( .clk_i  (clk_i)
                       ,.reset_i(reset_i)
                       ,.w_v_i    (w_v_i & w_mask_i[i])
                       ,.w_data_i (w_data_i[(i*8)+:8])
                       ,.w_addr_i (w_addr_i)
                       ,.r_v_i    (r_v_i)
                       ,.r_addr_i (r_addr_i)
                       ,.r_data_o (r_data_o[(i*8)+:8])
                      );
  end
   end

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1r1w_sync_mask_write_byte_synth)

// MBT 7/7/2016
//
// 1 read-port, 1 write-port ram
//
// reads are synchronous
//
// although we could merge this with normal bsg_mem_1r1w
// and select with a parameter, we do not do this because
// it's typically a very big change to the instantiating code
// to move to/from sync/async, and we want to reflect this.
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1r1w_sync.

//`include "bsg_defines.sv"

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

`ifndef BSG_HIDE_FROM_SYNTHESIS
   initial
     begin
        if (verbose_p)
      $display("## %L: instantiating width_p=%d, els_p=%d (%m)",width_p,els_p);
     end
`endif

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1r1w_sync_synth)// MBT
//
// 1 read-port, 1 write-port ram
//
// reads are asynchronous
//
// for synthesizable internal version, we omit assertions
// these should be placed in the outer wrapper
//

//`include "bsg_defines.sv"

module bsg_mem_1r1w_synth #(parameter `BSG_INV_PARAM(width_p)
			    ,parameter `BSG_INV_PARAM(els_p)
			    ,parameter read_write_same_addr_p=0
			    ,parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p))
(
  input w_clk_i
  ,input w_reset_i

  ,input w_v_i
  ,input [addr_width_lp-1:0] w_addr_i
  ,input [`BSG_SAFE_MINUS(width_p, 1):0] w_data_i

  // currently unused
  ,input r_v_i
  ,input [addr_width_lp-1:0]  r_addr_i

  ,output logic [`BSG_SAFE_MINUS(width_p, 1):0] r_data_o
);

  wire unused0 = w_reset_i;
  wire unused1 = r_v_i;

  if (width_p == 0 || els_p == 0)
   begin: z
     wire unused2 = &{w_clk_i, w_addr_i, w_data_i, r_addr_i};
     assign r_data_o = '0;
   end
  else
   begin: nz

  logic [width_p-1:0] mem [els_p-1:0];

  wire [addr_width_lp-1:0] r_addr_li = (els_p > 0) ? r_addr_i:'0;
  wire [addr_width_lp-1:0] w_addr_li = (els_p > 0) ? w_addr_i:'0;

  // this implementation ignores the r_v_i
  assign r_data_o = mem[r_addr_li];

  always_ff @(posedge w_clk_i) begin
    if (w_v_i) begin
      mem[w_addr_li] <= w_data_i;
    end
  end
   end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1r1w_synth)
// MBT 11/9/2014
//
// Synchronous 1-port ram.
// Only one read or one write may be done per cycle.
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1rw_sync_mask_write_bit.
//

//`include "bsg_defines.sv"

module bsg_mem_1rw_sync_mask_write_bit_synth
  #(parameter `BSG_INV_PARAM(width_p)
    , parameter `BSG_INV_PARAM(els_p)
    , parameter latch_last_read_p=0
    , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
   )
   (input   clk_i
    , input reset_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0] data_i
    , input [addr_width_lp-1:0] addr_i
    , input v_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0] w_mask_i
    , input w_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0]  data_o
    );

   wire unused = reset_i;

   if (width_p == 0 || els_p == 0)
    begin: z
      wire unused0 = &{clk_i, data_i, addr_i, v_i, w_mask_i, w_i};
      assign data_o = '0;
    end
   else
    begin: nz

   logic [addr_width_lp-1:0] addr_r;
   logic [width_p-1:0] mem [els_p-1:0];
   logic read_en;
   
   wire [addr_width_lp-1:0] addr_li = (els_p>1) ? addr_i:'0;
   
   assign read_en = v_i & ~w_i;

   always_ff @(posedge clk_i)
     if (read_en)
       addr_r <= addr_li;
     else
       addr_r <= 'X;

   logic [width_p-1:0] data_out;

   assign data_out = mem[addr_r];

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
        ,.data_o(data_o)
      );
     end
   else
     begin: no_llr
       assign data_o = data_out;
     end



// The Verilator and non-Verilator models are functionally equivalent. However, Verilator
//   cannot handle an array of non-blocking assignments in a for loop. It would be nice to 
//   see if these two models synthesize the same, because we can then reduce to the Verilator
//   model and avoid double maintenence. One could also add this feature to Verilator...
//   (Identified in Verilator 4.011)
`ifdef VERILATOR
   logic [width_p-1:0] data_n;

   for (genvar i = 0; i < width_p; i++)
     begin : rof1
       assign data_n[i] = w_mask_i[i] ? data_i[i] : mem[addr_li][i];
     end // rof1

   always_ff @(posedge clk_i)
     if (v_i & w_i)
       mem[addr_li] <= data_n;

`else
 
// this code does not map correctly with Xilinx Ultrascale FPGAs 
// in Vivado, substitute this file with hard/ultrascale_plus/bsg_mem/bsg_mem_1rw_sync_mask_write_bit.sv
      
`BSG_VIVADO_SYNTH_FAILS
      
   always_ff @(posedge clk_i)
     if (v_i & w_i)
       for (integer i = 0; i < width_p; i=i+1)
         if (w_mask_i[i])
           mem[addr_li][i] <= data_i[i];
`endif
   end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1rw_sync_mask_write_bit_synth)
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1r1w_sync_mask_write_byte.

//`include "bsg_defines.sv"

module bsg_mem_1rw_sync_mask_write_byte_synth
  #(parameter `BSG_INV_PARAM(els_p)
    , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
    , parameter latch_last_read_p=0

    , parameter `BSG_INV_PARAM(data_width_p )
    , parameter write_mask_width_lp = data_width_p>>3
  )
  ( input clk_i
   ,input reset_i

   ,input v_i
   ,input w_i

   ,input [addr_width_lp-1:0]       addr_i
   ,input [`BSG_SAFE_MINUS(data_width_p, 1):0]        data_i
    // for each bit set in the mask, a byte is written
   ,input [`BSG_SAFE_MINUS(write_mask_width_lp, 1):0] write_mask_i

   ,output [`BSG_SAFE_MINUS(data_width_p, 1):0] data_o
  );

  genvar i;

  if (data_width_p == 0 || els_p == 0)
   begin: z
     wire unused0 = &{clk_i, reset_i, v_i, w_i, addr_i, data_i, write_mask_i};
     assign data_o = '0;
   end
  else
   begin: nz

  for(i=0; i<write_mask_width_lp; i=i+1)
  begin: bk
    bsg_mem_1rw_sync #( .width_p      (8)
                        ,.els_p        (els_p)
                        ,.addr_width_lp(addr_width_lp)
                        ,.latch_last_read_p(latch_last_read_p)
			,.verbose_if_synth_p(0) // don't print out details of ram if breaks into synth srams
                      ) mem_1rw_sync
                      ( .clk_i  (clk_i)
                       ,.reset_i(reset_i)
                       ,.data_i (data_i[(i*8)+:8])
                       ,.addr_i (addr_i)
                       ,.v_i    (v_i & (w_i ? write_mask_i[i] : 1'b1))
                       ,.w_i    (w_i & write_mask_i[i])
                       ,.data_o (data_o[(i*8)+:8])
                      );
  end
   end

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1rw_sync_mask_write_byte_synth)
// MBT 11/9/2014
//
// Synchronous 1-port ram.
// Only one read or one write may be done per cycle.
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_1rw_sync.

//`include "bsg_defines.sv"

module bsg_mem_1rw_sync_synth
  #(parameter `BSG_INV_PARAM(width_p)
    , parameter `BSG_INV_PARAM(els_p)
    , parameter latch_last_read_p=0
    , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
    , parameter verbose_p=1
   )
   (input   clk_i
	 	, input v_i
		, input reset_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0] data_i
    , input [addr_width_lp-1:0] addr_i
    , input w_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0]  data_o
    );

  wire unused = reset_i;

  if (width_p == 0 || els_p == 0)
   begin: z
     wire unused0 = &{clk_i, v_i, data_i, addr_i, w_i};
     assign data_o = '0;
   end
  else
   begin: nz

    logic [addr_width_lp-1:0] addr_r;
    logic [width_p-1:0]    mem [els_p-1:0];
    logic read_en;
    logic [width_p-1:0] data_out;

    wire [addr_width_lp-1:0] addr_li = (els_p>0) ? addr_i:'0;

    assign read_en = v_i & ~w_i;
    assign data_out = mem[addr_r];

    always_ff @ (posedge clk_i) 
      if (read_en)
        addr_r <= addr_li;
      else
        addr_r <= 'X;

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
          ,.data_o(data_o)
        );
      end
    else
      begin: no_llr
        assign data_o = data_out;
      end


    always_ff @(posedge clk_i)
      if (v_i & w_i) 
        mem[addr_li] <= data_i;
   end // non_zero_width
`ifndef BSG_HIDE_FROM_SYNTHESIS
   initial
     begin
        if (verbose_p)
	  $display("## %L: instantiating width_p=%d, els_p=%d (%m)",width_p,els_p);
     end
   

   always_ff @(negedge clk_i)
     if (v_i)
       assert ( (v_i !== 1'b1) || (reset_i === 'X) || (reset_i === 1'b1) || (addr_i < els_p) || (els_p <= 1))
         else $error("Invalid address %x to %m of size %x (reset_i = %b, v_i = %b, clk_i = %b)\n", addr_i, els_p, reset_i, v_i, clk_i);
`endif

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_1rw_sync_synth)
// MBT 7/7/2016
//
// 2 read-port, 1 write-port ram
//
// reads are synchronous
//
// although we could merge this with normal bsg_mem_1r1w
// and select with a parameter, we do not do this because
// it's typically a very big change to the instantiating code
// to move to/from sync/async, and we want to reflect this.
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_2r1w_sync.

//`include "bsg_defines.sv"

module bsg_mem_2r1w_sync_synth #(parameter `BSG_INV_PARAM(width_p)
				 , parameter `BSG_INV_PARAM(els_p)
				 , parameter read_write_same_addr_p=0
				 , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
				 )
   (input   clk_i
    , input reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r0_v_i
    , input [addr_width_lp-1:0]  r0_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r0_data_o

    , input                      r1_v_i
    , input [addr_width_lp-1:0]  r1_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r1_data_o
    );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, w_v_i, w_addr_i, w_data_i, r0_v_i, r0_addr_i, r1_v_i, r1_addr_i};
      assign r0_data_o = '0;
      assign r1_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

   // keep consistent with bsg_ip_cores/bsg_mem/bsg_mem_2r1w_sync.sv
   // keep consistent with bsg_ip_cores/hard/bsg_mem/bsg_mem_2r1w_sync.sv
   
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
   
   //the read logic, register the input
   logic [addr_width_lp-1:0]  r0_addr_r, r1_addr_r;

   always_ff @(posedge clk_i)
     if (r0_v_i)
       r0_addr_r <= r0_addr_i;
     else
       r0_addr_r <= 'X;

   always_ff @(posedge clk_i)
     if (r1_v_i)
       r1_addr_r <= r1_addr_i;
     else
       r1_addr_r <= 'X;

   assign r0_data_o = mem[ r0_addr_r ];
   assign r1_data_o = mem[ r1_addr_r ];

   //the write logic, the memory is treated as dff array
   always_ff @(posedge clk_i)
     if (w_v_i)
       mem[w_addr_i] <= w_data_i;

   end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_2r1w_sync_synth)
// MBT 4/1/2014
//
// 2 read-port, 1 write-port ram
//
// reads are asynchronous
//
// this file should not be directly instantiated by end programmers
// use bsg_mem_2r1w instead
//

//`include "bsg_defines.sv"

module bsg_mem_2r1w_synth #(parameter `BSG_INV_PARAM(width_p)
			    , parameter `BSG_INV_PARAM(els_p)
			    , parameter read_write_same_addr_p=0
			    , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
			    )
   (input   w_clk_i
    , input w_reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    , input                      r0_v_i
    , input [addr_width_lp-1:0]  r0_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r0_data_o

    , input                      r1_v_i
    , input [addr_width_lp-1:0]  r1_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r1_data_o

    );

   wire                   unused = w_reset_i;

   if (width_p == 0 || els_p == 0)
    begin: z
      wire unused0 = &{w_clk_i, w_v_i, w_addr_i, w_data_i, r0_v_i, r0_addr_i, r1_v_i, r1_addr_i};
      assign r0_data_o = '0;
      assign r1_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

   // this implementation ignores the r_v_i
   wire [addr_width_lp-1:0]  r0_addr_li = (els_p>1) ? r0_addr_i:'0;
   wire [addr_width_lp-1:0]  r1_addr_li = (els_p>1) ? r1_addr_i:'0;

   assign r1_data_o = mem[r1_addr_li];
   assign r0_data_o = mem[r0_addr_li];
   
   wire [addr_width_lp-1:0]  w_addr_li = (els_p>1) ? w_addr_i:'0;

   always_ff @(posedge w_clk_i)
     if (w_v_i)
       begin
          mem[w_addr_li] <= w_data_i;
       end
   end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_2r1w_synth)

//`include "bsg_defines.sv"

module bsg_mem_2rw_sync_mask_write_bit_synth #( parameter `BSG_INV_PARAM(width_p )
                         , parameter `BSG_INV_PARAM(els_p )
                         , parameter read_write_same_addr_p = 0
                         , parameter disable_collision_warning_p = 0
                         , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
                         , parameter harden_p = 1
                         )
  ( input                      clk_i
  , input                      reset_i

  , input [width_p-1:0]        a_data_i
  , input [width_p-1:0]        a_w_mask_i
  , input [addr_width_lp-1:0]  a_addr_i
  , input                      a_v_i
  , input                      a_w_i

  , input [width_p-1:0]        b_data_i
  , input [width_p-1:0]        b_w_mask_i
  , input [addr_width_lp-1:0]  b_addr_i
  , input                      b_v_i
  , input                      b_w_i

  , output logic [width_p-1:0] a_data_o
  , output logic [width_p-1:0] b_data_o
  );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, a_data_i, a_w_mask_i, a_addr_i, a_v_i, a_w_i};
      wire unused1 = &{clk_i, b_data_i, b_w_mask_i, b_addr_i, b_v_i, b_w_i};
      assign a_data_o = '0;
      assign b_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

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

   logic [addr_width_lp-1:0] a_addr_r, b_addr_r;

   always_ff @(posedge clk_i)
     begin
        if (a_v_i)
            a_addr_r <= a_addr_i;
        else
            a_addr_r <= 'X;
          
        if (b_v_i)
            b_addr_r <= b_addr_i;
        else
            b_addr_r <= 'X;

`ifndef BSG_HIDE_FROM_SYNTHESIS
        // if addresses match and this is forbidden, then nuke the read address

        if (a_addr_i == b_addr_i && a_v_i && b_v_i && (a_w_i || b_w_i) && !read_write_same_addr_p)
          begin
             if (!disable_collision_warning_p)
               begin
                 $error("X'ing matched read addresses %x %x (%m)",a_addr_i, b_addr_i);
               end
             a_addr_r <= 'X;
             b_addr_r <= 'X;
          end
`endif

     end

   assign a_data_o = mem[a_addr_r];
   assign b_data_o = mem[b_addr_r];


   genvar                       i;
   for (i = 0; i < width_p; i=i+1)
     begin
	always_ff @(posedge clk_i)
      begin

	  if (a_v_i & a_w_i && a_w_mask_i[i])
            mem[a_addr_i][i] <= a_data_i[i];
	  if (b_v_i & b_w_i && b_w_mask_i[i])
            mem[b_addr_i][i] <= b_data_i[i];
      end
     end
  end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_2rw_sync_mask_write_bit_synth)

//`include "bsg_defines.sv"

module bsg_mem_2rw_sync_mask_write_byte_synth #( parameter `BSG_INV_PARAM(width_p )
                         , parameter `BSG_INV_PARAM(els_p )
                         , parameter read_write_same_addr_p=0
                         , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
                         , parameter harden_p = 1
                         , parameter disable_collision_warning_p=0     
                         , parameter write_mask_width_lp=(width_p>>3)              
                         )
  ( input                      clk_i
  , input                      reset_i

  , input [width_p-1:0]        a_data_i
  , input [write_mask_width_lp-1:0] a_w_mask_i
  , input [addr_width_lp-1:0]  a_addr_i
  , input                      a_v_i
  , input                      a_w_i

  , input [width_p-1:0]        b_data_i
  , input [write_mask_width_lp-1:0] b_w_mask_i
  , input [addr_width_lp-1:0]  b_addr_i
  , input                      b_v_i
  , input                      b_w_i

  , output logic [width_p-1:0] a_data_o
  , output logic [width_p-1:0] b_data_o
  );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, a_data_i, a_w_mask_i, a_addr_i, a_v_i, a_w_i};
      wire unused1 = &{clk_i, b_data_i, b_w_mask_i, b_addr_i, b_v_i, b_w_i};
      assign a_data_o = '0;
      assign b_data_o = '0;
    end
   else
    begin: nz

  genvar i;
  for(i=0; i<write_mask_width_lp; i=i+1)
  begin: bk
    bsg_mem_2rw_sync #( .width_p      (8)
                        ,.els_p        (els_p)
                        ,.addr_width_lp(addr_width_lp)
                        ,.disable_collision_warning_p(disable_collision_warning_p)
                        ,.harden_p(harden_p)
                      ) mem_2rw_sync
                      ( .clk_i  (clk_i)
                       ,.reset_i(reset_i)
                       ,.a_data_i (a_data_i[(i*8)+:8])
                       ,.a_addr_i (a_addr_i)
                       ,.a_v_i    (a_v_i & (a_w_i ? a_w_mask_i[i] : 1'b1))
                       ,.a_w_i    (a_w_i & a_w_mask_i[i])
                       ,.a_data_o (a_data_o[(i*8)+:8])
                       ,.b_data_i (b_data_i[(i*8)+:8])
                       ,.b_addr_i (b_addr_i)
                       ,.b_v_i    (b_v_i & (b_w_i ? b_w_mask_i[i] : 1'b1))
                       ,.b_w_i    (b_w_i & b_w_mask_i[i])
                       ,.b_data_o (b_data_o[(i*8)+:8])
                      );
  end
    end

endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_2rw_sync_mask_write_byte_synth)


//`include "bsg_defines.sv"

module bsg_mem_2rw_sync_synth #( parameter `BSG_INV_PARAM(width_p )
                         , parameter `BSG_INV_PARAM(els_p )
                         , parameter read_write_same_addr_p=0
                         , parameter addr_width_lp = `BSG_SAFE_CLOG2(els_p)
                         , parameter harden_p = 1
                         , parameter disable_collision_warning_p=0                   
                         )
  ( input                      clk_i
  , input                      reset_i

  , input [width_p-1:0]        a_data_i
  , input [addr_width_lp-1:0]  a_addr_i
  , input                      a_v_i
  , input                      a_w_i

  , input [width_p-1:0]        b_data_i
  , input [addr_width_lp-1:0]  b_addr_i
  , input                      b_v_i
  , input                      b_w_i

  , output logic [width_p-1:0] a_data_o
  , output logic [width_p-1:0] b_data_o
  );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, a_data_i, a_addr_i, a_v_i, a_w_i};
      wire unused1 = &{clk_i, b_data_i, b_addr_i, b_v_i, b_w_i};
      assign a_data_o = '0;
      assign b_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

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

   logic [addr_width_lp-1:0] a_addr_r, b_addr_r;

   always_ff @(posedge clk_i)
     begin
        if (a_v_i)
            a_addr_r <= a_addr_i;
        else
            a_addr_r <= 'X;
          
        if (b_v_i)
            b_addr_r <= b_addr_i;
        else
            b_addr_r <= 'X;

`ifndef BSG_HIDE_FROM_SYNTHESIS
        // if addresses match and this is forbidden, then nuke the read address

        if (a_addr_i == b_addr_i && a_v_i && b_v_i && (a_w_i || b_w_i) && !read_write_same_addr_p)
          begin
             if (!disable_collision_warning_p)
               begin
                 $error("X'ing matched read address %x (%m)",a_addr_i);
               end
             a_addr_r <= 'X;
             b_addr_r <= 'X;
          end
`endif

     end

   assign a_data_o = mem[a_addr_r];
   assign b_data_o = mem[b_addr_r];

	always_ff @(posedge clk_i)
    begin
	  if (a_v_i & a_w_i)
            mem[a_addr_i] <= a_data_i;
	  if (b_v_i & b_w_i)
            mem[b_addr_i] <= b_data_i;
    end
  end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_2rw_sync_synth)

// MBT 7/7/2016
// DWP 11/27/2019
//
// 3 read-port, 1 write-port ram
//
// reads are synchronous
//
// although we could merge this with normal bsg_mem_1r1w
// and select with a parameter, we do not do this because
// it's typically a very big change to the instantiating code
// to move to/from sync/async, and we want to reflect this.
//
// NOTE: Users of BaseJump STL should not instantiate this module directly
// they should use bsg_mem_3r1w_sync.

//`include "bsg_defines.sv"

module bsg_mem_3r1w_sync_synth #(parameter `BSG_INV_PARAM(width_p)
				 , parameter `BSG_INV_PARAM(els_p)
				 , parameter read_write_same_addr_p=0
				 , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
				 )
   (input   clk_i
    , input reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    // currently unused
    , input                      r0_v_i
    , input [addr_width_lp-1:0]  r0_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r0_data_o

    , input                      r1_v_i
    , input [addr_width_lp-1:0]  r1_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r1_data_o

    , input                      r2_v_i
    , input [addr_width_lp-1:0]  r2_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r2_data_o
    );

   wire                   unused = reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{clk_i, w_v_i, w_addr_i, w_data_i, r0_v_i, r0_addr_i, r1_v_i, r1_addr_i, r2_v_i, r2_addr_i};
      assign r0_data_o = '0;
      assign r1_data_o = '0;
      assign r2_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

   // keep consistent with bsg_ip_cores/bsg_mem/bsg_mem_3r1w_sync.sv
   // keep consistent with bsg_ip_cores/hard/bsg_mem/bsg_mem_3r1w_sync.sv

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

   //the read logic, register the input
   logic [addr_width_lp-1:0]  r0_addr_r, r1_addr_r, r2_addr_r;

   always_ff @(posedge clk_i)
     if (r0_v_i)
       r0_addr_r <= r0_addr_i;
     else
       r0_addr_r <= 'X;

   always_ff @(posedge clk_i)
     if (r1_v_i)
       r1_addr_r <= r1_addr_i;
     else
       r1_addr_r <= 'X;

   always_ff @(posedge clk_i)
     if (r2_v_i)
       r2_addr_r <= r2_addr_i;
     else
       r2_addr_r <= 'X;

   assign r0_data_o = mem[ r0_addr_r ];
   assign r1_data_o = mem[ r1_addr_r ];
   assign r2_data_o = mem[ r2_addr_r ];

   //the write logic, the memory is treated as dff array
   always_ff @(posedge clk_i)
     if (w_v_i)
       mem[w_addr_i] <= w_data_i;

    end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_3r1w_sync_synth)
// MBT 4/1/2014
// DWP 11/27/2019
//
// 3 read-port, 1 write-port ram
//
// reads are asynchronous
//
// this file should not be directly instantiated by end programmers
// use bsg_mem_3r1w instead
//

//`include "bsg_defines.sv"

module bsg_mem_3r1w_synth #(parameter `BSG_INV_PARAM(width_p)
			    , parameter `BSG_INV_PARAM(els_p)
			    , parameter read_write_same_addr_p=0
			    , parameter addr_width_lp=`BSG_SAFE_CLOG2(els_p)
			    )
   (input   w_clk_i
    , input w_reset_i

    , input                     w_v_i
    , input [addr_width_lp-1:0] w_addr_i
    , input [`BSG_SAFE_MINUS(width_p, 1):0]       w_data_i

    , input                      r0_v_i
    , input [addr_width_lp-1:0]  r0_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r0_data_o

    , input                      r1_v_i
    , input [addr_width_lp-1:0]  r1_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r1_data_o

    , input                      r2_v_i
    , input [addr_width_lp-1:0]  r2_addr_i
    , output logic [`BSG_SAFE_MINUS(width_p, 1):0] r2_data_o
    );

   wire                   unused = w_reset_i;

   if (width_p == 0)
    begin: z
      wire unused0 = &{w_clk_i, w_v_i, w_addr_i, w_data_i, r0_v_i, r0_addr_i, r1_v_i, r1_addr_i, r2_v_i, r2_addr_i};
      assign r0_data_o = '0;
      assign r1_data_o = '0;
      assign r2_data_o = '0;
    end
   else
    begin: nz

   logic [width_p-1:0]    mem [els_p-1:0];

   // this implementation ignores the r_v_i
   assign r2_data_o = mem[r2_addr_i];
   assign r1_data_o = mem[r1_addr_i];
   assign r0_data_o = mem[r0_addr_i];

   wire                   unused = w_reset_i;

   always_ff @(posedge w_clk_i)
     if (w_v_i)
       begin
          mem[w_addr_i] <= w_data_i;
       end
    end
endmodule

//`BSG_ABSTRACT_MODULE(bsg_mem_3r1w_synth)


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

