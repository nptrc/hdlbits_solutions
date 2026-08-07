`timescale 1ns / 1ps

module tb;

  reg  [2:0] vec;
  wire [2:0] outv;
  wire o2, o1, o0;

  top_module dut (
      .vec (vec),
      .outv(outv),
      .o2  (o2),
      .o1  (o1),
      .o0  (o0)
  );

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    vec = 3'b000;
    #10;

    vec = 3'b001;
    #10;

    vec = 3'b010;
    #10;

    vec = 3'b011;
    #10;

    vec = 3'b100;
    #10;

    vec = 3'b101;
    #10;

    vec = 3'b110;
    #10;

    vec = 3'b111;
    #10;

    $finish;
  end

endmodule
