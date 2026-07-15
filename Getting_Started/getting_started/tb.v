`timescale 1ns / 1ps

module tb;

  wire one;

  top_module dut (.one(one));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    #1;

    if (one !== 1'b1) $display("FAIL: expected one = 1");
    else $display("PASS");

    $finish;
  end

endmodule
