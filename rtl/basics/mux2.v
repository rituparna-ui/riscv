// 2-to-1 multiplexer: sel=0 -> a, sel=1 -> b
module mux2 (
    input  wire a,
    input  wire b,
    input  wire sel,
    output wire out
);
    assign out = sel ? b : a;
endmodule
