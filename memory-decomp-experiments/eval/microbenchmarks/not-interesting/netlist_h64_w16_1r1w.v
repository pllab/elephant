// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h64_w16_1r1w_raddr, openram_h64_w16_1r1w_ren, openram_h64_w16_1r1w_waddr, openram_h64_w16_1r1w_wdata, openram_h64_w16_1r1w_wen, openram_h64_w16_1r1w_rdata);
    input clk;
    input[5:0] openram_h64_w16_1r1w_raddr;
    input openram_h64_w16_1r1w_ren;
    input[5:0] openram_h64_w16_1r1w_waddr;
    input[15:0] openram_h64_w16_1r1w_wdata;
    input openram_h64_w16_1r1w_wen;
    output[15:0] openram_h64_w16_1r1w_rdata;

    reg[15:0] mem_32[63:0]; //openram_h64_w16_1r1w
    reg[5:0] tmp132;

    wire[5:0] tmp133;
    wire[15:0] tmp134;

    // Combinational
    assign openram_h64_w16_1r1w_rdata = tmp134;
    assign tmp133 = openram_h64_w16_1r1w_ren ? openram_h64_w16_1r1w_raddr : tmp132;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp132 <= tmp133;
        end
    end

    // Memory mem_32: openram_h64_w16_1r1w
    always @(posedge clk)
    begin
        if (openram_h64_w16_1r1w_wen) begin
            mem_32[openram_h64_w16_1r1w_waddr] <= openram_h64_w16_1r1w_wdata;
        end
    end
    assign tmp134 = mem_32[tmp132];

endmodule

