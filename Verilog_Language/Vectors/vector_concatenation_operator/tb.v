`timescale 1ns / 1ps

module tb;

  reg  [4:0] a;
  reg  [4:0] b;
  reg  [4:0] c;
  reg  [4:0] d;
  reg  [4:0] e;
  reg  [4:0] f;
  wire [7:0] w;
  wire [7:0] x;
  wire [7:0] y;
  wire [7:0] z;

  top_module dut (
      .a(a),
      .b(b),
      .c(c),
      .d(d),
      .e(e),
      .f(f),
      .w(w),
      .x(x),
      .y(y),
      .z(z)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    a = 5'b0;
    b = 5'b0;
    c = 5'b0;
    d = 5'b0;
    e = 5'b0;
    f = 5'b0;
    #10;

    a = 5'h1F;
    b = 5'h1F;
    c = 5'h1F;
    d = 5'h1F;
    e = 5'h1F;
    f = 5'h1F;
    #10;


    $finish;
  end

endmodule
