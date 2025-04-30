module simple_rw_port_mem #(
    parameter ADDR_WIDTH = 6,
    parameter DATA_WIDTH = 4
) (
    input wire clk,
    input wire we,  // write enable
    input wire[ADDR_WIDTH-1:0] addr,  // address
    input wire[DATA_WIDTH-1:0] wd,  // write data
    output reg[DATA_WIDTH-1:0] rd  // read data
);
    // memory array
    reg[DATA_WIDTH-1:0] mem[0:(1 << ADDR_WIDTH)-1];

    // read and write operation
    always @(posedge clk) begin
        if(we) begin
            mem[addr] <= wd;
        end
        rd <= mem[addr];
    end
endmodule