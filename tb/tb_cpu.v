module tb_cpu;
    reg clk, rst;
    wire [31:0] dbg_pc, dbg_instr, dbg_alu_result;
    wire [4:0]  dbg_rd;

    cpu dut (.clk(clk), .rst(rst),
             .dbg_pc(dbg_pc), .dbg_instr(dbg_instr),
             .dbg_alu_result(dbg_alu_result), .dbg_rd(dbg_rd));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; #12;
        rst = 0;
        repeat (4) begin
            #10;
            $display("PC=%0d instr=%h rd=x%0d alu=%0d", dbg_pc, dbg_instr, dbg_rd, dbg_alu_result);
        end
        $finish;
    end
endmodule
