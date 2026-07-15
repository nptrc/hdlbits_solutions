`timescale 1ns / 1ps

module tb;

  wire zero;

  top_module dut (.zero(zero));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    #1;

    if (zero !== 1'b0) $display("FAIL: expected zero = 0");
    else $display("PASS");

    $finish;
  end

endmodule
