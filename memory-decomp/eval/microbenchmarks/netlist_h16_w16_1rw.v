// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h16_w16_1rw_raddr, openram_h16_w16_1rw_ren, openram_h16_w16_1rw_waddr, openram_h16_w16_1rw_wdata, openram_h16_w16_1rw_wen, openram_h16_w16_1rw_rdata);
    input clk;
    input[3:0] openram_h16_w16_1rw_raddr;
    input openram_h16_w16_1rw_ren;
    input[3:0] openram_h16_w16_1rw_waddr;
    input[15:0] openram_h16_w16_1rw_wdata;
    input openram_h16_w16_1rw_wen;
    output[15:0] openram_h16_w16_1rw_rdata;

    reg[15:0] mem_2[15:0]; //openram_h16_w16_1rw
    reg[3:0] tmp6;

    wire[3:0] tmp7;
    wire[15:0] tmp8;

    // Combinational
    assign openram_h16_w16_1rw_rdata = tmp8;
    assign tmp7 = openram_h16_w16_1rw_ren ? openram_h16_w16_1rw_raddr : tmp6;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp6 <= tmp7;
        end
    end

    // Memory mem_2: openram_h16_w16_1rw
    always @(posedge clk)
    begin
        if (openram_h16_w16_1rw_wen) begin
            mem_2[openram_h16_w16_1rw_waddr] <= openram_h16_w16_1rw_wdata;
        end
    end
    assign tmp8 = mem_2[tmp6];

endmodule

