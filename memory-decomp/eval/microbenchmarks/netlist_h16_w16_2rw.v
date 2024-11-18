// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h16_w16_2rw_raddr_0, openram_h16_w16_2rw_raddr_1, openram_h16_w16_2rw_ren_0, openram_h16_w16_2rw_ren_1, openram_h16_w16_2rw_waddr, openram_h16_w16_2rw_wdata, openram_h16_w16_2rw_wen, openram_h16_w16_2rw_rdata_0, openram_h16_w16_2rw_rdata_1);
    input clk;
    input[3:0] openram_h16_w16_2rw_raddr_0;
    input[3:0] openram_h16_w16_2rw_raddr_1;
    input openram_h16_w16_2rw_ren_0;
    input openram_h16_w16_2rw_ren_1;
    input[3:0] openram_h16_w16_2rw_waddr;
    input[15:0] openram_h16_w16_2rw_wdata;
    input openram_h16_w16_2rw_wen;
    output[15:0] openram_h16_w16_2rw_rdata_0;
    output[15:0] openram_h16_w16_2rw_rdata_1;

    reg[15:0] mem_14[15:0]; //openram_h16_w16_2rw
    reg[3:0] tmp48;
    reg[3:0] tmp51;

    wire[3:0] tmp49;
    wire[15:0] tmp50;
    wire[3:0] tmp52;
    wire[15:0] tmp53;

    // Combinational
    assign openram_h16_w16_2rw_rdata_0 = tmp50;
    assign openram_h16_w16_2rw_rdata_1 = tmp53;
    assign tmp49 = openram_h16_w16_2rw_ren_0 ? openram_h16_w16_2rw_raddr_0 : tmp48;
    assign tmp52 = openram_h16_w16_2rw_ren_1 ? openram_h16_w16_2rw_raddr_1 : tmp51;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp48 <= tmp49;
            tmp51 <= tmp52;
        end
    end

    // Memory mem_14: openram_h16_w16_2rw
    always @(posedge clk)
    begin
        if (openram_h16_w16_2rw_wen) begin
            mem_14[openram_h16_w16_2rw_waddr] <= openram_h16_w16_2rw_wdata;
        end
    end
    assign tmp50 = mem_14[tmp48];
    assign tmp53 = mem_14[tmp51];

endmodule

