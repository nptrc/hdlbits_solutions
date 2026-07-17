`timescale 1ns / 1ps

module tb;

  reg  p1a;
  reg  p1b;
  reg  p1c;
  reg  p1d;
  reg  p1e;
  reg  p1f;
  wire p1y;
  reg  p2a;
  reg  p2b;
  reg  p2c;
  reg  p2d;
  wire p2y;

  top_module dut (
      .p1a(p1a),
      .p1b(p1b),
      .p1c(p1c),
      .p1d(p1d),
      .p1e(p1e),
      .p1f(p1f),
      .p1y(p1y),
      .p2a(p2a),
      .p2b(p2b),
      .p2c(p2c),
      .p2d(p2d),
      .p2y(p2y)
  );

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    p1a = 0;
    p1b = 0;
    p1c = 0;
    p1d = 0;
    p1e = 0;
    p1f = 0;
    p2a = 0;
    p2b = 0;
    p2c = 0;
    p2d = 0;
    #10;

    for (i = 0; i < 64; i = i + 1) begin
      p1a = i[5];
      p1b = i[4];
      p1c = i[3];
      p1d = i[2];
      p1e = i[1];
      p1f = i[0];

      p2a = i[3];
      p2b = i[2];
      p2c = i[1];
      p2d = i[0];

      #10;
    end

    $finish;
  end

endmodule
