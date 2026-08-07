module top_module (
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);

  wire c;
  wire [31:0] b1;

  assign b1 = b ^ {32{sub}};

  add16 ins1 ( .a(a[15:0]), .b(b1[15:0]), .cin(sub), .sum(sum[15:0]), .cout(c) );
  add16 ins2 ( .a(a[31:16]), .b(b1[31:16]), .cin(c), .sum(sum[31:16]) );

endmodule
