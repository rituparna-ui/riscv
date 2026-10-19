module tb_adder4;
    reg [3:0] a, b;
    reg       cin;
    wire [3:0] sum;
    wire       cout;
    adder4 dut (.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));

    integer i;
    initial begin
        // Exhaustive: all a, b, cin
        for (i = 0; i < 512; i = i + 1) begin
            {cin, a, b} = i[8:0];
            #10;
            if ({cout, sum} !== (a + b + cin)) begin
                $display("MISMATCH a=%h b=%h cin=%b got=%h%h exp=%h", a, b, cin, cout, sum, a+b+cin);
            end
        end
        $display("adder4 exhaustive test done");
        $finish;
    end
endmodule
