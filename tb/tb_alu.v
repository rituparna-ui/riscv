module tb_alu;
    reg [31:0] a, b;
    reg [3:0]  ctrl;
    wire [31:0] result;
    wire zero;
    alu dut (.a(a), .b(b), .alu_ctrl(ctrl), .result(result), .zero(zero));

    initial begin
        ctrl = 4'b0000; // ADD
        a = 5; b = 7; #10; $display("ADD 5+7=%0d (exp 12)", result);
        a = 32'hFFFFFFFF; b = 1; #10; $display("ADD overflow=%h (exp 0)", result);
        a = 0; b = 0; #10; $display("zero flag=%b (exp 1)", zero);
        $finish;
    end
endmodule
