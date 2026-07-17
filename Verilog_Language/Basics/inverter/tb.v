`timescale 1ns / 1ps

module tb;

  reg in;
  wire out;

  top_module dut (
      .in (in),
      .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    $monitor("in=%b out=%b", in, out);

    in = 0;
    #10;

    in = 1;
    #10;

    $finish;
  end

endmodule
