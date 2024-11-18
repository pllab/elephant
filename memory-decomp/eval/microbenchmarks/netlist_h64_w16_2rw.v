// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h64_w16_2rw_raddr_0, openram_h64_w16_2rw_raddr_1, openram_h64_w16_2rw_ren_0, openram_h64_w16_2rw_ren_1, openram_h64_w16_2rw_waddr, openram_h64_w16_2rw_wdata, openram_h64_w16_2rw_wen, openram_h64_w16_2rw_rdata_0, openram_h64_w16_2rw_rdata_1);
    input clk;
    input[5:0] openram_h64_w16_2rw_raddr_0;
    input[5:0] openram_h64_w16_2rw_raddr_1;
    input openram_h64_w16_2rw_ren_0;
    input openram_h64_w16_2rw_ren_1;
    input[5:0] openram_h64_w16_2rw_waddr;
    input[15:0] openram_h64_w16_2rw_wdata;
    input openram_h64_w16_2rw_wen;
    output[15:0] openram_h64_w16_2rw_rdata_0;
    output[15:0] openram_h64_w16_2rw_rdata_1;

    reg[15:0] mem_20[63:0]; //openram_h64_w16_2rw
    reg[5:0] tmp84;
    reg[5:0] tmp87;

    wire[5:0] tmp85;
    wire[15:0] tmp86;
    wire[5:0] tmp88;
    wire[15:0] tmp89;

    // Combinational
    assign openram_h64_w16_2rw_rdata_0 = tmp86;
    assign openram_h64_w16_2rw_rdata_1 = tmp89;
    assign tmp85 = openram_h64_w16_2rw_ren_0 ? openram_h64_w16_2rw_raddr_0 : tmp84;
    assign tmp88 = openram_h64_w16_2rw_ren_1 ? openram_h64_w16_2rw_raddr_1 : tmp87;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp84 <= tmp85;
            tmp87 <= tmp88;
        end
    end

    // Memory mem_20: openram_h64_w16_2rw
    always @(posedge clk)
    begin
        if (openram_h64_w16_2rw_wen) begin
            mem_20[openram_h64_w16_2rw_waddr] <= openram_h64_w16_2rw_wdata;
        end
    end
    assign tmp86 = mem_20[tmp84];
    assign tmp89 = mem_20[tmp87];

endmodule

