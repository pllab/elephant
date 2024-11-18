// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, openram_h4_w4_1rw_addr, openram_h4_w4_1rw_wdata, openram_h4_w4_1rw_wen, openram_h4_w4_1rw_rdata);
    input clk;
    input[1:0] openram_h4_w4_1rw_addr;
    input[3:0] openram_h4_w4_1rw_wdata;
    input openram_h4_w4_1rw_wen;
    output[3:0] openram_h4_w4_1rw_rdata;

    reg[3:0] mem_0[3:0]; //openram_h4_w4_1rw
    reg[1:0] tmp1;

    wire tmp0;
    wire[1:0] tmp2;
    wire[3:0] tmp3;

    // Combinational
    assign openram_h4_w4_1rw_rdata = tmp3;
    assign tmp0 = ~openram_h4_w4_1rw_wen;
    assign tmp2 = tmp0 ? openram_h4_w4_1rw_addr : tmp1;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp1 <= tmp2;
        end
    end

    // Memory mem_0: openram_h4_w4_1rw
    always @(posedge clk)
    begin
        if (openram_h4_w4_1rw_wen) begin
            mem_0[openram_h4_w4_1rw_addr] <= openram_h4_w4_1rw_wdata;
        end
    end
    assign tmp3 = mem_0[tmp1];

endmodule

