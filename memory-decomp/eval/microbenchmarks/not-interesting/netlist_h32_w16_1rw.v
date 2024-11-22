// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h32_w16_1rw_raddr, openram_h32_w16_1rw_ren, openram_h32_w16_1rw_waddr, openram_h32_w16_1rw_wdata, openram_h32_w16_1rw_wen, openram_h32_w16_1rw_rdata);
    input clk;
    input[4:0] openram_h32_w16_1rw_raddr;
    input openram_h32_w16_1rw_ren;
    input[4:0] openram_h32_w16_1rw_waddr;
    input[15:0] openram_h32_w16_1rw_wdata;
    input openram_h32_w16_1rw_wen;
    output[15:0] openram_h32_w16_1rw_rdata;

    reg[15:0] mem_5[31:0]; //openram_h32_w16_1rw
    reg[4:0] tmp15;

    wire[4:0] tmp16;
    wire[15:0] tmp17;

    // Combinational
    assign openram_h32_w16_1rw_rdata = tmp17;
    assign tmp16 = openram_h32_w16_1rw_ren ? openram_h32_w16_1rw_raddr : tmp15;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp15 <= tmp16;
        end
    end

    // Memory mem_5: openram_h32_w16_1rw
    always @(posedge clk)
    begin
        if (openram_h32_w16_1rw_wen) begin
            mem_5[openram_h32_w16_1rw_waddr] <= openram_h32_w16_1rw_wdata;
        end
    end
    assign tmp17 = mem_5[tmp15];

endmodule

