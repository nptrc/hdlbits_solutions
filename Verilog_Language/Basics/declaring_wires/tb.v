`timescale 1ns / 1ps

module tb;

  reg  a;
  reg  b;
  reg  c;
  reg  d;
  wire out;
  wire out_n;

  top_module dut (
      .a(a),
      .b(b),
      .c(c),
      .d(d),
      .out(out),
      .out_n(out_n)
  );

  integer i;
  reg [3:0] temp;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    a = 0;
    b = 0;
    c = 0;
    d = 0;

    for (i = 0; i < 16; i = i + 1) begin
      temp = i[3:0];
      a = temp[3];
      b = temp[2];
      c = temp[1];
      d = temp[0];
      #10;
    end

    $finish;
  end

endmodule
