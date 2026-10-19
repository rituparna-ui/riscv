module tb_alu;
    reg [31:0] a, b;
    reg [3:0]  ctrl;
    wire [31:0] result;
    wire zero;
    alu dut (.a(a), .b(b), .alu_ctrl(ctrl), .result(result), .zero(zero));

    initial begin
        // ADD
        ctrl = 4'b0000;
        a = 5; b = 7; #10; $display("ADD 5+7=%0d", result);
        // SUB
        ctrl = 4'b0001;
        a = 10; b = 3; #10; $display("SUB 10-3=%0d", result);
        a = 3; b = 10; #10; $display("SUB 3-10=%h zero=%b", result, zero);
        // AND
        ctrl = 4'b0010;
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; #10;
        // OR
        ctrl = 4'b0011;
        a = 32'hF0F0F0F0; b = 32'h0F0F0F0F; #10;
        $display("OR = %h (exp FFFFFFFF)", result);
        $finish;
    end
endmodule



