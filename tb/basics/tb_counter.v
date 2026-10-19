module tb_counter;
    reg clk, rst, en;
    wire [3:0] count;
    counter #(.WIDTH(4)) dut (.clk(clk), .rst(rst), .en(en), .count(count));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0; #12;
        rst = 0; en = 1;
        repeat (5) begin
            #10;
            $display("count=%0d", count);
        end
        // disable
        en = 0; #20;
        $display("after disable: count=%0d (exp 5)", count);
        $finish;
    end
endmodule
