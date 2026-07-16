`timescale 1ns / 1ps

module tb;

  reg a, b, c;
  wire w, x, y, z;

  top_module dut (
      .a(a),
      .b(b),
      .c(c),
      .w(w),
      .x(x),
      .y(y),
      .z(z)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    $monitor("t=%0t a=%b b=%b c=%b | w=%b x=%b y=%b z=%b", $time, a, b, c, w, x, y, z);

    a = 0;
    b = 0;
    c = 0;
    #10;

    a = 0;
    b = 0;
    c = 1;
    #10;

    a = 0;
    b = 1;
    c = 0;
    #10;

    a = 0;
    b = 1;
    c = 1;
    #10;

    a = 1;
    b = 0;
    c = 0;
    #10;

    a = 1;
    b = 0;
    c = 1;
    #10;

    a = 1;
    b = 1;
    c = 0;
    #10;

    a = 1;
    b = 1;
    c = 1;
    #10;

    $finish;
  end

endmodule
