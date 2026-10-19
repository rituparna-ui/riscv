// D flip-flop with synchronous reset.
// Sequential logic: updates on positive clock edge, not instantly.
module dff (
    input  wire clk,
    input  wire rst,
    input  wire d,
    output reg  q
);
    always @(posedge clk) begin
        if (rst)
            q <= 1'b0;   // non-blocking assignment for sequential
        else
            q <= d;
    end
endmodule
