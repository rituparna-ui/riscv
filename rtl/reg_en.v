// Register with synchronous reset and write-enable.
// WIDTH is a parameter (default 32) so we can reuse this for 1, 8, 32 bits.
module reg_en #(
    parameter WIDTH = 32
) (
    input  wire             clk,
    input  wire             rst,
    input  wire             en,   // write enable
    input  wire [WIDTH-1:0] d,
    output reg  [WIDTH-1:0] q
);
    always @(posedge clk) begin
        if (rst)
            q <= {WIDTH{1'b0}};
        else if (en)
            q <= d;
        // if !en: hold value (implicit)
    end
endmodule
