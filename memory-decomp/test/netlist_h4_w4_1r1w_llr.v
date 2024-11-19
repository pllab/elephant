// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h4_w4_1r1w_raddr, openram_h4_w4_1r1w_ren, openram_h4_w4_1r1w_waddr, openram_h4_w4_1r1w_wdata, openram_h4_w4_1r1w_wen, openram_h4_w4_1r1w_rdata);
    input clk;
    input[1:0] openram_h4_w4_1r1w_raddr;
    input openram_h4_w4_1r1w_ren;
    input[1:0] openram_h4_w4_1r1w_waddr;
    input[3:0] openram_h4_w4_1r1w_wdata;
    input openram_h4_w4_1r1w_wen;
    output[3:0] openram_h4_w4_1r1w_rdata;

    reg[3:0] mem_0[3:0]; //openram_h4_w4_1r1w
    reg[1:0] tmp0;
    reg tmp2;
    reg[3:0] tmp3;

    wire[1:0] tmp1;
    wire[3:0] tmp4;
    wire[3:0] tmp5;

    // Combinational
    assign openram_h4_w4_1r1w_rdata = tmp3;
    assign tmp1 = openram_h4_w4_1r1w_ren ? openram_h4_w4_1r1w_raddr : tmp0;
    assign tmp5 = tmp2 ? tmp4 : tmp3;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp0 <= tmp1;
            tmp2 <= openram_h4_w4_1r1w_ren;
            tmp3 <= tmp5;
        end
    end

    // Memory mem_0: openram_h4_w4_1r1w
    always @(posedge clk)
    begin
        if (openram_h4_w4_1r1w_wen) begin
            mem_0[openram_h4_w4_1r1w_waddr] <= openram_h4_w4_1r1w_wdata;
        end
    end
    assign tmp4 = mem_0[tmp0];

endmodule

