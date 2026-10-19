module tb_dff;
    reg clk, rst, d;
    wire q;
    dff dut (.clk(clk), .rst(rst), .d(d), .q(q));

    // Clock: period 10 (5 high, 5 low)
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; d = 0; #12;   // reset active
        rst = 0;               // release reset
        d = 1; #10;            // d sampled on next edge
        $display("after d=1: q=%b (exp 1)", q);
        d = 0; #10;
        $display("after d=0: q=%b (exp 0)", q);
        // reset again
        rst = 1; #10; rst = 0; #10;
        $display("after reset: q=%b (exp 0)", q);
        $finish;
    end
endmodule
