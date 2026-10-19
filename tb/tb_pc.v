module tb_pc;
    reg clk, rst, en;
    reg [31:0] next_pc;
    wire [31:0] pc;
    pc dut (.clk(clk), .rst(rst), .en(en), .next_pc(next_pc), .pc(pc));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        rst = 1; en = 0; next_pc = 0; #12;
        rst = 0; en = 1;
        next_pc = 32'd4; #10;
        $display("pc=%0d (exp 4)", pc);
        next_pc = 32'd8; #10;
        $display("pc=%0d (exp 8)", pc);
        // disable hold
        en = 0; next_pc = 32'd100; #10;
        $display("pc=%0d (exp 8)", pc);
        $finish;
    end
endmodule

