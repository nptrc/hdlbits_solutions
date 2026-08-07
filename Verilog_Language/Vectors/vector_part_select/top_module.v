module top_module (
    input  [31:0] in,
    output [31:0] out
);
  assign out = {in[8*0+:8], in[8*1+:8], in[8*2+:8], in[8*3+:8]};
endmodule
