`timescale 1ns / 1ps

module tb;

  reg  a;
  reg  b;
  wire out;

  top_module dut (
      .a  (a),
      .b  (b),
      .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    $monitor("a=%b b=%b out=%b", a, b, out);

    a = 0;
    b = 0;
    #10;

    a = 0;
    b = 1;
    #10;

    a = 1;
    b = 0;
    #10;

    a = 1;
    b = 1;
    #10;

    $finish;
  end

endmodule
