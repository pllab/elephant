// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, addr, mask, w_en, wdata, rdata);
    input clk;
    input[1:0] addr;
    input[1:0] mask;
    input w_en;
    input[1:0] wdata;
    output[1:0] rdata;

    reg[1:0] mem_0[3:0]; //mem
    reg[1:0] tmp13;

    wire tmp0;
    wire tmp1;
    wire tmp2;
    wire tmp3;
    wire[1:0] tmp4;
    wire tmp5;
    wire tmp6;
    wire tmp7;
    wire tmp8;
    wire tmp9;
    wire tmp10;
    wire tmp11;
    wire[1:0] tmp12;
    wire[1:0] tmp14;
    wire[1:0] tmp15;

    // Combinational
    assign rdata = tmp15;
    assign tmp0 = ~w_en;
    assign tmp1 = {mask[0]};
    assign tmp2 = w_en & tmp1;
    assign tmp3 = {wdata[0]};
    assign tmp5 = {tmp4[0]};
    assign tmp6 = tmp2 ? tmp3 : tmp5;
    assign tmp7 = {mask[1]};
    assign tmp8 = w_en & tmp7;
    assign tmp9 = {wdata[1]};
    assign tmp10 = {tmp4[1]};
    assign tmp11 = tmp8 ? tmp9 : tmp10;
    assign tmp12 = {tmp11, tmp6};
    assign tmp14 = tmp0 ? addr : tmp13;

    // Registers
    always @(posedge clk)
    begin
        begin
            tmp13 <= tmp14;
        end
    end

    // Memory mem_0: mem
    always @(posedge clk)
    begin
        if (w_en) begin
            mem_0[addr] <= tmp12;
        end
    end
    assign tmp4 = mem_0[addr];
    assign tmp15 = mem_0[tmp13];

endmodule

