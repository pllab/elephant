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



module bsg_mem_1r1w_synth_0000002b_16_1
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

  input [3:0] w_addr_i;
  input [42:0] w_data_i;
  input [3:0] r_addr_i;
  output [42:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [42:0] r_data_o;
  wire N0,N1,N2,N3,N4,N5,N6,N7,N8,N9,N10,N11,N12,N13,N14,N15,N16,N17,N18,N19,N20,N21,
  N22,N23,N24,N25,N26,N27,N28,N29,N30,N31,N32,N33,N34,N35,N36,N37,N38,N39,N40,N41,
  N42,N43,N44,N45,N46,N47,N48,N49,N50,N51,N52,N53,N54,N55,N56,N57,N58,N59,N60,N61,
  N62,N63,N64,N65,N66,N67,N68,N69,N70,N71,N72,N73,N74,N75,N76,N77,N78,N79,N80,N81,
  N82;
  wire [687:0] \nz.mem ;
  reg \nz.mem_687_sv2v_reg ,\nz.mem_686_sv2v_reg ,\nz.mem_685_sv2v_reg ,
  \nz.mem_684_sv2v_reg ,\nz.mem_683_sv2v_reg ,\nz.mem_682_sv2v_reg ,\nz.mem_681_sv2v_reg ,
  \nz.mem_680_sv2v_reg ,\nz.mem_679_sv2v_reg ,\nz.mem_678_sv2v_reg ,
  \nz.mem_677_sv2v_reg ,\nz.mem_676_sv2v_reg ,\nz.mem_675_sv2v_reg ,\nz.mem_674_sv2v_reg ,
  \nz.mem_673_sv2v_reg ,\nz.mem_672_sv2v_reg ,\nz.mem_671_sv2v_reg ,\nz.mem_670_sv2v_reg ,
  \nz.mem_669_sv2v_reg ,\nz.mem_668_sv2v_reg ,\nz.mem_667_sv2v_reg ,
  \nz.mem_666_sv2v_reg ,\nz.mem_665_sv2v_reg ,\nz.mem_664_sv2v_reg ,\nz.mem_663_sv2v_reg ,
  \nz.mem_662_sv2v_reg ,\nz.mem_661_sv2v_reg ,\nz.mem_660_sv2v_reg ,\nz.mem_659_sv2v_reg ,
  \nz.mem_658_sv2v_reg ,\nz.mem_657_sv2v_reg ,\nz.mem_656_sv2v_reg ,
  \nz.mem_655_sv2v_reg ,\nz.mem_654_sv2v_reg ,\nz.mem_653_sv2v_reg ,\nz.mem_652_sv2v_reg ,
  \nz.mem_651_sv2v_reg ,\nz.mem_650_sv2v_reg ,\nz.mem_649_sv2v_reg ,\nz.mem_648_sv2v_reg ,
  \nz.mem_647_sv2v_reg ,\nz.mem_646_sv2v_reg ,\nz.mem_645_sv2v_reg ,
  \nz.mem_644_sv2v_reg ,\nz.mem_643_sv2v_reg ,\nz.mem_642_sv2v_reg ,\nz.mem_641_sv2v_reg ,
  \nz.mem_640_sv2v_reg ,\nz.mem_639_sv2v_reg ,\nz.mem_638_sv2v_reg ,
  \nz.mem_637_sv2v_reg ,\nz.mem_636_sv2v_reg ,\nz.mem_635_sv2v_reg ,\nz.mem_634_sv2v_reg ,
  \nz.mem_633_sv2v_reg ,\nz.mem_632_sv2v_reg ,\nz.mem_631_sv2v_reg ,\nz.mem_630_sv2v_reg ,
  \nz.mem_629_sv2v_reg ,\nz.mem_628_sv2v_reg ,\nz.mem_627_sv2v_reg ,
  \nz.mem_626_sv2v_reg ,\nz.mem_625_sv2v_reg ,\nz.mem_624_sv2v_reg ,\nz.mem_623_sv2v_reg ,
  \nz.mem_622_sv2v_reg ,\nz.mem_621_sv2v_reg ,\nz.mem_620_sv2v_reg ,\nz.mem_619_sv2v_reg ,
  \nz.mem_618_sv2v_reg ,\nz.mem_617_sv2v_reg ,\nz.mem_616_sv2v_reg ,
  \nz.mem_615_sv2v_reg ,\nz.mem_614_sv2v_reg ,\nz.mem_613_sv2v_reg ,\nz.mem_612_sv2v_reg ,
  \nz.mem_611_sv2v_reg ,\nz.mem_610_sv2v_reg ,\nz.mem_609_sv2v_reg ,\nz.mem_608_sv2v_reg ,
  \nz.mem_607_sv2v_reg ,\nz.mem_606_sv2v_reg ,\nz.mem_605_sv2v_reg ,
  \nz.mem_604_sv2v_reg ,\nz.mem_603_sv2v_reg ,\nz.mem_602_sv2v_reg ,\nz.mem_601_sv2v_reg ,
  \nz.mem_600_sv2v_reg ,\nz.mem_599_sv2v_reg ,\nz.mem_598_sv2v_reg ,
  \nz.mem_597_sv2v_reg ,\nz.mem_596_sv2v_reg ,\nz.mem_595_sv2v_reg ,\nz.mem_594_sv2v_reg ,
  \nz.mem_593_sv2v_reg ,\nz.mem_592_sv2v_reg ,\nz.mem_591_sv2v_reg ,\nz.mem_590_sv2v_reg ,
  \nz.mem_589_sv2v_reg ,\nz.mem_588_sv2v_reg ,\nz.mem_587_sv2v_reg ,
  \nz.mem_586_sv2v_reg ,\nz.mem_585_sv2v_reg ,\nz.mem_584_sv2v_reg ,\nz.mem_583_sv2v_reg ,
  \nz.mem_582_sv2v_reg ,\nz.mem_581_sv2v_reg ,\nz.mem_580_sv2v_reg ,\nz.mem_579_sv2v_reg ,
  \nz.mem_578_sv2v_reg ,\nz.mem_577_sv2v_reg ,\nz.mem_576_sv2v_reg ,
  \nz.mem_575_sv2v_reg ,\nz.mem_574_sv2v_reg ,\nz.mem_573_sv2v_reg ,\nz.mem_572_sv2v_reg ,
  \nz.mem_571_sv2v_reg ,\nz.mem_570_sv2v_reg ,\nz.mem_569_sv2v_reg ,\nz.mem_568_sv2v_reg ,
  \nz.mem_567_sv2v_reg ,\nz.mem_566_sv2v_reg ,\nz.mem_565_sv2v_reg ,
  \nz.mem_564_sv2v_reg ,\nz.mem_563_sv2v_reg ,\nz.mem_562_sv2v_reg ,\nz.mem_561_sv2v_reg ,
  \nz.mem_560_sv2v_reg ,\nz.mem_559_sv2v_reg ,\nz.mem_558_sv2v_reg ,
  \nz.mem_557_sv2v_reg ,\nz.mem_556_sv2v_reg ,\nz.mem_555_sv2v_reg ,\nz.mem_554_sv2v_reg ,
  \nz.mem_553_sv2v_reg ,\nz.mem_552_sv2v_reg ,\nz.mem_551_sv2v_reg ,\nz.mem_550_sv2v_reg ,
  \nz.mem_549_sv2v_reg ,\nz.mem_548_sv2v_reg ,\nz.mem_547_sv2v_reg ,
  \nz.mem_546_sv2v_reg ,\nz.mem_545_sv2v_reg ,\nz.mem_544_sv2v_reg ,\nz.mem_543_sv2v_reg ,
  \nz.mem_542_sv2v_reg ,\nz.mem_541_sv2v_reg ,\nz.mem_540_sv2v_reg ,\nz.mem_539_sv2v_reg ,
  \nz.mem_538_sv2v_reg ,\nz.mem_537_sv2v_reg ,\nz.mem_536_sv2v_reg ,
  \nz.mem_535_sv2v_reg ,\nz.mem_534_sv2v_reg ,\nz.mem_533_sv2v_reg ,\nz.mem_532_sv2v_reg ,
  \nz.mem_531_sv2v_reg ,\nz.mem_530_sv2v_reg ,\nz.mem_529_sv2v_reg ,\nz.mem_528_sv2v_reg ,
  \nz.mem_527_sv2v_reg ,\nz.mem_526_sv2v_reg ,\nz.mem_525_sv2v_reg ,
  \nz.mem_524_sv2v_reg ,\nz.mem_523_sv2v_reg ,\nz.mem_522_sv2v_reg ,\nz.mem_521_sv2v_reg ,
  \nz.mem_520_sv2v_reg ,\nz.mem_519_sv2v_reg ,\nz.mem_518_sv2v_reg ,
  \nz.mem_517_sv2v_reg ,\nz.mem_516_sv2v_reg ,\nz.mem_515_sv2v_reg ,\nz.mem_514_sv2v_reg ,
  \nz.mem_513_sv2v_reg ,\nz.mem_512_sv2v_reg ,\nz.mem_511_sv2v_reg ,\nz.mem_510_sv2v_reg ,
  \nz.mem_509_sv2v_reg ,\nz.mem_508_sv2v_reg ,\nz.mem_507_sv2v_reg ,
  \nz.mem_506_sv2v_reg ,\nz.mem_505_sv2v_reg ,\nz.mem_504_sv2v_reg ,\nz.mem_503_sv2v_reg ,
  \nz.mem_502_sv2v_reg ,\nz.mem_501_sv2v_reg ,\nz.mem_500_sv2v_reg ,\nz.mem_499_sv2v_reg ,
  \nz.mem_498_sv2v_reg ,\nz.mem_497_sv2v_reg ,\nz.mem_496_sv2v_reg ,
  \nz.mem_495_sv2v_reg ,\nz.mem_494_sv2v_reg ,\nz.mem_493_sv2v_reg ,\nz.mem_492_sv2v_reg ,
  \nz.mem_491_sv2v_reg ,\nz.mem_490_sv2v_reg ,\nz.mem_489_sv2v_reg ,\nz.mem_488_sv2v_reg ,
  \nz.mem_487_sv2v_reg ,\nz.mem_486_sv2v_reg ,\nz.mem_485_sv2v_reg ,
  \nz.mem_484_sv2v_reg ,\nz.mem_483_sv2v_reg ,\nz.mem_482_sv2v_reg ,\nz.mem_481_sv2v_reg ,
  \nz.mem_480_sv2v_reg ,\nz.mem_479_sv2v_reg ,\nz.mem_478_sv2v_reg ,
  \nz.mem_477_sv2v_reg ,\nz.mem_476_sv2v_reg ,\nz.mem_475_sv2v_reg ,\nz.mem_474_sv2v_reg ,
  \nz.mem_473_sv2v_reg ,\nz.mem_472_sv2v_reg ,\nz.mem_471_sv2v_reg ,\nz.mem_470_sv2v_reg ,
  \nz.mem_469_sv2v_reg ,\nz.mem_468_sv2v_reg ,\nz.mem_467_sv2v_reg ,
  \nz.mem_466_sv2v_reg ,\nz.mem_465_sv2v_reg ,\nz.mem_464_sv2v_reg ,\nz.mem_463_sv2v_reg ,
  \nz.mem_462_sv2v_reg ,\nz.mem_461_sv2v_reg ,\nz.mem_460_sv2v_reg ,\nz.mem_459_sv2v_reg ,
  \nz.mem_458_sv2v_reg ,\nz.mem_457_sv2v_reg ,\nz.mem_456_sv2v_reg ,
  \nz.mem_455_sv2v_reg ,\nz.mem_454_sv2v_reg ,\nz.mem_453_sv2v_reg ,\nz.mem_452_sv2v_reg ,
  \nz.mem_451_sv2v_reg ,\nz.mem_450_sv2v_reg ,\nz.mem_449_sv2v_reg ,\nz.mem_448_sv2v_reg ,
  \nz.mem_447_sv2v_reg ,\nz.mem_446_sv2v_reg ,\nz.mem_445_sv2v_reg ,
  \nz.mem_444_sv2v_reg ,\nz.mem_443_sv2v_reg ,\nz.mem_442_sv2v_reg ,\nz.mem_441_sv2v_reg ,
  \nz.mem_440_sv2v_reg ,\nz.mem_439_sv2v_reg ,\nz.mem_438_sv2v_reg ,
  \nz.mem_437_sv2v_reg ,\nz.mem_436_sv2v_reg ,\nz.mem_435_sv2v_reg ,\nz.mem_434_sv2v_reg ,
  \nz.mem_433_sv2v_reg ,\nz.mem_432_sv2v_reg ,\nz.mem_431_sv2v_reg ,\nz.mem_430_sv2v_reg ,
  \nz.mem_429_sv2v_reg ,\nz.mem_428_sv2v_reg ,\nz.mem_427_sv2v_reg ,
  \nz.mem_426_sv2v_reg ,\nz.mem_425_sv2v_reg ,\nz.mem_424_sv2v_reg ,\nz.mem_423_sv2v_reg ,
  \nz.mem_422_sv2v_reg ,\nz.mem_421_sv2v_reg ,\nz.mem_420_sv2v_reg ,\nz.mem_419_sv2v_reg ,
  \nz.mem_418_sv2v_reg ,\nz.mem_417_sv2v_reg ,\nz.mem_416_sv2v_reg ,
  \nz.mem_415_sv2v_reg ,\nz.mem_414_sv2v_reg ,\nz.mem_413_sv2v_reg ,\nz.mem_412_sv2v_reg ,
  \nz.mem_411_sv2v_reg ,\nz.mem_410_sv2v_reg ,\nz.mem_409_sv2v_reg ,\nz.mem_408_sv2v_reg ,
  \nz.mem_407_sv2v_reg ,\nz.mem_406_sv2v_reg ,\nz.mem_405_sv2v_reg ,
  \nz.mem_404_sv2v_reg ,\nz.mem_403_sv2v_reg ,\nz.mem_402_sv2v_reg ,\nz.mem_401_sv2v_reg ,
  \nz.mem_400_sv2v_reg ,\nz.mem_399_sv2v_reg ,\nz.mem_398_sv2v_reg ,
  \nz.mem_397_sv2v_reg ,\nz.mem_396_sv2v_reg ,\nz.mem_395_sv2v_reg ,\nz.mem_394_sv2v_reg ,
  \nz.mem_393_sv2v_reg ,\nz.mem_392_sv2v_reg ,\nz.mem_391_sv2v_reg ,\nz.mem_390_sv2v_reg ,
  \nz.mem_389_sv2v_reg ,\nz.mem_388_sv2v_reg ,\nz.mem_387_sv2v_reg ,
  \nz.mem_386_sv2v_reg ,\nz.mem_385_sv2v_reg ,\nz.mem_384_sv2v_reg ,\nz.mem_383_sv2v_reg ,
  \nz.mem_382_sv2v_reg ,\nz.mem_381_sv2v_reg ,\nz.mem_380_sv2v_reg ,\nz.mem_379_sv2v_reg ,
  \nz.mem_378_sv2v_reg ,\nz.mem_377_sv2v_reg ,\nz.mem_376_sv2v_reg ,
  \nz.mem_375_sv2v_reg ,\nz.mem_374_sv2v_reg ,\nz.mem_373_sv2v_reg ,\nz.mem_372_sv2v_reg ,
  \nz.mem_371_sv2v_reg ,\nz.mem_370_sv2v_reg ,\nz.mem_369_sv2v_reg ,\nz.mem_368_sv2v_reg ,
  \nz.mem_367_sv2v_reg ,\nz.mem_366_sv2v_reg ,\nz.mem_365_sv2v_reg ,
  \nz.mem_364_sv2v_reg ,\nz.mem_363_sv2v_reg ,\nz.mem_362_sv2v_reg ,\nz.mem_361_sv2v_reg ,
  \nz.mem_360_sv2v_reg ,\nz.mem_359_sv2v_reg ,\nz.mem_358_sv2v_reg ,
  \nz.mem_357_sv2v_reg ,\nz.mem_356_sv2v_reg ,\nz.mem_355_sv2v_reg ,\nz.mem_354_sv2v_reg ,
  \nz.mem_353_sv2v_reg ,\nz.mem_352_sv2v_reg ,\nz.mem_351_sv2v_reg ,\nz.mem_350_sv2v_reg ,
  \nz.mem_349_sv2v_reg ,\nz.mem_348_sv2v_reg ,\nz.mem_347_sv2v_reg ,
  \nz.mem_346_sv2v_reg ,\nz.mem_345_sv2v_reg ,\nz.mem_344_sv2v_reg ,\nz.mem_343_sv2v_reg ,
  \nz.mem_342_sv2v_reg ,\nz.mem_341_sv2v_reg ,\nz.mem_340_sv2v_reg ,\nz.mem_339_sv2v_reg ,
  \nz.mem_338_sv2v_reg ,\nz.mem_337_sv2v_reg ,\nz.mem_336_sv2v_reg ,
  \nz.mem_335_sv2v_reg ,\nz.mem_334_sv2v_reg ,\nz.mem_333_sv2v_reg ,\nz.mem_332_sv2v_reg ,
  \nz.mem_331_sv2v_reg ,\nz.mem_330_sv2v_reg ,\nz.mem_329_sv2v_reg ,\nz.mem_328_sv2v_reg ,
  \nz.mem_327_sv2v_reg ,\nz.mem_326_sv2v_reg ,\nz.mem_325_sv2v_reg ,
  \nz.mem_324_sv2v_reg ,\nz.mem_323_sv2v_reg ,\nz.mem_322_sv2v_reg ,\nz.mem_321_sv2v_reg ,
  \nz.mem_320_sv2v_reg ,\nz.mem_319_sv2v_reg ,\nz.mem_318_sv2v_reg ,
  \nz.mem_317_sv2v_reg ,\nz.mem_316_sv2v_reg ,\nz.mem_315_sv2v_reg ,\nz.mem_314_sv2v_reg ,
  \nz.mem_313_sv2v_reg ,\nz.mem_312_sv2v_reg ,\nz.mem_311_sv2v_reg ,\nz.mem_310_sv2v_reg ,
  \nz.mem_309_sv2v_reg ,\nz.mem_308_sv2v_reg ,\nz.mem_307_sv2v_reg ,
  \nz.mem_306_sv2v_reg ,\nz.mem_305_sv2v_reg ,\nz.mem_304_sv2v_reg ,\nz.mem_303_sv2v_reg ,
  \nz.mem_302_sv2v_reg ,\nz.mem_301_sv2v_reg ,\nz.mem_300_sv2v_reg ,\nz.mem_299_sv2v_reg ,
  \nz.mem_298_sv2v_reg ,\nz.mem_297_sv2v_reg ,\nz.mem_296_sv2v_reg ,
  \nz.mem_295_sv2v_reg ,\nz.mem_294_sv2v_reg ,\nz.mem_293_sv2v_reg ,\nz.mem_292_sv2v_reg ,
  \nz.mem_291_sv2v_reg ,\nz.mem_290_sv2v_reg ,\nz.mem_289_sv2v_reg ,\nz.mem_288_sv2v_reg ,
  \nz.mem_287_sv2v_reg ,\nz.mem_286_sv2v_reg ,\nz.mem_285_sv2v_reg ,
  \nz.mem_284_sv2v_reg ,\nz.mem_283_sv2v_reg ,\nz.mem_282_sv2v_reg ,\nz.mem_281_sv2v_reg ,
  \nz.mem_280_sv2v_reg ,\nz.mem_279_sv2v_reg ,\nz.mem_278_sv2v_reg ,
  \nz.mem_277_sv2v_reg ,\nz.mem_276_sv2v_reg ,\nz.mem_275_sv2v_reg ,\nz.mem_274_sv2v_reg ,
  \nz.mem_273_sv2v_reg ,\nz.mem_272_sv2v_reg ,\nz.mem_271_sv2v_reg ,\nz.mem_270_sv2v_reg ,
  \nz.mem_269_sv2v_reg ,\nz.mem_268_sv2v_reg ,\nz.mem_267_sv2v_reg ,
  \nz.mem_266_sv2v_reg ,\nz.mem_265_sv2v_reg ,\nz.mem_264_sv2v_reg ,\nz.mem_263_sv2v_reg ,
  \nz.mem_262_sv2v_reg ,\nz.mem_261_sv2v_reg ,\nz.mem_260_sv2v_reg ,\nz.mem_259_sv2v_reg ,
  \nz.mem_258_sv2v_reg ,\nz.mem_257_sv2v_reg ,\nz.mem_256_sv2v_reg ,
  \nz.mem_255_sv2v_reg ,\nz.mem_254_sv2v_reg ,\nz.mem_253_sv2v_reg ,\nz.mem_252_sv2v_reg ,
  \nz.mem_251_sv2v_reg ,\nz.mem_250_sv2v_reg ,\nz.mem_249_sv2v_reg ,\nz.mem_248_sv2v_reg ,
  \nz.mem_247_sv2v_reg ,\nz.mem_246_sv2v_reg ,\nz.mem_245_sv2v_reg ,
  \nz.mem_244_sv2v_reg ,\nz.mem_243_sv2v_reg ,\nz.mem_242_sv2v_reg ,\nz.mem_241_sv2v_reg ,
  \nz.mem_240_sv2v_reg ,\nz.mem_239_sv2v_reg ,\nz.mem_238_sv2v_reg ,
  \nz.mem_237_sv2v_reg ,\nz.mem_236_sv2v_reg ,\nz.mem_235_sv2v_reg ,\nz.mem_234_sv2v_reg ,
  \nz.mem_233_sv2v_reg ,\nz.mem_232_sv2v_reg ,\nz.mem_231_sv2v_reg ,\nz.mem_230_sv2v_reg ,
  \nz.mem_229_sv2v_reg ,\nz.mem_228_sv2v_reg ,\nz.mem_227_sv2v_reg ,
  \nz.mem_226_sv2v_reg ,\nz.mem_225_sv2v_reg ,\nz.mem_224_sv2v_reg ,\nz.mem_223_sv2v_reg ,
  \nz.mem_222_sv2v_reg ,\nz.mem_221_sv2v_reg ,\nz.mem_220_sv2v_reg ,\nz.mem_219_sv2v_reg ,
  \nz.mem_218_sv2v_reg ,\nz.mem_217_sv2v_reg ,\nz.mem_216_sv2v_reg ,
  \nz.mem_215_sv2v_reg ,\nz.mem_214_sv2v_reg ,\nz.mem_213_sv2v_reg ,\nz.mem_212_sv2v_reg ,
  \nz.mem_211_sv2v_reg ,\nz.mem_210_sv2v_reg ,\nz.mem_209_sv2v_reg ,\nz.mem_208_sv2v_reg ,
  \nz.mem_207_sv2v_reg ,\nz.mem_206_sv2v_reg ,\nz.mem_205_sv2v_reg ,
  \nz.mem_204_sv2v_reg ,\nz.mem_203_sv2v_reg ,\nz.mem_202_sv2v_reg ,\nz.mem_201_sv2v_reg ,
  \nz.mem_200_sv2v_reg ,\nz.mem_199_sv2v_reg ,\nz.mem_198_sv2v_reg ,
  \nz.mem_197_sv2v_reg ,\nz.mem_196_sv2v_reg ,\nz.mem_195_sv2v_reg ,\nz.mem_194_sv2v_reg ,
  \nz.mem_193_sv2v_reg ,\nz.mem_192_sv2v_reg ,\nz.mem_191_sv2v_reg ,\nz.mem_190_sv2v_reg ,
  \nz.mem_189_sv2v_reg ,\nz.mem_188_sv2v_reg ,\nz.mem_187_sv2v_reg ,
  \nz.mem_186_sv2v_reg ,\nz.mem_185_sv2v_reg ,\nz.mem_184_sv2v_reg ,\nz.mem_183_sv2v_reg ,
  \nz.mem_182_sv2v_reg ,\nz.mem_181_sv2v_reg ,\nz.mem_180_sv2v_reg ,\nz.mem_179_sv2v_reg ,
  \nz.mem_178_sv2v_reg ,\nz.mem_177_sv2v_reg ,\nz.mem_176_sv2v_reg ,
  \nz.mem_175_sv2v_reg ,\nz.mem_174_sv2v_reg ,\nz.mem_173_sv2v_reg ,\nz.mem_172_sv2v_reg ,
  \nz.mem_171_sv2v_reg ,\nz.mem_170_sv2v_reg ,\nz.mem_169_sv2v_reg ,\nz.mem_168_sv2v_reg ,
  \nz.mem_167_sv2v_reg ,\nz.mem_166_sv2v_reg ,\nz.mem_165_sv2v_reg ,
  \nz.mem_164_sv2v_reg ,\nz.mem_163_sv2v_reg ,\nz.mem_162_sv2v_reg ,\nz.mem_161_sv2v_reg ,
  \nz.mem_160_sv2v_reg ,\nz.mem_159_sv2v_reg ,\nz.mem_158_sv2v_reg ,
  \nz.mem_157_sv2v_reg ,\nz.mem_156_sv2v_reg ,\nz.mem_155_sv2v_reg ,\nz.mem_154_sv2v_reg ,
  \nz.mem_153_sv2v_reg ,\nz.mem_152_sv2v_reg ,\nz.mem_151_sv2v_reg ,\nz.mem_150_sv2v_reg ,
  \nz.mem_149_sv2v_reg ,\nz.mem_148_sv2v_reg ,\nz.mem_147_sv2v_reg ,
  \nz.mem_146_sv2v_reg ,\nz.mem_145_sv2v_reg ,\nz.mem_144_sv2v_reg ,\nz.mem_143_sv2v_reg ,
  \nz.mem_142_sv2v_reg ,\nz.mem_141_sv2v_reg ,\nz.mem_140_sv2v_reg ,\nz.mem_139_sv2v_reg ,
  \nz.mem_138_sv2v_reg ,\nz.mem_137_sv2v_reg ,\nz.mem_136_sv2v_reg ,
  \nz.mem_135_sv2v_reg ,\nz.mem_134_sv2v_reg ,\nz.mem_133_sv2v_reg ,\nz.mem_132_sv2v_reg ,
  \nz.mem_131_sv2v_reg ,\nz.mem_130_sv2v_reg ,\nz.mem_129_sv2v_reg ,\nz.mem_128_sv2v_reg ,
  \nz.mem_127_sv2v_reg ,\nz.mem_126_sv2v_reg ,\nz.mem_125_sv2v_reg ,
  \nz.mem_124_sv2v_reg ,\nz.mem_123_sv2v_reg ,\nz.mem_122_sv2v_reg ,\nz.mem_121_sv2v_reg ,
  \nz.mem_120_sv2v_reg ,\nz.mem_119_sv2v_reg ,\nz.mem_118_sv2v_reg ,
  \nz.mem_117_sv2v_reg ,\nz.mem_116_sv2v_reg ,\nz.mem_115_sv2v_reg ,\nz.mem_114_sv2v_reg ,
  \nz.mem_113_sv2v_reg ,\nz.mem_112_sv2v_reg ,\nz.mem_111_sv2v_reg ,\nz.mem_110_sv2v_reg ,
  \nz.mem_109_sv2v_reg ,\nz.mem_108_sv2v_reg ,\nz.mem_107_sv2v_reg ,
  \nz.mem_106_sv2v_reg ,\nz.mem_105_sv2v_reg ,\nz.mem_104_sv2v_reg ,\nz.mem_103_sv2v_reg ,
  \nz.mem_102_sv2v_reg ,\nz.mem_101_sv2v_reg ,\nz.mem_100_sv2v_reg ,\nz.mem_99_sv2v_reg ,
  \nz.mem_98_sv2v_reg ,\nz.mem_97_sv2v_reg ,\nz.mem_96_sv2v_reg ,
  \nz.mem_95_sv2v_reg ,\nz.mem_94_sv2v_reg ,\nz.mem_93_sv2v_reg ,\nz.mem_92_sv2v_reg ,
  \nz.mem_91_sv2v_reg ,\nz.mem_90_sv2v_reg ,\nz.mem_89_sv2v_reg ,\nz.mem_88_sv2v_reg ,
  \nz.mem_87_sv2v_reg ,\nz.mem_86_sv2v_reg ,\nz.mem_85_sv2v_reg ,\nz.mem_84_sv2v_reg ,
  \nz.mem_83_sv2v_reg ,\nz.mem_82_sv2v_reg ,\nz.mem_81_sv2v_reg ,\nz.mem_80_sv2v_reg ,
  \nz.mem_79_sv2v_reg ,\nz.mem_78_sv2v_reg ,\nz.mem_77_sv2v_reg ,\nz.mem_76_sv2v_reg ,
  \nz.mem_75_sv2v_reg ,\nz.mem_74_sv2v_reg ,\nz.mem_73_sv2v_reg ,
  \nz.mem_72_sv2v_reg ,\nz.mem_71_sv2v_reg ,\nz.mem_70_sv2v_reg ,\nz.mem_69_sv2v_reg ,
  \nz.mem_68_sv2v_reg ,\nz.mem_67_sv2v_reg ,\nz.mem_66_sv2v_reg ,\nz.mem_65_sv2v_reg ,
  \nz.mem_64_sv2v_reg ,\nz.mem_63_sv2v_reg ,\nz.mem_62_sv2v_reg ,\nz.mem_61_sv2v_reg ,
  \nz.mem_60_sv2v_reg ,\nz.mem_59_sv2v_reg ,\nz.mem_58_sv2v_reg ,\nz.mem_57_sv2v_reg ,
  \nz.mem_56_sv2v_reg ,\nz.mem_55_sv2v_reg ,\nz.mem_54_sv2v_reg ,
  \nz.mem_53_sv2v_reg ,\nz.mem_52_sv2v_reg ,\nz.mem_51_sv2v_reg ,\nz.mem_50_sv2v_reg ,
  \nz.mem_49_sv2v_reg ,\nz.mem_48_sv2v_reg ,\nz.mem_47_sv2v_reg ,\nz.mem_46_sv2v_reg ,
  \nz.mem_45_sv2v_reg ,\nz.mem_44_sv2v_reg ,\nz.mem_43_sv2v_reg ,\nz.mem_42_sv2v_reg ,
  \nz.mem_41_sv2v_reg ,\nz.mem_40_sv2v_reg ,\nz.mem_39_sv2v_reg ,\nz.mem_38_sv2v_reg ,
  \nz.mem_37_sv2v_reg ,\nz.mem_36_sv2v_reg ,\nz.mem_35_sv2v_reg ,
  \nz.mem_34_sv2v_reg ,\nz.mem_33_sv2v_reg ,\nz.mem_32_sv2v_reg ,\nz.mem_31_sv2v_reg ,
  \nz.mem_30_sv2v_reg ,\nz.mem_29_sv2v_reg ,\nz.mem_28_sv2v_reg ,\nz.mem_27_sv2v_reg ,
  \nz.mem_26_sv2v_reg ,\nz.mem_25_sv2v_reg ,\nz.mem_24_sv2v_reg ,\nz.mem_23_sv2v_reg ,
  \nz.mem_22_sv2v_reg ,\nz.mem_21_sv2v_reg ,\nz.mem_20_sv2v_reg ,\nz.mem_19_sv2v_reg ,
  \nz.mem_18_sv2v_reg ,\nz.mem_17_sv2v_reg ,\nz.mem_16_sv2v_reg ,
  \nz.mem_15_sv2v_reg ,\nz.mem_14_sv2v_reg ,\nz.mem_13_sv2v_reg ,\nz.mem_12_sv2v_reg ,
  \nz.mem_11_sv2v_reg ,\nz.mem_10_sv2v_reg ,\nz.mem_9_sv2v_reg ,\nz.mem_8_sv2v_reg ,
  \nz.mem_7_sv2v_reg ,\nz.mem_6_sv2v_reg ,\nz.mem_5_sv2v_reg ,\nz.mem_4_sv2v_reg ,
  \nz.mem_3_sv2v_reg ,\nz.mem_2_sv2v_reg ,\nz.mem_1_sv2v_reg ,\nz.mem_0_sv2v_reg ;
  assign \nz.mem [687] = \nz.mem_687_sv2v_reg ;
  assign \nz.mem [686] = \nz.mem_686_sv2v_reg ;
  assign \nz.mem [685] = \nz.mem_685_sv2v_reg ;
  assign \nz.mem [684] = \nz.mem_684_sv2v_reg ;
  assign \nz.mem [683] = \nz.mem_683_sv2v_reg ;
  assign \nz.mem [682] = \nz.mem_682_sv2v_reg ;
  assign \nz.mem [681] = \nz.mem_681_sv2v_reg ;
  assign \nz.mem [680] = \nz.mem_680_sv2v_reg ;
  assign \nz.mem [679] = \nz.mem_679_sv2v_reg ;
  assign \nz.mem [678] = \nz.mem_678_sv2v_reg ;
  assign \nz.mem [677] = \nz.mem_677_sv2v_reg ;
  assign \nz.mem [676] = \nz.mem_676_sv2v_reg ;
  assign \nz.mem [675] = \nz.mem_675_sv2v_reg ;
  assign \nz.mem [674] = \nz.mem_674_sv2v_reg ;
  assign \nz.mem [673] = \nz.mem_673_sv2v_reg ;
  assign \nz.mem [672] = \nz.mem_672_sv2v_reg ;
  assign \nz.mem [671] = \nz.mem_671_sv2v_reg ;
  assign \nz.mem [670] = \nz.mem_670_sv2v_reg ;
  assign \nz.mem [669] = \nz.mem_669_sv2v_reg ;
  assign \nz.mem [668] = \nz.mem_668_sv2v_reg ;
  assign \nz.mem [667] = \nz.mem_667_sv2v_reg ;
  assign \nz.mem [666] = \nz.mem_666_sv2v_reg ;
  assign \nz.mem [665] = \nz.mem_665_sv2v_reg ;
  assign \nz.mem [664] = \nz.mem_664_sv2v_reg ;
  assign \nz.mem [663] = \nz.mem_663_sv2v_reg ;
  assign \nz.mem [662] = \nz.mem_662_sv2v_reg ;
  assign \nz.mem [661] = \nz.mem_661_sv2v_reg ;
  assign \nz.mem [660] = \nz.mem_660_sv2v_reg ;
  assign \nz.mem [659] = \nz.mem_659_sv2v_reg ;
  assign \nz.mem [658] = \nz.mem_658_sv2v_reg ;
  assign \nz.mem [657] = \nz.mem_657_sv2v_reg ;
  assign \nz.mem [656] = \nz.mem_656_sv2v_reg ;
  assign \nz.mem [655] = \nz.mem_655_sv2v_reg ;
  assign \nz.mem [654] = \nz.mem_654_sv2v_reg ;
  assign \nz.mem [653] = \nz.mem_653_sv2v_reg ;
  assign \nz.mem [652] = \nz.mem_652_sv2v_reg ;
  assign \nz.mem [651] = \nz.mem_651_sv2v_reg ;
  assign \nz.mem [650] = \nz.mem_650_sv2v_reg ;
  assign \nz.mem [649] = \nz.mem_649_sv2v_reg ;
  assign \nz.mem [648] = \nz.mem_648_sv2v_reg ;
  assign \nz.mem [647] = \nz.mem_647_sv2v_reg ;
  assign \nz.mem [646] = \nz.mem_646_sv2v_reg ;
  assign \nz.mem [645] = \nz.mem_645_sv2v_reg ;
  assign \nz.mem [644] = \nz.mem_644_sv2v_reg ;
  assign \nz.mem [643] = \nz.mem_643_sv2v_reg ;
  assign \nz.mem [642] = \nz.mem_642_sv2v_reg ;
  assign \nz.mem [641] = \nz.mem_641_sv2v_reg ;
  assign \nz.mem [640] = \nz.mem_640_sv2v_reg ;
  assign \nz.mem [639] = \nz.mem_639_sv2v_reg ;
  assign \nz.mem [638] = \nz.mem_638_sv2v_reg ;
  assign \nz.mem [637] = \nz.mem_637_sv2v_reg ;
  assign \nz.mem [636] = \nz.mem_636_sv2v_reg ;
  assign \nz.mem [635] = \nz.mem_635_sv2v_reg ;
  assign \nz.mem [634] = \nz.mem_634_sv2v_reg ;
  assign \nz.mem [633] = \nz.mem_633_sv2v_reg ;
  assign \nz.mem [632] = \nz.mem_632_sv2v_reg ;
  assign \nz.mem [631] = \nz.mem_631_sv2v_reg ;
  assign \nz.mem [630] = \nz.mem_630_sv2v_reg ;
  assign \nz.mem [629] = \nz.mem_629_sv2v_reg ;
  assign \nz.mem [628] = \nz.mem_628_sv2v_reg ;
  assign \nz.mem [627] = \nz.mem_627_sv2v_reg ;
  assign \nz.mem [626] = \nz.mem_626_sv2v_reg ;
  assign \nz.mem [625] = \nz.mem_625_sv2v_reg ;
  assign \nz.mem [624] = \nz.mem_624_sv2v_reg ;
  assign \nz.mem [623] = \nz.mem_623_sv2v_reg ;
  assign \nz.mem [622] = \nz.mem_622_sv2v_reg ;
  assign \nz.mem [621] = \nz.mem_621_sv2v_reg ;
  assign \nz.mem [620] = \nz.mem_620_sv2v_reg ;
  assign \nz.mem [619] = \nz.mem_619_sv2v_reg ;
  assign \nz.mem [618] = \nz.mem_618_sv2v_reg ;
  assign \nz.mem [617] = \nz.mem_617_sv2v_reg ;
  assign \nz.mem [616] = \nz.mem_616_sv2v_reg ;
  assign \nz.mem [615] = \nz.mem_615_sv2v_reg ;
  assign \nz.mem [614] = \nz.mem_614_sv2v_reg ;
  assign \nz.mem [613] = \nz.mem_613_sv2v_reg ;
  assign \nz.mem [612] = \nz.mem_612_sv2v_reg ;
  assign \nz.mem [611] = \nz.mem_611_sv2v_reg ;
  assign \nz.mem [610] = \nz.mem_610_sv2v_reg ;
  assign \nz.mem [609] = \nz.mem_609_sv2v_reg ;
  assign \nz.mem [608] = \nz.mem_608_sv2v_reg ;
  assign \nz.mem [607] = \nz.mem_607_sv2v_reg ;
  assign \nz.mem [606] = \nz.mem_606_sv2v_reg ;
  assign \nz.mem [605] = \nz.mem_605_sv2v_reg ;
  assign \nz.mem [604] = \nz.mem_604_sv2v_reg ;
  assign \nz.mem [603] = \nz.mem_603_sv2v_reg ;
  assign \nz.mem [602] = \nz.mem_602_sv2v_reg ;
  assign \nz.mem [601] = \nz.mem_601_sv2v_reg ;
  assign \nz.mem [600] = \nz.mem_600_sv2v_reg ;
  assign \nz.mem [599] = \nz.mem_599_sv2v_reg ;
  assign \nz.mem [598] = \nz.mem_598_sv2v_reg ;
  assign \nz.mem [597] = \nz.mem_597_sv2v_reg ;
  assign \nz.mem [596] = \nz.mem_596_sv2v_reg ;
  assign \nz.mem [595] = \nz.mem_595_sv2v_reg ;
  assign \nz.mem [594] = \nz.mem_594_sv2v_reg ;
  assign \nz.mem [593] = \nz.mem_593_sv2v_reg ;
  assign \nz.mem [592] = \nz.mem_592_sv2v_reg ;
  assign \nz.mem [591] = \nz.mem_591_sv2v_reg ;
  assign \nz.mem [590] = \nz.mem_590_sv2v_reg ;
  assign \nz.mem [589] = \nz.mem_589_sv2v_reg ;
  assign \nz.mem [588] = \nz.mem_588_sv2v_reg ;
  assign \nz.mem [587] = \nz.mem_587_sv2v_reg ;
  assign \nz.mem [586] = \nz.mem_586_sv2v_reg ;
  assign \nz.mem [585] = \nz.mem_585_sv2v_reg ;
  assign \nz.mem [584] = \nz.mem_584_sv2v_reg ;
  assign \nz.mem [583] = \nz.mem_583_sv2v_reg ;
  assign \nz.mem [582] = \nz.mem_582_sv2v_reg ;
  assign \nz.mem [581] = \nz.mem_581_sv2v_reg ;
  assign \nz.mem [580] = \nz.mem_580_sv2v_reg ;
  assign \nz.mem [579] = \nz.mem_579_sv2v_reg ;
  assign \nz.mem [578] = \nz.mem_578_sv2v_reg ;
  assign \nz.mem [577] = \nz.mem_577_sv2v_reg ;
  assign \nz.mem [576] = \nz.mem_576_sv2v_reg ;
  assign \nz.mem [575] = \nz.mem_575_sv2v_reg ;
  assign \nz.mem [574] = \nz.mem_574_sv2v_reg ;
  assign \nz.mem [573] = \nz.mem_573_sv2v_reg ;
  assign \nz.mem [572] = \nz.mem_572_sv2v_reg ;
  assign \nz.mem [571] = \nz.mem_571_sv2v_reg ;
  assign \nz.mem [570] = \nz.mem_570_sv2v_reg ;
  assign \nz.mem [569] = \nz.mem_569_sv2v_reg ;
  assign \nz.mem [568] = \nz.mem_568_sv2v_reg ;
  assign \nz.mem [567] = \nz.mem_567_sv2v_reg ;
  assign \nz.mem [566] = \nz.mem_566_sv2v_reg ;
  assign \nz.mem [565] = \nz.mem_565_sv2v_reg ;
  assign \nz.mem [564] = \nz.mem_564_sv2v_reg ;
  assign \nz.mem [563] = \nz.mem_563_sv2v_reg ;
  assign \nz.mem [562] = \nz.mem_562_sv2v_reg ;
  assign \nz.mem [561] = \nz.mem_561_sv2v_reg ;
  assign \nz.mem [560] = \nz.mem_560_sv2v_reg ;
  assign \nz.mem [559] = \nz.mem_559_sv2v_reg ;
  assign \nz.mem [558] = \nz.mem_558_sv2v_reg ;
  assign \nz.mem [557] = \nz.mem_557_sv2v_reg ;
  assign \nz.mem [556] = \nz.mem_556_sv2v_reg ;
  assign \nz.mem [555] = \nz.mem_555_sv2v_reg ;
  assign \nz.mem [554] = \nz.mem_554_sv2v_reg ;
  assign \nz.mem [553] = \nz.mem_553_sv2v_reg ;
  assign \nz.mem [552] = \nz.mem_552_sv2v_reg ;
  assign \nz.mem [551] = \nz.mem_551_sv2v_reg ;
  assign \nz.mem [550] = \nz.mem_550_sv2v_reg ;
  assign \nz.mem [549] = \nz.mem_549_sv2v_reg ;
  assign \nz.mem [548] = \nz.mem_548_sv2v_reg ;
  assign \nz.mem [547] = \nz.mem_547_sv2v_reg ;
  assign \nz.mem [546] = \nz.mem_546_sv2v_reg ;
  assign \nz.mem [545] = \nz.mem_545_sv2v_reg ;
  assign \nz.mem [544] = \nz.mem_544_sv2v_reg ;
  assign \nz.mem [543] = \nz.mem_543_sv2v_reg ;
  assign \nz.mem [542] = \nz.mem_542_sv2v_reg ;
  assign \nz.mem [541] = \nz.mem_541_sv2v_reg ;
  assign \nz.mem [540] = \nz.mem_540_sv2v_reg ;
  assign \nz.mem [539] = \nz.mem_539_sv2v_reg ;
  assign \nz.mem [538] = \nz.mem_538_sv2v_reg ;
  assign \nz.mem [537] = \nz.mem_537_sv2v_reg ;
  assign \nz.mem [536] = \nz.mem_536_sv2v_reg ;
  assign \nz.mem [535] = \nz.mem_535_sv2v_reg ;
  assign \nz.mem [534] = \nz.mem_534_sv2v_reg ;
  assign \nz.mem [533] = \nz.mem_533_sv2v_reg ;
  assign \nz.mem [532] = \nz.mem_532_sv2v_reg ;
  assign \nz.mem [531] = \nz.mem_531_sv2v_reg ;
  assign \nz.mem [530] = \nz.mem_530_sv2v_reg ;
  assign \nz.mem [529] = \nz.mem_529_sv2v_reg ;
  assign \nz.mem [528] = \nz.mem_528_sv2v_reg ;
  assign \nz.mem [527] = \nz.mem_527_sv2v_reg ;
  assign \nz.mem [526] = \nz.mem_526_sv2v_reg ;
  assign \nz.mem [525] = \nz.mem_525_sv2v_reg ;
  assign \nz.mem [524] = \nz.mem_524_sv2v_reg ;
  assign \nz.mem [523] = \nz.mem_523_sv2v_reg ;
  assign \nz.mem [522] = \nz.mem_522_sv2v_reg ;
  assign \nz.mem [521] = \nz.mem_521_sv2v_reg ;
  assign \nz.mem [520] = \nz.mem_520_sv2v_reg ;
  assign \nz.mem [519] = \nz.mem_519_sv2v_reg ;
  assign \nz.mem [518] = \nz.mem_518_sv2v_reg ;
  assign \nz.mem [517] = \nz.mem_517_sv2v_reg ;
  assign \nz.mem [516] = \nz.mem_516_sv2v_reg ;
  assign \nz.mem [515] = \nz.mem_515_sv2v_reg ;
  assign \nz.mem [514] = \nz.mem_514_sv2v_reg ;
  assign \nz.mem [513] = \nz.mem_513_sv2v_reg ;
  assign \nz.mem [512] = \nz.mem_512_sv2v_reg ;
  assign \nz.mem [511] = \nz.mem_511_sv2v_reg ;
  assign \nz.mem [510] = \nz.mem_510_sv2v_reg ;
  assign \nz.mem [509] = \nz.mem_509_sv2v_reg ;
  assign \nz.mem [508] = \nz.mem_508_sv2v_reg ;
  assign \nz.mem [507] = \nz.mem_507_sv2v_reg ;
  assign \nz.mem [506] = \nz.mem_506_sv2v_reg ;
  assign \nz.mem [505] = \nz.mem_505_sv2v_reg ;
  assign \nz.mem [504] = \nz.mem_504_sv2v_reg ;
  assign \nz.mem [503] = \nz.mem_503_sv2v_reg ;
  assign \nz.mem [502] = \nz.mem_502_sv2v_reg ;
  assign \nz.mem [501] = \nz.mem_501_sv2v_reg ;
  assign \nz.mem [500] = \nz.mem_500_sv2v_reg ;
  assign \nz.mem [499] = \nz.mem_499_sv2v_reg ;
  assign \nz.mem [498] = \nz.mem_498_sv2v_reg ;
  assign \nz.mem [497] = \nz.mem_497_sv2v_reg ;
  assign \nz.mem [496] = \nz.mem_496_sv2v_reg ;
  assign \nz.mem [495] = \nz.mem_495_sv2v_reg ;
  assign \nz.mem [494] = \nz.mem_494_sv2v_reg ;
  assign \nz.mem [493] = \nz.mem_493_sv2v_reg ;
  assign \nz.mem [492] = \nz.mem_492_sv2v_reg ;
  assign \nz.mem [491] = \nz.mem_491_sv2v_reg ;
  assign \nz.mem [490] = \nz.mem_490_sv2v_reg ;
  assign \nz.mem [489] = \nz.mem_489_sv2v_reg ;
  assign \nz.mem [488] = \nz.mem_488_sv2v_reg ;
  assign \nz.mem [487] = \nz.mem_487_sv2v_reg ;
  assign \nz.mem [486] = \nz.mem_486_sv2v_reg ;
  assign \nz.mem [485] = \nz.mem_485_sv2v_reg ;
  assign \nz.mem [484] = \nz.mem_484_sv2v_reg ;
  assign \nz.mem [483] = \nz.mem_483_sv2v_reg ;
  assign \nz.mem [482] = \nz.mem_482_sv2v_reg ;
  assign \nz.mem [481] = \nz.mem_481_sv2v_reg ;
  assign \nz.mem [480] = \nz.mem_480_sv2v_reg ;
  assign \nz.mem [479] = \nz.mem_479_sv2v_reg ;
  assign \nz.mem [478] = \nz.mem_478_sv2v_reg ;
  assign \nz.mem [477] = \nz.mem_477_sv2v_reg ;
  assign \nz.mem [476] = \nz.mem_476_sv2v_reg ;
  assign \nz.mem [475] = \nz.mem_475_sv2v_reg ;
  assign \nz.mem [474] = \nz.mem_474_sv2v_reg ;
  assign \nz.mem [473] = \nz.mem_473_sv2v_reg ;
  assign \nz.mem [472] = \nz.mem_472_sv2v_reg ;
  assign \nz.mem [471] = \nz.mem_471_sv2v_reg ;
  assign \nz.mem [470] = \nz.mem_470_sv2v_reg ;
  assign \nz.mem [469] = \nz.mem_469_sv2v_reg ;
  assign \nz.mem [468] = \nz.mem_468_sv2v_reg ;
  assign \nz.mem [467] = \nz.mem_467_sv2v_reg ;
  assign \nz.mem [466] = \nz.mem_466_sv2v_reg ;
  assign \nz.mem [465] = \nz.mem_465_sv2v_reg ;
  assign \nz.mem [464] = \nz.mem_464_sv2v_reg ;
  assign \nz.mem [463] = \nz.mem_463_sv2v_reg ;
  assign \nz.mem [462] = \nz.mem_462_sv2v_reg ;
  assign \nz.mem [461] = \nz.mem_461_sv2v_reg ;
  assign \nz.mem [460] = \nz.mem_460_sv2v_reg ;
  assign \nz.mem [459] = \nz.mem_459_sv2v_reg ;
  assign \nz.mem [458] = \nz.mem_458_sv2v_reg ;
  assign \nz.mem [457] = \nz.mem_457_sv2v_reg ;
  assign \nz.mem [456] = \nz.mem_456_sv2v_reg ;
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
  assign r_data_o[42] = (N26)? \nz.mem [42] : 
                        (N28)? \nz.mem [85] : 
                        (N30)? \nz.mem [128] : 
                        (N32)? \nz.mem [171] : 
                        (N34)? \nz.mem [214] : 
                        (N36)? \nz.mem [257] : 
                        (N38)? \nz.mem [300] : 
                        (N40)? \nz.mem [343] : 
                        (N27)? \nz.mem [386] : 
                        (N29)? \nz.mem [429] : 
                        (N31)? \nz.mem [472] : 
                        (N33)? \nz.mem [515] : 
                        (N35)? \nz.mem [558] : 
                        (N37)? \nz.mem [601] : 
                        (N39)? \nz.mem [644] : 
                        (N41)? \nz.mem [687] : 1'b0;
  assign r_data_o[41] = (N26)? \nz.mem [41] : 
                        (N28)? \nz.mem [84] : 
                        (N30)? \nz.mem [127] : 
                        (N32)? \nz.mem [170] : 
                        (N34)? \nz.mem [213] : 
                        (N36)? \nz.mem [256] : 
                        (N38)? \nz.mem [299] : 
                        (N40)? \nz.mem [342] : 
                        (N27)? \nz.mem [385] : 
                        (N29)? \nz.mem [428] : 
                        (N31)? \nz.mem [471] : 
                        (N33)? \nz.mem [514] : 
                        (N35)? \nz.mem [557] : 
                        (N37)? \nz.mem [600] : 
                        (N39)? \nz.mem [643] : 
                        (N41)? \nz.mem [686] : 1'b0;
  assign r_data_o[40] = (N26)? \nz.mem [40] : 
                        (N28)? \nz.mem [83] : 
                        (N30)? \nz.mem [126] : 
                        (N32)? \nz.mem [169] : 
                        (N34)? \nz.mem [212] : 
                        (N36)? \nz.mem [255] : 
                        (N38)? \nz.mem [298] : 
                        (N40)? \nz.mem [341] : 
                        (N27)? \nz.mem [384] : 
                        (N29)? \nz.mem [427] : 
                        (N31)? \nz.mem [470] : 
                        (N33)? \nz.mem [513] : 
                        (N35)? \nz.mem [556] : 
                        (N37)? \nz.mem [599] : 
                        (N39)? \nz.mem [642] : 
                        (N41)? \nz.mem [685] : 1'b0;
  assign r_data_o[39] = (N26)? \nz.mem [39] : 
                        (N28)? \nz.mem [82] : 
                        (N30)? \nz.mem [125] : 
                        (N32)? \nz.mem [168] : 
                        (N34)? \nz.mem [211] : 
                        (N36)? \nz.mem [254] : 
                        (N38)? \nz.mem [297] : 
                        (N40)? \nz.mem [340] : 
                        (N27)? \nz.mem [383] : 
                        (N29)? \nz.mem [426] : 
                        (N31)? \nz.mem [469] : 
                        (N33)? \nz.mem [512] : 
                        (N35)? \nz.mem [555] : 
                        (N37)? \nz.mem [598] : 
                        (N39)? \nz.mem [641] : 
                        (N41)? \nz.mem [684] : 1'b0;
  assign r_data_o[38] = (N26)? \nz.mem [38] : 
                        (N28)? \nz.mem [81] : 
                        (N30)? \nz.mem [124] : 
                        (N32)? \nz.mem [167] : 
                        (N34)? \nz.mem [210] : 
                        (N36)? \nz.mem [253] : 
                        (N38)? \nz.mem [296] : 
                        (N40)? \nz.mem [339] : 
                        (N27)? \nz.mem [382] : 
                        (N29)? \nz.mem [425] : 
                        (N31)? \nz.mem [468] : 
                        (N33)? \nz.mem [511] : 
                        (N35)? \nz.mem [554] : 
                        (N37)? \nz.mem [597] : 
                        (N39)? \nz.mem [640] : 
                        (N41)? \nz.mem [683] : 1'b0;
  assign r_data_o[37] = (N26)? \nz.mem [37] : 
                        (N28)? \nz.mem [80] : 
                        (N30)? \nz.mem [123] : 
                        (N32)? \nz.mem [166] : 
                        (N34)? \nz.mem [209] : 
                        (N36)? \nz.mem [252] : 
                        (N38)? \nz.mem [295] : 
                        (N40)? \nz.mem [338] : 
                        (N27)? \nz.mem [381] : 
                        (N29)? \nz.mem [424] : 
                        (N31)? \nz.mem [467] : 
                        (N33)? \nz.mem [510] : 
                        (N35)? \nz.mem [553] : 
                        (N37)? \nz.mem [596] : 
                        (N39)? \nz.mem [639] : 
                        (N41)? \nz.mem [682] : 1'b0;
  assign r_data_o[36] = (N26)? \nz.mem [36] : 
                        (N28)? \nz.mem [79] : 
                        (N30)? \nz.mem [122] : 
                        (N32)? \nz.mem [165] : 
                        (N34)? \nz.mem [208] : 
                        (N36)? \nz.mem [251] : 
                        (N38)? \nz.mem [294] : 
                        (N40)? \nz.mem [337] : 
                        (N27)? \nz.mem [380] : 
                        (N29)? \nz.mem [423] : 
                        (N31)? \nz.mem [466] : 
                        (N33)? \nz.mem [509] : 
                        (N35)? \nz.mem [552] : 
                        (N37)? \nz.mem [595] : 
                        (N39)? \nz.mem [638] : 
                        (N41)? \nz.mem [681] : 1'b0;
  assign r_data_o[35] = (N26)? \nz.mem [35] : 
                        (N28)? \nz.mem [78] : 
                        (N30)? \nz.mem [121] : 
                        (N32)? \nz.mem [164] : 
                        (N34)? \nz.mem [207] : 
                        (N36)? \nz.mem [250] : 
                        (N38)? \nz.mem [293] : 
                        (N40)? \nz.mem [336] : 
                        (N27)? \nz.mem [379] : 
                        (N29)? \nz.mem [422] : 
                        (N31)? \nz.mem [465] : 
                        (N33)? \nz.mem [508] : 
                        (N35)? \nz.mem [551] : 
                        (N37)? \nz.mem [594] : 
                        (N39)? \nz.mem [637] : 
                        (N41)? \nz.mem [680] : 1'b0;
  assign r_data_o[34] = (N26)? \nz.mem [34] : 
                        (N28)? \nz.mem [77] : 
                        (N30)? \nz.mem [120] : 
                        (N32)? \nz.mem [163] : 
                        (N34)? \nz.mem [206] : 
                        (N36)? \nz.mem [249] : 
                        (N38)? \nz.mem [292] : 
                        (N40)? \nz.mem [335] : 
                        (N27)? \nz.mem [378] : 
                        (N29)? \nz.mem [421] : 
                        (N31)? \nz.mem [464] : 
                        (N33)? \nz.mem [507] : 
                        (N35)? \nz.mem [550] : 
                        (N37)? \nz.mem [593] : 
                        (N39)? \nz.mem [636] : 
                        (N41)? \nz.mem [679] : 1'b0;
  assign r_data_o[33] = (N26)? \nz.mem [33] : 
                        (N28)? \nz.mem [76] : 
                        (N30)? \nz.mem [119] : 
                        (N32)? \nz.mem [162] : 
                        (N34)? \nz.mem [205] : 
                        (N36)? \nz.mem [248] : 
                        (N38)? \nz.mem [291] : 
                        (N40)? \nz.mem [334] : 
                        (N27)? \nz.mem [377] : 
                        (N29)? \nz.mem [420] : 
                        (N31)? \nz.mem [463] : 
                        (N33)? \nz.mem [506] : 
                        (N35)? \nz.mem [549] : 
                        (N37)? \nz.mem [592] : 
                        (N39)? \nz.mem [635] : 
                        (N41)? \nz.mem [678] : 1'b0;
  assign r_data_o[32] = (N26)? \nz.mem [32] : 
                        (N28)? \nz.mem [75] : 
                        (N30)? \nz.mem [118] : 
                        (N32)? \nz.mem [161] : 
                        (N34)? \nz.mem [204] : 
                        (N36)? \nz.mem [247] : 
                        (N38)? \nz.mem [290] : 
                        (N40)? \nz.mem [333] : 
                        (N27)? \nz.mem [376] : 
                        (N29)? \nz.mem [419] : 
                        (N31)? \nz.mem [462] : 
                        (N33)? \nz.mem [505] : 
                        (N35)? \nz.mem [548] : 
                        (N37)? \nz.mem [591] : 
                        (N39)? \nz.mem [634] : 
                        (N41)? \nz.mem [677] : 1'b0;
  assign r_data_o[31] = (N26)? \nz.mem [31] : 
                        (N28)? \nz.mem [74] : 
                        (N30)? \nz.mem [117] : 
                        (N32)? \nz.mem [160] : 
                        (N34)? \nz.mem [203] : 
                        (N36)? \nz.mem [246] : 
                        (N38)? \nz.mem [289] : 
                        (N40)? \nz.mem [332] : 
                        (N27)? \nz.mem [375] : 
                        (N29)? \nz.mem [418] : 
                        (N31)? \nz.mem [461] : 
                        (N33)? \nz.mem [504] : 
                        (N35)? \nz.mem [547] : 
                        (N37)? \nz.mem [590] : 
                        (N39)? \nz.mem [633] : 
                        (N41)? \nz.mem [676] : 1'b0;
  assign r_data_o[30] = (N26)? \nz.mem [30] : 
                        (N28)? \nz.mem [73] : 
                        (N30)? \nz.mem [116] : 
                        (N32)? \nz.mem [159] : 
                        (N34)? \nz.mem [202] : 
                        (N36)? \nz.mem [245] : 
                        (N38)? \nz.mem [288] : 
                        (N40)? \nz.mem [331] : 
                        (N27)? \nz.mem [374] : 
                        (N29)? \nz.mem [417] : 
                        (N31)? \nz.mem [460] : 
                        (N33)? \nz.mem [503] : 
                        (N35)? \nz.mem [546] : 
                        (N37)? \nz.mem [589] : 
                        (N39)? \nz.mem [632] : 
                        (N41)? \nz.mem [675] : 1'b0;
  assign r_data_o[29] = (N26)? \nz.mem [29] : 
                        (N28)? \nz.mem [72] : 
                        (N30)? \nz.mem [115] : 
                        (N32)? \nz.mem [158] : 
                        (N34)? \nz.mem [201] : 
                        (N36)? \nz.mem [244] : 
                        (N38)? \nz.mem [287] : 
                        (N40)? \nz.mem [330] : 
                        (N27)? \nz.mem [373] : 
                        (N29)? \nz.mem [416] : 
                        (N31)? \nz.mem [459] : 
                        (N33)? \nz.mem [502] : 
                        (N35)? \nz.mem [545] : 
                        (N37)? \nz.mem [588] : 
                        (N39)? \nz.mem [631] : 
                        (N41)? \nz.mem [674] : 1'b0;
  assign r_data_o[28] = (N26)? \nz.mem [28] : 
                        (N28)? \nz.mem [71] : 
                        (N30)? \nz.mem [114] : 
                        (N32)? \nz.mem [157] : 
                        (N34)? \nz.mem [200] : 
                        (N36)? \nz.mem [243] : 
                        (N38)? \nz.mem [286] : 
                        (N40)? \nz.mem [329] : 
                        (N27)? \nz.mem [372] : 
                        (N29)? \nz.mem [415] : 
                        (N31)? \nz.mem [458] : 
                        (N33)? \nz.mem [501] : 
                        (N35)? \nz.mem [544] : 
                        (N37)? \nz.mem [587] : 
                        (N39)? \nz.mem [630] : 
                        (N41)? \nz.mem [673] : 1'b0;
  assign r_data_o[27] = (N26)? \nz.mem [27] : 
                        (N28)? \nz.mem [70] : 
                        (N30)? \nz.mem [113] : 
                        (N32)? \nz.mem [156] : 
                        (N34)? \nz.mem [199] : 
                        (N36)? \nz.mem [242] : 
                        (N38)? \nz.mem [285] : 
                        (N40)? \nz.mem [328] : 
                        (N27)? \nz.mem [371] : 
                        (N29)? \nz.mem [414] : 
                        (N31)? \nz.mem [457] : 
                        (N33)? \nz.mem [500] : 
                        (N35)? \nz.mem [543] : 
                        (N37)? \nz.mem [586] : 
                        (N39)? \nz.mem [629] : 
                        (N41)? \nz.mem [672] : 1'b0;
  assign r_data_o[26] = (N26)? \nz.mem [26] : 
                        (N28)? \nz.mem [69] : 
                        (N30)? \nz.mem [112] : 
                        (N32)? \nz.mem [155] : 
                        (N34)? \nz.mem [198] : 
                        (N36)? \nz.mem [241] : 
                        (N38)? \nz.mem [284] : 
                        (N40)? \nz.mem [327] : 
                        (N27)? \nz.mem [370] : 
                        (N29)? \nz.mem [413] : 
                        (N31)? \nz.mem [456] : 
                        (N33)? \nz.mem [499] : 
                        (N35)? \nz.mem [542] : 
                        (N37)? \nz.mem [585] : 
                        (N39)? \nz.mem [628] : 
                        (N41)? \nz.mem [671] : 1'b0;
  assign r_data_o[25] = (N26)? \nz.mem [25] : 
                        (N28)? \nz.mem [68] : 
                        (N30)? \nz.mem [111] : 
                        (N32)? \nz.mem [154] : 
                        (N34)? \nz.mem [197] : 
                        (N36)? \nz.mem [240] : 
                        (N38)? \nz.mem [283] : 
                        (N40)? \nz.mem [326] : 
                        (N27)? \nz.mem [369] : 
                        (N29)? \nz.mem [412] : 
                        (N31)? \nz.mem [455] : 
                        (N33)? \nz.mem [498] : 
                        (N35)? \nz.mem [541] : 
                        (N37)? \nz.mem [584] : 
                        (N39)? \nz.mem [627] : 
                        (N41)? \nz.mem [670] : 1'b0;
  assign r_data_o[24] = (N26)? \nz.mem [24] : 
                        (N28)? \nz.mem [67] : 
                        (N30)? \nz.mem [110] : 
                        (N32)? \nz.mem [153] : 
                        (N34)? \nz.mem [196] : 
                        (N36)? \nz.mem [239] : 
                        (N38)? \nz.mem [282] : 
                        (N40)? \nz.mem [325] : 
                        (N27)? \nz.mem [368] : 
                        (N29)? \nz.mem [411] : 
                        (N31)? \nz.mem [454] : 
                        (N33)? \nz.mem [497] : 
                        (N35)? \nz.mem [540] : 
                        (N37)? \nz.mem [583] : 
                        (N39)? \nz.mem [626] : 
                        (N41)? \nz.mem [669] : 1'b0;
  assign r_data_o[23] = (N26)? \nz.mem [23] : 
                        (N28)? \nz.mem [66] : 
                        (N30)? \nz.mem [109] : 
                        (N32)? \nz.mem [152] : 
                        (N34)? \nz.mem [195] : 
                        (N36)? \nz.mem [238] : 
                        (N38)? \nz.mem [281] : 
                        (N40)? \nz.mem [324] : 
                        (N27)? \nz.mem [367] : 
                        (N29)? \nz.mem [410] : 
                        (N31)? \nz.mem [453] : 
                        (N33)? \nz.mem [496] : 
                        (N35)? \nz.mem [539] : 
                        (N37)? \nz.mem [582] : 
                        (N39)? \nz.mem [625] : 
                        (N41)? \nz.mem [668] : 1'b0;
  assign r_data_o[22] = (N26)? \nz.mem [22] : 
                        (N28)? \nz.mem [65] : 
                        (N30)? \nz.mem [108] : 
                        (N32)? \nz.mem [151] : 
                        (N34)? \nz.mem [194] : 
                        (N36)? \nz.mem [237] : 
                        (N38)? \nz.mem [280] : 
                        (N40)? \nz.mem [323] : 
                        (N27)? \nz.mem [366] : 
                        (N29)? \nz.mem [409] : 
                        (N31)? \nz.mem [452] : 
                        (N33)? \nz.mem [495] : 
                        (N35)? \nz.mem [538] : 
                        (N37)? \nz.mem [581] : 
                        (N39)? \nz.mem [624] : 
                        (N41)? \nz.mem [667] : 1'b0;
  assign r_data_o[21] = (N26)? \nz.mem [21] : 
                        (N28)? \nz.mem [64] : 
                        (N30)? \nz.mem [107] : 
                        (N32)? \nz.mem [150] : 
                        (N34)? \nz.mem [193] : 
                        (N36)? \nz.mem [236] : 
                        (N38)? \nz.mem [279] : 
                        (N40)? \nz.mem [322] : 
                        (N27)? \nz.mem [365] : 
                        (N29)? \nz.mem [408] : 
                        (N31)? \nz.mem [451] : 
                        (N33)? \nz.mem [494] : 
                        (N35)? \nz.mem [537] : 
                        (N37)? \nz.mem [580] : 
                        (N39)? \nz.mem [623] : 
                        (N41)? \nz.mem [666] : 1'b0;
  assign r_data_o[20] = (N26)? \nz.mem [20] : 
                        (N28)? \nz.mem [63] : 
                        (N30)? \nz.mem [106] : 
                        (N32)? \nz.mem [149] : 
                        (N34)? \nz.mem [192] : 
                        (N36)? \nz.mem [235] : 
                        (N38)? \nz.mem [278] : 
                        (N40)? \nz.mem [321] : 
                        (N27)? \nz.mem [364] : 
                        (N29)? \nz.mem [407] : 
                        (N31)? \nz.mem [450] : 
                        (N33)? \nz.mem [493] : 
                        (N35)? \nz.mem [536] : 
                        (N37)? \nz.mem [579] : 
                        (N39)? \nz.mem [622] : 
                        (N41)? \nz.mem [665] : 1'b0;
  assign r_data_o[19] = (N26)? \nz.mem [19] : 
                        (N28)? \nz.mem [62] : 
                        (N30)? \nz.mem [105] : 
                        (N32)? \nz.mem [148] : 
                        (N34)? \nz.mem [191] : 
                        (N36)? \nz.mem [234] : 
                        (N38)? \nz.mem [277] : 
                        (N40)? \nz.mem [320] : 
                        (N27)? \nz.mem [363] : 
                        (N29)? \nz.mem [406] : 
                        (N31)? \nz.mem [449] : 
                        (N33)? \nz.mem [492] : 
                        (N35)? \nz.mem [535] : 
                        (N37)? \nz.mem [578] : 
                        (N39)? \nz.mem [621] : 
                        (N41)? \nz.mem [664] : 1'b0;
  assign r_data_o[18] = (N26)? \nz.mem [18] : 
                        (N28)? \nz.mem [61] : 
                        (N30)? \nz.mem [104] : 
                        (N32)? \nz.mem [147] : 
                        (N34)? \nz.mem [190] : 
                        (N36)? \nz.mem [233] : 
                        (N38)? \nz.mem [276] : 
                        (N40)? \nz.mem [319] : 
                        (N27)? \nz.mem [362] : 
                        (N29)? \nz.mem [405] : 
                        (N31)? \nz.mem [448] : 
                        (N33)? \nz.mem [491] : 
                        (N35)? \nz.mem [534] : 
                        (N37)? \nz.mem [577] : 
                        (N39)? \nz.mem [620] : 
                        (N41)? \nz.mem [663] : 1'b0;
  assign r_data_o[17] = (N26)? \nz.mem [17] : 
                        (N28)? \nz.mem [60] : 
                        (N30)? \nz.mem [103] : 
                        (N32)? \nz.mem [146] : 
                        (N34)? \nz.mem [189] : 
                        (N36)? \nz.mem [232] : 
                        (N38)? \nz.mem [275] : 
                        (N40)? \nz.mem [318] : 
                        (N27)? \nz.mem [361] : 
                        (N29)? \nz.mem [404] : 
                        (N31)? \nz.mem [447] : 
                        (N33)? \nz.mem [490] : 
                        (N35)? \nz.mem [533] : 
                        (N37)? \nz.mem [576] : 
                        (N39)? \nz.mem [619] : 
                        (N41)? \nz.mem [662] : 1'b0;
  assign r_data_o[16] = (N26)? \nz.mem [16] : 
                        (N28)? \nz.mem [59] : 
                        (N30)? \nz.mem [102] : 
                        (N32)? \nz.mem [145] : 
                        (N34)? \nz.mem [188] : 
                        (N36)? \nz.mem [231] : 
                        (N38)? \nz.mem [274] : 
                        (N40)? \nz.mem [317] : 
                        (N27)? \nz.mem [360] : 
                        (N29)? \nz.mem [403] : 
                        (N31)? \nz.mem [446] : 
                        (N33)? \nz.mem [489] : 
                        (N35)? \nz.mem [532] : 
                        (N37)? \nz.mem [575] : 
                        (N39)? \nz.mem [618] : 
                        (N41)? \nz.mem [661] : 1'b0;
  assign r_data_o[15] = (N26)? \nz.mem [15] : 
                        (N28)? \nz.mem [58] : 
                        (N30)? \nz.mem [101] : 
                        (N32)? \nz.mem [144] : 
                        (N34)? \nz.mem [187] : 
                        (N36)? \nz.mem [230] : 
                        (N38)? \nz.mem [273] : 
                        (N40)? \nz.mem [316] : 
                        (N27)? \nz.mem [359] : 
                        (N29)? \nz.mem [402] : 
                        (N31)? \nz.mem [445] : 
                        (N33)? \nz.mem [488] : 
                        (N35)? \nz.mem [531] : 
                        (N37)? \nz.mem [574] : 
                        (N39)? \nz.mem [617] : 
                        (N41)? \nz.mem [660] : 1'b0;
  assign r_data_o[14] = (N26)? \nz.mem [14] : 
                        (N28)? \nz.mem [57] : 
                        (N30)? \nz.mem [100] : 
                        (N32)? \nz.mem [143] : 
                        (N34)? \nz.mem [186] : 
                        (N36)? \nz.mem [229] : 
                        (N38)? \nz.mem [272] : 
                        (N40)? \nz.mem [315] : 
                        (N27)? \nz.mem [358] : 
                        (N29)? \nz.mem [401] : 
                        (N31)? \nz.mem [444] : 
                        (N33)? \nz.mem [487] : 
                        (N35)? \nz.mem [530] : 
                        (N37)? \nz.mem [573] : 
                        (N39)? \nz.mem [616] : 
                        (N41)? \nz.mem [659] : 1'b0;
  assign r_data_o[13] = (N26)? \nz.mem [13] : 
                        (N28)? \nz.mem [56] : 
                        (N30)? \nz.mem [99] : 
                        (N32)? \nz.mem [142] : 
                        (N34)? \nz.mem [185] : 
                        (N36)? \nz.mem [228] : 
                        (N38)? \nz.mem [271] : 
                        (N40)? \nz.mem [314] : 
                        (N27)? \nz.mem [357] : 
                        (N29)? \nz.mem [400] : 
                        (N31)? \nz.mem [443] : 
                        (N33)? \nz.mem [486] : 
                        (N35)? \nz.mem [529] : 
                        (N37)? \nz.mem [572] : 
                        (N39)? \nz.mem [615] : 
                        (N41)? \nz.mem [658] : 1'b0;
  assign r_data_o[12] = (N26)? \nz.mem [12] : 
                        (N28)? \nz.mem [55] : 
                        (N30)? \nz.mem [98] : 
                        (N32)? \nz.mem [141] : 
                        (N34)? \nz.mem [184] : 
                        (N36)? \nz.mem [227] : 
                        (N38)? \nz.mem [270] : 
                        (N40)? \nz.mem [313] : 
                        (N27)? \nz.mem [356] : 
                        (N29)? \nz.mem [399] : 
                        (N31)? \nz.mem [442] : 
                        (N33)? \nz.mem [485] : 
                        (N35)? \nz.mem [528] : 
                        (N37)? \nz.mem [571] : 
                        (N39)? \nz.mem [614] : 
                        (N41)? \nz.mem [657] : 1'b0;
  assign r_data_o[11] = (N26)? \nz.mem [11] : 
                        (N28)? \nz.mem [54] : 
                        (N30)? \nz.mem [97] : 
                        (N32)? \nz.mem [140] : 
                        (N34)? \nz.mem [183] : 
                        (N36)? \nz.mem [226] : 
                        (N38)? \nz.mem [269] : 
                        (N40)? \nz.mem [312] : 
                        (N27)? \nz.mem [355] : 
                        (N29)? \nz.mem [398] : 
                        (N31)? \nz.mem [441] : 
                        (N33)? \nz.mem [484] : 
                        (N35)? \nz.mem [527] : 
                        (N37)? \nz.mem [570] : 
                        (N39)? \nz.mem [613] : 
                        (N41)? \nz.mem [656] : 1'b0;
  assign r_data_o[10] = (N26)? \nz.mem [10] : 
                        (N28)? \nz.mem [53] : 
                        (N30)? \nz.mem [96] : 
                        (N32)? \nz.mem [139] : 
                        (N34)? \nz.mem [182] : 
                        (N36)? \nz.mem [225] : 
                        (N38)? \nz.mem [268] : 
                        (N40)? \nz.mem [311] : 
                        (N27)? \nz.mem [354] : 
                        (N29)? \nz.mem [397] : 
                        (N31)? \nz.mem [440] : 
                        (N33)? \nz.mem [483] : 
                        (N35)? \nz.mem [526] : 
                        (N37)? \nz.mem [569] : 
                        (N39)? \nz.mem [612] : 
                        (N41)? \nz.mem [655] : 1'b0;
  assign r_data_o[9] = (N26)? \nz.mem [9] : 
                       (N28)? \nz.mem [52] : 
                       (N30)? \nz.mem [95] : 
                       (N32)? \nz.mem [138] : 
                       (N34)? \nz.mem [181] : 
                       (N36)? \nz.mem [224] : 
                       (N38)? \nz.mem [267] : 
                       (N40)? \nz.mem [310] : 
                       (N27)? \nz.mem [353] : 
                       (N29)? \nz.mem [396] : 
                       (N31)? \nz.mem [439] : 
                       (N33)? \nz.mem [482] : 
                       (N35)? \nz.mem [525] : 
                       (N37)? \nz.mem [568] : 
                       (N39)? \nz.mem [611] : 
                       (N41)? \nz.mem [654] : 1'b0;
  assign r_data_o[8] = (N26)? \nz.mem [8] : 
                       (N28)? \nz.mem [51] : 
                       (N30)? \nz.mem [94] : 
                       (N32)? \nz.mem [137] : 
                       (N34)? \nz.mem [180] : 
                       (N36)? \nz.mem [223] : 
                       (N38)? \nz.mem [266] : 
                       (N40)? \nz.mem [309] : 
                       (N27)? \nz.mem [352] : 
                       (N29)? \nz.mem [395] : 
                       (N31)? \nz.mem [438] : 
                       (N33)? \nz.mem [481] : 
                       (N35)? \nz.mem [524] : 
                       (N37)? \nz.mem [567] : 
                       (N39)? \nz.mem [610] : 
                       (N41)? \nz.mem [653] : 1'b0;
  assign r_data_o[7] = (N26)? \nz.mem [7] : 
                       (N28)? \nz.mem [50] : 
                       (N30)? \nz.mem [93] : 
                       (N32)? \nz.mem [136] : 
                       (N34)? \nz.mem [179] : 
                       (N36)? \nz.mem [222] : 
                       (N38)? \nz.mem [265] : 
                       (N40)? \nz.mem [308] : 
                       (N27)? \nz.mem [351] : 
                       (N29)? \nz.mem [394] : 
                       (N31)? \nz.mem [437] : 
                       (N33)? \nz.mem [480] : 
                       (N35)? \nz.mem [523] : 
                       (N37)? \nz.mem [566] : 
                       (N39)? \nz.mem [609] : 
                       (N41)? \nz.mem [652] : 1'b0;
  assign r_data_o[6] = (N26)? \nz.mem [6] : 
                       (N28)? \nz.mem [49] : 
                       (N30)? \nz.mem [92] : 
                       (N32)? \nz.mem [135] : 
                       (N34)? \nz.mem [178] : 
                       (N36)? \nz.mem [221] : 
                       (N38)? \nz.mem [264] : 
                       (N40)? \nz.mem [307] : 
                       (N27)? \nz.mem [350] : 
                       (N29)? \nz.mem [393] : 
                       (N31)? \nz.mem [436] : 
                       (N33)? \nz.mem [479] : 
                       (N35)? \nz.mem [522] : 
                       (N37)? \nz.mem [565] : 
                       (N39)? \nz.mem [608] : 
                       (N41)? \nz.mem [651] : 1'b0;
  assign r_data_o[5] = (N26)? \nz.mem [5] : 
                       (N28)? \nz.mem [48] : 
                       (N30)? \nz.mem [91] : 
                       (N32)? \nz.mem [134] : 
                       (N34)? \nz.mem [177] : 
                       (N36)? \nz.mem [220] : 
                       (N38)? \nz.mem [263] : 
                       (N40)? \nz.mem [306] : 
                       (N27)? \nz.mem [349] : 
                       (N29)? \nz.mem [392] : 
                       (N31)? \nz.mem [435] : 
                       (N33)? \nz.mem [478] : 
                       (N35)? \nz.mem [521] : 
                       (N37)? \nz.mem [564] : 
                       (N39)? \nz.mem [607] : 
                       (N41)? \nz.mem [650] : 1'b0;
  assign r_data_o[4] = (N26)? \nz.mem [4] : 
                       (N28)? \nz.mem [47] : 
                       (N30)? \nz.mem [90] : 
                       (N32)? \nz.mem [133] : 
                       (N34)? \nz.mem [176] : 
                       (N36)? \nz.mem [219] : 
                       (N38)? \nz.mem [262] : 
                       (N40)? \nz.mem [305] : 
                       (N27)? \nz.mem [348] : 
                       (N29)? \nz.mem [391] : 
                       (N31)? \nz.mem [434] : 
                       (N33)? \nz.mem [477] : 
                       (N35)? \nz.mem [520] : 
                       (N37)? \nz.mem [563] : 
                       (N39)? \nz.mem [606] : 
                       (N41)? \nz.mem [649] : 1'b0;
  assign r_data_o[3] = (N26)? \nz.mem [3] : 
                       (N28)? \nz.mem [46] : 
                       (N30)? \nz.mem [89] : 
                       (N32)? \nz.mem [132] : 
                       (N34)? \nz.mem [175] : 
                       (N36)? \nz.mem [218] : 
                       (N38)? \nz.mem [261] : 
                       (N40)? \nz.mem [304] : 
                       (N27)? \nz.mem [347] : 
                       (N29)? \nz.mem [390] : 
                       (N31)? \nz.mem [433] : 
                       (N33)? \nz.mem [476] : 
                       (N35)? \nz.mem [519] : 
                       (N37)? \nz.mem [562] : 
                       (N39)? \nz.mem [605] : 
                       (N41)? \nz.mem [648] : 1'b0;
  assign r_data_o[2] = (N26)? \nz.mem [2] : 
                       (N28)? \nz.mem [45] : 
                       (N30)? \nz.mem [88] : 
                       (N32)? \nz.mem [131] : 
                       (N34)? \nz.mem [174] : 
                       (N36)? \nz.mem [217] : 
                       (N38)? \nz.mem [260] : 
                       (N40)? \nz.mem [303] : 
                       (N27)? \nz.mem [346] : 
                       (N29)? \nz.mem [389] : 
                       (N31)? \nz.mem [432] : 
                       (N33)? \nz.mem [475] : 
                       (N35)? \nz.mem [518] : 
                       (N37)? \nz.mem [561] : 
                       (N39)? \nz.mem [604] : 
                       (N41)? \nz.mem [647] : 1'b0;
  assign r_data_o[1] = (N26)? \nz.mem [1] : 
                       (N28)? \nz.mem [44] : 
                       (N30)? \nz.mem [87] : 
                       (N32)? \nz.mem [130] : 
                       (N34)? \nz.mem [173] : 
                       (N36)? \nz.mem [216] : 
                       (N38)? \nz.mem [259] : 
                       (N40)? \nz.mem [302] : 
                       (N27)? \nz.mem [345] : 
                       (N29)? \nz.mem [388] : 
                       (N31)? \nz.mem [431] : 
                       (N33)? \nz.mem [474] : 
                       (N35)? \nz.mem [517] : 
                       (N37)? \nz.mem [560] : 
                       (N39)? \nz.mem [603] : 
                       (N41)? \nz.mem [646] : 1'b0;
  assign r_data_o[0] = (N26)? \nz.mem [0] : 
                       (N28)? \nz.mem [43] : 
                       (N30)? \nz.mem [86] : 
                       (N32)? \nz.mem [129] : 
                       (N34)? \nz.mem [172] : 
                       (N36)? \nz.mem [215] : 
                       (N38)? \nz.mem [258] : 
                       (N40)? \nz.mem [301] : 
                       (N27)? \nz.mem [344] : 
                       (N29)? \nz.mem [387] : 
                       (N31)? \nz.mem [430] : 
                       (N33)? \nz.mem [473] : 
                       (N35)? \nz.mem [516] : 
                       (N37)? \nz.mem [559] : 
                       (N39)? \nz.mem [602] : 
                       (N41)? \nz.mem [645] : 1'b0;
  assign N75 = w_addr_i[2] & w_addr_i[3];
  assign N76 = N0 & w_addr_i[3];
  assign N0 = ~w_addr_i[2];
  assign N77 = w_addr_i[2] & N1;
  assign N1 = ~w_addr_i[3];
  assign N78 = N2 & N3;
  assign N2 = ~w_addr_i[2];
  assign N3 = ~w_addr_i[3];
  assign N79 = w_addr_i[0] & w_addr_i[1];
  assign N80 = N4 & w_addr_i[1];
  assign N4 = ~w_addr_i[0];
  assign N81 = w_addr_i[0] & N5;
  assign N5 = ~w_addr_i[1];
  assign N82 = N6 & N7;
  assign N6 = ~w_addr_i[0];
  assign N7 = ~w_addr_i[1];
  assign N58 = N75 & N79;
  assign N57 = N75 & N80;
  assign N56 = N75 & N81;
  assign N55 = N75 & N82;
  assign N54 = N76 & N79;
  assign N53 = N76 & N80;
  assign N52 = N76 & N81;
  assign N51 = N76 & N82;
  assign N50 = N77 & N79;
  assign N49 = N77 & N80;
  assign N48 = N77 & N81;
  assign N47 = N77 & N82;
  assign N46 = N78 & N79;
  assign N45 = N78 & N80;
  assign N44 = N78 & N81;
  assign N43 = N78 & N82;
  assign { N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64, N63, N62, N61, N60, N59 } = (N8)? { N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48, N47, N46, N45, N44, N43 } : 
                                                                                              (N9)? { 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0 } : 1'b0;
  assign N8 = w_v_i;
  assign N9 = N42;
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
  assign N25 = ~r_addr_i[3];
  assign N26 = N17 & N25;
  assign N27 = N17 & r_addr_i[3];
  assign N28 = N19 & N25;
  assign N29 = N19 & r_addr_i[3];
  assign N30 = N21 & N25;
  assign N31 = N21 & r_addr_i[3];
  assign N32 = N23 & N25;
  assign N33 = N23 & r_addr_i[3];
  assign N34 = N18 & N25;
  assign N35 = N18 & r_addr_i[3];
  assign N36 = N20 & N25;
  assign N37 = N20 & r_addr_i[3];
  assign N38 = N22 & N25;
  assign N39 = N22 & r_addr_i[3];
  assign N40 = N24 & N25;
  assign N41 = N24 & r_addr_i[3];
  assign N42 = ~w_v_i;

  always @(posedge w_clk_i) begin
    if(N74) begin
      \nz.mem_687_sv2v_reg  <= w_data_i[42];
      \nz.mem_686_sv2v_reg  <= w_data_i[41];
      \nz.mem_685_sv2v_reg  <= w_data_i[40];
      \nz.mem_684_sv2v_reg  <= w_data_i[39];
      \nz.mem_683_sv2v_reg  <= w_data_i[38];
      \nz.mem_682_sv2v_reg  <= w_data_i[37];
      \nz.mem_681_sv2v_reg  <= w_data_i[36];
      \nz.mem_680_sv2v_reg  <= w_data_i[35];
      \nz.mem_679_sv2v_reg  <= w_data_i[34];
      \nz.mem_678_sv2v_reg  <= w_data_i[33];
      \nz.mem_677_sv2v_reg  <= w_data_i[32];
      \nz.mem_676_sv2v_reg  <= w_data_i[31];
      \nz.mem_675_sv2v_reg  <= w_data_i[30];
      \nz.mem_674_sv2v_reg  <= w_data_i[29];
      \nz.mem_673_sv2v_reg  <= w_data_i[28];
      \nz.mem_672_sv2v_reg  <= w_data_i[27];
      \nz.mem_671_sv2v_reg  <= w_data_i[26];
      \nz.mem_670_sv2v_reg  <= w_data_i[25];
      \nz.mem_669_sv2v_reg  <= w_data_i[24];
      \nz.mem_668_sv2v_reg  <= w_data_i[23];
      \nz.mem_667_sv2v_reg  <= w_data_i[22];
      \nz.mem_666_sv2v_reg  <= w_data_i[21];
      \nz.mem_665_sv2v_reg  <= w_data_i[20];
      \nz.mem_664_sv2v_reg  <= w_data_i[19];
      \nz.mem_663_sv2v_reg  <= w_data_i[18];
      \nz.mem_662_sv2v_reg  <= w_data_i[17];
      \nz.mem_661_sv2v_reg  <= w_data_i[16];
      \nz.mem_660_sv2v_reg  <= w_data_i[15];
      \nz.mem_659_sv2v_reg  <= w_data_i[14];
      \nz.mem_658_sv2v_reg  <= w_data_i[13];
      \nz.mem_657_sv2v_reg  <= w_data_i[12];
      \nz.mem_656_sv2v_reg  <= w_data_i[11];
      \nz.mem_655_sv2v_reg  <= w_data_i[10];
      \nz.mem_654_sv2v_reg  <= w_data_i[9];
      \nz.mem_653_sv2v_reg  <= w_data_i[8];
      \nz.mem_652_sv2v_reg  <= w_data_i[7];
      \nz.mem_651_sv2v_reg  <= w_data_i[6];
      \nz.mem_650_sv2v_reg  <= w_data_i[5];
      \nz.mem_649_sv2v_reg  <= w_data_i[4];
      \nz.mem_648_sv2v_reg  <= w_data_i[3];
      \nz.mem_647_sv2v_reg  <= w_data_i[2];
      \nz.mem_646_sv2v_reg  <= w_data_i[1];
      \nz.mem_645_sv2v_reg  <= w_data_i[0];
    end 
    if(N73) begin
      \nz.mem_644_sv2v_reg  <= w_data_i[42];
      \nz.mem_643_sv2v_reg  <= w_data_i[41];
      \nz.mem_642_sv2v_reg  <= w_data_i[40];
      \nz.mem_641_sv2v_reg  <= w_data_i[39];
      \nz.mem_640_sv2v_reg  <= w_data_i[38];
      \nz.mem_639_sv2v_reg  <= w_data_i[37];
      \nz.mem_638_sv2v_reg  <= w_data_i[36];
      \nz.mem_637_sv2v_reg  <= w_data_i[35];
      \nz.mem_636_sv2v_reg  <= w_data_i[34];
      \nz.mem_635_sv2v_reg  <= w_data_i[33];
      \nz.mem_634_sv2v_reg  <= w_data_i[32];
      \nz.mem_633_sv2v_reg  <= w_data_i[31];
      \nz.mem_632_sv2v_reg  <= w_data_i[30];
      \nz.mem_631_sv2v_reg  <= w_data_i[29];
      \nz.mem_630_sv2v_reg  <= w_data_i[28];
      \nz.mem_629_sv2v_reg  <= w_data_i[27];
      \nz.mem_628_sv2v_reg  <= w_data_i[26];
      \nz.mem_627_sv2v_reg  <= w_data_i[25];
      \nz.mem_626_sv2v_reg  <= w_data_i[24];
      \nz.mem_625_sv2v_reg  <= w_data_i[23];
      \nz.mem_624_sv2v_reg  <= w_data_i[22];
      \nz.mem_623_sv2v_reg  <= w_data_i[21];
      \nz.mem_622_sv2v_reg  <= w_data_i[20];
      \nz.mem_621_sv2v_reg  <= w_data_i[19];
      \nz.mem_620_sv2v_reg  <= w_data_i[18];
      \nz.mem_619_sv2v_reg  <= w_data_i[17];
      \nz.mem_618_sv2v_reg  <= w_data_i[16];
      \nz.mem_617_sv2v_reg  <= w_data_i[15];
      \nz.mem_616_sv2v_reg  <= w_data_i[14];
      \nz.mem_615_sv2v_reg  <= w_data_i[13];
      \nz.mem_614_sv2v_reg  <= w_data_i[12];
      \nz.mem_613_sv2v_reg  <= w_data_i[11];
      \nz.mem_612_sv2v_reg  <= w_data_i[10];
      \nz.mem_611_sv2v_reg  <= w_data_i[9];
      \nz.mem_610_sv2v_reg  <= w_data_i[8];
      \nz.mem_609_sv2v_reg  <= w_data_i[7];
      \nz.mem_608_sv2v_reg  <= w_data_i[6];
      \nz.mem_607_sv2v_reg  <= w_data_i[5];
      \nz.mem_606_sv2v_reg  <= w_data_i[4];
      \nz.mem_605_sv2v_reg  <= w_data_i[3];
      \nz.mem_604_sv2v_reg  <= w_data_i[2];
      \nz.mem_603_sv2v_reg  <= w_data_i[1];
      \nz.mem_602_sv2v_reg  <= w_data_i[0];
    end 
    if(N72) begin
      \nz.mem_601_sv2v_reg  <= w_data_i[42];
      \nz.mem_600_sv2v_reg  <= w_data_i[41];
      \nz.mem_599_sv2v_reg  <= w_data_i[40];
      \nz.mem_598_sv2v_reg  <= w_data_i[39];
      \nz.mem_597_sv2v_reg  <= w_data_i[38];
      \nz.mem_596_sv2v_reg  <= w_data_i[37];
      \nz.mem_595_sv2v_reg  <= w_data_i[36];
      \nz.mem_594_sv2v_reg  <= w_data_i[35];
      \nz.mem_593_sv2v_reg  <= w_data_i[34];
      \nz.mem_592_sv2v_reg  <= w_data_i[33];
      \nz.mem_591_sv2v_reg  <= w_data_i[32];
      \nz.mem_590_sv2v_reg  <= w_data_i[31];
      \nz.mem_589_sv2v_reg  <= w_data_i[30];
      \nz.mem_588_sv2v_reg  <= w_data_i[29];
      \nz.mem_587_sv2v_reg  <= w_data_i[28];
      \nz.mem_586_sv2v_reg  <= w_data_i[27];
      \nz.mem_585_sv2v_reg  <= w_data_i[26];
      \nz.mem_584_sv2v_reg  <= w_data_i[25];
      \nz.mem_583_sv2v_reg  <= w_data_i[24];
      \nz.mem_582_sv2v_reg  <= w_data_i[23];
      \nz.mem_581_sv2v_reg  <= w_data_i[22];
      \nz.mem_580_sv2v_reg  <= w_data_i[21];
      \nz.mem_579_sv2v_reg  <= w_data_i[20];
      \nz.mem_578_sv2v_reg  <= w_data_i[19];
      \nz.mem_577_sv2v_reg  <= w_data_i[18];
      \nz.mem_576_sv2v_reg  <= w_data_i[17];
      \nz.mem_575_sv2v_reg  <= w_data_i[16];
      \nz.mem_574_sv2v_reg  <= w_data_i[15];
      \nz.mem_573_sv2v_reg  <= w_data_i[14];
      \nz.mem_572_sv2v_reg  <= w_data_i[13];
      \nz.mem_571_sv2v_reg  <= w_data_i[12];
      \nz.mem_570_sv2v_reg  <= w_data_i[11];
      \nz.mem_569_sv2v_reg  <= w_data_i[10];
      \nz.mem_568_sv2v_reg  <= w_data_i[9];
      \nz.mem_567_sv2v_reg  <= w_data_i[8];
      \nz.mem_566_sv2v_reg  <= w_data_i[7];
      \nz.mem_565_sv2v_reg  <= w_data_i[6];
      \nz.mem_564_sv2v_reg  <= w_data_i[5];
      \nz.mem_563_sv2v_reg  <= w_data_i[4];
      \nz.mem_562_sv2v_reg  <= w_data_i[3];
      \nz.mem_561_sv2v_reg  <= w_data_i[2];
      \nz.mem_560_sv2v_reg  <= w_data_i[1];
      \nz.mem_559_sv2v_reg  <= w_data_i[0];
    end 
    if(N71) begin
      \nz.mem_558_sv2v_reg  <= w_data_i[42];
      \nz.mem_557_sv2v_reg  <= w_data_i[41];
      \nz.mem_556_sv2v_reg  <= w_data_i[40];
      \nz.mem_555_sv2v_reg  <= w_data_i[39];
      \nz.mem_554_sv2v_reg  <= w_data_i[38];
      \nz.mem_553_sv2v_reg  <= w_data_i[37];
      \nz.mem_552_sv2v_reg  <= w_data_i[36];
      \nz.mem_551_sv2v_reg  <= w_data_i[35];
      \nz.mem_550_sv2v_reg  <= w_data_i[34];
      \nz.mem_549_sv2v_reg  <= w_data_i[33];
      \nz.mem_548_sv2v_reg  <= w_data_i[32];
      \nz.mem_547_sv2v_reg  <= w_data_i[31];
      \nz.mem_546_sv2v_reg  <= w_data_i[30];
      \nz.mem_545_sv2v_reg  <= w_data_i[29];
      \nz.mem_544_sv2v_reg  <= w_data_i[28];
      \nz.mem_543_sv2v_reg  <= w_data_i[27];
      \nz.mem_542_sv2v_reg  <= w_data_i[26];
      \nz.mem_541_sv2v_reg  <= w_data_i[25];
      \nz.mem_540_sv2v_reg  <= w_data_i[24];
      \nz.mem_539_sv2v_reg  <= w_data_i[23];
      \nz.mem_538_sv2v_reg  <= w_data_i[22];
      \nz.mem_537_sv2v_reg  <= w_data_i[21];
      \nz.mem_536_sv2v_reg  <= w_data_i[20];
      \nz.mem_535_sv2v_reg  <= w_data_i[19];
      \nz.mem_534_sv2v_reg  <= w_data_i[18];
      \nz.mem_533_sv2v_reg  <= w_data_i[17];
      \nz.mem_532_sv2v_reg  <= w_data_i[16];
      \nz.mem_531_sv2v_reg  <= w_data_i[15];
      \nz.mem_530_sv2v_reg  <= w_data_i[14];
      \nz.mem_529_sv2v_reg  <= w_data_i[13];
      \nz.mem_528_sv2v_reg  <= w_data_i[12];
      \nz.mem_527_sv2v_reg  <= w_data_i[11];
      \nz.mem_526_sv2v_reg  <= w_data_i[10];
      \nz.mem_525_sv2v_reg  <= w_data_i[9];
      \nz.mem_524_sv2v_reg  <= w_data_i[8];
      \nz.mem_523_sv2v_reg  <= w_data_i[7];
      \nz.mem_522_sv2v_reg  <= w_data_i[6];
      \nz.mem_521_sv2v_reg  <= w_data_i[5];
      \nz.mem_520_sv2v_reg  <= w_data_i[4];
      \nz.mem_519_sv2v_reg  <= w_data_i[3];
      \nz.mem_518_sv2v_reg  <= w_data_i[2];
      \nz.mem_517_sv2v_reg  <= w_data_i[1];
      \nz.mem_516_sv2v_reg  <= w_data_i[0];
    end 
    if(N70) begin
      \nz.mem_515_sv2v_reg  <= w_data_i[42];
      \nz.mem_514_sv2v_reg  <= w_data_i[41];
      \nz.mem_513_sv2v_reg  <= w_data_i[40];
      \nz.mem_512_sv2v_reg  <= w_data_i[39];
      \nz.mem_511_sv2v_reg  <= w_data_i[38];
      \nz.mem_510_sv2v_reg  <= w_data_i[37];
      \nz.mem_509_sv2v_reg  <= w_data_i[36];
      \nz.mem_508_sv2v_reg  <= w_data_i[35];
      \nz.mem_507_sv2v_reg  <= w_data_i[34];
      \nz.mem_506_sv2v_reg  <= w_data_i[33];
      \nz.mem_505_sv2v_reg  <= w_data_i[32];
      \nz.mem_504_sv2v_reg  <= w_data_i[31];
      \nz.mem_503_sv2v_reg  <= w_data_i[30];
      \nz.mem_502_sv2v_reg  <= w_data_i[29];
      \nz.mem_501_sv2v_reg  <= w_data_i[28];
      \nz.mem_500_sv2v_reg  <= w_data_i[27];
      \nz.mem_499_sv2v_reg  <= w_data_i[26];
      \nz.mem_498_sv2v_reg  <= w_data_i[25];
      \nz.mem_497_sv2v_reg  <= w_data_i[24];
      \nz.mem_496_sv2v_reg  <= w_data_i[23];
      \nz.mem_495_sv2v_reg  <= w_data_i[22];
      \nz.mem_494_sv2v_reg  <= w_data_i[21];
      \nz.mem_493_sv2v_reg  <= w_data_i[20];
      \nz.mem_492_sv2v_reg  <= w_data_i[19];
      \nz.mem_491_sv2v_reg  <= w_data_i[18];
      \nz.mem_490_sv2v_reg  <= w_data_i[17];
      \nz.mem_489_sv2v_reg  <= w_data_i[16];
      \nz.mem_488_sv2v_reg  <= w_data_i[15];
      \nz.mem_487_sv2v_reg  <= w_data_i[14];
      \nz.mem_486_sv2v_reg  <= w_data_i[13];
      \nz.mem_485_sv2v_reg  <= w_data_i[12];
      \nz.mem_484_sv2v_reg  <= w_data_i[11];
      \nz.mem_483_sv2v_reg  <= w_data_i[10];
      \nz.mem_482_sv2v_reg  <= w_data_i[9];
      \nz.mem_481_sv2v_reg  <= w_data_i[8];
      \nz.mem_480_sv2v_reg  <= w_data_i[7];
      \nz.mem_479_sv2v_reg  <= w_data_i[6];
      \nz.mem_478_sv2v_reg  <= w_data_i[5];
      \nz.mem_477_sv2v_reg  <= w_data_i[4];
      \nz.mem_476_sv2v_reg  <= w_data_i[3];
      \nz.mem_475_sv2v_reg  <= w_data_i[2];
      \nz.mem_474_sv2v_reg  <= w_data_i[1];
      \nz.mem_473_sv2v_reg  <= w_data_i[0];
    end 
    if(N69) begin
      \nz.mem_472_sv2v_reg  <= w_data_i[42];
      \nz.mem_471_sv2v_reg  <= w_data_i[41];
      \nz.mem_470_sv2v_reg  <= w_data_i[40];
      \nz.mem_469_sv2v_reg  <= w_data_i[39];
      \nz.mem_468_sv2v_reg  <= w_data_i[38];
      \nz.mem_467_sv2v_reg  <= w_data_i[37];
      \nz.mem_466_sv2v_reg  <= w_data_i[36];
      \nz.mem_465_sv2v_reg  <= w_data_i[35];
      \nz.mem_464_sv2v_reg  <= w_data_i[34];
      \nz.mem_463_sv2v_reg  <= w_data_i[33];
      \nz.mem_462_sv2v_reg  <= w_data_i[32];
      \nz.mem_461_sv2v_reg  <= w_data_i[31];
      \nz.mem_460_sv2v_reg  <= w_data_i[30];
      \nz.mem_459_sv2v_reg  <= w_data_i[29];
      \nz.mem_458_sv2v_reg  <= w_data_i[28];
      \nz.mem_457_sv2v_reg  <= w_data_i[27];
      \nz.mem_456_sv2v_reg  <= w_data_i[26];
      \nz.mem_455_sv2v_reg  <= w_data_i[25];
      \nz.mem_454_sv2v_reg  <= w_data_i[24];
      \nz.mem_453_sv2v_reg  <= w_data_i[23];
      \nz.mem_452_sv2v_reg  <= w_data_i[22];
      \nz.mem_451_sv2v_reg  <= w_data_i[21];
      \nz.mem_450_sv2v_reg  <= w_data_i[20];
      \nz.mem_449_sv2v_reg  <= w_data_i[19];
      \nz.mem_448_sv2v_reg  <= w_data_i[18];
      \nz.mem_447_sv2v_reg  <= w_data_i[17];
      \nz.mem_446_sv2v_reg  <= w_data_i[16];
      \nz.mem_445_sv2v_reg  <= w_data_i[15];
      \nz.mem_444_sv2v_reg  <= w_data_i[14];
      \nz.mem_443_sv2v_reg  <= w_data_i[13];
      \nz.mem_442_sv2v_reg  <= w_data_i[12];
      \nz.mem_441_sv2v_reg  <= w_data_i[11];
      \nz.mem_440_sv2v_reg  <= w_data_i[10];
      \nz.mem_439_sv2v_reg  <= w_data_i[9];
      \nz.mem_438_sv2v_reg  <= w_data_i[8];
      \nz.mem_437_sv2v_reg  <= w_data_i[7];
      \nz.mem_436_sv2v_reg  <= w_data_i[6];
      \nz.mem_435_sv2v_reg  <= w_data_i[5];
      \nz.mem_434_sv2v_reg  <= w_data_i[4];
      \nz.mem_433_sv2v_reg  <= w_data_i[3];
      \nz.mem_432_sv2v_reg  <= w_data_i[2];
      \nz.mem_431_sv2v_reg  <= w_data_i[1];
      \nz.mem_430_sv2v_reg  <= w_data_i[0];
    end 
    if(N68) begin
      \nz.mem_429_sv2v_reg  <= w_data_i[42];
      \nz.mem_428_sv2v_reg  <= w_data_i[41];
      \nz.mem_427_sv2v_reg  <= w_data_i[40];
      \nz.mem_426_sv2v_reg  <= w_data_i[39];
      \nz.mem_425_sv2v_reg  <= w_data_i[38];
      \nz.mem_424_sv2v_reg  <= w_data_i[37];
      \nz.mem_423_sv2v_reg  <= w_data_i[36];
      \nz.mem_422_sv2v_reg  <= w_data_i[35];
      \nz.mem_421_sv2v_reg  <= w_data_i[34];
      \nz.mem_420_sv2v_reg  <= w_data_i[33];
      \nz.mem_419_sv2v_reg  <= w_data_i[32];
      \nz.mem_418_sv2v_reg  <= w_data_i[31];
      \nz.mem_417_sv2v_reg  <= w_data_i[30];
      \nz.mem_416_sv2v_reg  <= w_data_i[29];
      \nz.mem_415_sv2v_reg  <= w_data_i[28];
      \nz.mem_414_sv2v_reg  <= w_data_i[27];
      \nz.mem_413_sv2v_reg  <= w_data_i[26];
      \nz.mem_412_sv2v_reg  <= w_data_i[25];
      \nz.mem_411_sv2v_reg  <= w_data_i[24];
      \nz.mem_410_sv2v_reg  <= w_data_i[23];
      \nz.mem_409_sv2v_reg  <= w_data_i[22];
      \nz.mem_408_sv2v_reg  <= w_data_i[21];
      \nz.mem_407_sv2v_reg  <= w_data_i[20];
      \nz.mem_406_sv2v_reg  <= w_data_i[19];
      \nz.mem_405_sv2v_reg  <= w_data_i[18];
      \nz.mem_404_sv2v_reg  <= w_data_i[17];
      \nz.mem_403_sv2v_reg  <= w_data_i[16];
      \nz.mem_402_sv2v_reg  <= w_data_i[15];
      \nz.mem_401_sv2v_reg  <= w_data_i[14];
      \nz.mem_400_sv2v_reg  <= w_data_i[13];
      \nz.mem_399_sv2v_reg  <= w_data_i[12];
      \nz.mem_398_sv2v_reg  <= w_data_i[11];
      \nz.mem_397_sv2v_reg  <= w_data_i[10];
      \nz.mem_396_sv2v_reg  <= w_data_i[9];
      \nz.mem_395_sv2v_reg  <= w_data_i[8];
      \nz.mem_394_sv2v_reg  <= w_data_i[7];
      \nz.mem_393_sv2v_reg  <= w_data_i[6];
      \nz.mem_392_sv2v_reg  <= w_data_i[5];
      \nz.mem_391_sv2v_reg  <= w_data_i[4];
      \nz.mem_390_sv2v_reg  <= w_data_i[3];
      \nz.mem_389_sv2v_reg  <= w_data_i[2];
      \nz.mem_388_sv2v_reg  <= w_data_i[1];
      \nz.mem_387_sv2v_reg  <= w_data_i[0];
    end 
    if(N67) begin
      \nz.mem_386_sv2v_reg  <= w_data_i[42];
      \nz.mem_385_sv2v_reg  <= w_data_i[41];
      \nz.mem_384_sv2v_reg  <= w_data_i[40];
      \nz.mem_383_sv2v_reg  <= w_data_i[39];
      \nz.mem_382_sv2v_reg  <= w_data_i[38];
      \nz.mem_381_sv2v_reg  <= w_data_i[37];
      \nz.mem_380_sv2v_reg  <= w_data_i[36];
      \nz.mem_379_sv2v_reg  <= w_data_i[35];
      \nz.mem_378_sv2v_reg  <= w_data_i[34];
      \nz.mem_377_sv2v_reg  <= w_data_i[33];
      \nz.mem_376_sv2v_reg  <= w_data_i[32];
      \nz.mem_375_sv2v_reg  <= w_data_i[31];
      \nz.mem_374_sv2v_reg  <= w_data_i[30];
      \nz.mem_373_sv2v_reg  <= w_data_i[29];
      \nz.mem_372_sv2v_reg  <= w_data_i[28];
      \nz.mem_371_sv2v_reg  <= w_data_i[27];
      \nz.mem_370_sv2v_reg  <= w_data_i[26];
      \nz.mem_369_sv2v_reg  <= w_data_i[25];
      \nz.mem_368_sv2v_reg  <= w_data_i[24];
      \nz.mem_367_sv2v_reg  <= w_data_i[23];
      \nz.mem_366_sv2v_reg  <= w_data_i[22];
      \nz.mem_365_sv2v_reg  <= w_data_i[21];
      \nz.mem_364_sv2v_reg  <= w_data_i[20];
      \nz.mem_363_sv2v_reg  <= w_data_i[19];
      \nz.mem_362_sv2v_reg  <= w_data_i[18];
      \nz.mem_361_sv2v_reg  <= w_data_i[17];
      \nz.mem_360_sv2v_reg  <= w_data_i[16];
      \nz.mem_359_sv2v_reg  <= w_data_i[15];
      \nz.mem_358_sv2v_reg  <= w_data_i[14];
      \nz.mem_357_sv2v_reg  <= w_data_i[13];
      \nz.mem_356_sv2v_reg  <= w_data_i[12];
      \nz.mem_355_sv2v_reg  <= w_data_i[11];
      \nz.mem_354_sv2v_reg  <= w_data_i[10];
      \nz.mem_353_sv2v_reg  <= w_data_i[9];
      \nz.mem_352_sv2v_reg  <= w_data_i[8];
      \nz.mem_351_sv2v_reg  <= w_data_i[7];
      \nz.mem_350_sv2v_reg  <= w_data_i[6];
      \nz.mem_349_sv2v_reg  <= w_data_i[5];
      \nz.mem_348_sv2v_reg  <= w_data_i[4];
      \nz.mem_347_sv2v_reg  <= w_data_i[3];
      \nz.mem_346_sv2v_reg  <= w_data_i[2];
      \nz.mem_345_sv2v_reg  <= w_data_i[1];
      \nz.mem_344_sv2v_reg  <= w_data_i[0];
    end 
    if(N66) begin
      \nz.mem_343_sv2v_reg  <= w_data_i[42];
      \nz.mem_342_sv2v_reg  <= w_data_i[41];
      \nz.mem_341_sv2v_reg  <= w_data_i[40];
      \nz.mem_340_sv2v_reg  <= w_data_i[39];
      \nz.mem_339_sv2v_reg  <= w_data_i[38];
      \nz.mem_338_sv2v_reg  <= w_data_i[37];
      \nz.mem_337_sv2v_reg  <= w_data_i[36];
      \nz.mem_336_sv2v_reg  <= w_data_i[35];
      \nz.mem_335_sv2v_reg  <= w_data_i[34];
      \nz.mem_334_sv2v_reg  <= w_data_i[33];
      \nz.mem_333_sv2v_reg  <= w_data_i[32];
      \nz.mem_332_sv2v_reg  <= w_data_i[31];
      \nz.mem_331_sv2v_reg  <= w_data_i[30];
      \nz.mem_330_sv2v_reg  <= w_data_i[29];
      \nz.mem_329_sv2v_reg  <= w_data_i[28];
      \nz.mem_328_sv2v_reg  <= w_data_i[27];
      \nz.mem_327_sv2v_reg  <= w_data_i[26];
      \nz.mem_326_sv2v_reg  <= w_data_i[25];
      \nz.mem_325_sv2v_reg  <= w_data_i[24];
      \nz.mem_324_sv2v_reg  <= w_data_i[23];
      \nz.mem_323_sv2v_reg  <= w_data_i[22];
      \nz.mem_322_sv2v_reg  <= w_data_i[21];
      \nz.mem_321_sv2v_reg  <= w_data_i[20];
      \nz.mem_320_sv2v_reg  <= w_data_i[19];
      \nz.mem_319_sv2v_reg  <= w_data_i[18];
      \nz.mem_318_sv2v_reg  <= w_data_i[17];
      \nz.mem_317_sv2v_reg  <= w_data_i[16];
      \nz.mem_316_sv2v_reg  <= w_data_i[15];
      \nz.mem_315_sv2v_reg  <= w_data_i[14];
      \nz.mem_314_sv2v_reg  <= w_data_i[13];
      \nz.mem_313_sv2v_reg  <= w_data_i[12];
      \nz.mem_312_sv2v_reg  <= w_data_i[11];
      \nz.mem_311_sv2v_reg  <= w_data_i[10];
      \nz.mem_310_sv2v_reg  <= w_data_i[9];
      \nz.mem_309_sv2v_reg  <= w_data_i[8];
      \nz.mem_308_sv2v_reg  <= w_data_i[7];
      \nz.mem_307_sv2v_reg  <= w_data_i[6];
      \nz.mem_306_sv2v_reg  <= w_data_i[5];
      \nz.mem_305_sv2v_reg  <= w_data_i[4];
      \nz.mem_304_sv2v_reg  <= w_data_i[3];
      \nz.mem_303_sv2v_reg  <= w_data_i[2];
      \nz.mem_302_sv2v_reg  <= w_data_i[1];
      \nz.mem_301_sv2v_reg  <= w_data_i[0];
    end 
    if(N65) begin
      \nz.mem_300_sv2v_reg  <= w_data_i[42];
      \nz.mem_299_sv2v_reg  <= w_data_i[41];
      \nz.mem_298_sv2v_reg  <= w_data_i[40];
      \nz.mem_297_sv2v_reg  <= w_data_i[39];
      \nz.mem_296_sv2v_reg  <= w_data_i[38];
      \nz.mem_295_sv2v_reg  <= w_data_i[37];
      \nz.mem_294_sv2v_reg  <= w_data_i[36];
      \nz.mem_293_sv2v_reg  <= w_data_i[35];
      \nz.mem_292_sv2v_reg  <= w_data_i[34];
      \nz.mem_291_sv2v_reg  <= w_data_i[33];
      \nz.mem_290_sv2v_reg  <= w_data_i[32];
      \nz.mem_289_sv2v_reg  <= w_data_i[31];
      \nz.mem_288_sv2v_reg  <= w_data_i[30];
      \nz.mem_287_sv2v_reg  <= w_data_i[29];
      \nz.mem_286_sv2v_reg  <= w_data_i[28];
      \nz.mem_285_sv2v_reg  <= w_data_i[27];
      \nz.mem_284_sv2v_reg  <= w_data_i[26];
      \nz.mem_283_sv2v_reg  <= w_data_i[25];
      \nz.mem_282_sv2v_reg  <= w_data_i[24];
      \nz.mem_281_sv2v_reg  <= w_data_i[23];
      \nz.mem_280_sv2v_reg  <= w_data_i[22];
      \nz.mem_279_sv2v_reg  <= w_data_i[21];
      \nz.mem_278_sv2v_reg  <= w_data_i[20];
      \nz.mem_277_sv2v_reg  <= w_data_i[19];
      \nz.mem_276_sv2v_reg  <= w_data_i[18];
      \nz.mem_275_sv2v_reg  <= w_data_i[17];
      \nz.mem_274_sv2v_reg  <= w_data_i[16];
      \nz.mem_273_sv2v_reg  <= w_data_i[15];
      \nz.mem_272_sv2v_reg  <= w_data_i[14];
      \nz.mem_271_sv2v_reg  <= w_data_i[13];
      \nz.mem_270_sv2v_reg  <= w_data_i[12];
      \nz.mem_269_sv2v_reg  <= w_data_i[11];
      \nz.mem_268_sv2v_reg  <= w_data_i[10];
      \nz.mem_267_sv2v_reg  <= w_data_i[9];
      \nz.mem_266_sv2v_reg  <= w_data_i[8];
      \nz.mem_265_sv2v_reg  <= w_data_i[7];
      \nz.mem_264_sv2v_reg  <= w_data_i[6];
      \nz.mem_263_sv2v_reg  <= w_data_i[5];
      \nz.mem_262_sv2v_reg  <= w_data_i[4];
      \nz.mem_261_sv2v_reg  <= w_data_i[3];
      \nz.mem_260_sv2v_reg  <= w_data_i[2];
      \nz.mem_259_sv2v_reg  <= w_data_i[1];
      \nz.mem_258_sv2v_reg  <= w_data_i[0];
    end 
    if(N64) begin
      \nz.mem_257_sv2v_reg  <= w_data_i[42];
      \nz.mem_256_sv2v_reg  <= w_data_i[41];
      \nz.mem_255_sv2v_reg  <= w_data_i[40];
      \nz.mem_254_sv2v_reg  <= w_data_i[39];
      \nz.mem_253_sv2v_reg  <= w_data_i[38];
      \nz.mem_252_sv2v_reg  <= w_data_i[37];
      \nz.mem_251_sv2v_reg  <= w_data_i[36];
      \nz.mem_250_sv2v_reg  <= w_data_i[35];
      \nz.mem_249_sv2v_reg  <= w_data_i[34];
      \nz.mem_248_sv2v_reg  <= w_data_i[33];
      \nz.mem_247_sv2v_reg  <= w_data_i[32];
      \nz.mem_246_sv2v_reg  <= w_data_i[31];
      \nz.mem_245_sv2v_reg  <= w_data_i[30];
      \nz.mem_244_sv2v_reg  <= w_data_i[29];
      \nz.mem_243_sv2v_reg  <= w_data_i[28];
      \nz.mem_242_sv2v_reg  <= w_data_i[27];
      \nz.mem_241_sv2v_reg  <= w_data_i[26];
      \nz.mem_240_sv2v_reg  <= w_data_i[25];
      \nz.mem_239_sv2v_reg  <= w_data_i[24];
      \nz.mem_238_sv2v_reg  <= w_data_i[23];
      \nz.mem_237_sv2v_reg  <= w_data_i[22];
      \nz.mem_236_sv2v_reg  <= w_data_i[21];
      \nz.mem_235_sv2v_reg  <= w_data_i[20];
      \nz.mem_234_sv2v_reg  <= w_data_i[19];
      \nz.mem_233_sv2v_reg  <= w_data_i[18];
      \nz.mem_232_sv2v_reg  <= w_data_i[17];
      \nz.mem_231_sv2v_reg  <= w_data_i[16];
      \nz.mem_230_sv2v_reg  <= w_data_i[15];
      \nz.mem_229_sv2v_reg  <= w_data_i[14];
      \nz.mem_228_sv2v_reg  <= w_data_i[13];
      \nz.mem_227_sv2v_reg  <= w_data_i[12];
      \nz.mem_226_sv2v_reg  <= w_data_i[11];
      \nz.mem_225_sv2v_reg  <= w_data_i[10];
      \nz.mem_224_sv2v_reg  <= w_data_i[9];
      \nz.mem_223_sv2v_reg  <= w_data_i[8];
      \nz.mem_222_sv2v_reg  <= w_data_i[7];
      \nz.mem_221_sv2v_reg  <= w_data_i[6];
      \nz.mem_220_sv2v_reg  <= w_data_i[5];
      \nz.mem_219_sv2v_reg  <= w_data_i[4];
      \nz.mem_218_sv2v_reg  <= w_data_i[3];
      \nz.mem_217_sv2v_reg  <= w_data_i[2];
      \nz.mem_216_sv2v_reg  <= w_data_i[1];
      \nz.mem_215_sv2v_reg  <= w_data_i[0];
    end 
    if(N63) begin
      \nz.mem_214_sv2v_reg  <= w_data_i[42];
      \nz.mem_213_sv2v_reg  <= w_data_i[41];
      \nz.mem_212_sv2v_reg  <= w_data_i[40];
      \nz.mem_211_sv2v_reg  <= w_data_i[39];
      \nz.mem_210_sv2v_reg  <= w_data_i[38];
      \nz.mem_209_sv2v_reg  <= w_data_i[37];
      \nz.mem_208_sv2v_reg  <= w_data_i[36];
      \nz.mem_207_sv2v_reg  <= w_data_i[35];
      \nz.mem_206_sv2v_reg  <= w_data_i[34];
      \nz.mem_205_sv2v_reg  <= w_data_i[33];
      \nz.mem_204_sv2v_reg  <= w_data_i[32];
      \nz.mem_203_sv2v_reg  <= w_data_i[31];
      \nz.mem_202_sv2v_reg  <= w_data_i[30];
      \nz.mem_201_sv2v_reg  <= w_data_i[29];
      \nz.mem_200_sv2v_reg  <= w_data_i[28];
      \nz.mem_199_sv2v_reg  <= w_data_i[27];
      \nz.mem_198_sv2v_reg  <= w_data_i[26];
      \nz.mem_197_sv2v_reg  <= w_data_i[25];
      \nz.mem_196_sv2v_reg  <= w_data_i[24];
      \nz.mem_195_sv2v_reg  <= w_data_i[23];
      \nz.mem_194_sv2v_reg  <= w_data_i[22];
      \nz.mem_193_sv2v_reg  <= w_data_i[21];
      \nz.mem_192_sv2v_reg  <= w_data_i[20];
      \nz.mem_191_sv2v_reg  <= w_data_i[19];
      \nz.mem_190_sv2v_reg  <= w_data_i[18];
      \nz.mem_189_sv2v_reg  <= w_data_i[17];
      \nz.mem_188_sv2v_reg  <= w_data_i[16];
      \nz.mem_187_sv2v_reg  <= w_data_i[15];
      \nz.mem_186_sv2v_reg  <= w_data_i[14];
      \nz.mem_185_sv2v_reg  <= w_data_i[13];
      \nz.mem_184_sv2v_reg  <= w_data_i[12];
      \nz.mem_183_sv2v_reg  <= w_data_i[11];
      \nz.mem_182_sv2v_reg  <= w_data_i[10];
      \nz.mem_181_sv2v_reg  <= w_data_i[9];
      \nz.mem_180_sv2v_reg  <= w_data_i[8];
      \nz.mem_179_sv2v_reg  <= w_data_i[7];
      \nz.mem_178_sv2v_reg  <= w_data_i[6];
      \nz.mem_177_sv2v_reg  <= w_data_i[5];
      \nz.mem_176_sv2v_reg  <= w_data_i[4];
      \nz.mem_175_sv2v_reg  <= w_data_i[3];
      \nz.mem_174_sv2v_reg  <= w_data_i[2];
      \nz.mem_173_sv2v_reg  <= w_data_i[1];
      \nz.mem_172_sv2v_reg  <= w_data_i[0];
    end 
    if(N62) begin
      \nz.mem_171_sv2v_reg  <= w_data_i[42];
      \nz.mem_170_sv2v_reg  <= w_data_i[41];
      \nz.mem_169_sv2v_reg  <= w_data_i[40];
      \nz.mem_168_sv2v_reg  <= w_data_i[39];
      \nz.mem_167_sv2v_reg  <= w_data_i[38];
      \nz.mem_166_sv2v_reg  <= w_data_i[37];
      \nz.mem_165_sv2v_reg  <= w_data_i[36];
      \nz.mem_164_sv2v_reg  <= w_data_i[35];
      \nz.mem_163_sv2v_reg  <= w_data_i[34];
      \nz.mem_162_sv2v_reg  <= w_data_i[33];
      \nz.mem_161_sv2v_reg  <= w_data_i[32];
      \nz.mem_160_sv2v_reg  <= w_data_i[31];
      \nz.mem_159_sv2v_reg  <= w_data_i[30];
      \nz.mem_158_sv2v_reg  <= w_data_i[29];
      \nz.mem_157_sv2v_reg  <= w_data_i[28];
      \nz.mem_156_sv2v_reg  <= w_data_i[27];
      \nz.mem_155_sv2v_reg  <= w_data_i[26];
      \nz.mem_154_sv2v_reg  <= w_data_i[25];
      \nz.mem_153_sv2v_reg  <= w_data_i[24];
      \nz.mem_152_sv2v_reg  <= w_data_i[23];
      \nz.mem_151_sv2v_reg  <= w_data_i[22];
      \nz.mem_150_sv2v_reg  <= w_data_i[21];
      \nz.mem_149_sv2v_reg  <= w_data_i[20];
      \nz.mem_148_sv2v_reg  <= w_data_i[19];
      \nz.mem_147_sv2v_reg  <= w_data_i[18];
      \nz.mem_146_sv2v_reg  <= w_data_i[17];
      \nz.mem_145_sv2v_reg  <= w_data_i[16];
      \nz.mem_144_sv2v_reg  <= w_data_i[15];
      \nz.mem_143_sv2v_reg  <= w_data_i[14];
      \nz.mem_142_sv2v_reg  <= w_data_i[13];
      \nz.mem_141_sv2v_reg  <= w_data_i[12];
      \nz.mem_140_sv2v_reg  <= w_data_i[11];
      \nz.mem_139_sv2v_reg  <= w_data_i[10];
      \nz.mem_138_sv2v_reg  <= w_data_i[9];
      \nz.mem_137_sv2v_reg  <= w_data_i[8];
      \nz.mem_136_sv2v_reg  <= w_data_i[7];
      \nz.mem_135_sv2v_reg  <= w_data_i[6];
      \nz.mem_134_sv2v_reg  <= w_data_i[5];
      \nz.mem_133_sv2v_reg  <= w_data_i[4];
      \nz.mem_132_sv2v_reg  <= w_data_i[3];
      \nz.mem_131_sv2v_reg  <= w_data_i[2];
      \nz.mem_130_sv2v_reg  <= w_data_i[1];
      \nz.mem_129_sv2v_reg  <= w_data_i[0];
    end 
    if(N61) begin
      \nz.mem_128_sv2v_reg  <= w_data_i[42];
      \nz.mem_127_sv2v_reg  <= w_data_i[41];
      \nz.mem_126_sv2v_reg  <= w_data_i[40];
      \nz.mem_125_sv2v_reg  <= w_data_i[39];
      \nz.mem_124_sv2v_reg  <= w_data_i[38];
      \nz.mem_123_sv2v_reg  <= w_data_i[37];
      \nz.mem_122_sv2v_reg  <= w_data_i[36];
      \nz.mem_121_sv2v_reg  <= w_data_i[35];
      \nz.mem_120_sv2v_reg  <= w_data_i[34];
      \nz.mem_119_sv2v_reg  <= w_data_i[33];
      \nz.mem_118_sv2v_reg  <= w_data_i[32];
      \nz.mem_117_sv2v_reg  <= w_data_i[31];
      \nz.mem_116_sv2v_reg  <= w_data_i[30];
      \nz.mem_115_sv2v_reg  <= w_data_i[29];
      \nz.mem_114_sv2v_reg  <= w_data_i[28];
      \nz.mem_113_sv2v_reg  <= w_data_i[27];
      \nz.mem_112_sv2v_reg  <= w_data_i[26];
      \nz.mem_111_sv2v_reg  <= w_data_i[25];
      \nz.mem_110_sv2v_reg  <= w_data_i[24];
      \nz.mem_109_sv2v_reg  <= w_data_i[23];
      \nz.mem_108_sv2v_reg  <= w_data_i[22];
      \nz.mem_107_sv2v_reg  <= w_data_i[21];
      \nz.mem_106_sv2v_reg  <= w_data_i[20];
      \nz.mem_105_sv2v_reg  <= w_data_i[19];
      \nz.mem_104_sv2v_reg  <= w_data_i[18];
      \nz.mem_103_sv2v_reg  <= w_data_i[17];
      \nz.mem_102_sv2v_reg  <= w_data_i[16];
      \nz.mem_101_sv2v_reg  <= w_data_i[15];
      \nz.mem_100_sv2v_reg  <= w_data_i[14];
      \nz.mem_99_sv2v_reg  <= w_data_i[13];
      \nz.mem_98_sv2v_reg  <= w_data_i[12];
      \nz.mem_97_sv2v_reg  <= w_data_i[11];
      \nz.mem_96_sv2v_reg  <= w_data_i[10];
      \nz.mem_95_sv2v_reg  <= w_data_i[9];
      \nz.mem_94_sv2v_reg  <= w_data_i[8];
      \nz.mem_93_sv2v_reg  <= w_data_i[7];
      \nz.mem_92_sv2v_reg  <= w_data_i[6];
      \nz.mem_91_sv2v_reg  <= w_data_i[5];
      \nz.mem_90_sv2v_reg  <= w_data_i[4];
      \nz.mem_89_sv2v_reg  <= w_data_i[3];
      \nz.mem_88_sv2v_reg  <= w_data_i[2];
      \nz.mem_87_sv2v_reg  <= w_data_i[1];
      \nz.mem_86_sv2v_reg  <= w_data_i[0];
    end 
    if(N60) begin
      \nz.mem_85_sv2v_reg  <= w_data_i[42];
      \nz.mem_84_sv2v_reg  <= w_data_i[41];
      \nz.mem_83_sv2v_reg  <= w_data_i[40];
      \nz.mem_82_sv2v_reg  <= w_data_i[39];
      \nz.mem_81_sv2v_reg  <= w_data_i[38];
      \nz.mem_80_sv2v_reg  <= w_data_i[37];
      \nz.mem_79_sv2v_reg  <= w_data_i[36];
      \nz.mem_78_sv2v_reg  <= w_data_i[35];
      \nz.mem_77_sv2v_reg  <= w_data_i[34];
      \nz.mem_76_sv2v_reg  <= w_data_i[33];
      \nz.mem_75_sv2v_reg  <= w_data_i[32];
      \nz.mem_74_sv2v_reg  <= w_data_i[31];
      \nz.mem_73_sv2v_reg  <= w_data_i[30];
      \nz.mem_72_sv2v_reg  <= w_data_i[29];
      \nz.mem_71_sv2v_reg  <= w_data_i[28];
      \nz.mem_70_sv2v_reg  <= w_data_i[27];
      \nz.mem_69_sv2v_reg  <= w_data_i[26];
      \nz.mem_68_sv2v_reg  <= w_data_i[25];
      \nz.mem_67_sv2v_reg  <= w_data_i[24];
      \nz.mem_66_sv2v_reg  <= w_data_i[23];
      \nz.mem_65_sv2v_reg  <= w_data_i[22];
      \nz.mem_64_sv2v_reg  <= w_data_i[21];
      \nz.mem_63_sv2v_reg  <= w_data_i[20];
      \nz.mem_62_sv2v_reg  <= w_data_i[19];
      \nz.mem_61_sv2v_reg  <= w_data_i[18];
      \nz.mem_60_sv2v_reg  <= w_data_i[17];
      \nz.mem_59_sv2v_reg  <= w_data_i[16];
      \nz.mem_58_sv2v_reg  <= w_data_i[15];
      \nz.mem_57_sv2v_reg  <= w_data_i[14];
      \nz.mem_56_sv2v_reg  <= w_data_i[13];
      \nz.mem_55_sv2v_reg  <= w_data_i[12];
      \nz.mem_54_sv2v_reg  <= w_data_i[11];
      \nz.mem_53_sv2v_reg  <= w_data_i[10];
      \nz.mem_52_sv2v_reg  <= w_data_i[9];
      \nz.mem_51_sv2v_reg  <= w_data_i[8];
      \nz.mem_50_sv2v_reg  <= w_data_i[7];
      \nz.mem_49_sv2v_reg  <= w_data_i[6];
      \nz.mem_48_sv2v_reg  <= w_data_i[5];
      \nz.mem_47_sv2v_reg  <= w_data_i[4];
      \nz.mem_46_sv2v_reg  <= w_data_i[3];
      \nz.mem_45_sv2v_reg  <= w_data_i[2];
      \nz.mem_44_sv2v_reg  <= w_data_i[1];
      \nz.mem_43_sv2v_reg  <= w_data_i[0];
    end 
    if(N59) begin
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
      \nz.mem_0_sv2v_reg  <= w_data_i[0];
    end 
  end


endmodule



module bsg_mem_1r1w_0000002b_16_1
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

  input [3:0] w_addr_i;
  input [42:0] w_data_i;
  input [3:0] r_addr_i;
  output [42:0] r_data_o;
  input w_clk_i;
  input w_reset_i;
  input w_v_i;
  input r_v_i;
  wire [42:0] r_data_o;

  bsg_mem_1r1w_synth_0000002b_16_1
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


  bsg_mem_1r1w_0000002b_16_1
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

