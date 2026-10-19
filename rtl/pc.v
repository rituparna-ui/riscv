// Program counter register.
module pc (
    input  wire        clk,
    input  wire        rst,
    input  wire        en,      // enable update
    input  wire [31:0] next_pc, // next value
    output reg  [31:0] pc       // current PC
);
    always @(posedge clk) begin
        if (rst)
            pc <= 32'd0;
        else if (en)
            pc <= next_pc;
    end
endmodule

