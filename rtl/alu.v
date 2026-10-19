// ALU : supports ADD.
module alu (
    input  wire [31:0] a,
    input  wire [31:0] b,
    input  wire [3:0]  alu_ctrl,
    output reg  [31:0] result,
    output wire        zero
);
    localparam ALU_ADD = 4'b0000;

    always @(*) begin
        case (alu_ctrl)
            ALU_ADD: result = a + b;
            default: result = 32'd0;
        endcase
    end

    assign zero = (result == 32'd0);
endmodule
