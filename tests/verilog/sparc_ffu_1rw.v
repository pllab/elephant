module bram_1rw_wrapper #(
    parameter NAME = "",
    parameter DEPTH = 1,
    parameter ADDR_WIDTH = 6,
    parameter BITMASK_WIDTH = 4,
    parameter DATA_WIDTH = 4
)(
    input                       MEMCLK,
    input                       RESET_N,
    input                       CE,
    input  [ADDR_WIDTH-1:0]     A,
    input                       RDWEN,        // 1 = Read, 0 = Write
    input  [BITMASK_WIDTH-1:0]  BW,
    input  [DATA_WIDTH-1:0]     DIN,
    output [DATA_WIDTH-1:0]     DOUT
);

    reg  [DATA_WIDTH-1:0] ram [0:DEPTH-1];
    reg  [DATA_WIDTH-1:0] dout_reg;
    reg  [ADDR_WIDTH-1:0] addr_reg;
    reg                   read_en;

    wire write_en = CE & ~RDWEN;
    wire read_req = CE & RDWEN;

    // Write logic with bitmask support
    always @(posedge MEMCLK) begin
        if (write_en) begin
            for (integer i = 0; i < BITMASK_WIDTH; i = i + 1) begin
                if (BW[i]) ram[A][i*DATA_WIDTH/BITMASK_WIDTH +: DATA_WIDTH/BITMASK_WIDTH] <=
                              DIN[i*DATA_WIDTH/BITMASK_WIDTH +: DATA_WIDTH/BITMASK_WIDTH];
            end
        end
    end

    // Read logic
    always @(posedge MEMCLK) begin
        if (read_req) begin
            dout_reg <= ram[A];
        end
        addr_reg <= A;
        read_en <= read_req;
    end

    assign DOUT = read_en ? dout_reg : {DATA_WIDTH{1'b0}};

    // Optional: zero initialization (BIST-style)
    integer j;
    always @(posedge MEMCLK or negedge RESET_N) begin
        if (!RESET_N) begin
            for (j = 0; j < DEPTH; j = j + 1) begin
                ram[j] <= {DATA_WIDTH{1'b0}};
            end
        end
    end

endmodule
