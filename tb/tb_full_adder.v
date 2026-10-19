module tb_full_adder;
    reg a, b, cin;
    wire sum, cout;
    full_adder dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    integer i;
    initial begin
        // Walk all 8 input combinations
        for (i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i[2:0];   // bit-slice assignment
            #10;
            $display("a=%b b=%b cin=%b -> sum=%b cout=%b", a, b, cin, sum, cout);
        end
        $finish;
    end
endmodule
