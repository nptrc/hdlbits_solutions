module top_module (
    input wire clk,
    input wire reset,
    input wire enable,
    output reg [3:0] Q,
    output wire c_enable,
    output wire c_load,
    output wire [3:0] c_d
);

    assign c_enable = enable;
    assign c_load = reset | (enable & Q == 4'd12);
    assign c_d = 4'b1;

    count4 c1(
        .clk(clk),
        .enable(c_enable),
        .load(c_load),
        .d(c_d),
        .Q(Q)
    );

endmodule
