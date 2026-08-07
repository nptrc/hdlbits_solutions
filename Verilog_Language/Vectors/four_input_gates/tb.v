`timescale 1ns / 1ps

module tb;

  reg [3:0] in;
  wire out_and;
  wire out_or;
  wire out_xor;

  top_module dut (
      .in(in),
      .out_and(out_and),
      .out_or(out_or),
      .out_xor(out_xor)
  );

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    for (i = 0; i < 2 ** 4; i = i + 1) begin
      in = i[3:0];
      #10;
    end

    $finish;
  end

endmodule
