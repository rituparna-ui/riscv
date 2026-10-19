module tb_adder32;
    reg [31:0] a, b;
    wire [31:0] sum;
    adder32 dut (.a(a), .b(b), .sum(sum));

    initial begin
        a = 0; b = 0; #10; $display("0+0=%h", sum);
        a = 5; b = 7; #10; $display("5+7=%h", sum);
        a = 32'hFFFFFFFF; b = 1; #10; $display("overflow=%h", sum);
        a = 32'h12345678; b = 32'h9ABCDEF0; #10;
        $display("big=%h (exp ACED2568?)", sum);
        $finish;
    end
endmodule
