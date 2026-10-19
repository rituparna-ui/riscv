// 4-bit ripple-carry adder: chain of 4 full adders.
// cin feeds the LSB; cout is the final carry out.
module adder4 (
    input  wire [3:0] a,
    input  wire [3:0] b,
    input  wire       cin,
    output wire [3:0] sum,
    output wire       cout
);
    wire c0, c1, c2; // internal carries

    full_adder fa0 (.a(a[0]), .b(b[0]), .cin(cin),  .sum(sum[0]), .cout(c0));
    full_adder fa1 (.a(a[1]), .b(b[1]), .cin(c0),  .sum(sum[1]), .cout(c1));
    full_adder fa2 (.a(a[2]), .b(b[2]), .cin(c1),  .sum(sum[2]), .cout(c2));
    full_adder fa3 (.a(a[3]), .b(b[3]), .cin(c2),  .sum(sum[3]), .cout(cout));
endmodule
