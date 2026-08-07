`timescale 1ns / 1ps

module tb;

  reg  [31:0] in;
  wire [31:0] out;

  top_module dut (
      .in (in),
      .out(out)
  );

  integer i;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    in = 32'h00000000;
    #10;

    in = 32'h12345678;
    #10;

    in = 32'hAABBCCDD;
    #10;

    in = 32'hFFFFFFFF;
    #10;

    $finish;
  end

endmodule
