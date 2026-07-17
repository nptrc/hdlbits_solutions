module top_module (
    input  p1a,
    input  p1b,
    input  p1c,
    input  p1d,
    input  p1e,
    input  p1f,
    output p1y,
    input  p2a,
    input  p2b,
    input  p2c,
    input  p2d,
    output p2y
);

  wire w11, w12, w21, w22;

  assign w11 = p1a & p1b & p1c;
  assign w12 = p1d & p1e & p1f;
  assign p1y = w11 | w12;

  assign w21 = p2a & p2b;
  assign w22 = p2c & p2d;
  assign p2y = w21 | w22;

endmodule
