module top_module (
    input  x,
    input  y,
    output z
);

  wire z1, z2, z3, z4;

  A ia1 (.x(x), .y(y), .z(z1));
  A ia2 (.x(x), .y(y), .z(z2));
  B ib1 (.x(x), .y(y), .z(z3));
  B ib2 (.x(x), .y(y), .z(z4));

  assign z = (z1 | z2) ^ (z3 & z4);

endmodule

module A (
    input  x,
    input  y,
    output z
);

  assign z = ~(x ^ y);

endmodule

module B (
    input  x,
    input  y,
    output z
);

  assign z = (x ^ y) & x;

endmodule
