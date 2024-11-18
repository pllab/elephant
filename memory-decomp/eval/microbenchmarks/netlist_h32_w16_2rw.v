// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h32_w16_2rw_raddr_0, openram_h32_w16_2rw_raddr_1, openram_h32_w16_2rw_ren_0, openram_h32_w16_2rw_ren_1, openram_h32_w16_2rw_waddr, openram_h32_w16_2rw_wdata, openram_h32_w16_2rw_wen, openram_h32_w16_2rw_rdata_0, openram_h32_w16_2rw_rdata_1);
    input clk;
    input[4:0] openram_h32_w16_2rw_raddr_0;
    input[4:0] openram_h32_w16_2rw_raddr_1;
    input openram_h32_w16_2rw_ren_0;
    input openram_h32_w16_2rw_ren_1;
    input[4:0] openram_h32_w16_2rw_waddr;
    input[15:0] openram_h32_w16_2rw_wdata;
    input openram_h32_w16_2rw_wen;
    output[15:0] openram_h32_w16_2rw_rdata_0;
    output[15:0] openram_h32_w16_2rw_rdata_1;

    reg[15:0] mem_17[31:0]; //openram_h32_w16_2rw
    reg[4:0] tmp66;
    reg[4:0] tmp69;

    wire[4:0] tmp67;
    wire[15:0] tmp68;
    wire[4:0] tmp70;
    wire[15:0] tmp71;

    // Combinational
    assign openram_h32_w16_2rw_rdata_0 = tmp68;
    assign openram_h32_w16_2rw_rdata_1 = tmp71;
    assign tmp67 = openram_h32_w16_2rw_ren_0 ? openram_h32_w16_2rw_raddr_0 : tmp66;
    assign tmp70 = openram_h32_w16_2rw_ren_1 ? openram_h32_w16_2rw_raddr_1 : tmp69;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp66 <= tmp67;
            tmp69 <= tmp70;
        end
    end

    // Memory mem_17: openram_h32_w16_2rw
    always @(posedge clk)
    begin
        if (openram_h32_w16_2rw_wen) begin
            mem_17[openram_h32_w16_2rw_waddr] <= openram_h32_w16_2rw_wdata;
        end
    end
    assign tmp68 = mem_17[tmp66];
    assign tmp71 = mem_17[tmp69];

endmodule

