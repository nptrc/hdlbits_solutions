module top_module (
    input c,
    input d,
    output reg [3:0] mux_in
);

  wire [1:0] cd = {c, d};

  always @(*) begin
    case (cd)
      2'b00: mux_in = 4'b0100;
      2'b01: mux_in = 4'b0001;
      2'b10: mux_in = 4'b0101;
      2'b11: mux_in = 4'b1001;
      default: mux_in = 0;
    endcase
  end

endmodule
