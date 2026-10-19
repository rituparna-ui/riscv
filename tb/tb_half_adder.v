module tb_half_adder;
    reg a, b;
    wire sum, carry;
    half_adder dut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        a=0; b=0; #10; $display("0 0 -> sum=%b carry=%b (exp 0 0)", sum, carry);
        a=0; b=1; #10; $display("0 1 -> sum=%b carry=%b (exp 1 0)", sum, carry);
        a=1; b=0; #10; $display("1 0 -> sum=%b carry=%b (exp 1 0)", sum, carry);
        a=1; b=1; #10; $display("1 1 -> sum=%b carry=%b (exp 0 1)", sum, carry);
        $finish;
    end
endmodule
