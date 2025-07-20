module top #(
    parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 1
)(
    input  wire                  clk,

    // Write port 0
    input  wire                  we0,
    input  wire [ADDR_WIDTH-1:0] waddr0,
    input  wire [DATA_WIDTH-1:0] wdata0,

    // Write port 1
    input  wire                  we1,
    input  wire [ADDR_WIDTH-1:0] waddr1,
    input  wire [DATA_WIDTH-1:0] wdata1,

    // Write port 2
    input  wire                  we2,
    input  wire [ADDR_WIDTH-1:0] waddr2,
    input  wire [DATA_WIDTH-1:0] wdata2,

    // Write port 3
    input  wire                  we3,
    input  wire [ADDR_WIDTH-1:0] waddr3,
    input  wire [DATA_WIDTH-1:0] wdata3,

    // Read port
    input  wire [ADDR_WIDTH-1:0] raddr,
    output reg  [DATA_WIDTH-1:0] rdata
);

    reg [DATA_WIDTH-1:0] mem [0:(1<<ADDR_WIDTH)-1];

    always @(posedge clk) begin
        if (we0)
            mem[waddr0] <= wdata0;
        if (we1)
            mem[waddr1] <= wdata1;
        if (we2)
            mem[waddr2] <= wdata2;
        if (we3)
            mem[waddr3] <= wdata3;
        rdata <= mem[raddr];
    end

endmodule
