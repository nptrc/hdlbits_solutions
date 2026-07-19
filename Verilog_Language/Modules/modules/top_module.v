module top_module (
    input  a,
    input  b,
    output out
);
  mod_a ins (
      .in1(a),
      .in2(b),
      .out(out)
  );
endmodule
