// Minimal single-cycle CPU: supports ADDI only.
/* verilator lint_off UNUSEDSIGNAL */
module cpu (
    input  wire        clk,
    input  wire        rst,
    output wire [31:0] dbg_pc,
    output wire [31:0] dbg_instr,
    output wire [31:0] dbg_alu_result,
    output wire [4:0]  dbg_rd
);
    wire [31:0] pc, instr, rd1, alu_result, imm, next_pc;
    wire [31:0] unused_rd2;
    wire unused_zero;
    wire [4:0]  rs1, rd;

    // PC
    pc pc_reg (.clk(clk), .rst(rst), .en(1'b1), .next_pc(next_pc), .pc(pc));

    // Instruction memory
    imem im (.addr(pc), .instr(instr));

    // Decode (ADDI: I-type)
    assign rd  = instr[11:7];
    assign rs1 = instr[19:15];
    assign imm = {{20{instr[31]}}, instr[31:20]};

    // Register file
    regfile rf (
        .clk(clk), .rs1(rs1), .rs2(5'd0), .rd(rd),
        .wd(alu_result), .we(1'b1), .rd1(rd1), .rd2(unused_rd2)
    );

    // ALU: ADD
    alu alu0 (.a(rd1), .b(imm), .alu_ctrl(4'b0000), .result(alu_result), .zero(unused_zero));

    // Next PC = PC + 4
    assign next_pc = pc + 32'd4;

    // Debug
    assign dbg_pc          = pc;
    assign dbg_instr       = instr;
    assign dbg_alu_result  = alu_result;
    assign dbg_rd          = rd;
endmodule
