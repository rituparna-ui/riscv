module tb_regfile;
    reg clk;
    reg [4:0] rs1, rs2, rd;
    reg [31:0] wd;
    reg we;
    wire [31:0] rd1, rd2;

    regfile dut (.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd),
                 .wd(wd), .we(we), .rd1(rd1), .rd2(rd2));

    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Write x1 = 0x1111
        we = 1; rd = 5'd1; wd = 32'h00001111; #10; we = 0;
        // Write x2 = 0x2222
        we = 1; rd = 5'd2; wd = 32'h00002222; #10; we = 0;

        // Read x1, x2
        rs1 = 5'd1; rs2 = 5'd2; #1;
        $display("rd1=%h (exp 1111) rd2=%h (exp 2222)", rd1, rd2);

        // x0 always 0 even if written
        we = 1; rd = 5'd0; wd = 32'hFFFFFFFF; #10; we = 0;
        rs1 = 5'd0; #1;
        $display("x0=%h (exp 00000000)", rd1);

        // Write disabled
        we = 0; rd = 5'd3; wd = 32'h9999; #10;
        rs1 = 5'd3; #1;
        $display("x3 (disabled write)=%h (exp 00000000)", rd1);

        $finish;
    end
endmodule
