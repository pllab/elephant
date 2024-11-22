// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h4_w4_2rw_addr_0, openram_h4_w4_2rw_addr_1, openram_h4_w4_2rw_wdata_0, openram_h4_w4_2rw_wdata_1, openram_h4_w4_2rw_wen_0, openram_h4_w4_2rw_wen_1, openram_h4_w4_2rw_rdata_0, openram_h4_w4_2rw_rdata_1);
    input clk;
    input[1:0] openram_h4_w4_2rw_addr_0;
    input[1:0] openram_h4_w4_2rw_addr_1;
    input[3:0] openram_h4_w4_2rw_wdata_0;
    input[3:0] openram_h4_w4_2rw_wdata_1;
    input openram_h4_w4_2rw_wen_0;
    input openram_h4_w4_2rw_wen_1;
    output[3:0] openram_h4_w4_2rw_rdata_0;
    output[3:0] openram_h4_w4_2rw_rdata_1;

    reg[3:0] mem_2[3:0]; //openram_h4_w4_2rw
    reg[1:0] tmp9;
    reg[1:0] tmp12;

    wire tmp7;
    wire tmp8;
    wire[1:0] tmp10;
    wire[3:0] tmp11;
    wire[1:0] tmp13;
    wire[3:0] tmp14;

    // Combinational
    assign openram_h4_w4_2rw_rdata_0 = tmp11;
    assign openram_h4_w4_2rw_rdata_1 = tmp14;
    assign tmp7 = ~openram_h4_w4_2rw_wen_0;
    assign tmp8 = ~openram_h4_w4_2rw_wen_1;
    assign tmp10 = tmp7 ? openram_h4_w4_2rw_addr_0 : tmp9;
    assign tmp13 = tmp8 ? openram_h4_w4_2rw_addr_1 : tmp12;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp9 <= tmp10;
            tmp12 <= tmp13;
        end
    end

    // Memory mem_2: openram_h4_w4_2rw
    always @(posedge clk)
    begin
        if (openram_h4_w4_2rw_wen_0) begin
            mem_2[openram_h4_w4_2rw_addr_0] <= openram_h4_w4_2rw_wdata_0;
        end
        if (openram_h4_w4_2rw_wen_1) begin
            mem_2[openram_h4_w4_2rw_addr_1] <= openram_h4_w4_2rw_wdata_1;
        end
    end
    assign tmp11 = mem_2[tmp9];
    assign tmp14 = mem_2[tmp12];

endmodule

