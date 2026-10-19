module tb_mux2;
    reg a, b, sel;
    wire out;
    mux2 dut (.a(a), .b(b), .sel(sel), .out(out));

    initial begin
        a=0; b=0; sel=0; #10; $display("sel=0 a=0 b=0 -> out=%b (exp 0)", out);
        a=0; b=1; sel=0; #10; $display("sel=0 a=0 b=1 -> out=%b (exp 0)", out);
        a=1; b=0; sel=1; #10; $display("sel=1 a=1 b=0 -> out=%b (exp 0)", out);
        a=0; b=1; sel=1; #10; $display("sel=1 a=0 b=1 -> out=%b (exp 1)", out);
        $finish;
    end
endmodule
