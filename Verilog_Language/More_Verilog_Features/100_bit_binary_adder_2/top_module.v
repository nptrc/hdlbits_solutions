module top_module (
    input [99:0] a,
    input [99:0] b,
    input cin,
    output [99:0] cout,
    output [99:0] sum
);

  wire [100:0] carry;
  assign carry[0] = cin;
  assign cout   = carry[100:1];

  genvar i;
  generate
    for (i = 0; i < 100; i = i + 1) begin : gen_adders
      full_adder fa (
          .a(a[i]),
          .b(b[i]),
          .cin(carry[i]),
          .sum(sum[i]),
          .cout(carry[i+1])
      );
    end
  endgenerate

endmodule

module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (a ^ b) & cin;

endmodule
