// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h64_w16_1rw_raddr, openram_h64_w16_1rw_ren, openram_h64_w16_1rw_waddr, openram_h64_w16_1rw_wdata, openram_h64_w16_1rw_wen, openram_h64_w16_1rw_rdata);
    input clk;
    input[5:0] openram_h64_w16_1rw_raddr;
    input openram_h64_w16_1rw_ren;
    input[5:0] openram_h64_w16_1rw_waddr;
    input[15:0] openram_h64_w16_1rw_wdata;
    input openram_h64_w16_1rw_wen;
    output[15:0] openram_h64_w16_1rw_rdata;

    reg[15:0] mem_8[63:0]; //openram_h64_w16_1rw
    reg[5:0] tmp24;

    wire[5:0] tmp25;
    wire[15:0] tmp26;

    // Combinational
    assign openram_h64_w16_1rw_rdata = tmp26;
    assign tmp25 = openram_h64_w16_1rw_ren ? openram_h64_w16_1rw_raddr : tmp24;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp24 <= tmp25;
        end
    end

    // Memory mem_8: openram_h64_w16_1rw
    always @(posedge clk)
    begin
        if (openram_h64_w16_1rw_wen) begin
            mem_8[openram_h64_w16_1rw_waddr] <= openram_h64_w16_1rw_wdata;
        end
    end
    assign tmp26 = mem_8[tmp24];

endmodule

