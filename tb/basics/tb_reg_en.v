module tb_reg_en;
    reg clk, rst, en;
    reg [7:0] d;
    wire [7:0] q;

    // Override WIDTH to 8 for this test
    reg_en #(.WIDTH(8)) dut (.clk(clk), .rst(rst), .en(en), .d(d), .q(q));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0; d = 8'hAA; #12;
        rst = 0;
        // write enabled
        en = 1; d = 8'h3C; #10;
        $display("after write: q=%h (exp 3C)", q);
        // hold when disabled
        en = 0; d = 8'hFF; #10;
        $display("hold: q=%h (exp 3C)", q);
        // reset clears
        rst = 1; #10; rst = 0; #10;
        $display("after reset: q=%h (exp 00)", q);
        $finish;
    end
endmodule
