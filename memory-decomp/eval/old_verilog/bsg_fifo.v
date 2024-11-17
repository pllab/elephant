

module top
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

  input [15:0] data_i;
  output [15:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;

  bsg_one_fifo
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



module bsg_dff_reset_width_p1
(
  clk_i,
  reset_i,
  data_i,
  data_o
);

  input [0:0] data_i;
  output [0:0] data_o;
  input clk_i;
  input reset_i;
  wire N0,N1,N2,N3;
  reg [0:0] data_o;
  assign N3 = (N0)? 1'b0 : 
              (N1)? data_i[0] : 1'b0;
  assign N0 = reset_i;
  assign N1 = N2;
  assign N2 = ~reset_i;

  always @(posedge clk_i) begin
    if(1'b1) begin
      { data_o[0:0] } <= { N3 };
    end 
  end


endmodule



module bsg_dff_en_width_p16_harden_p0
(
  clk_i,
  data_i,
  en_i,
  data_o
);

  input [15:0] data_i;
  output [15:0] data_o;
  input clk_i;
  input en_i;
  reg [15:0] data_o;

  always @(posedge clk_i) begin
    if(en_i) begin
      { data_o[15:0] } <= { data_i[15:0] };
    end 
  end


endmodule



module bsg_one_fifo
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

  input [15:0] data_i;
  output [15:0] data_o;
  input clk_i;
  input reset_i;
  input v_i;
  input yumi_i;
  output ready_o;
  output v_o;
  wire [15:0] data_o;
  wire ready_o,v_o,N0,N1,n_0_net_,N2,N3,n_1_net_;

  bsg_dff_reset_width_p1
  dff_full
  (
    .clk_i(clk_i),
    .reset_i(reset_i),
    .data_i(n_0_net_),
    .data_o(v_o)
  );


  bsg_dff_en_width_p16_harden_p0
  dff
  (
    .clk_i(clk_i),
    .data_i(data_i),
    .en_i(n_1_net_),
    .data_o(data_o)
  );

  assign n_0_net_ = (N0)? N3 : 
                    (N1)? v_i : 1'b0;
  assign N0 = v_o;
  assign N1 = N2;
  assign ready_o = ~v_o;
  assign N2 = ~v_o;
  assign N3 = ~yumi_i;
  assign n_1_net_ = v_i & ready_o;

endmodule

