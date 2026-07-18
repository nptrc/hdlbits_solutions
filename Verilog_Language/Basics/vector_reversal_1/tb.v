`timescale 1ns / 1ps

module tb;

  reg  [7:0] in;
  wire [7:0] out;

  top_module dut (
      .in (in),
      .out(out)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    in = 8'b10101010;
    #10;

    in = 8'b11110000;
    #10;

    in = 8'b01101100;
    #10;

    $finish;
  end

endmodule
