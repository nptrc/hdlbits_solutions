module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] last;
    wire [7:0] trigger;

    assign trigger = ~last & in;
    always @(posedge clk) begin
        last <= in;
        pedge <= trigger;
    end
endmodule
