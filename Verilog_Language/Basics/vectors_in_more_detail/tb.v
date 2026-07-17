`timescale 1ns / 1ps

module tb;

  reg  [15:0] in;
  wire [ 7:0] out_hi;
  wire [ 7:0] out_lo;

  top_module dut (
      .in(in),
      .out_hi(out_hi),
      .out_lo(out_lo)
  );

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    for (i = 0; i < 2 ** 16; i = i + 1) begin
      in = i;
      #10;
    end

    $finish;
  end

endmodule
