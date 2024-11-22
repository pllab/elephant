// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h32_w16_1r1w_raddr, openram_h32_w16_1r1w_ren, openram_h32_w16_1r1w_waddr, openram_h32_w16_1r1w_wdata, openram_h32_w16_1r1w_wen, openram_h32_w16_1r1w_rdata);
    input clk;
    input[4:0] openram_h32_w16_1r1w_raddr;
    input openram_h32_w16_1r1w_ren;
    input[4:0] openram_h32_w16_1r1w_waddr;
    input[15:0] openram_h32_w16_1r1w_wdata;
    input openram_h32_w16_1r1w_wen;
    output[15:0] openram_h32_w16_1r1w_rdata;

    reg[15:0] mem_29[31:0]; //openram_h32_w16_1r1w
    reg[4:0] tmp123;

    wire[4:0] tmp124;
    wire[15:0] tmp125;

    // Combinational
    assign openram_h32_w16_1r1w_rdata = tmp125;
    assign tmp124 = openram_h32_w16_1r1w_ren ? openram_h32_w16_1r1w_raddr : tmp123;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp123 <= tmp124;
        end
    end

    // Memory mem_29: openram_h32_w16_1r1w
    always @(posedge clk)
    begin
        if (openram_h32_w16_1r1w_wen) begin
            mem_29[openram_h32_w16_1r1w_waddr] <= openram_h32_w16_1r1w_wdata;
        end
    end
    assign tmp125 = mem_29[tmp123];

endmodule

