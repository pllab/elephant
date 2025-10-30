// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h128_w16_2rw_raddr_0, openram_h128_w16_2rw_raddr_1, openram_h128_w16_2rw_ren_0, openram_h128_w16_2rw_ren_1, openram_h128_w16_2rw_waddr, openram_h128_w16_2rw_wdata, openram_h128_w16_2rw_wen, openram_h128_w16_2rw_rdata_0, openram_h128_w16_2rw_rdata_1);
    input clk;
    input[6:0] openram_h128_w16_2rw_raddr_0;
    input[6:0] openram_h128_w16_2rw_raddr_1;
    input openram_h128_w16_2rw_ren_0;
    input openram_h128_w16_2rw_ren_1;
    input[6:0] openram_h128_w16_2rw_waddr;
    input[15:0] openram_h128_w16_2rw_wdata;
    input openram_h128_w16_2rw_wen;
    output[15:0] openram_h128_w16_2rw_rdata_0;
    output[15:0] openram_h128_w16_2rw_rdata_1;

    reg[15:0] mem_23[127:0]; //openram_h128_w16_2rw
    reg[6:0] tmp102;
    reg[6:0] tmp105;

    wire[6:0] tmp103;
    wire[15:0] tmp104;
    wire[6:0] tmp106;
    wire[15:0] tmp107;

    // Combinational
    assign openram_h128_w16_2rw_rdata_0 = tmp104;
    assign openram_h128_w16_2rw_rdata_1 = tmp107;
    assign tmp103 = openram_h128_w16_2rw_ren_0 ? openram_h128_w16_2rw_raddr_0 : tmp102;
    assign tmp106 = openram_h128_w16_2rw_ren_1 ? openram_h128_w16_2rw_raddr_1 : tmp105;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp102 <= tmp103;
            tmp105 <= tmp106;
        end
    end

    // Memory mem_23: openram_h128_w16_2rw
    always @(posedge clk)
    begin
        if (openram_h128_w16_2rw_wen) begin
            mem_23[openram_h128_w16_2rw_waddr] <= openram_h128_w16_2rw_wdata;
        end
    end
    assign tmp104 = mem_23[tmp102];
    assign tmp107 = mem_23[tmp105];

endmodule

