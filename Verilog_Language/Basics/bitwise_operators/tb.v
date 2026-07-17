`timescale 1ns / 1ps

module tb;

  reg [2:0] a;
  reg [2:0] b;
  wire [2:0] out_or_bitwise;
  wire out_or_logical;
  wire [5:0] out_not;

  top_module dut (
      .a(a),
      .b(b),
      .out_or_bitwise(out_or_bitwise),
      .out_or_logical(out_or_logical),
      .out_not(out_not)
  );

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    for (i = 0; i < 2 ** 6; i = i + 1) begin
      a = i[2:0];
      b = i[5:3];
      #10;
    end

    $finish;
  end

endmodule
