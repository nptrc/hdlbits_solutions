`timescale 1ns / 1ps

module tb;

  reg a;
  reg b;
  reg c;
  reg d;
  reg e;
  wire [24:0] out;

  top_module dut (
      .a  (a),
      .b  (b),
      .c  (c),
      .d  (d),
      .e  (e),
      .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    a = 0;
    b = 0;
    c = 0;
    d = 0;
    e = 0;
    #10;
    if (out !== 25'h1FFFFFF) $fatal;

    a = 1;
    b = 0;
    c = 1;
    d = 0;
    e = 1;
    #10;
    if (out !== 25'b10101_01010_10101_01010_10101) $fatal;

    $display("PASS");

    $finish;
  end

endmodule
