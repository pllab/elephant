// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h16_w16_1r1w_raddr, openram_h16_w16_1r1w_ren, openram_h16_w16_1r1w_waddr, openram_h16_w16_1r1w_wdata, openram_h16_w16_1r1w_wen, openram_h16_w16_1r1w_rdata);
    input clk;
    input[3:0] openram_h16_w16_1r1w_raddr;
    input openram_h16_w16_1r1w_ren;
    input[3:0] openram_h16_w16_1r1w_waddr;
    input[15:0] openram_h16_w16_1r1w_wdata;
    input openram_h16_w16_1r1w_wen;
    output[15:0] openram_h16_w16_1r1w_rdata;

    reg[15:0] mem_26[15:0]; //openram_h16_w16_1r1w
    reg[3:0] tmp114;

    wire[3:0] tmp115;
    wire[15:0] tmp116;

    // Combinational
    assign openram_h16_w16_1r1w_rdata = tmp116;
    assign tmp115 = openram_h16_w16_1r1w_ren ? openram_h16_w16_1r1w_raddr : tmp114;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp114 <= tmp115;
        end
    end

    // Memory mem_26: openram_h16_w16_1r1w
    always @(posedge clk)
    begin
        if (openram_h16_w16_1r1w_wen) begin
            mem_26[openram_h16_w16_1r1w_waddr] <= openram_h16_w16_1r1w_wdata;
        end
    end
    assign tmp116 = mem_26[tmp114];

endmodule

