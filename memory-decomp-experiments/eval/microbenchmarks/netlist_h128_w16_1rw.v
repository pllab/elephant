// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h128_w16_1rw_raddr, openram_h128_w16_1rw_ren, openram_h128_w16_1rw_waddr, openram_h128_w16_1rw_wdata, openram_h128_w16_1rw_wen, openram_h128_w16_1rw_rdata);
    input clk;
    input[6:0] openram_h128_w16_1rw_raddr;
    input openram_h128_w16_1rw_ren;
    input[6:0] openram_h128_w16_1rw_waddr;
    input[15:0] openram_h128_w16_1rw_wdata;
    input openram_h128_w16_1rw_wen;
    output[15:0] openram_h128_w16_1rw_rdata;

    reg[15:0] mem_11[127:0]; //openram_h128_w16_1rw
    reg[6:0] tmp33;

    wire[6:0] tmp34;
    wire[15:0] tmp35;

    // Combinational
    assign openram_h128_w16_1rw_rdata = tmp35;
    assign tmp34 = openram_h128_w16_1rw_ren ? openram_h128_w16_1rw_raddr : tmp33;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp33 <= tmp34;
        end
    end

    // Memory mem_11: openram_h128_w16_1rw
    always @(posedge clk)
    begin
        if (openram_h128_w16_1rw_wen) begin
            mem_11[openram_h128_w16_1rw_waddr] <= openram_h128_w16_1rw_wdata;
        end
    end
    assign tmp35 = mem_11[tmp33];

endmodule

