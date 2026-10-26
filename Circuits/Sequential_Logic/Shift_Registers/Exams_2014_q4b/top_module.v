module top_module (
    input [3:0] SW, // R
    input [3:0] KEY, // w L E clk
    output [3:0] LEDR // Q
);

    MUXDFF muxdff1 (.clk(KEY[0]), .w(LEDR[1]), .R(SW[0]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[0]));
    MUXDFF muxdff2 (.clk(KEY[0]), .w(LEDR[2]), .R(SW[1]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[1]));
    MUXDFF muxdff3 (.clk(KEY[0]), .w(LEDR[3]), .R(SW[2]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[2]));
    MUXDFF muxdff4 (.clk(KEY[0]), .w(KEY[3]), .R(SW[3]), .E(KEY[1]), .L(KEY[2]), .Q(LEDR[3]));

endmodule

module MUXDFF (
    input wire clk,
    input wire w, 
    input wire R, 
    input wire E, 
    input wire L,
    output reg Q
);
    wire d1 = E ? w : Q;
    wire d2 = L ? R : d1;

    always @(posedge clk) begin
        Q <= d2;
    end

endmodule
