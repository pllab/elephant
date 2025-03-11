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

`endif
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



module bsg_mem_1r1w_synth_114_00000004_0
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

  input [1:0] w_addr_i;
  input [113:0] w_data_i;
  input [1:0] r_addr_i;
  output [113:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [113:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24;
  wire [455:0] \nz.mem ;
  reg \nz.mem_455_sv2v_reg ,\nz.mem_454_sv2v_reg ,\nz.mem_453_sv2v_reg ,
  \nz.mem_452_sv2v_reg ,\nz.mem_451_sv2v_reg ,\nz.mem_450_sv2v_reg ,\nz.mem_449_sv2v_reg ,
  \nz.mem_448_sv2v_reg ,\nz.mem_447_sv2v_reg ,\nz.mem_446_sv2v_reg ,
  \nz.mem_445_sv2v_reg ,\nz.mem_444_sv2v_reg ,\nz.mem_443_sv2v_reg ,\nz.mem_442_sv2v_reg ,
  \nz.mem_441_sv2v_reg ,\nz.mem_440_sv2v_reg ,\nz.mem_439_sv2v_reg ,\nz.mem_438_sv2v_reg ,
  \nz.mem_437_sv2v_reg ,\nz.mem_436_sv2v_reg ,\nz.mem_435_sv2v_reg ,
  \nz.mem_434_sv2v_reg ,\nz.mem_433_sv2v_reg ,\nz.mem_432_sv2v_reg ,\nz.mem_431_sv2v_reg ,
  \nz.mem_430_sv2v_reg ,\nz.mem_429_sv2v_reg ,\nz.mem_428_sv2v_reg ,\nz.mem_427_sv2v_reg ,
  \nz.mem_426_sv2v_reg ,\nz.mem_425_sv2v_reg ,\nz.mem_424_sv2v_reg ,
  \nz.mem_423_sv2v_reg ,\nz.mem_422_sv2v_reg ,\nz.mem_421_sv2v_reg ,\nz.mem_420_sv2v_reg ,
  \nz.mem_419_sv2v_reg ,\nz.mem_418_sv2v_reg ,\nz.mem_417_sv2v_reg ,\nz.mem_416_sv2v_reg ,
  \nz.mem_415_sv2v_reg ,\nz.mem_414_sv2v_reg ,\nz.mem_413_sv2v_reg ,
  \nz.mem_412_sv2v_reg ,\nz.mem_411_sv2v_reg ,\nz.mem_410_sv2v_reg ,\nz.mem_409_sv2v_reg ,
  \nz.mem_408_sv2v_reg ,\nz.mem_407_sv2v_reg ,\nz.mem_406_sv2v_reg ,
  \nz.mem_405_sv2v_reg ,\nz.mem_404_sv2v_reg ,\nz.mem_403_sv2v_reg ,\nz.mem_402_sv2v_reg ,
  \nz.mem_401_sv2v_reg ,\nz.mem_400_sv2v_reg ,\nz.mem_399_sv2v_reg ,\nz.mem_398_sv2v_reg ,
  \nz.mem_397_sv2v_reg ,\nz.mem_396_sv2v_reg ,\nz.mem_395_sv2v_reg ,
  \nz.mem_394_sv2v_reg ,\nz.mem_393_sv2v_reg ,\nz.mem_392_sv2v_reg ,\nz.mem_391_sv2v_reg ,
  \nz.mem_390_sv2v_reg ,\nz.mem_389_sv2v_reg ,\nz.mem_388_sv2v_reg ,\nz.mem_387_sv2v_reg ,
  \nz.mem_386_sv2v_reg ,\nz.mem_385_sv2v_reg ,\nz.mem_384_sv2v_reg ,
  \nz.mem_383_sv2v_reg ,\nz.mem_382_sv2v_reg ,\nz.mem_381_sv2v_reg ,\nz.mem_380_sv2v_reg ,
  \nz.mem_379_sv2v_reg ,\nz.mem_378_sv2v_reg ,\nz.mem_377_sv2v_reg ,\nz.mem_376_sv2v_reg ,
  \nz.mem_375_sv2v_reg ,\nz.mem_374_sv2v_reg ,\nz.mem_373_sv2v_reg ,
  \nz.mem_372_sv2v_reg ,\nz.mem_371_sv2v_reg ,\nz.mem_370_sv2v_reg ,\nz.mem_369_sv2v_reg ,
  \nz.mem_368_sv2v_reg ,\nz.mem_367_sv2v_reg ,\nz.mem_366_sv2v_reg ,
  \nz.mem_365_sv2v_reg ,\nz.mem_364_sv2v_reg ,\nz.mem_363_sv2v_reg ,\nz.mem_362_sv2v_reg ,
  \nz.mem_361_sv2v_reg ,\nz.mem_360_sv2v_reg ,\nz.mem_359_sv2v_reg ,\nz.mem_358_sv2v_reg ,
  \nz.mem_357_sv2v_reg ,\nz.mem_356_sv2v_reg ,\nz.mem_355_sv2v_reg ,
  \nz.mem_354_sv2v_reg ,\nz.mem_353_sv2v_reg ,\nz.mem_352_sv2v_reg ,\nz.mem_351_sv2v_reg ,
  \nz.mem_350_sv2v_reg ,\nz.mem_349_sv2v_reg ,\nz.mem_348_sv2v_reg ,\nz.mem_347_sv2v_reg ,
  \nz.mem_346_sv2v_reg ,\nz.mem_345_sv2v_reg ,\nz.mem_344_sv2v_reg ,
  \nz.mem_343_sv2v_reg ,\nz.mem_342_sv2v_reg ,\nz.mem_341_sv2v_reg ,\nz.mem_340_sv2v_reg ,
  \nz.mem_339_sv2v_reg ,\nz.mem_338_sv2v_reg ,\nz.mem_337_sv2v_reg ,\nz.mem_336_sv2v_reg ,
  \nz.mem_335_sv2v_reg ,\nz.mem_334_sv2v_reg ,\nz.mem_333_sv2v_reg ,
  \nz.mem_332_sv2v_reg ,\nz.mem_331_sv2v_reg ,\nz.mem_330_sv2v_reg ,\nz.mem_329_sv2v_reg ,
  \nz.mem_328_sv2v_reg ,\nz.mem_327_sv2v_reg ,\nz.mem_326_sv2v_reg ,
  \nz.mem_325_sv2v_reg ,\nz.mem_324_sv2v_reg ,\nz.mem_323_sv2v_reg ,\nz.mem_322_sv2v_reg ,
  \nz.mem_321_sv2v_reg ,\nz.mem_320_sv2v_reg ,\nz.mem_319_sv2v_reg ,\nz.mem_318_sv2v_reg ,
  \nz.mem_317_sv2v_reg ,\nz.mem_316_sv2v_reg ,\nz.mem_315_sv2v_reg ,
  \nz.mem_314_sv2v_reg ,\nz.mem_313_sv2v_reg ,\nz.mem_312_sv2v_reg ,\nz.mem_311_sv2v_reg ,
  \nz.mem_310_sv2v_reg ,\nz.mem_309_sv2v_reg ,\nz.mem_308_sv2v_reg ,\nz.mem_307_sv2v_reg ,
  \nz.mem_306_sv2v_reg ,\nz.mem_305_sv2v_reg ,\nz.mem_304_sv2v_reg ,
  \nz.mem_303_sv2v_reg ,\nz.mem_302_sv2v_reg ,\nz.mem_301_sv2v_reg ,\nz.mem_300_sv2v_reg ,
  \nz.mem_299_sv2v_reg ,\nz.mem_298_sv2v_reg ,\nz.mem_297_sv2v_reg ,\nz.mem_296_sv2v_reg ,
  \nz.mem_295_sv2v_reg ,\nz.mem_294_sv2v_reg ,\nz.mem_293_sv2v_reg ,
  \nz.mem_292_sv2v_reg ,\nz.mem_291_sv2v_reg ,\nz.mem_290_sv2v_reg ,\nz.mem_289_sv2v_reg ,
  \nz.mem_288_sv2v_reg ,\nz.mem_287_sv2v_reg ,\nz.mem_286_sv2v_reg ,
  \nz.mem_285_sv2v_reg ,\nz.mem_284_sv2v_reg ,\nz.mem_283_sv2v_reg ,\nz.mem_282_sv2v_reg ,
  \nz.mem_281_sv2v_reg ,\nz.mem_280_sv2v_reg ,\nz.mem_279_sv2v_reg ,\nz.mem_278_sv2v_reg ,
  \nz.mem_277_sv2v_reg ,\nz.mem_276_sv2v_reg ,\nz.mem_275_sv2v_reg ,
  \nz.mem_274_sv2v_reg ,\nz.mem_273_sv2v_reg ,\nz.mem_272_sv2v_reg ,\nz.mem_271_sv2v_reg ,
  \nz.mem_270_sv2v_reg ,\nz.mem_269_sv2v_reg ,\nz.mem_268_sv2v_reg ,\nz.mem_267_sv2v_reg ,
  \nz.mem_266_sv2v_reg ,\nz.mem_265_sv2v_reg ,\nz.mem_264_sv2v_reg ,
  \nz.mem_263_sv2v_reg ,\nz.mem_262_sv2v_reg ,\nz.mem_261_sv2v_reg ,\nz.mem_260_sv2v_reg ,
  \nz.mem_259_sv2v_reg ,\nz.mem_258_sv2v_reg ,\nz.mem_257_sv2v_reg ,\nz.mem_256_sv2v_reg ,
  \nz.mem_255_sv2v_reg ,\nz.mem_254_sv2v_reg ,\nz.mem_253_sv2v_reg ,
  \nz.mem_252_sv2v_reg ,\nz.mem_251_sv2v_reg ,\nz.mem_250_sv2v_reg ,\nz.mem_249_sv2v_reg ,
  \nz.mem_248_sv2v_reg ,\nz.mem_247_sv2v_reg ,\nz.mem_246_sv2v_reg ,
  \nz.mem_245_sv2v_reg ,\nz.mem_244_sv2v_reg ,\nz.mem_243_sv2v_reg ,\nz.mem_242_sv2v_reg ,
  \nz.mem_241_sv2v_reg ,\nz.mem_240_sv2v_reg ,\nz.mem_239_sv2v_reg ,\nz.mem_238_sv2v_reg ,
  \nz.mem_237_sv2v_reg ,\nz.mem_236_sv2v_reg ,\nz.mem_235_sv2v_reg ,
  \nz.mem_234_sv2v_reg ,\nz.mem_233_sv2v_reg ,\nz.mem_232_sv2v_reg ,\nz.mem_231_sv2v_reg ,
  \nz.mem_230_sv2v_reg ,\nz.mem_229_sv2v_reg ,\nz.mem_228_sv2v_reg ,\nz.mem_227_sv2v_reg ,
  \nz.mem_226_sv2v_reg ,\nz.mem_225_sv2v_reg ,\nz.mem_224_sv2v_reg ,
  \nz.mem_223_sv2v_reg ,\nz.mem_222_sv2v_reg ,\nz.mem_221_sv2v_reg ,\nz.mem_220_sv2v_reg ,
  \nz.mem_219_sv2v_reg ,\nz.mem_218_sv2v_reg ,\nz.mem_217_sv2v_reg ,\nz.mem_216_sv2v_reg ,
  \nz.mem_215_sv2v_reg ,\nz.mem_214_sv2v_reg ,\nz.mem_213_sv2v_reg ,
  \nz.mem_212_sv2v_reg ,\nz.mem_211_sv2v_reg ,\nz.mem_210_sv2v_reg ,\nz.mem_209_sv2v_reg ,
  \nz.mem_208_sv2v_reg ,\nz.mem_207_sv2v_reg ,\nz.mem_206_sv2v_reg ,
  \nz.mem_205_sv2v_reg ,\nz.mem_204_sv2v_reg ,\nz.mem_203_sv2v_reg ,\nz.mem_202_sv2v_reg ,
  \nz.mem_201_sv2v_reg ,\nz.mem_200_sv2v_reg ,\nz.mem_199_sv2v_reg ,\nz.mem_198_sv2v_reg ,
  \nz.mem_197_sv2v_reg ,\nz.mem_196_sv2v_reg ,\nz.mem_195_sv2v_reg ,
  \nz.mem_194_sv2v_reg ,\nz.mem_193_sv2v_reg ,\nz.mem_192_sv2v_reg ,\nz.mem_191_sv2v_reg ,
  \nz.mem_190_sv2v_reg ,\nz.mem_189_sv2v_reg ,\nz.mem_188_sv2v_reg ,\nz.mem_187_sv2v_reg ,
  \nz.mem_186_sv2v_reg ,\nz.mem_185_sv2v_reg ,\nz.mem_184_sv2v_reg ,
  \nz.mem_183_sv2v_reg ,\nz.mem_182_sv2v_reg ,\nz.mem_181_sv2v_reg ,\nz.mem_180_sv2v_reg ,
  \nz.mem_179_sv2v_reg ,\nz.mem_178_sv2v_reg ,\nz.mem_177_sv2v_reg ,\nz.mem_176_sv2v_reg ,
  \nz.mem_175_sv2v_reg ,\nz.mem_174_sv2v_reg ,\nz.mem_173_sv2v_reg ,
  \nz.mem_172_sv2v_reg ,\nz.mem_171_sv2v_reg ,\nz.mem_170_sv2v_reg ,\nz.mem_169_sv2v_reg ,
  \nz.mem_168_sv2v_reg ,\nz.mem_167_sv2v_reg ,\nz.mem_166_sv2v_reg ,
  \nz.mem_165_sv2v_reg ,\nz.mem_164_sv2v_reg ,\nz.mem_163_sv2v_reg ,\nz.mem_162_sv2v_reg ,
  \nz.mem_161_sv2v_reg ,\nz.mem_160_sv2v_reg ,\nz.mem_159_sv2v_reg ,\nz.mem_158_sv2v_reg ,
  \nz.mem_157_sv2v_reg ,\nz.mem_156_sv2v_reg ,\nz.mem_155_sv2v_reg ,
  \nz.mem_154_sv2v_reg ,\nz.mem_153_sv2v_reg ,\nz.mem_152_sv2v_reg ,\nz.mem_151_sv2v_reg ,
  \nz.mem_150_sv2v_reg ,\nz.mem_149_sv2v_reg ,\nz.mem_148_sv2v_reg ,\nz.mem_147_sv2v_reg ,
  \nz.mem_146_sv2v_reg ,\nz.mem_145_sv2v_reg ,\nz.mem_144_sv2v_reg ,
  \nz.mem_143_sv2v_reg ,\nz.mem_142_sv2v_reg ,\nz.mem_141_sv2v_reg ,\nz.mem_140_sv2v_reg ,
  \nz.mem_139_sv2v_reg ,\nz.mem_138_sv2v_reg ,\nz.mem_137_sv2v_reg ,\nz.mem_136_sv2v_reg ,
  \nz.mem_135_sv2v_reg ,\nz.mem_134_sv2v_reg ,\nz.mem_133_sv2v_reg ,
  \nz.mem_132_sv2v_reg ,\nz.mem_131_sv2v_reg ,\nz.mem_130_sv2v_reg ,\nz.mem_129_sv2v_reg ,
  \nz.mem_128_sv2v_reg ,\nz.mem_127_sv2v_reg ,\nz.mem_126_sv2v_reg ,
  \nz.mem_125_sv2v_reg ,\nz.mem_124_sv2v_reg ,\nz.mem_123_sv2v_reg ,\nz.mem_122_sv2v_reg ,
  \nz.mem_121_sv2v_reg ,\nz.mem_120_sv2v_reg ,\nz.mem_119_sv2v_reg ,\nz.mem_118_sv2v_reg ,
  \nz.mem_117_sv2v_reg ,\nz.mem_116_sv2v_reg ,\nz.mem_115_sv2v_reg ,
  \nz.mem_114_sv2v_reg ,\nz.mem_113_sv2v_reg ,\nz.mem_112_sv2v_reg ,\nz.mem_111_sv2v_reg ,
  \nz.mem_110_sv2v_reg ,\nz.mem_109_sv2v_reg ,\nz.mem_108_sv2v_reg ,\nz.mem_107_sv2v_reg ,
  \nz.mem_106_sv2v_reg ,\nz.mem_105_sv2v_reg ,\nz.mem_104_sv2v_reg ,
  \nz.mem_103_sv2v_reg ,\nz.mem_102_sv2v_reg ,\nz.mem_101_sv2v_reg ,\nz.mem_100_sv2v_reg ,
  \nz.mem_99_sv2v_reg ,\nz.mem_98_sv2v_reg ,\nz.mem_97_sv2v_reg ,\nz.mem_96_sv2v_reg ,
  \nz.mem_95_sv2v_reg ,\nz.mem_94_sv2v_reg ,\nz.mem_93_sv2v_reg ,\nz.mem_92_sv2v_reg ,
  \nz.mem_91_sv2v_reg ,\nz.mem_90_sv2v_reg ,\nz.mem_89_sv2v_reg ,
  \nz.mem_88_sv2v_reg ,\nz.mem_87_sv2v_reg ,\nz.mem_86_sv2v_reg ,\nz.mem_85_sv2v_reg ,
  \nz.mem_84_sv2v_reg ,\nz.mem_83_sv2v_reg ,\nz.mem_82_sv2v_reg ,\nz.mem_81_sv2v_reg ,
  \nz.mem_80_sv2v_reg ,\nz.mem_79_sv2v_reg ,\nz.mem_78_sv2v_reg ,\nz.mem_77_sv2v_reg ,
  \nz.mem_76_sv2v_reg ,\nz.mem_75_sv2v_reg ,\nz.mem_74_sv2v_reg ,\nz.mem_73_sv2v_reg ,
  \nz.mem_72_sv2v_reg ,\nz.mem_71_sv2v_reg ,\nz.mem_70_sv2v_reg ,
  \nz.mem_69_sv2v_reg ,\nz.mem_68_sv2v_reg ,\nz.mem_67_sv2v_reg ,\nz.mem_66_sv2v_reg ,
  \nz.mem_65_sv2v_reg ,\nz.mem_64_sv2v_reg ,\nz.mem_63_sv2v_reg ,\nz.mem_62_sv2v_reg ,
  \nz.mem_61_sv2v_reg ,\nz.mem_60_sv2v_reg ,\nz.mem_59_sv2v_reg ,\nz.mem_58_sv2v_reg ,
  \nz.mem_57_sv2v_reg ,\nz.mem_56_sv2v_reg ,\nz.mem_55_sv2v_reg ,\nz.mem_54_sv2v_reg ,
  \nz.mem_53_sv2v_reg ,\nz.mem_52_sv2v_reg ,\nz.mem_51_sv2v_reg ,
  \nz.mem_50_sv2v_reg ,\nz.mem_49_sv2v_reg ,\nz.mem_48_sv2v_reg ,\nz.mem_47_sv2v_reg ,
  \nz.mem_46_sv2v_reg ,\nz.mem_45_sv2v_reg ,\nz.mem_44_sv2v_reg ,\nz.mem_43_sv2v_reg ,
  \nz.mem_42_sv2v_reg ,\nz.mem_41_sv2v_reg ,\nz.mem_40_sv2v_reg ,\nz.mem_39_sv2v_reg ,
  \nz.mem_38_sv2v_reg ,\nz.mem_37_sv2v_reg ,\nz.mem_36_sv2v_reg ,\nz.mem_35_sv2v_reg ,
  \nz.mem_34_sv2v_reg ,\nz.mem_33_sv2v_reg ,\nz.mem_32_sv2v_reg ,
  \nz.mem_31_sv2v_reg ,\nz.mem_30_sv2v_reg ,\nz.mem_29_sv2v_reg ,\nz.mem_28_sv2v_reg ,
  \nz.mem_27_sv2v_reg ,\nz.mem_26_sv2v_reg ,\nz.mem_25_sv2v_reg ,\nz.mem_24_sv2v_reg ,
  \nz.mem_23_sv2v_reg ,\nz.mem_22_sv2v_reg ,\nz.mem_21_sv2v_reg ,\nz.mem_20_sv2v_reg ,
  \nz.mem_19_sv2v_reg ,\nz.mem_18_sv2v_reg ,\nz.mem_17_sv2v_reg ,\nz.mem_16_sv2v_reg ,
  \nz.mem_15_sv2v_reg ,\nz.mem_14_sv2v_reg ,\nz.mem_13_sv2v_reg ,\nz.mem_12_sv2v_reg ,
  \nz.mem_11_sv2v_reg ,\nz.mem_10_sv2v_reg ,\nz.mem_9_sv2v_reg ,
  \nz.mem_8_sv2v_reg ,\nz.mem_7_sv2v_reg ,\nz.mem_6_sv2v_reg ,\nz.mem_5_sv2v_reg ,
  \nz.mem_4_sv2v_reg ,\nz.mem_3_sv2v_reg ,\nz.mem_2_sv2v_reg ,\nz.mem_1_sv2v_reg ,
  \nz.mem_0_sv2v_reg ;
  assign \nz.mem [455] = \nz.mem_455_sv2v_reg ;
  assign \nz.mem [454] = \nz.mem_454_sv2v_reg ;
  assign \nz.mem [453] = \nz.mem_453_sv2v_reg ;
  assign \nz.mem [452] = \nz.mem_452_sv2v_reg ;
  assign \nz.mem [451] = \nz.mem_451_sv2v_reg ;
  assign \nz.mem [450] = \nz.mem_450_sv2v_reg ;
  assign \nz.mem [449] = \nz.mem_449_sv2v_reg ;
  assign \nz.mem [448] = \nz.mem_448_sv2v_reg ;
  assign \nz.mem [447] = \nz.mem_447_sv2v_reg ;
  assign \nz.mem [446] = \nz.mem_446_sv2v_reg ;
  assign \nz.mem [445] = \nz.mem_445_sv2v_reg ;
  assign \nz.mem [444] = \nz.mem_444_sv2v_reg ;
  assign \nz.mem [443] = \nz.mem_443_sv2v_reg ;
  assign \nz.mem [442] = \nz.mem_442_sv2v_reg ;
  assign \nz.mem [441] = \nz.mem_441_sv2v_reg ;
  assign \nz.mem [440] = \nz.mem_440_sv2v_reg ;
  assign \nz.mem [439] = \nz.mem_439_sv2v_reg ;
  assign \nz.mem [438] = \nz.mem_438_sv2v_reg ;
  assign \nz.mem [437] = \nz.mem_437_sv2v_reg ;
  assign \nz.mem [436] = \nz.mem_436_sv2v_reg ;
  assign \nz.mem [435] = \nz.mem_435_sv2v_reg ;
  assign \nz.mem [434] = \nz.mem_434_sv2v_reg ;
  assign \nz.mem [433] = \nz.mem_433_sv2v_reg ;
  assign \nz.mem [432] = \nz.mem_432_sv2v_reg ;
  assign \nz.mem [431] = \nz.mem_431_sv2v_reg ;
  assign \nz.mem [430] = \nz.mem_430_sv2v_reg ;
  assign \nz.mem [429] = \nz.mem_429_sv2v_reg ;
  assign \nz.mem [428] = \nz.mem_428_sv2v_reg ;
  assign \nz.mem [427] = \nz.mem_427_sv2v_reg ;
  assign \nz.mem [426] = \nz.mem_426_sv2v_reg ;
  assign \nz.mem [425] = \nz.mem_425_sv2v_reg ;
  assign \nz.mem [424] = \nz.mem_424_sv2v_reg ;
  assign \nz.mem [423] = \nz.mem_423_sv2v_reg ;
  assign \nz.mem [422] = \nz.mem_422_sv2v_reg ;
  assign \nz.mem [421] = \nz.mem_421_sv2v_reg ;
  assign \nz.mem [420] = \nz.mem_420_sv2v_reg ;
  assign \nz.mem [419] = \nz.mem_419_sv2v_reg ;
  assign \nz.mem [418] = \nz.mem_418_sv2v_reg ;
  assign \nz.mem [417] = \nz.mem_417_sv2v_reg ;
  assign \nz.mem [416] = \nz.mem_416_sv2v_reg ;
  assign \nz.mem [415] = \nz.mem_415_sv2v_reg ;
  assign \nz.mem [414] = \nz.mem_414_sv2v_reg ;
  assign \nz.mem [413] = \nz.mem_413_sv2v_reg ;
  assign \nz.mem [412] = \nz.mem_412_sv2v_reg ;
  assign \nz.mem [411] = \nz.mem_411_sv2v_reg ;
  assign \nz.mem [410] = \nz.mem_410_sv2v_reg ;
  assign \nz.mem [409] = \nz.mem_409_sv2v_reg ;
  assign \nz.mem [408] = \nz.mem_408_sv2v_reg ;
  assign \nz.mem [407] = \nz.mem_407_sv2v_reg ;
  assign \nz.mem [406] = \nz.mem_406_sv2v_reg ;
  assign \nz.mem [405] = \nz.mem_405_sv2v_reg ;
  assign \nz.mem [404] = \nz.mem_404_sv2v_reg ;
  assign \nz.mem [403] = \nz.mem_403_sv2v_reg ;
  assign \nz.mem [402] = \nz.mem_402_sv2v_reg ;
  assign \nz.mem [401] = \nz.mem_401_sv2v_reg ;
  assign \nz.mem [400] = \nz.mem_400_sv2v_reg ;
  assign \nz.mem [399] = \nz.mem_399_sv2v_reg ;
  assign \nz.mem [398] = \nz.mem_398_sv2v_reg ;
  assign \nz.mem [397] = \nz.mem_397_sv2v_reg ;
  assign \nz.mem [396] = \nz.mem_396_sv2v_reg ;
  assign \nz.mem [395] = \nz.mem_395_sv2v_reg ;
  assign \nz.mem [394] = \nz.mem_394_sv2v_reg ;
  assign \nz.mem [393] = \nz.mem_393_sv2v_reg ;
  assign \nz.mem [392] = \nz.mem_392_sv2v_reg ;
  assign \nz.mem [391] = \nz.mem_391_sv2v_reg ;
  assign \nz.mem [390] = \nz.mem_390_sv2v_reg ;
  assign \nz.mem [389] = \nz.mem_389_sv2v_reg ;
  assign \nz.mem [388] = \nz.mem_388_sv2v_reg ;
  assign \nz.mem [387] = \nz.mem_387_sv2v_reg ;
  assign \nz.mem [386] = \nz.mem_386_sv2v_reg ;
  assign \nz.mem [385] = \nz.mem_385_sv2v_reg ;
  assign \nz.mem [384] = \nz.mem_384_sv2v_reg ;
  assign \nz.mem [383] = \nz.mem_383_sv2v_reg ;
  assign \nz.mem [382] = \nz.mem_382_sv2v_reg ;
  assign \nz.mem [381] = \nz.mem_381_sv2v_reg ;
  assign \nz.mem [380] = \nz.mem_380_sv2v_reg ;
  assign \nz.mem [379] = \nz.mem_379_sv2v_reg ;
  assign \nz.mem [378] = \nz.mem_378_sv2v_reg ;
  assign \nz.mem [377] = \nz.mem_377_sv2v_reg ;
  assign \nz.mem [376] = \nz.mem_376_sv2v_reg ;
  assign \nz.mem [375] = \nz.mem_375_sv2v_reg ;
  assign \nz.mem [374] = \nz.mem_374_sv2v_reg ;
  assign \nz.mem [373] = \nz.mem_373_sv2v_reg ;
  assign \nz.mem [372] = \nz.mem_372_sv2v_reg ;
  assign \nz.mem [371] = \nz.mem_371_sv2v_reg ;
  assign \nz.mem [370] = \nz.mem_370_sv2v_reg ;
  assign \nz.mem [369] = \nz.mem_369_sv2v_reg ;
  assign \nz.mem [368] = \nz.mem_368_sv2v_reg ;
  assign \nz.mem [367] = \nz.mem_367_sv2v_reg ;
  assign \nz.mem [366] = \nz.mem_366_sv2v_reg ;
  assign \nz.mem [365] = \nz.mem_365_sv2v_reg ;
  assign \nz.mem [364] = \nz.mem_364_sv2v_reg ;
  assign \nz.mem [363] = \nz.mem_363_sv2v_reg ;
  assign \nz.mem [362] = \nz.mem_362_sv2v_reg ;
  assign \nz.mem [361] = \nz.mem_361_sv2v_reg ;
  assign \nz.mem [360] = \nz.mem_360_sv2v_reg ;
  assign \nz.mem [359] = \nz.mem_359_sv2v_reg ;
  assign \nz.mem [358] = \nz.mem_358_sv2v_reg ;
  assign \nz.mem [357] = \nz.mem_357_sv2v_reg ;
  assign \nz.mem [356] = \nz.mem_356_sv2v_reg ;
  assign \nz.mem [355] = \nz.mem_355_sv2v_reg ;
  assign \nz.mem [354] = \nz.mem_354_sv2v_reg ;
  assign \nz.mem [353] = \nz.mem_353_sv2v_reg ;
  assign \nz.mem [352] = \nz.mem_352_sv2v_reg ;
  assign \nz.mem [351] = \nz.mem_351_sv2v_reg ;
  assign \nz.mem [350] = \nz.mem_350_sv2v_reg ;
  assign \nz.mem [349] = \nz.mem_349_sv2v_reg ;
  assign \nz.mem [348] = \nz.mem_348_sv2v_reg ;
  assign \nz.mem [347] = \nz.mem_347_sv2v_reg ;
  assign \nz.mem [346] = \nz.mem_346_sv2v_reg ;
  assign \nz.mem [345] = \nz.mem_345_sv2v_reg ;
  assign \nz.mem [344] = \nz.mem_344_sv2v_reg ;
  assign \nz.mem [343] = \nz.mem_343_sv2v_reg ;
  assign \nz.mem [342] = \nz.mem_342_sv2v_reg ;
  assign \nz.mem [341] = \nz.mem_341_sv2v_reg ;
  assign \nz.mem [340] = \nz.mem_340_sv2v_reg ;
  assign \nz.mem [339] = \nz.mem_339_sv2v_reg ;
  assign \nz.mem [338] = \nz.mem_338_sv2v_reg ;
  assign \nz.mem [337] = \nz.mem_337_sv2v_reg ;
  assign \nz.mem [336] = \nz.mem_336_sv2v_reg ;
  assign \nz.mem [335] = \nz.mem_335_sv2v_reg ;
  assign \nz.mem [334] = \nz.mem_334_sv2v_reg ;
  assign \nz.mem [333] = \nz.mem_333_sv2v_reg ;
  assign \nz.mem [332] = \nz.mem_332_sv2v_reg ;
  assign \nz.mem [331] = \nz.mem_331_sv2v_reg ;
  assign \nz.mem [330] = \nz.mem_330_sv2v_reg ;
  assign \nz.mem [329] = \nz.mem_329_sv2v_reg ;
  assign \nz.mem [328] = \nz.mem_328_sv2v_reg ;
  assign \nz.mem [327] = \nz.mem_327_sv2v_reg ;
  assign \nz.mem [326] = \nz.mem_326_sv2v_reg ;
  assign \nz.mem [325] = \nz.mem_325_sv2v_reg ;
  assign \nz.mem [324] = \nz.mem_324_sv2v_reg ;
  assign \nz.mem [323] = \nz.mem_323_sv2v_reg ;
  assign \nz.mem [322] = \nz.mem_322_sv2v_reg ;
  assign \nz.mem [321] = \nz.mem_321_sv2v_reg ;
  assign \nz.mem [320] = \nz.mem_320_sv2v_reg ;
  assign \nz.mem [319] = \nz.mem_319_sv2v_reg ;
  assign \nz.mem [318] = \nz.mem_318_sv2v_reg ;
  assign \nz.mem [317] = \nz.mem_317_sv2v_reg ;
  assign \nz.mem [316] = \nz.mem_316_sv2v_reg ;
  assign \nz.mem [315] = \nz.mem_315_sv2v_reg ;
  assign \nz.mem [314] = \nz.mem_314_sv2v_reg ;
  assign \nz.mem [313] = \nz.mem_313_sv2v_reg ;
  assign \nz.mem [312] = \nz.mem_312_sv2v_reg ;
  assign \nz.mem [311] = \nz.mem_311_sv2v_reg ;
  assign \nz.mem [310] = \nz.mem_310_sv2v_reg ;
  assign \nz.mem [309] = \nz.mem_309_sv2v_reg ;
  assign \nz.mem [308] = \nz.mem_308_sv2v_reg ;
  assign \nz.mem [307] = \nz.mem_307_sv2v_reg ;
  assign \nz.mem [306] = \nz.mem_306_sv2v_reg ;
  assign \nz.mem [305] = \nz.mem_305_sv2v_reg ;
  assign \nz.mem [304] = \nz.mem_304_sv2v_reg ;
  assign \nz.mem [303] = \nz.mem_303_sv2v_reg ;
  assign \nz.mem [302] = \nz.mem_302_sv2v_reg ;
  assign \nz.mem [301] = \nz.mem_301_sv2v_reg ;
  assign \nz.mem [300] = \nz.mem_300_sv2v_reg ;
  assign \nz.mem [299] = \nz.mem_299_sv2v_reg ;
  assign \nz.mem [298] = \nz.mem_298_sv2v_reg ;
  assign \nz.mem [297] = \nz.mem_297_sv2v_reg ;
  assign \nz.mem [296] = \nz.mem_296_sv2v_reg ;
  assign \nz.mem [295] = \nz.mem_295_sv2v_reg ;
  assign \nz.mem [294] = \nz.mem_294_sv2v_reg ;
  assign \nz.mem [293] = \nz.mem_293_sv2v_reg ;
  assign \nz.mem [292] = \nz.mem_292_sv2v_reg ;
  assign \nz.mem [291] = \nz.mem_291_sv2v_reg ;
  assign \nz.mem [290] = \nz.mem_290_sv2v_reg ;
  assign \nz.mem [289] = \nz.mem_289_sv2v_reg ;
  assign \nz.mem [288] = \nz.mem_288_sv2v_reg ;
  assign \nz.mem [287] = \nz.mem_287_sv2v_reg ;
  assign \nz.mem [286] = \nz.mem_286_sv2v_reg ;
  assign \nz.mem [285] = \nz.mem_285_sv2v_reg ;
  assign \nz.mem [284] = \nz.mem_284_sv2v_reg ;
  assign \nz.mem [283] = \nz.mem_283_sv2v_reg ;
  assign \nz.mem [282] = \nz.mem_282_sv2v_reg ;
  assign \nz.mem [281] = \nz.mem_281_sv2v_reg ;
  assign \nz.mem [280] = \nz.mem_280_sv2v_reg ;
  assign \nz.mem [279] = \nz.mem_279_sv2v_reg ;
  assign \nz.mem [278] = \nz.mem_278_sv2v_reg ;
  assign \nz.mem [277] = \nz.mem_277_sv2v_reg ;
  assign \nz.mem [276] = \nz.mem_276_sv2v_reg ;
  assign \nz.mem [275] = \nz.mem_275_sv2v_reg ;
  assign \nz.mem [274] = \nz.mem_274_sv2v_reg ;
  assign \nz.mem [273] = \nz.mem_273_sv2v_reg ;
  assign \nz.mem [272] = \nz.mem_272_sv2v_reg ;
  assign \nz.mem [271] = \nz.mem_271_sv2v_reg ;
  assign \nz.mem [270] = \nz.mem_270_sv2v_reg ;
  assign \nz.mem [269] = \nz.mem_269_sv2v_reg ;
  assign \nz.mem [268] = \nz.mem_268_sv2v_reg ;
  assign \nz.mem [267] = \nz.mem_267_sv2v_reg ;
  assign \nz.mem [266] = \nz.mem_266_sv2v_reg ;
  assign \nz.mem [265] = \nz.mem_265_sv2v_reg ;
  assign \nz.mem [264] = \nz.mem_264_sv2v_reg ;
  assign \nz.mem [263] = \nz.mem_263_sv2v_reg ;
  assign \nz.mem [262] = \nz.mem_262_sv2v_reg ;
  assign \nz.mem [261] = \nz.mem_261_sv2v_reg ;
  assign \nz.mem [260] = \nz.mem_260_sv2v_reg ;
  assign \nz.mem [259] = \nz.mem_259_sv2v_reg ;
  assign \nz.mem [258] = \nz.mem_258_sv2v_reg ;
  assign \nz.mem [257] = \nz.mem_257_sv2v_reg ;
  assign \nz.mem [256] = \nz.mem_256_sv2v_reg ;
  assign \nz.mem [255] = \nz.mem_255_sv2v_reg ;
  assign \nz.mem [254] = \nz.mem_254_sv2v_reg ;
  assign \nz.mem [253] = \nz.mem_253_sv2v_reg ;
  assign \nz.mem [252] = \nz.mem_252_sv2v_reg ;
  assign \nz.mem [251] = \nz.mem_251_sv2v_reg ;
  assign \nz.mem [250] = \nz.mem_250_sv2v_reg ;
  assign \nz.mem [249] = \nz.mem_249_sv2v_reg ;
  assign \nz.mem [248] = \nz.mem_248_sv2v_reg ;
  assign \nz.mem [247] = \nz.mem_247_sv2v_reg ;
  assign \nz.mem [246] = \nz.mem_246_sv2v_reg ;
  assign \nz.mem [245] = \nz.mem_245_sv2v_reg ;
  assign \nz.mem [244] = \nz.mem_244_sv2v_reg ;
  assign \nz.mem [243] = \nz.mem_243_sv2v_reg ;
  assign \nz.mem [242] = \nz.mem_242_sv2v_reg ;
  assign \nz.mem [241] = \nz.mem_241_sv2v_reg ;
  assign \nz.mem [240] = \nz.mem_240_sv2v_reg ;
  assign \nz.mem [239] = \nz.mem_239_sv2v_reg ;
  assign \nz.mem [238] = \nz.mem_238_sv2v_reg ;
  assign \nz.mem [237] = \nz.mem_237_sv2v_reg ;
  assign \nz.mem [236] = \nz.mem_236_sv2v_reg ;
  assign \nz.mem [235] = \nz.mem_235_sv2v_reg ;
  assign \nz.mem [234] = \nz.mem_234_sv2v_reg ;
  assign \nz.mem [233] = \nz.mem_233_sv2v_reg ;
  assign \nz.mem [232] = \nz.mem_232_sv2v_reg ;
  assign \nz.mem [231] = \nz.mem_231_sv2v_reg ;
  assign \nz.mem [230] = \nz.mem_230_sv2v_reg ;
  assign \nz.mem [229] = \nz.mem_229_sv2v_reg ;
  assign \nz.mem [228] = \nz.mem_228_sv2v_reg ;
  assign \nz.mem [227] = \nz.mem_227_sv2v_reg ;
  assign \nz.mem [226] = \nz.mem_226_sv2v_reg ;
  assign \nz.mem [225] = \nz.mem_225_sv2v_reg ;
  assign \nz.mem [224] = \nz.mem_224_sv2v_reg ;
  assign \nz.mem [223] = \nz.mem_223_sv2v_reg ;
  assign \nz.mem [222] = \nz.mem_222_sv2v_reg ;
  assign \nz.mem [221] = \nz.mem_221_sv2v_reg ;
  assign \nz.mem [220] = \nz.mem_220_sv2v_reg ;
  assign \nz.mem [219] = \nz.mem_219_sv2v_reg ;
  assign \nz.mem [218] = \nz.mem_218_sv2v_reg ;
  assign \nz.mem [217] = \nz.mem_217_sv2v_reg ;
  assign \nz.mem [216] = \nz.mem_216_sv2v_reg ;
  assign \nz.mem [215] = \nz.mem_215_sv2v_reg ;
  assign \nz.mem [214] = \nz.mem_214_sv2v_reg ;
  assign \nz.mem [213] = \nz.mem_213_sv2v_reg ;
  assign \nz.mem [212] = \nz.mem_212_sv2v_reg ;
  assign \nz.mem [211] = \nz.mem_211_sv2v_reg ;
  assign \nz.mem [210] = \nz.mem_210_sv2v_reg ;
  assign \nz.mem [209] = \nz.mem_209_sv2v_reg ;
  assign \nz.mem [208] = \nz.mem_208_sv2v_reg ;
  assign \nz.mem [207] = \nz.mem_207_sv2v_reg ;
  assign \nz.mem [206] = \nz.mem_206_sv2v_reg ;
  assign \nz.mem [205] = \nz.mem_205_sv2v_reg ;
  assign \nz.mem [204] = \nz.mem_204_sv2v_reg ;
  assign \nz.mem [203] = \nz.mem_203_sv2v_reg ;
  assign \nz.mem [202] = \nz.mem_202_sv2v_reg ;
  assign \nz.mem [201] = \nz.mem_201_sv2v_reg ;
  assign \nz.mem [200] = \nz.mem_200_sv2v_reg ;
  assign \nz.mem [199] = \nz.mem_199_sv2v_reg ;
  assign \nz.mem [198] = \nz.mem_198_sv2v_reg ;
  assign \nz.mem [197] = \nz.mem_197_sv2v_reg ;
  assign \nz.mem [196] = \nz.mem_196_sv2v_reg ;
  assign \nz.mem [195] = \nz.mem_195_sv2v_reg ;
  assign \nz.mem [194] = \nz.mem_194_sv2v_reg ;
  assign \nz.mem [193] = \nz.mem_193_sv2v_reg ;
  assign \nz.mem [192] = \nz.mem_192_sv2v_reg ;
  assign \nz.mem [191] = \nz.mem_191_sv2v_reg ;
  assign \nz.mem [190] = \nz.mem_190_sv2v_reg ;
  assign \nz.mem [189] = \nz.mem_189_sv2v_reg ;
  assign \nz.mem [188] = \nz.mem_188_sv2v_reg ;
  assign \nz.mem [187] = \nz.mem_187_sv2v_reg ;
  assign \nz.mem [186] = \nz.mem_186_sv2v_reg ;
  assign \nz.mem [185] = \nz.mem_185_sv2v_reg ;
  assign \nz.mem [184] = \nz.mem_184_sv2v_reg ;
  assign \nz.mem [183] = \nz.mem_183_sv2v_reg ;
  assign \nz.mem [182] = \nz.mem_182_sv2v_reg ;
  assign \nz.mem [181] = \nz.mem_181_sv2v_reg ;
  assign \nz.mem [180] = \nz.mem_180_sv2v_reg ;
  assign \nz.mem [179] = \nz.mem_179_sv2v_reg ;
  assign \nz.mem [178] = \nz.mem_178_sv2v_reg ;
  assign \nz.mem [177] = \nz.mem_177_sv2v_reg ;
  assign \nz.mem [176] = \nz.mem_176_sv2v_reg ;
  assign \nz.mem [175] = \nz.mem_175_sv2v_reg ;
  assign \nz.mem [174] = \nz.mem_174_sv2v_reg ;
  assign \nz.mem [173] = \nz.mem_173_sv2v_reg ;
  assign \nz.mem [172] = \nz.mem_172_sv2v_reg ;
  assign \nz.mem [171] = \nz.mem_171_sv2v_reg ;
  assign \nz.mem [170] = \nz.mem_170_sv2v_reg ;
  assign \nz.mem [169] = \nz.mem_169_sv2v_reg ;
  assign \nz.mem [168] = \nz.mem_168_sv2v_reg ;
  assign \nz.mem [167] = \nz.mem_167_sv2v_reg ;
  assign \nz.mem [166] = \nz.mem_166_sv2v_reg ;
  assign \nz.mem [165] = \nz.mem_165_sv2v_reg ;
  assign \nz.mem [164] = \nz.mem_164_sv2v_reg ;
  assign \nz.mem [163] = \nz.mem_163_sv2v_reg ;
  assign \nz.mem [162] = \nz.mem_162_sv2v_reg ;
  assign \nz.mem [161] = \nz.mem_161_sv2v_reg ;
  assign \nz.mem [160] = \nz.mem_160_sv2v_reg ;
  assign \nz.mem [159] = \nz.mem_159_sv2v_reg ;
  assign \nz.mem [158] = \nz.mem_158_sv2v_reg ;
  assign \nz.mem [157] = \nz.mem_157_sv2v_reg ;
  assign \nz.mem [156] = \nz.mem_156_sv2v_reg ;
  assign \nz.mem [155] = \nz.mem_155_sv2v_reg ;
  assign \nz.mem [154] = \nz.mem_154_sv2v_reg ;
  assign \nz.mem [153] = \nz.mem_153_sv2v_reg ;
  assign \nz.mem [152] = \nz.mem_152_sv2v_reg ;
  assign \nz.mem [151] = \nz.mem_151_sv2v_reg ;
  assign \nz.mem [150] = \nz.mem_150_sv2v_reg ;
  assign \nz.mem [149] = \nz.mem_149_sv2v_reg ;
  assign \nz.mem [148] = \nz.mem_148_sv2v_reg ;
  assign \nz.mem [147] = \nz.mem_147_sv2v_reg ;
  assign \nz.mem [146] = \nz.mem_146_sv2v_reg ;
  assign \nz.mem [145] = \nz.mem_145_sv2v_reg ;
  assign \nz.mem [144] = \nz.mem_144_sv2v_reg ;
  assign \nz.mem [143] = \nz.mem_143_sv2v_reg ;
  assign \nz.mem [142] = \nz.mem_142_sv2v_reg ;
  assign \nz.mem [141] = \nz.mem_141_sv2v_reg ;
  assign \nz.mem [140] = \nz.mem_140_sv2v_reg ;
  assign \nz.mem [139] = \nz.mem_139_sv2v_reg ;
  assign \nz.mem [138] = \nz.mem_138_sv2v_reg ;
  assign \nz.mem [137] = \nz.mem_137_sv2v_reg ;
  assign \nz.mem [136] = \nz.mem_136_sv2v_reg ;
  assign \nz.mem [135] = \nz.mem_135_sv2v_reg ;
  assign \nz.mem [134] = \nz.mem_134_sv2v_reg ;
  assign \nz.mem [133] = \nz.mem_133_sv2v_reg ;
  assign \nz.mem [132] = \nz.mem_132_sv2v_reg ;
  assign \nz.mem [131] = \nz.mem_131_sv2v_reg ;
  assign \nz.mem [130] = \nz.mem_130_sv2v_reg ;
  assign \nz.mem [129] = \nz.mem_129_sv2v_reg ;
  assign \nz.mem [128] = \nz.mem_128_sv2v_reg ;
  assign \nz.mem [127] = \nz.mem_127_sv2v_reg ;
  assign \nz.mem [126] = \nz.mem_126_sv2v_reg ;
  assign \nz.mem [125] = \nz.mem_125_sv2v_reg ;
  assign \nz.mem [124] = \nz.mem_124_sv2v_reg ;
  assign \nz.mem [123] = \nz.mem_123_sv2v_reg ;
  assign \nz.mem [122] = \nz.mem_122_sv2v_reg ;
  assign \nz.mem [121] = \nz.mem_121_sv2v_reg ;
  assign \nz.mem [120] = \nz.mem_120_sv2v_reg ;
  assign \nz.mem [119] = \nz.mem_119_sv2v_reg ;
  assign \nz.mem [118] = \nz.mem_118_sv2v_reg ;
  assign \nz.mem [117] = \nz.mem_117_sv2v_reg ;
  assign \nz.mem [116] = \nz.mem_116_sv2v_reg ;
  assign \nz.mem [115] = \nz.mem_115_sv2v_reg ;
  assign \nz.mem [114] = \nz.mem_114_sv2v_reg ;
  assign \nz.mem [113] = \nz.mem_113_sv2v_reg ;
  assign \nz.mem [112] = \nz.mem_112_sv2v_reg ;
  assign \nz.mem [111] = \nz.mem_111_sv2v_reg ;
  assign \nz.mem [110] = \nz.mem_110_sv2v_reg ;
  assign \nz.mem [109] = \nz.mem_109_sv2v_reg ;
  assign \nz.mem [108] = \nz.mem_108_sv2v_reg ;
  assign \nz.mem [107] = \nz.mem_107_sv2v_reg ;
  assign \nz.mem [106] = \nz.mem_106_sv2v_reg ;
  assign \nz.mem [105] = \nz.mem_105_sv2v_reg ;
  assign \nz.mem [104] = \nz.mem_104_sv2v_reg ;
  assign \nz.mem [103] = \nz.mem_103_sv2v_reg ;
  assign \nz.mem [102] = \nz.mem_102_sv2v_reg ;
  assign \nz.mem [101] = \nz.mem_101_sv2v_reg ;
  assign \nz.mem [100] = \nz.mem_100_sv2v_reg ;
  assign \nz.mem [99] = \nz.mem_99_sv2v_reg ;
  assign \nz.mem [98] = \nz.mem_98_sv2v_reg ;
  assign \nz.mem [97] = \nz.mem_97_sv2v_reg ;
  assign \nz.mem [96] = \nz.mem_96_sv2v_reg ;
  assign \nz.mem [95] = \nz.mem_95_sv2v_reg ;
  assign \nz.mem [94] = \nz.mem_94_sv2v_reg ;
  assign \nz.mem [93] = \nz.mem_93_sv2v_reg ;
  assign \nz.mem [92] = \nz.mem_92_sv2v_reg ;
  assign \nz.mem [91] = \nz.mem_91_sv2v_reg ;
  assign \nz.mem [90] = \nz.mem_90_sv2v_reg ;
  assign \nz.mem [89] = \nz.mem_89_sv2v_reg ;
  assign \nz.mem [88] = \nz.mem_88_sv2v_reg ;
  assign \nz.mem [87] = \nz.mem_87_sv2v_reg ;
  assign \nz.mem [86] = \nz.mem_86_sv2v_reg ;
  assign \nz.mem [85] = \nz.mem_85_sv2v_reg ;
  assign \nz.mem [84] = \nz.mem_84_sv2v_reg ;
  assign \nz.mem [83] = \nz.mem_83_sv2v_reg ;
  assign \nz.mem [82] = \nz.mem_82_sv2v_reg ;
  assign \nz.mem [81] = \nz.mem_81_sv2v_reg ;
  assign \nz.mem [80] = \nz.mem_80_sv2v_reg ;
  assign \nz.mem [79] = \nz.mem_79_sv2v_reg ;
  assign \nz.mem [78] = \nz.mem_78_sv2v_reg ;
  assign \nz.mem [77] = \nz.mem_77_sv2v_reg ;
  assign \nz.mem [76] = \nz.mem_76_sv2v_reg ;
  assign \nz.mem [75] = \nz.mem_75_sv2v_reg ;
  assign \nz.mem [74] = \nz.mem_74_sv2v_reg ;
  assign \nz.mem [73] = \nz.mem_73_sv2v_reg ;
  assign \nz.mem [72] = \nz.mem_72_sv2v_reg ;
  assign \nz.mem [71] = \nz.mem_71_sv2v_reg ;
  assign \nz.mem [70] = \nz.mem_70_sv2v_reg ;
  assign \nz.mem [69] = \nz.mem_69_sv2v_reg ;
  assign \nz.mem [68] = \nz.mem_68_sv2v_reg ;
  assign \nz.mem [67] = \nz.mem_67_sv2v_reg ;
  assign \nz.mem [66] = \nz.mem_66_sv2v_reg ;
  assign \nz.mem [65] = \nz.mem_65_sv2v_reg ;
  assign \nz.mem [64] = \nz.mem_64_sv2v_reg ;
  assign \nz.mem [63] = \nz.mem_63_sv2v_reg ;
  assign \nz.mem [62] = \nz.mem_62_sv2v_reg ;
  assign \nz.mem [61] = \nz.mem_61_sv2v_reg ;
  assign \nz.mem [60] = \nz.mem_60_sv2v_reg ;
  assign \nz.mem [59] = \nz.mem_59_sv2v_reg ;
  assign \nz.mem [58] = \nz.mem_58_sv2v_reg ;
  assign \nz.mem [57] = \nz.mem_57_sv2v_reg ;
  assign \nz.mem [56] = \nz.mem_56_sv2v_reg ;
  assign \nz.mem [55] = \nz.mem_55_sv2v_reg ;
  assign \nz.mem [54] = \nz.mem_54_sv2v_reg ;
  assign \nz.mem [53] = \nz.mem_53_sv2v_reg ;
  assign \nz.mem [52] = \nz.mem_52_sv2v_reg ;
  assign \nz.mem [51] = \nz.mem_51_sv2v_reg ;
  assign \nz.mem [50] = \nz.mem_50_sv2v_reg ;
  assign \nz.mem [49] = \nz.mem_49_sv2v_reg ;
  assign \nz.mem [48] = \nz.mem_48_sv2v_reg ;
  assign \nz.mem [47] = \nz.mem_47_sv2v_reg ;
  assign \nz.mem [46] = \nz.mem_46_sv2v_reg ;
  assign \nz.mem [45] = \nz.mem_45_sv2v_reg ;
  assign \nz.mem [44] = \nz.mem_44_sv2v_reg ;
  assign \nz.mem [43] = \nz.mem_43_sv2v_reg ;
  assign \nz.mem [42] = \nz.mem_42_sv2v_reg ;
  assign \nz.mem [41] = \nz.mem_41_sv2v_reg ;
  assign \nz.mem [40] = \nz.mem_40_sv2v_reg ;
  assign \nz.mem [39] = \nz.mem_39_sv2v_reg ;
  assign \nz.mem [38] = \nz.mem_38_sv2v_reg ;
  assign \nz.mem [37] = \nz.mem_37_sv2v_reg ;
  assign \nz.mem [36] = \nz.mem_36_sv2v_reg ;
  assign \nz.mem [35] = \nz.mem_35_sv2v_reg ;
  assign \nz.mem [34] = \nz.mem_34_sv2v_reg ;
  assign \nz.mem [33] = \nz.mem_33_sv2v_reg ;
  assign \nz.mem [32] = \nz.mem_32_sv2v_reg ;
  assign \nz.mem [31] = \nz.mem_31_sv2v_reg ;
  assign \nz.mem [30] = \nz.mem_30_sv2v_reg ;
  assign \nz.mem [29] = \nz.mem_29_sv2v_reg ;
  assign \nz.mem [28] = \nz.mem_28_sv2v_reg ;
  assign \nz.mem [27] = \nz.mem_27_sv2v_reg ;
  assign \nz.mem [26] = \nz.mem_26_sv2v_reg ;
  assign \nz.mem [25] = \nz.mem_25_sv2v_reg ;
  assign \nz.mem [24] = \nz.mem_24_sv2v_reg ;
  assign \nz.mem [23] = \nz.mem_23_sv2v_reg ;
  assign \nz.mem [22] = \nz.mem_22_sv2v_reg ;
  assign \nz.mem [21] = \nz.mem_21_sv2v_reg ;
  assign \nz.mem [20] = \nz.mem_20_sv2v_reg ;
  assign \nz.mem [19] = \nz.mem_19_sv2v_reg ;
  assign \nz.mem [18] = \nz.mem_18_sv2v_reg ;
  assign \nz.mem [17] = \nz.mem_17_sv2v_reg ;
  assign \nz.mem [16] = \nz.mem_16_sv2v_reg ;
  assign \nz.mem [15] = \nz.mem_15_sv2v_reg ;
  assign \nz.mem [14] = \nz.mem_14_sv2v_reg ;
  assign \nz.mem [13] = \nz.mem_13_sv2v_reg ;
  assign \nz.mem [12] = \nz.mem_12_sv2v_reg ;
  assign \nz.mem [11] = \nz.mem_11_sv2v_reg ;
  assign \nz.mem [10] = \nz.mem_10_sv2v_reg ;
  assign \nz.mem [9] = \nz.mem_9_sv2v_reg ;
  assign \nz.mem [8] = \nz.mem_8_sv2v_reg ;
  assign \nz.mem [7] = \nz.mem_7_sv2v_reg ;
  assign \nz.mem [6] = \nz.mem_6_sv2v_reg ;
  assign \nz.mem [5] = \nz.mem_5_sv2v_reg ;
  assign \nz.mem [4] = \nz.mem_4_sv2v_reg ;
  assign \nz.mem [3] = \nz.mem_3_sv2v_reg ;
  assign \nz.mem [2] = \nz.mem_2_sv2v_reg ;
  assign \nz.mem [1] = \nz.mem_1_sv2v_reg ;
  assign \nz.mem [0] = \nz.mem_0_sv2v_reg ;
  assign r_data_o[113] = (N8)? \nz.mem [113] : 
                         (N10)? \nz.mem [227] : 
                         (N9)? \nz.mem [341] : 
                         (N11)? \nz.mem [455] : 1'b0;
  assign r_data_o[112] = (N8)? \nz.mem [112] : 
                         (N10)? \nz.mem [226] : 
                         (N9)? \nz.mem [340] : 
                         (N11)? \nz.mem [454] : 1'b0;
  assign r_data_o[111] = (N8)? \nz.mem [111] : 
                         (N10)? \nz.mem [225] : 
                         (N9)? \nz.mem [339] : 
                         (N11)? \nz.mem [453] : 1'b0;
  assign r_data_o[110] = (N8)? \nz.mem [110] : 
                         (N10)? \nz.mem [224] : 
                         (N9)? \nz.mem [338] : 
                         (N11)? \nz.mem [452] : 1'b0;
  assign r_data_o[109] = (N8)? \nz.mem [109] : 
                         (N10)? \nz.mem [223] : 
                         (N9)? \nz.mem [337] : 
                         (N11)? \nz.mem [451] : 1'b0;
  assign r_data_o[108] = (N8)? \nz.mem [108] : 
                         (N10)? \nz.mem [222] : 
                         (N9)? \nz.mem [336] : 
                         (N11)? \nz.mem [450] : 1'b0;
  assign r_data_o[107] = (N8)? \nz.mem [107] : 
                         (N10)? \nz.mem [221] : 
                         (N9)? \nz.mem [335] : 
                         (N11)? \nz.mem [449] : 1'b0;
  assign r_data_o[106] = (N8)? \nz.mem [106] : 
                         (N10)? \nz.mem [220] : 
                         (N9)? \nz.mem [334] : 
                         (N11)? \nz.mem [448] : 1'b0;
  assign r_data_o[105] = (N8)? \nz.mem [105] : 
                         (N10)? \nz.mem [219] : 
                         (N9)? \nz.mem [333] : 
                         (N11)? \nz.mem [447] : 1'b0;
  assign r_data_o[104] = (N8)? \nz.mem [104] : 
                         (N10)? \nz.mem [218] : 
                         (N9)? \nz.mem [332] : 
                         (N11)? \nz.mem [446] : 1'b0;
  assign r_data_o[103] = (N8)? \nz.mem [103] : 
                         (N10)? \nz.mem [217] : 
                         (N9)? \nz.mem [331] : 
                         (N11)? \nz.mem [445] : 1'b0;
  assign r_data_o[102] = (N8)? \nz.mem [102] : 
                         (N10)? \nz.mem [216] : 
                         (N9)? \nz.mem [330] : 
                         (N11)? \nz.mem [444] : 1'b0;
  assign r_data_o[101] = (N8)? \nz.mem [101] : 
                         (N10)? \nz.mem [215] : 
                         (N9)? \nz.mem [329] : 
                         (N11)? \nz.mem [443] : 1'b0;
  assign r_data_o[100] = (N8)? \nz.mem [100] : 
                         (N10)? \nz.mem [214] : 
                         (N9)? \nz.mem [328] : 
                         (N11)? \nz.mem [442] : 1'b0;
  assign r_data_o[99] = (N8)? \nz.mem [99] : 
                        (N10)? \nz.mem [213] : 
                        (N9)? \nz.mem [327] : 
                        (N11)? \nz.mem [441] : 1'b0;
  assign r_data_o[98] = (N8)? \nz.mem [98] : 
                        (N10)? \nz.mem [212] : 
                        (N9)? \nz.mem [326] : 
                        (N11)? \nz.mem [440] : 1'b0;
  assign r_data_o[97] = (N8)? \nz.mem [97] : 
                        (N10)? \nz.mem [211] : 
                        (N9)? \nz.mem [325] : 
                        (N11)? \nz.mem [439] : 1'b0;
  assign r_data_o[96] = (N8)? \nz.mem [96] : 
                        (N10)? \nz.mem [210] : 
                        (N9)? \nz.mem [324] : 
                        (N11)? \nz.mem [438] : 1'b0;
  assign r_data_o[95] = (N8)? \nz.mem [95] : 
                        (N10)? \nz.mem [209] : 
                        (N9)? \nz.mem [323] : 
                        (N11)? \nz.mem [437] : 1'b0;
  assign r_data_o[94] = (N8)? \nz.mem [94] : 
                        (N10)? \nz.mem [208] : 
                        (N9)? \nz.mem [322] : 
                        (N11)? \nz.mem [436] : 1'b0;
  assign r_data_o[93] = (N8)? \nz.mem [93] : 
                        (N10)? \nz.mem [207] : 
                        (N9)? \nz.mem [321] : 
                        (N11)? \nz.mem [435] : 1'b0;
  assign r_data_o[92] = (N8)? \nz.mem [92] : 
                        (N10)? \nz.mem [206] : 
                        (N9)? \nz.mem [320] : 
                        (N11)? \nz.mem [434] : 1'b0;
  assign r_data_o[91] = (N8)? \nz.mem [91] : 
                        (N10)? \nz.mem [205] : 
                        (N9)? \nz.mem [319] : 
                        (N11)? \nz.mem [433] : 1'b0;
  assign r_data_o[90] = (N8)? \nz.mem [90] : 
                        (N10)? \nz.mem [204] : 
                        (N9)? \nz.mem [318] : 
                        (N11)? \nz.mem [432] : 1'b0;
  assign r_data_o[89] = (N8)? \nz.mem [89] : 
                        (N10)? \nz.mem [203] : 
                        (N9)? \nz.mem [317] : 
                        (N11)? \nz.mem [431] : 1'b0;
  assign r_data_o[88] = (N8)? \nz.mem [88] : 
                        (N10)? \nz.mem [202] : 
                        (N9)? \nz.mem [316] : 
                        (N11)? \nz.mem [430] : 1'b0;
  assign r_data_o[87] = (N8)? \nz.mem [87] : 
                        (N10)? \nz.mem [201] : 
                        (N9)? \nz.mem [315] : 
                        (N11)? \nz.mem [429] : 1'b0;
  assign r_data_o[86] = (N8)? \nz.mem [86] : 
                        (N10)? \nz.mem [200] : 
                        (N9)? \nz.mem [314] : 
                        (N11)? \nz.mem [428] : 1'b0;
  assign r_data_o[85] = (N8)? \nz.mem [85] : 
                        (N10)? \nz.mem [199] : 
                        (N9)? \nz.mem [313] : 
                        (N11)? \nz.mem [427] : 1'b0;
  assign r_data_o[84] = (N8)? \nz.mem [84] : 
                        (N10)? \nz.mem [198] : 
                        (N9)? \nz.mem [312] : 
                        (N11)? \nz.mem [426] : 1'b0;
  assign r_data_o[83] = (N8)? \nz.mem [83] : 
                        (N10)? \nz.mem [197] : 
                        (N9)? \nz.mem [311] : 
                        (N11)? \nz.mem [425] : 1'b0;
  assign r_data_o[82] = (N8)? \nz.mem [82] : 
                        (N10)? \nz.mem [196] : 
                        (N9)? \nz.mem [310] : 
                        (N11)? \nz.mem [424] : 1'b0;
  assign r_data_o[81] = (N8)? \nz.mem [81] : 
                        (N10)? \nz.mem [195] : 
                        (N9)? \nz.mem [309] : 
                        (N11)? \nz.mem [423] : 1'b0;
  assign r_data_o[80] = (N8)? \nz.mem [80] : 
                        (N10)? \nz.mem [194] : 
                        (N9)? \nz.mem [308] : 
                        (N11)? \nz.mem [422] : 1'b0;
  assign r_data_o[79] = (N8)? \nz.mem [79] : 
                        (N10)? \nz.mem [193] : 
                        (N9)? \nz.mem [307] : 
                        (N11)? \nz.mem [421] : 1'b0;
  assign r_data_o[78] = (N8)? \nz.mem [78] : 
                        (N10)? \nz.mem [192] : 
                        (N9)? \nz.mem [306] : 
                        (N11)? \nz.mem [420] : 1'b0;
  assign r_data_o[77] = (N8)? \nz.mem [77] : 
                        (N10)? \nz.mem [191] : 
                        (N9)? \nz.mem [305] : 
                        (N11)? \nz.mem [419] : 1'b0;
  assign r_data_o[76] = (N8)? \nz.mem [76] : 
                        (N10)? \nz.mem [190] : 
                        (N9)? \nz.mem [304] : 
                        (N11)? \nz.mem [418] : 1'b0;
  assign r_data_o[75] = (N8)? \nz.mem [75] : 
                        (N10)? \nz.mem [189] : 
                        (N9)? \nz.mem [303] : 
                        (N11)? \nz.mem [417] : 1'b0;
  assign r_data_o[74] = (N8)? \nz.mem [74] : 
                        (N10)? \nz.mem [188] : 
                        (N9)? \nz.mem [302] : 
                        (N11)? \nz.mem [416] : 1'b0;
  assign r_data_o[73] = (N8)? \nz.mem [73] : 
                        (N10)? \nz.mem [187] : 
                        (N9)? \nz.mem [301] : 
                        (N11)? \nz.mem [415] : 1'b0;
  assign r_data_o[72] = (N8)? \nz.mem [72] : 
                        (N10)? \nz.mem [186] : 
                        (N9)? \nz.mem [300] : 
                        (N11)? \nz.mem [414] : 1'b0;
  assign r_data_o[71] = (N8)? \nz.mem [71] : 
                        (N10)? \nz.mem [185] : 
                        (N9)? \nz.mem [299] : 
                        (N11)? \nz.mem [413] : 1'b0;
  assign r_data_o[70] = (N8)? \nz.mem [70] : 
                        (N10)? \nz.mem [184] : 
                        (N9)? \nz.mem [298] : 
                        (N11)? \nz.mem [412] : 1'b0;
  assign r_data_o[69] = (N8)? \nz.mem [69] : 
                        (N10)? \nz.mem [183] : 
                        (N9)? \nz.mem [297] : 
                        (N11)? \nz.mem [411] : 1'b0;
  assign r_data_o[68] = (N8)? \nz.mem [68] : 
                        (N10)? \nz.mem [182] : 
                        (N9)? \nz.mem [296] : 
                        (N11)? \nz.mem [410] : 1'b0;
  assign r_data_o[67] = (N8)? \nz.mem [67] : 
                        (N10)? \nz.mem [181] : 
                        (N9)? \nz.mem [295] : 
                        (N11)? \nz.mem [409] : 1'b0;
  assign r_data_o[66] = (N8)? \nz.mem [66] : 
                        (N10)? \nz.mem [180] : 
                        (N9)? \nz.mem [294] : 
                        (N11)? \nz.mem [408] : 1'b0;
  assign r_data_o[65] = (N8)? \nz.mem [65] : 
                        (N10)? \nz.mem [179] : 
                        (N9)? \nz.mem [293] : 
                        (N11)? \nz.mem [407] : 1'b0;
  assign r_data_o[64] = (N8)? \nz.mem [64] : 
                        (N10)? \nz.mem [178] : 
                        (N9)? \nz.mem [292] : 
                        (N11)? \nz.mem [406] : 1'b0;
  assign r_data_o[63] = (N8)? \nz.mem [63] : 
                        (N10)? \nz.mem [177] : 
                        (N9)? \nz.mem [291] : 
                        (N11)? \nz.mem [405] : 1'b0;
  assign r_data_o[62] = (N8)? \nz.mem [62] : 
                        (N10)? \nz.mem [176] : 
                        (N9)? \nz.mem [290] : 
                        (N11)? \nz.mem [404] : 1'b0;
  assign r_data_o[61] = (N8)? \nz.mem [61] : 
                        (N10)? \nz.mem [175] : 
                        (N9)? \nz.mem [289] : 
                        (N11)? \nz.mem [403] : 1'b0;
  assign r_data_o[60] = (N8)? \nz.mem [60] : 
                        (N10)? \nz.mem [174] : 
                        (N9)? \nz.mem [288] : 
                        (N11)? \nz.mem [402] : 1'b0;
  assign r_data_o[59] = (N8)? \nz.mem [59] : 
                        (N10)? \nz.mem [173] : 
                        (N9)? \nz.mem [287] : 
                        (N11)? \nz.mem [401] : 1'b0;
  assign r_data_o[58] = (N8)? \nz.mem [58] : 
                        (N10)? \nz.mem [172] : 
                        (N9)? \nz.mem [286] : 
                        (N11)? \nz.mem [400] : 1'b0;
  assign r_data_o[57] = (N8)? \nz.mem [57] : 
                        (N10)? \nz.mem [171] : 
                        (N9)? \nz.mem [285] : 
                        (N11)? \nz.mem [399] : 1'b0;
  assign r_data_o[56] = (N8)? \nz.mem [56] : 
                        (N10)? \nz.mem [170] : 
                        (N9)? \nz.mem [284] : 
                        (N11)? \nz.mem [398] : 1'b0;
  assign r_data_o[55] = (N8)? \nz.mem [55] : 
                        (N10)? \nz.mem [169] : 
                        (N9)? \nz.mem [283] : 
                        (N11)? \nz.mem [397] : 1'b0;
  assign r_data_o[54] = (N8)? \nz.mem [54] : 
                        (N10)? \nz.mem [168] : 
                        (N9)? \nz.mem [282] : 
                        (N11)? \nz.mem [396] : 1'b0;
  assign r_data_o[53] = (N8)? \nz.mem [53] : 
                        (N10)? \nz.mem [167] : 
                        (N9)? \nz.mem [281] : 
                        (N11)? \nz.mem [395] : 1'b0;
  assign r_data_o[52] = (N8)? \nz.mem [52] : 
                        (N10)? \nz.mem [166] : 
                        (N9)? \nz.mem [280] : 
                        (N11)? \nz.mem [394] : 1'b0;
  assign r_data_o[51] = (N8)? \nz.mem [51] : 
                        (N10)? \nz.mem [165] : 
                        (N9)? \nz.mem [279] : 
                        (N11)? \nz.mem [393] : 1'b0;
  assign r_data_o[50] = (N8)? \nz.mem [50] : 
                        (N10)? \nz.mem [164] : 
                        (N9)? \nz.mem [278] : 
                        (N11)? \nz.mem [392] : 1'b0;
  assign r_data_o[49] = (N8)? \nz.mem [49] : 
                        (N10)? \nz.mem [163] : 
                        (N9)? \nz.mem [277] : 
                        (N11)? \nz.mem [391] : 1'b0;
  assign r_data_o[48] = (N8)? \nz.mem [48] : 
                        (N10)? \nz.mem [162] : 
                        (N9)? \nz.mem [276] : 
                        (N11)? \nz.mem [390] : 1'b0;
  assign r_data_o[47] = (N8)? \nz.mem [47] : 
                        (N10)? \nz.mem [161] : 
                        (N9)? \nz.mem [275] : 
                        (N11)? \nz.mem [389] : 1'b0;
  assign r_data_o[46] = (N8)? \nz.mem [46] : 
                        (N10)? \nz.mem [160] : 
                        (N9)? \nz.mem [274] : 
                        (N11)? \nz.mem [388] : 1'b0;
  assign r_data_o[45] = (N8)? \nz.mem [45] : 
                        (N10)? \nz.mem [159] : 
                        (N9)? \nz.mem [273] : 
                        (N11)? \nz.mem [387] : 1'b0;
  assign r_data_o[44] = (N8)? \nz.mem [44] : 
                        (N10)? \nz.mem [158] : 
                        (N9)? \nz.mem [272] : 
                        (N11)? \nz.mem [386] : 1'b0;
  assign r_data_o[43] = (N8)? \nz.mem [43] : 
                        (N10)? \nz.mem [157] : 
                        (N9)? \nz.mem [271] : 
                        (N11)? \nz.mem [385] : 1'b0;
  assign r_data_o[42] = (N8)? \nz.mem [42] : 
                        (N10)? \nz.mem [156] : 
                        (N9)? \nz.mem [270] : 
                        (N11)? \nz.mem [384] : 1'b0;
  assign r_data_o[41] = (N8)? \nz.mem [41] : 
                        (N10)? \nz.mem [155] : 
                        (N9)? \nz.mem [269] : 
                        (N11)? \nz.mem [383] : 1'b0;
  assign r_data_o[40] = (N8)? \nz.mem [40] : 
                        (N10)? \nz.mem [154] : 
                        (N9)? \nz.mem [268] : 
                        (N11)? \nz.mem [382] : 1'b0;
  assign r_data_o[39] = (N8)? \nz.mem [39] : 
                        (N10)? \nz.mem [153] : 
                        (N9)? \nz.mem [267] : 
                        (N11)? \nz.mem [381] : 1'b0;
  assign r_data_o[38] = (N8)? \nz.mem [38] : 
                        (N10)? \nz.mem [152] : 
                        (N9)? \nz.mem [266] : 
                        (N11)? \nz.mem [380] : 1'b0;
  assign r_data_o[37] = (N8)? \nz.mem [37] : 
                        (N10)? \nz.mem [151] : 
                        (N9)? \nz.mem [265] : 
                        (N11)? \nz.mem [379] : 1'b0;
  assign r_data_o[36] = (N8)? \nz.mem [36] : 
                        (N10)? \nz.mem [150] : 
                        (N9)? \nz.mem [264] : 
                        (N11)? \nz.mem [378] : 1'b0;
  assign r_data_o[35] = (N8)? \nz.mem [35] : 
                        (N10)? \nz.mem [149] : 
                        (N9)? \nz.mem [263] : 
                        (N11)? \nz.mem [377] : 1'b0;
  assign r_data_o[34] = (N8)? \nz.mem [34] : 
                        (N10)? \nz.mem [148] : 
                        (N9)? \nz.mem [262] : 
                        (N11)? \nz.mem [376] : 1'b0;
  assign r_data_o[33] = (N8)? \nz.mem [33] : 
                        (N10)? \nz.mem [147] : 
                        (N9)? \nz.mem [261] : 
                        (N11)? \nz.mem [375] : 1'b0;
  assign r_data_o[32] = (N8)? \nz.mem [32] : 
                        (N10)? \nz.mem [146] : 
                        (N9)? \nz.mem [260] : 
                        (N11)? \nz.mem [374] : 1'b0;
  assign r_data_o[31] = (N8)? \nz.mem [31] : 
                        (N10)? \nz.mem [145] : 
                        (N9)? \nz.mem [259] : 
                        (N11)? \nz.mem [373] : 1'b0;
  assign r_data_o[30] = (N8)? \nz.mem [30] : 
                        (N10)? \nz.mem [144] : 
                        (N9)? \nz.mem [258] : 
                        (N11)? \nz.mem [372] : 1'b0;
  assign r_data_o[29] = (N8)? \nz.mem [29] : 
                        (N10)? \nz.mem [143] : 
                        (N9)? \nz.mem [257] : 
                        (N11)? \nz.mem [371] : 1'b0;
  assign r_data_o[28] = (N8)? \nz.mem [28] : 
                        (N10)? \nz.mem [142] : 
                        (N9)? \nz.mem [256] : 
                        (N11)? \nz.mem [370] : 1'b0;
  assign r_data_o[27] = (N8)? \nz.mem [27] : 
                        (N10)? \nz.mem [141] : 
                        (N9)? \nz.mem [255] : 
                        (N11)? \nz.mem [369] : 1'b0;
  assign r_data_o[26] = (N8)? \nz.mem [26] : 
                        (N10)? \nz.mem [140] : 
                        (N9)? \nz.mem [254] : 
                        (N11)? \nz.mem [368] : 1'b0;
  assign r_data_o[25] = (N8)? \nz.mem [25] : 
                        (N10)? \nz.mem [139] : 
                        (N9)? \nz.mem [253] : 
                        (N11)? \nz.mem [367] : 1'b0;
  assign r_data_o[24] = (N8)? \nz.mem [24] : 
                        (N10)? \nz.mem [138] : 
                        (N9)? \nz.mem [252] : 
                        (N11)? \nz.mem [366] : 1'b0;
  assign r_data_o[23] = (N8)? \nz.mem [23] : 
                        (N10)? \nz.mem [137] : 
                        (N9)? \nz.mem [251] : 
                        (N11)? \nz.mem [365] : 1'b0;
  assign r_data_o[22] = (N8)? \nz.mem [22] : 
                        (N10)? \nz.mem [136] : 
                        (N9)? \nz.mem [250] : 
                        (N11)? \nz.mem [364] : 1'b0;
  assign r_data_o[21] = (N8)? \nz.mem [21] : 
                        (N10)? \nz.mem [135] : 
                        (N9)? \nz.mem [249] : 
                        (N11)? \nz.mem [363] : 1'b0;
  assign r_data_o[20] = (N8)? \nz.mem [20] : 
                        (N10)? \nz.mem [134] : 
                        (N9)? \nz.mem [248] : 
                        (N11)? \nz.mem [362] : 1'b0;
  assign r_data_o[19] = (N8)? \nz.mem [19] : 
                        (N10)? \nz.mem [133] : 
                        (N9)? \nz.mem [247] : 
                        (N11)? \nz.mem [361] : 1'b0;
  assign r_data_o[18] = (N8)? \nz.mem [18] : 
                        (N10)? \nz.mem [132] : 
                        (N9)? \nz.mem [246] : 
                        (N11)? \nz.mem [360] : 1'b0;
  assign r_data_o[17] = (N8)? \nz.mem [17] : 
                        (N10)? \nz.mem [131] : 
                        (N9)? \nz.mem [245] : 
                        (N11)? \nz.mem [359] : 1'b0;
  assign r_data_o[16] = (N8)? \nz.mem [16] : 
                        (N10)? \nz.mem [130] : 
                        (N9)? \nz.mem [244] : 
                        (N11)? \nz.mem [358] : 1'b0;
  assign r_data_o[15] = (N8)? \nz.mem [15] : 
                        (N10)? \nz.mem [129] : 
                        (N9)? \nz.mem [243] : 
                        (N11)? \nz.mem [357] : 1'b0;
  assign r_data_o[14] = (N8)? \nz.mem [14] : 
                        (N10)? \nz.mem [128] : 
                        (N9)? \nz.mem [242] : 
                        (N11)? \nz.mem [356] : 1'b0;
  assign r_data_o[13] = (N8)? \nz.mem [13] : 
                        (N10)? \nz.mem [127] : 
                        (N9)? \nz.mem [241] : 
                        (N11)? \nz.mem [355] : 1'b0;
  assign r_data_o[12] = (N8)? \nz.mem [12] : 
                        (N10)? \nz.mem [126] : 
                        (N9)? \nz.mem [240] : 
                        (N11)? \nz.mem [354] : 1'b0;
  assign r_data_o[11] = (N8)? \nz.mem [11] : 
                        (N10)? \nz.mem [125] : 
                        (N9)? \nz.mem [239] : 
                        (N11)? \nz.mem [353] : 1'b0;
  assign r_data_o[10] = (N8)? \nz.mem [10] : 
                        (N10)? \nz.mem [124] : 
                        (N9)? \nz.mem [238] : 
                        (N11)? \nz.mem [352] : 1'b0;
  assign r_data_o[9] = (N8)? \nz.mem [9] : 
                       (N10)? \nz.mem [123] : 
                       (N9)? \nz.mem [237] : 
                       (N11)? \nz.mem [351] : 1'b0;
  assign r_data_o[8] = (N8)? \nz.mem [8] : 
                       (N10)? \nz.mem [122] : 
                       (N9)? \nz.mem [236] : 
                       (N11)? \nz.mem [350] : 1'b0;
  assign r_data_o[7] = (N8)? \nz.mem [7] : 
                       (N10)? \nz.mem [121] : 
                       (N9)? \nz.mem [235] : 
                       (N11)? \nz.mem [349] : 1'b0;
  assign r_data_o[6] = (N8)? \nz.mem [6] : 
                       (N10)? \nz.mem [120] : 
                       (N9)? \nz.mem [234] : 
                       (N11)? \nz.mem [348] : 1'b0;
  assign r_data_o[5] = (N8)? \nz.mem [5] : 
                       (N10)? \nz.mem [119] : 
                       (N9)? \nz.mem [233] : 
                       (N11)? \nz.mem [347] : 1'b0;
  assign r_data_o[4] = (N8)? \nz.mem [4] : 
                       (N10)? \nz.mem [118] : 
                       (N9)? \nz.mem [232] : 
                       (N11)? \nz.mem [346] : 1'b0;
  assign r_data_o[3] = (N8)? \nz.mem [3] : 
                       (N10)? \nz.mem [117] : 
                       (N9)? \nz.mem [231] : 
                       (N11)? \nz.mem [345] : 1'b0;
  assign r_data_o[2] = (N8)? \nz.mem [2] : 
                       (N10)? \nz.mem [116] : 
                       (N9)? \nz.mem [230] : 
                       (N11)? \nz.mem [344] : 1'b0;
  assign r_data_o[1] = (N8)? \nz.mem [1] : 
                       (N10)? \nz.mem [115] : 
                       (N9)? \nz.mem [229] : 
                       (N11)? \nz.mem [343] : 1'b0;
  assign r_data_o[0] = (N8)? \nz.mem [0] : 
                       (N10)? \nz.mem [114] : 
                       (N9)? \nz.mem [228] : 
                       (N11)? \nz.mem [342] : 1'b0;
  assign N16 = w_addr_i[0] & w_addr_i[1];
  assign N15 = N0 & w_addr_i[1];
  assign N0 = ~w_addr_i[0];
  assign N14 = w_addr_i[0] & N1;
  assign N1 = ~w_addr_i[1];
  assign N13 = N2 & N3;
  assign N2 = ~w_addr_i[0];
  assign N3 = ~w_addr_i[1];
  assign { N24, N23, N22, N21, N20, N19, N18, N17 } = (N4)? { N16, N16, N15, N15, N14, N14, N13, N13 } : 
                                                      (N5)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N4 = w_v_i;
  assign N5 = N12;
  assign N6 = ~r_addr_i[0];
  assign N7 = ~r_addr_i[1];
  assign N8 = N6 & N7;
  assign N9 = N6 & r_addr_i[1];
  assign N10 = r_addr_i[0] & N7;
  assign N11 = r_addr_i[0] & r_addr_i[1];
  assign N12 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N23) begin
      \nz.mem_455_sv2v_reg  <= w_data_i[113];
      \nz.mem_454_sv2v_reg  <= w_data_i[112];
      \nz.mem_453_sv2v_reg  <= w_data_i[111];
      \nz.mem_452_sv2v_reg  <= w_data_i[110];
      \nz.mem_451_sv2v_reg  <= w_data_i[109];
      \nz.mem_450_sv2v_reg  <= w_data_i[108];
      \nz.mem_449_sv2v_reg  <= w_data_i[107];
      \nz.mem_448_sv2v_reg  <= w_data_i[106];
      \nz.mem_447_sv2v_reg  <= w_data_i[105];
      \nz.mem_446_sv2v_reg  <= w_data_i[104];
      \nz.mem_445_sv2v_reg  <= w_data_i[103];
      \nz.mem_444_sv2v_reg  <= w_data_i[102];
      \nz.mem_443_sv2v_reg  <= w_data_i[101];
      \nz.mem_442_sv2v_reg  <= w_data_i[100];
      \nz.mem_441_sv2v_reg  <= w_data_i[99];
      \nz.mem_440_sv2v_reg  <= w_data_i[98];
      \nz.mem_439_sv2v_reg  <= w_data_i[97];
      \nz.mem_438_sv2v_reg  <= w_data_i[96];
      \nz.mem_437_sv2v_reg  <= w_data_i[95];
      \nz.mem_436_sv2v_reg  <= w_data_i[94];
      \nz.mem_435_sv2v_reg  <= w_data_i[93];
      \nz.mem_434_sv2v_reg  <= w_data_i[92];
      \nz.mem_433_sv2v_reg  <= w_data_i[91];
      \nz.mem_432_sv2v_reg  <= w_data_i[90];
      \nz.mem_431_sv2v_reg  <= w_data_i[89];
      \nz.mem_430_sv2v_reg  <= w_data_i[88];
      \nz.mem_429_sv2v_reg  <= w_data_i[87];
      \nz.mem_428_sv2v_reg  <= w_data_i[86];
      \nz.mem_427_sv2v_reg  <= w_data_i[85];
      \nz.mem_426_sv2v_reg  <= w_data_i[84];
      \nz.mem_425_sv2v_reg  <= w_data_i[83];
      \nz.mem_424_sv2v_reg  <= w_data_i[82];
      \nz.mem_423_sv2v_reg  <= w_data_i[81];
      \nz.mem_422_sv2v_reg  <= w_data_i[80];
      \nz.mem_421_sv2v_reg  <= w_data_i[79];
      \nz.mem_420_sv2v_reg  <= w_data_i[78];
      \nz.mem_419_sv2v_reg  <= w_data_i[77];
      \nz.mem_418_sv2v_reg  <= w_data_i[76];
      \nz.mem_417_sv2v_reg  <= w_data_i[75];
      \nz.mem_416_sv2v_reg  <= w_data_i[74];
      \nz.mem_415_sv2v_reg  <= w_data_i[73];
      \nz.mem_414_sv2v_reg  <= w_data_i[72];
      \nz.mem_413_sv2v_reg  <= w_data_i[71];
      \nz.mem_412_sv2v_reg  <= w_data_i[70];
      \nz.mem_411_sv2v_reg  <= w_data_i[69];
      \nz.mem_410_sv2v_reg  <= w_data_i[68];
      \nz.mem_409_sv2v_reg  <= w_data_i[67];
      \nz.mem_408_sv2v_reg  <= w_data_i[66];
      \nz.mem_407_sv2v_reg  <= w_data_i[65];
      \nz.mem_406_sv2v_reg  <= w_data_i[64];
      \nz.mem_405_sv2v_reg  <= w_data_i[63];
      \nz.mem_404_sv2v_reg  <= w_data_i[62];
      \nz.mem_403_sv2v_reg  <= w_data_i[61];
      \nz.mem_402_sv2v_reg  <= w_data_i[60];
      \nz.mem_401_sv2v_reg  <= w_data_i[59];
      \nz.mem_400_sv2v_reg  <= w_data_i[58];
      \nz.mem_399_sv2v_reg  <= w_data_i[57];
      \nz.mem_398_sv2v_reg  <= w_data_i[56];
      \nz.mem_397_sv2v_reg  <= w_data_i[55];
      \nz.mem_396_sv2v_reg  <= w_data_i[54];
      \nz.mem_395_sv2v_reg  <= w_data_i[53];
      \nz.mem_394_sv2v_reg  <= w_data_i[52];
      \nz.mem_393_sv2v_reg  <= w_data_i[51];
      \nz.mem_392_sv2v_reg  <= w_data_i[50];
      \nz.mem_391_sv2v_reg  <= w_data_i[49];
      \nz.mem_390_sv2v_reg  <= w_data_i[48];
      \nz.mem_389_sv2v_reg  <= w_data_i[47];
      \nz.mem_388_sv2v_reg  <= w_data_i[46];
      \nz.mem_387_sv2v_reg  <= w_data_i[45];
      \nz.mem_386_sv2v_reg  <= w_data_i[44];
      \nz.mem_385_sv2v_reg  <= w_data_i[43];
      \nz.mem_384_sv2v_reg  <= w_data_i[42];
      \nz.mem_383_sv2v_reg  <= w_data_i[41];
      \nz.mem_382_sv2v_reg  <= w_data_i[40];
      \nz.mem_381_sv2v_reg  <= w_data_i[39];
      \nz.mem_380_sv2v_reg  <= w_data_i[38];
      \nz.mem_379_sv2v_reg  <= w_data_i[37];
      \nz.mem_378_sv2v_reg  <= w_data_i[36];
      \nz.mem_377_sv2v_reg  <= w_data_i[35];
      \nz.mem_376_sv2v_reg  <= w_data_i[34];
      \nz.mem_375_sv2v_reg  <= w_data_i[33];
      \nz.mem_374_sv2v_reg  <= w_data_i[32];
      \nz.mem_373_sv2v_reg  <= w_data_i[31];
      \nz.mem_372_sv2v_reg  <= w_data_i[30];
      \nz.mem_371_sv2v_reg  <= w_data_i[29];
      \nz.mem_370_sv2v_reg  <= w_data_i[28];
      \nz.mem_369_sv2v_reg  <= w_data_i[27];
      \nz.mem_368_sv2v_reg  <= w_data_i[26];
      \nz.mem_367_sv2v_reg  <= w_data_i[25];
      \nz.mem_366_sv2v_reg  <= w_data_i[24];
      \nz.mem_365_sv2v_reg  <= w_data_i[23];
      \nz.mem_364_sv2v_reg  <= w_data_i[22];
      \nz.mem_363_sv2v_reg  <= w_data_i[21];
      \nz.mem_362_sv2v_reg  <= w_data_i[20];
      \nz.mem_361_sv2v_reg  <= w_data_i[19];
      \nz.mem_360_sv2v_reg  <= w_data_i[18];
      \nz.mem_359_sv2v_reg  <= w_data_i[17];
      \nz.mem_358_sv2v_reg  <= w_data_i[16];
      \nz.mem_357_sv2v_reg  <= w_data_i[15];
      \nz.mem_342_sv2v_reg  <= w_data_i[0];
    end 
    if(N24) begin
      \nz.mem_356_sv2v_reg  <= w_data_i[14];
      \nz.mem_355_sv2v_reg  <= w_data_i[13];
      \nz.mem_354_sv2v_reg  <= w_data_i[12];
      \nz.mem_353_sv2v_reg  <= w_data_i[11];
      \nz.mem_352_sv2v_reg  <= w_data_i[10];
      \nz.mem_351_sv2v_reg  <= w_data_i[9];
      \nz.mem_350_sv2v_reg  <= w_data_i[8];
      \nz.mem_349_sv2v_reg  <= w_data_i[7];
      \nz.mem_348_sv2v_reg  <= w_data_i[6];
      \nz.mem_347_sv2v_reg  <= w_data_i[5];
      \nz.mem_346_sv2v_reg  <= w_data_i[4];
      \nz.mem_345_sv2v_reg  <= w_data_i[3];
      \nz.mem_344_sv2v_reg  <= w_data_i[2];
      \nz.mem_343_sv2v_reg  <= w_data_i[1];
    end 
    if(N21) begin
      \nz.mem_341_sv2v_reg  <= w_data_i[113];
      \nz.mem_340_sv2v_reg  <= w_data_i[112];
      \nz.mem_339_sv2v_reg  <= w_data_i[111];
      \nz.mem_338_sv2v_reg  <= w_data_i[110];
      \nz.mem_337_sv2v_reg  <= w_data_i[109];
      \nz.mem_336_sv2v_reg  <= w_data_i[108];
      \nz.mem_335_sv2v_reg  <= w_data_i[107];
      \nz.mem_334_sv2v_reg  <= w_data_i[106];
      \nz.mem_333_sv2v_reg  <= w_data_i[105];
      \nz.mem_332_sv2v_reg  <= w_data_i[104];
      \nz.mem_331_sv2v_reg  <= w_data_i[103];
      \nz.mem_330_sv2v_reg  <= w_data_i[102];
      \nz.mem_329_sv2v_reg  <= w_data_i[101];
      \nz.mem_328_sv2v_reg  <= w_data_i[100];
      \nz.mem_327_sv2v_reg  <= w_data_i[99];
      \nz.mem_326_sv2v_reg  <= w_data_i[98];
      \nz.mem_325_sv2v_reg  <= w_data_i[97];
      \nz.mem_324_sv2v_reg  <= w_data_i[96];
      \nz.mem_323_sv2v_reg  <= w_data_i[95];
      \nz.mem_322_sv2v_reg  <= w_data_i[94];
      \nz.mem_321_sv2v_reg  <= w_data_i[93];
      \nz.mem_320_sv2v_reg  <= w_data_i[92];
      \nz.mem_319_sv2v_reg  <= w_data_i[91];
      \nz.mem_318_sv2v_reg  <= w_data_i[90];
      \nz.mem_317_sv2v_reg  <= w_data_i[89];
      \nz.mem_316_sv2v_reg  <= w_data_i[88];
      \nz.mem_315_sv2v_reg  <= w_data_i[87];
      \nz.mem_314_sv2v_reg  <= w_data_i[86];
      \nz.mem_313_sv2v_reg  <= w_data_i[85];
      \nz.mem_312_sv2v_reg  <= w_data_i[84];
      \nz.mem_311_sv2v_reg  <= w_data_i[83];
      \nz.mem_310_sv2v_reg  <= w_data_i[82];
      \nz.mem_309_sv2v_reg  <= w_data_i[81];
      \nz.mem_308_sv2v_reg  <= w_data_i[80];
      \nz.mem_307_sv2v_reg  <= w_data_i[79];
      \nz.mem_306_sv2v_reg  <= w_data_i[78];
      \nz.mem_305_sv2v_reg  <= w_data_i[77];
      \nz.mem_304_sv2v_reg  <= w_data_i[76];
      \nz.mem_303_sv2v_reg  <= w_data_i[75];
      \nz.mem_302_sv2v_reg  <= w_data_i[74];
      \nz.mem_301_sv2v_reg  <= w_data_i[73];
      \nz.mem_300_sv2v_reg  <= w_data_i[72];
      \nz.mem_299_sv2v_reg  <= w_data_i[71];
      \nz.mem_298_sv2v_reg  <= w_data_i[70];
      \nz.mem_297_sv2v_reg  <= w_data_i[69];
      \nz.mem_296_sv2v_reg  <= w_data_i[68];
      \nz.mem_295_sv2v_reg  <= w_data_i[67];
      \nz.mem_294_sv2v_reg  <= w_data_i[66];
      \nz.mem_293_sv2v_reg  <= w_data_i[65];
      \nz.mem_292_sv2v_reg  <= w_data_i[64];
      \nz.mem_291_sv2v_reg  <= w_data_i[63];
      \nz.mem_290_sv2v_reg  <= w_data_i[62];
      \nz.mem_289_sv2v_reg  <= w_data_i[61];
      \nz.mem_288_sv2v_reg  <= w_data_i[60];
      \nz.mem_287_sv2v_reg  <= w_data_i[59];
      \nz.mem_286_sv2v_reg  <= w_data_i[58];
      \nz.mem_285_sv2v_reg  <= w_data_i[57];
      \nz.mem_284_sv2v_reg  <= w_data_i[56];
      \nz.mem_283_sv2v_reg  <= w_data_i[55];
      \nz.mem_282_sv2v_reg  <= w_data_i[54];
      \nz.mem_281_sv2v_reg  <= w_data_i[53];
      \nz.mem_280_sv2v_reg  <= w_data_i[52];
      \nz.mem_279_sv2v_reg  <= w_data_i[51];
      \nz.mem_278_sv2v_reg  <= w_data_i[50];
      \nz.mem_277_sv2v_reg  <= w_data_i[49];
      \nz.mem_276_sv2v_reg  <= w_data_i[48];
      \nz.mem_275_sv2v_reg  <= w_data_i[47];
      \nz.mem_274_sv2v_reg  <= w_data_i[46];
      \nz.mem_273_sv2v_reg  <= w_data_i[45];
      \nz.mem_272_sv2v_reg  <= w_data_i[44];
      \nz.mem_271_sv2v_reg  <= w_data_i[43];
      \nz.mem_270_sv2v_reg  <= w_data_i[42];
      \nz.mem_269_sv2v_reg  <= w_data_i[41];
      \nz.mem_268_sv2v_reg  <= w_data_i[40];
      \nz.mem_267_sv2v_reg  <= w_data_i[39];
      \nz.mem_266_sv2v_reg  <= w_data_i[38];
      \nz.mem_265_sv2v_reg  <= w_data_i[37];
      \nz.mem_264_sv2v_reg  <= w_data_i[36];
      \nz.mem_263_sv2v_reg  <= w_data_i[35];
      \nz.mem_262_sv2v_reg  <= w_data_i[34];
      \nz.mem_261_sv2v_reg  <= w_data_i[33];
      \nz.mem_260_sv2v_reg  <= w_data_i[32];
      \nz.mem_259_sv2v_reg  <= w_data_i[31];
      \nz.mem_258_sv2v_reg  <= w_data_i[30];
      \nz.mem_257_sv2v_reg  <= w_data_i[29];
      \nz.mem_256_sv2v_reg  <= w_data_i[28];
      \nz.mem_255_sv2v_reg  <= w_data_i[27];
      \nz.mem_254_sv2v_reg  <= w_data_i[26];
      \nz.mem_253_sv2v_reg  <= w_data_i[25];
      \nz.mem_252_sv2v_reg  <= w_data_i[24];
      \nz.mem_251_sv2v_reg  <= w_data_i[23];
      \nz.mem_250_sv2v_reg  <= w_data_i[22];
      \nz.mem_249_sv2v_reg  <= w_data_i[21];
      \nz.mem_248_sv2v_reg  <= w_data_i[20];
      \nz.mem_247_sv2v_reg  <= w_data_i[19];
      \nz.mem_246_sv2v_reg  <= w_data_i[18];
      \nz.mem_245_sv2v_reg  <= w_data_i[17];
      \nz.mem_244_sv2v_reg  <= w_data_i[16];
      \nz.mem_243_sv2v_reg  <= w_data_i[15];
      \nz.mem_228_sv2v_reg  <= w_data_i[0];
    end 
    if(N22) begin
      \nz.mem_242_sv2v_reg  <= w_data_i[14];
      \nz.mem_241_sv2v_reg  <= w_data_i[13];
      \nz.mem_240_sv2v_reg  <= w_data_i[12];
      \nz.mem_239_sv2v_reg  <= w_data_i[11];
      \nz.mem_238_sv2v_reg  <= w_data_i[10];
      \nz.mem_237_sv2v_reg  <= w_data_i[9];
      \nz.mem_236_sv2v_reg  <= w_data_i[8];
      \nz.mem_235_sv2v_reg  <= w_data_i[7];
      \nz.mem_234_sv2v_reg  <= w_data_i[6];
      \nz.mem_233_sv2v_reg  <= w_data_i[5];
      \nz.mem_232_sv2v_reg  <= w_data_i[4];
      \nz.mem_231_sv2v_reg  <= w_data_i[3];
      \nz.mem_230_sv2v_reg  <= w_data_i[2];
      \nz.mem_229_sv2v_reg  <= w_data_i[1];
    end 
    if(N19) begin
      \nz.mem_227_sv2v_reg  <= w_data_i[113];
      \nz.mem_226_sv2v_reg  <= w_data_i[112];
      \nz.mem_225_sv2v_reg  <= w_data_i[111];
      \nz.mem_224_sv2v_reg  <= w_data_i[110];
      \nz.mem_223_sv2v_reg  <= w_data_i[109];
      \nz.mem_222_sv2v_reg  <= w_data_i[108];
      \nz.mem_221_sv2v_reg  <= w_data_i[107];
      \nz.mem_220_sv2v_reg  <= w_data_i[106];
      \nz.mem_219_sv2v_reg  <= w_data_i[105];
      \nz.mem_218_sv2v_reg  <= w_data_i[104];
      \nz.mem_217_sv2v_reg  <= w_data_i[103];
      \nz.mem_216_sv2v_reg  <= w_data_i[102];
      \nz.mem_215_sv2v_reg  <= w_data_i[101];
      \nz.mem_214_sv2v_reg  <= w_data_i[100];
      \nz.mem_213_sv2v_reg  <= w_data_i[99];
      \nz.mem_212_sv2v_reg  <= w_data_i[98];
      \nz.mem_211_sv2v_reg  <= w_data_i[97];
      \nz.mem_210_sv2v_reg  <= w_data_i[96];
      \nz.mem_209_sv2v_reg  <= w_data_i[95];
      \nz.mem_208_sv2v_reg  <= w_data_i[94];
      \nz.mem_207_sv2v_reg  <= w_data_i[93];
      \nz.mem_206_sv2v_reg  <= w_data_i[92];
      \nz.mem_205_sv2v_reg  <= w_data_i[91];
      \nz.mem_204_sv2v_reg  <= w_data_i[90];
      \nz.mem_203_sv2v_reg  <= w_data_i[89];
      \nz.mem_202_sv2v_reg  <= w_data_i[88];
      \nz.mem_201_sv2v_reg  <= w_data_i[87];
      \nz.mem_200_sv2v_reg  <= w_data_i[86];
      \nz.mem_199_sv2v_reg  <= w_data_i[85];
      \nz.mem_198_sv2v_reg  <= w_data_i[84];
      \nz.mem_197_sv2v_reg  <= w_data_i[83];
      \nz.mem_196_sv2v_reg  <= w_data_i[82];
      \nz.mem_195_sv2v_reg  <= w_data_i[81];
      \nz.mem_194_sv2v_reg  <= w_data_i[80];
      \nz.mem_193_sv2v_reg  <= w_data_i[79];
      \nz.mem_192_sv2v_reg  <= w_data_i[78];
      \nz.mem_191_sv2v_reg  <= w_data_i[77];
      \nz.mem_190_sv2v_reg  <= w_data_i[76];
      \nz.mem_189_sv2v_reg  <= w_data_i[75];
      \nz.mem_188_sv2v_reg  <= w_data_i[74];
      \nz.mem_187_sv2v_reg  <= w_data_i[73];
      \nz.mem_186_sv2v_reg  <= w_data_i[72];
      \nz.mem_185_sv2v_reg  <= w_data_i[71];
      \nz.mem_184_sv2v_reg  <= w_data_i[70];
      \nz.mem_183_sv2v_reg  <= w_data_i[69];
      \nz.mem_182_sv2v_reg  <= w_data_i[68];
      \nz.mem_181_sv2v_reg  <= w_data_i[67];
      \nz.mem_180_sv2v_reg  <= w_data_i[66];
      \nz.mem_179_sv2v_reg  <= w_data_i[65];
      \nz.mem_178_sv2v_reg  <= w_data_i[64];
      \nz.mem_177_sv2v_reg  <= w_data_i[63];
      \nz.mem_176_sv2v_reg  <= w_data_i[62];
      \nz.mem_175_sv2v_reg  <= w_data_i[61];
      \nz.mem_174_sv2v_reg  <= w_data_i[60];
      \nz.mem_173_sv2v_reg  <= w_data_i[59];
      \nz.mem_172_sv2v_reg  <= w_data_i[58];
      \nz.mem_171_sv2v_reg  <= w_data_i[57];
      \nz.mem_170_sv2v_reg  <= w_data_i[56];
      \nz.mem_169_sv2v_reg  <= w_data_i[55];
      \nz.mem_168_sv2v_reg  <= w_data_i[54];
      \nz.mem_167_sv2v_reg  <= w_data_i[53];
      \nz.mem_166_sv2v_reg  <= w_data_i[52];
      \nz.mem_165_sv2v_reg  <= w_data_i[51];
      \nz.mem_164_sv2v_reg  <= w_data_i[50];
      \nz.mem_163_sv2v_reg  <= w_data_i[49];
      \nz.mem_162_sv2v_reg  <= w_data_i[48];
      \nz.mem_161_sv2v_reg  <= w_data_i[47];
      \nz.mem_160_sv2v_reg  <= w_data_i[46];
      \nz.mem_159_sv2v_reg  <= w_data_i[45];
      \nz.mem_158_sv2v_reg  <= w_data_i[44];
      \nz.mem_157_sv2v_reg  <= w_data_i[43];
      \nz.mem_156_sv2v_reg  <= w_data_i[42];
      \nz.mem_155_sv2v_reg  <= w_data_i[41];
      \nz.mem_154_sv2v_reg  <= w_data_i[40];
      \nz.mem_153_sv2v_reg  <= w_data_i[39];
      \nz.mem_152_sv2v_reg  <= w_data_i[38];
      \nz.mem_151_sv2v_reg  <= w_data_i[37];
      \nz.mem_150_sv2v_reg  <= w_data_i[36];
      \nz.mem_149_sv2v_reg  <= w_data_i[35];
      \nz.mem_148_sv2v_reg  <= w_data_i[34];
      \nz.mem_147_sv2v_reg  <= w_data_i[33];
      \nz.mem_146_sv2v_reg  <= w_data_i[32];
      \nz.mem_145_sv2v_reg  <= w_data_i[31];
      \nz.mem_144_sv2v_reg  <= w_data_i[30];
      \nz.mem_143_sv2v_reg  <= w_data_i[29];
      \nz.mem_142_sv2v_reg  <= w_data_i[28];
      \nz.mem_141_sv2v_reg  <= w_data_i[27];
      \nz.mem_140_sv2v_reg  <= w_data_i[26];
      \nz.mem_139_sv2v_reg  <= w_data_i[25];
      \nz.mem_138_sv2v_reg  <= w_data_i[24];
      \nz.mem_137_sv2v_reg  <= w_data_i[23];
      \nz.mem_136_sv2v_reg  <= w_data_i[22];
      \nz.mem_135_sv2v_reg  <= w_data_i[21];
      \nz.mem_134_sv2v_reg  <= w_data_i[20];
      \nz.mem_133_sv2v_reg  <= w_data_i[19];
      \nz.mem_132_sv2v_reg  <= w_data_i[18];
      \nz.mem_131_sv2v_reg  <= w_data_i[17];
      \nz.mem_130_sv2v_reg  <= w_data_i[16];
      \nz.mem_129_sv2v_reg  <= w_data_i[15];
      \nz.mem_114_sv2v_reg  <= w_data_i[0];
    end 
    if(N20) begin
      \nz.mem_128_sv2v_reg  <= w_data_i[14];
      \nz.mem_127_sv2v_reg  <= w_data_i[13];
      \nz.mem_126_sv2v_reg  <= w_data_i[12];
      \nz.mem_125_sv2v_reg  <= w_data_i[11];
      \nz.mem_124_sv2v_reg  <= w_data_i[10];
      \nz.mem_123_sv2v_reg  <= w_data_i[9];
      \nz.mem_122_sv2v_reg  <= w_data_i[8];
      \nz.mem_121_sv2v_reg  <= w_data_i[7];
      \nz.mem_120_sv2v_reg  <= w_data_i[6];
      \nz.mem_119_sv2v_reg  <= w_data_i[5];
      \nz.mem_118_sv2v_reg  <= w_data_i[4];
      \nz.mem_117_sv2v_reg  <= w_data_i[3];
      \nz.mem_116_sv2v_reg  <= w_data_i[2];
      \nz.mem_115_sv2v_reg  <= w_data_i[1];
    end 
    if(N17) begin
      \nz.mem_113_sv2v_reg  <= w_data_i[113];
      \nz.mem_112_sv2v_reg  <= w_data_i[112];
      \nz.mem_111_sv2v_reg  <= w_data_i[111];
      \nz.mem_110_sv2v_reg  <= w_data_i[110];
      \nz.mem_109_sv2v_reg  <= w_data_i[109];
      \nz.mem_108_sv2v_reg  <= w_data_i[108];
      \nz.mem_107_sv2v_reg  <= w_data_i[107];
      \nz.mem_106_sv2v_reg  <= w_data_i[106];
      \nz.mem_105_sv2v_reg  <= w_data_i[105];
      \nz.mem_104_sv2v_reg  <= w_data_i[104];
      \nz.mem_103_sv2v_reg  <= w_data_i[103];
      \nz.mem_102_sv2v_reg  <= w_data_i[102];
      \nz.mem_101_sv2v_reg  <= w_data_i[101];
      \nz.mem_100_sv2v_reg  <= w_data_i[100];
      \nz.mem_99_sv2v_reg  <= w_data_i[99];
      \nz.mem_98_sv2v_reg  <= w_data_i[98];
      \nz.mem_97_sv2v_reg  <= w_data_i[97];
      \nz.mem_96_sv2v_reg  <= w_data_i[96];
      \nz.mem_95_sv2v_reg  <= w_data_i[95];
      \nz.mem_94_sv2v_reg  <= w_data_i[94];
      \nz.mem_93_sv2v_reg  <= w_data_i[93];
      \nz.mem_92_sv2v_reg  <= w_data_i[92];
      \nz.mem_91_sv2v_reg  <= w_data_i[91];
      \nz.mem_90_sv2v_reg  <= w_data_i[90];
      \nz.mem_89_sv2v_reg  <= w_data_i[89];
      \nz.mem_88_sv2v_reg  <= w_data_i[88];
      \nz.mem_87_sv2v_reg  <= w_data_i[87];
      \nz.mem_86_sv2v_reg  <= w_data_i[86];
      \nz.mem_85_sv2v_reg  <= w_data_i[85];
      \nz.mem_84_sv2v_reg  <= w_data_i[84];
      \nz.mem_83_sv2v_reg  <= w_data_i[83];
      \nz.mem_82_sv2v_reg  <= w_data_i[82];
      \nz.mem_81_sv2v_reg  <= w_data_i[81];
      \nz.mem_80_sv2v_reg  <= w_data_i[80];
      \nz.mem_79_sv2v_reg  <= w_data_i[79];
      \nz.mem_78_sv2v_reg  <= w_data_i[78];
      \nz.mem_77_sv2v_reg  <= w_data_i[77];
      \nz.mem_76_sv2v_reg  <= w_data_i[76];
      \nz.mem_75_sv2v_reg  <= w_data_i[75];
      \nz.mem_74_sv2v_reg  <= w_data_i[74];
      \nz.mem_73_sv2v_reg  <= w_data_i[73];
      \nz.mem_72_sv2v_reg  <= w_data_i[72];
      \nz.mem_71_sv2v_reg  <= w_data_i[71];
      \nz.mem_70_sv2v_reg  <= w_data_i[70];
      \nz.mem_69_sv2v_reg  <= w_data_i[69];
      \nz.mem_68_sv2v_reg  <= w_data_i[68];
      \nz.mem_67_sv2v_reg  <= w_data_i[67];
      \nz.mem_66_sv2v_reg  <= w_data_i[66];
      \nz.mem_65_sv2v_reg  <= w_data_i[65];
      \nz.mem_64_sv2v_reg  <= w_data_i[64];
      \nz.mem_63_sv2v_reg  <= w_data_i[63];
      \nz.mem_62_sv2v_reg  <= w_data_i[62];
      \nz.mem_61_sv2v_reg  <= w_data_i[61];
      \nz.mem_60_sv2v_reg  <= w_data_i[60];
      \nz.mem_59_sv2v_reg  <= w_data_i[59];
      \nz.mem_58_sv2v_reg  <= w_data_i[58];
      \nz.mem_57_sv2v_reg  <= w_data_i[57];
      \nz.mem_56_sv2v_reg  <= w_data_i[56];
      \nz.mem_55_sv2v_reg  <= w_data_i[55];
      \nz.mem_54_sv2v_reg  <= w_data_i[54];
      \nz.mem_53_sv2v_reg  <= w_data_i[53];
      \nz.mem_52_sv2v_reg  <= w_data_i[52];
      \nz.mem_51_sv2v_reg  <= w_data_i[51];
      \nz.mem_50_sv2v_reg  <= w_data_i[50];
      \nz.mem_49_sv2v_reg  <= w_data_i[49];
      \nz.mem_48_sv2v_reg  <= w_data_i[48];
      \nz.mem_47_sv2v_reg  <= w_data_i[47];
      \nz.mem_46_sv2v_reg  <= w_data_i[46];
      \nz.mem_45_sv2v_reg  <= w_data_i[45];
      \nz.mem_44_sv2v_reg  <= w_data_i[44];
      \nz.mem_43_sv2v_reg  <= w_data_i[43];
      \nz.mem_42_sv2v_reg  <= w_data_i[42];
      \nz.mem_41_sv2v_reg  <= w_data_i[41];
      \nz.mem_40_sv2v_reg  <= w_data_i[40];
      \nz.mem_39_sv2v_reg  <= w_data_i[39];
      \nz.mem_38_sv2v_reg  <= w_data_i[38];
      \nz.mem_37_sv2v_reg  <= w_data_i[37];
      \nz.mem_36_sv2v_reg  <= w_data_i[36];
      \nz.mem_35_sv2v_reg  <= w_data_i[35];
      \nz.mem_34_sv2v_reg  <= w_data_i[34];
      \nz.mem_33_sv2v_reg  <= w_data_i[33];
      \nz.mem_32_sv2v_reg  <= w_data_i[32];
      \nz.mem_31_sv2v_reg  <= w_data_i[31];
      \nz.mem_30_sv2v_reg  <= w_data_i[30];
      \nz.mem_29_sv2v_reg  <= w_data_i[29];
      \nz.mem_28_sv2v_reg  <= w_data_i[28];
      \nz.mem_27_sv2v_reg  <= w_data_i[27];
      \nz.mem_26_sv2v_reg  <= w_data_i[26];
      \nz.mem_25_sv2v_reg  <= w_data_i[25];
      \nz.mem_24_sv2v_reg  <= w_data_i[24];
      \nz.mem_23_sv2v_reg  <= w_data_i[23];
      \nz.mem_22_sv2v_reg  <= w_data_i[22];
      \nz.mem_21_sv2v_reg  <= w_data_i[21];
      \nz.mem_20_sv2v_reg  <= w_data_i[20];
      \nz.mem_19_sv2v_reg  <= w_data_i[19];
      \nz.mem_18_sv2v_reg  <= w_data_i[18];
      \nz.mem_17_sv2v_reg  <= w_data_i[17];
      \nz.mem_16_sv2v_reg  <= w_data_i[16];
      \nz.mem_15_sv2v_reg  <= w_data_i[15];
      \nz.mem_0_sv2v_reg  <= w_data_i[0];
    end 
    if(N18) begin
      \nz.mem_14_sv2v_reg  <= w_data_i[14];
      \nz.mem_13_sv2v_reg  <= w_data_i[13];
      \nz.mem_12_sv2v_reg  <= w_data_i[12];
      \nz.mem_11_sv2v_reg  <= w_data_i[11];
      \nz.mem_10_sv2v_reg  <= w_data_i[10];
      \nz.mem_9_sv2v_reg  <= w_data_i[9];
      \nz.mem_8_sv2v_reg  <= w_data_i[8];
      \nz.mem_7_sv2v_reg  <= w_data_i[7];
      \nz.mem_6_sv2v_reg  <= w_data_i[6];
      \nz.mem_5_sv2v_reg  <= w_data_i[5];
      \nz.mem_4_sv2v_reg  <= w_data_i[4];
      \nz.mem_3_sv2v_reg  <= w_data_i[3];
      \nz.mem_2_sv2v_reg  <= w_data_i[2];
      \nz.mem_1_sv2v_reg  <= w_data_i[1];
    end 
  end


endmodule



module bsg_mem_1r1w_114_00000004
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

  input [1:0] w_addr_i;
  input [113:0] w_data_i;
  input [1:0] r_addr_i;
  output [113:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [113:0] r_data_o;

  bsg_mem_1r1w_synth_114_00000004_0
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


  bsg_mem_1r1w_114_00000004
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

