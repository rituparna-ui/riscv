/* verilator lint_off UNUSEDSIGNAL */
// Instruction memory (ROM): 16 words, word-addressed.
// Input addr is byte address; we use addr[5:2] as word index.
module imem (
    input  wire [31:0] addr,
    output wire [31:0] instr
);
    reg [31:0] mem [0:15];
    integer i;

    initial begin
        for (i = 0; i < 16; i = i + 1)
            mem[i] = 32'd0;
        // Sample words (just data for now)
        mem[0] = 32'h00000013; // addi x0,x0,0 (NOP)
        mem[1] = 32'h00500093; // addi x1,x0,5
        mem[2] = 32'h00A00113; // addi x2,x0,10
    end

    assign instr = mem[addr[5:2]];
endmodule

