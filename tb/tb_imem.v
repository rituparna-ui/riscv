module tb_imem;
    reg [31:0] addr;
    wire [31:0] instr;
    imem dut (.addr(addr), .instr(instr));

    initial begin
        addr = 32'd0; #10; $display("instr0=%h (exp 00000013)", instr);
        addr = 32'd4; #10; $display("instr1=%h (exp 00500093)", instr);
        addr = 32'd8; #10; $display("instr2=%h (exp 00A00113)", instr);
        addr = 32'd12; #10; $display("instr3=%h (exp 00000000)", instr);
        $finish;
    end
endmodule
