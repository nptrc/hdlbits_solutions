module top_module (
    input  [7:0] a, b, c, d,
    output [7:0] min
);

  wire [7:0] z1, z2;

  assign z1 = a < b ? a : b;
  assign z2 = c < d ? c : d;
  assign min = z1 < z2 ? z1 : z2;

endmodule
