// 32 x 32-bit register file.
// - 2 combinational read ports (rs1, rs2)
// - 1 synchronous write port (rd) with write enable (we)
// - x0 is hardwired to 0 (writes to x0 are ignored)
module regfile (
    input  wire        clk,
    input  wire [4:0]  rs1,   // read address 1
    input  wire [4:0]  rs2,   // read address 2
    input  wire [4:0]  rd,    // write address
    input  wire [31:0] wd,    // write data
    input  wire        we,    // write enable
    output wire [31:0] rd1,   // read data 1 (value of rs1)
    output wire [31:0] rd2    // read data 2 (value of rs2)
);
    reg [31:0] regs [0:31];
    integer i;

    // Initialize all registers to 0 at time 0
    initial begin
        for (i = 0; i < 32; i = i + 1)
            regs[i] = 32'd0;
    end

    // Combinational reads
    assign rd1 = (rs1 == 5'd0) ? 32'd0 : regs[rs1];
    assign rd2 = (rs2 == 5'd0) ? 32'd0 : regs[rs2];

    // Synchronous write
    always @(posedge clk) begin
        if (we && (rd != 5'd0))
            regs[rd] <= wd;
    end
endmodule
