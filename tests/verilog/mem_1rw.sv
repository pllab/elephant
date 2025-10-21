module mem_1rw
   (input clk_i,
    input v_i,
    input reset_i,
    input [4-1:0] data_i,
    input [4-1:0] addr_i,
    input w_i,
    output [4-1:0] data_o
   );

  logic [4-1:0] addr_r;
  logic [4-1:0] mem [16-1:0];
  wire read_en;
  wire [4-1:0] data_out;

  assign read_en = v_i & ~w_i;
  assign data_out = mem[addr_r];

  always_ff @(posedge clk_i)
    if (read_en)
      addr_r <= addr_i;
    else
      addr_r <= 'X;
// assign addr_r = addr_i;

  assign data_o = data_out;

  always_ff @(posedge clk_i)
    if (v_i & w_i) 
      mem[addr_i] <= data_i;

endmodule

