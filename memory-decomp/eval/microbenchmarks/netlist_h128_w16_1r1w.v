// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h128_w16_1r1w_raddr, openram_h128_w16_1r1w_ren, openram_h128_w16_1r1w_waddr, openram_h128_w16_1r1w_wdata, openram_h128_w16_1r1w_wen, openram_h128_w16_1r1w_rdata);
    input clk;
    input[6:0] openram_h128_w16_1r1w_raddr;
    input openram_h128_w16_1r1w_ren;
    input[6:0] openram_h128_w16_1r1w_waddr;
    input[15:0] openram_h128_w16_1r1w_wdata;
    input openram_h128_w16_1r1w_wen;
    output[15:0] openram_h128_w16_1r1w_rdata;

    reg[15:0] mem_35[127:0]; //openram_h128_w16_1r1w
    reg[6:0] tmp141;

    wire[6:0] tmp142;
    wire[15:0] tmp143;

    // Combinational
    assign openram_h128_w16_1r1w_rdata = tmp143;
    assign tmp142 = openram_h128_w16_1r1w_ren ? openram_h128_w16_1r1w_raddr : tmp141;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp141 <= tmp142;
        end
    end

    // Memory mem_35: openram_h128_w16_1r1w
    always @(posedge clk)
    begin
        if (openram_h128_w16_1r1w_wen) begin
            mem_35[openram_h128_w16_1r1w_waddr] <= openram_h128_w16_1r1w_wdata;
        end
    end
    assign tmp143 = mem_35[tmp141];

endmodule

