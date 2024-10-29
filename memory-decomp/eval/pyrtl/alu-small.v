// Generated automatically via PyRTL
// As one initial test of synthesis, map to FPGA with:
//   yosys -p "synth_xilinx -top toplevel" thisfile.v

module toplevel(clk, instruction, alu_result_o, op, rd, rs1, rs2, write_enable_o);
    input clk;
    input[7:0] instruction;
    output[2:0] alu_result_o;
    output[1:0] op;
    output[1:0] rd;
    output[1:0] rs1;
    output[1:0] rs2;
    output write_enable_o;

    reg[2:0] mem_0[3:0]; //reg_file

    wire[2:0] alu_result;
    wire const_0_1;
    wire const_1_0;
    wire[1:0] const_2_2;
    wire[1:0] const_3_3;
    wire const_4_0;
    wire const_5_0;
    wire const_6_0;
    wire const_7_0;
    wire[2:0] rs1val;
    wire[2:0] rs2val;
    wire[1:0] tmp0;
    wire[1:0] tmp1;
    wire[1:0] tmp2;
    wire[1:0] tmp3;
    wire[2:0] tmp4;
    wire[2:0] tmp5;
    wire tmp6;
    wire[1:0] tmp7;
    wire tmp8;
    wire[3:0] tmp9;
    wire[2:0] tmp10;
    wire tmp11;
    wire[3:0] tmp12;
    wire[2:0] tmp13;
    wire tmp14;
    wire tmp15;
    wire tmp16;
    wire[2:0] tmp17;
    wire tmp18;
    wire tmp19;
    wire tmp20;
    wire tmp21;
    wire[1:0] tmp22;
    wire[2:0] tmp23;
    wire[2:0] tmp24;
    wire[2:0] tmp25;
    wire[2:0] tmp26;
    wire tmp27;
    wire[1:0] tmp28;
    wire tmp29;
    wire tmp30;
    wire write_enable;

    // Combinational
    assign const_0_1 = 1;
    assign const_1_0 = 0;
    assign const_2_2 = 2;
    assign const_3_3 = 3;
    assign const_4_0 = 0;
    assign const_5_0 = 0;
    assign const_6_0 = 0;
    assign const_7_0 = 0;
    assign alu_result = tmp26;
    assign alu_result_o = alu_result;
    assign op = tmp3;
    assign rd = tmp2;
    assign rs1 = tmp0;
    assign rs1val = tmp4;
    assign rs2 = tmp1;
    assign rs2val = tmp5;
    assign tmp0 = {instruction[7], instruction[6]};
    assign tmp1 = {instruction[5], instruction[4]};
    assign tmp2 = {instruction[3], instruction[2]};
    assign tmp3 = {instruction[1], instruction[0]};
    assign tmp6 = {const_1_0};
    assign tmp7 = {tmp6, const_0_1};
    assign tmp8 = tmp3 == tmp7;
    assign tmp9 = rs1val + rs2val;
    assign tmp10 = {tmp9[2], tmp9[1], tmp9[0]};
    assign tmp11 = tmp3 == const_2_2;
    assign tmp12 = rs1val - rs2val;
    assign tmp13 = {tmp12[2], tmp12[1], tmp12[0]};
    assign tmp14 = ~tmp8;
    assign tmp15 = tmp14 & tmp11;
    assign tmp16 = tmp3 == const_3_3;
    assign tmp17 = rs1val & rs2val;
    assign tmp18 = ~tmp8;
    assign tmp19 = ~tmp11;
    assign tmp20 = tmp18 & tmp19;
    assign tmp21 = tmp20 & tmp16;
    assign tmp22 = {const_5_0, const_5_0};
    assign tmp23 = {tmp22, const_4_0};
    assign tmp24 = tmp8 ? tmp10 : tmp23;
    assign tmp25 = tmp15 ? tmp13 : tmp24;
    assign tmp26 = tmp21 ? tmp17 : tmp25;
    assign tmp27 = {const_7_0};
    assign tmp28 = {tmp27, const_6_0};
    assign tmp29 = tmp3 == tmp28;
    assign tmp30 = ~tmp29;
    assign write_enable = tmp30;
    assign write_enable_o = write_enable;

    // Memory mem_0: reg_file
    always @(posedge clk)
    begin
        if (write_enable) begin
            mem_0[tmp2] <= alu_result;
        end
    end
    assign tmp4 = mem_0[tmp0];
    assign tmp5 = mem_0[tmp1];

endmodule

