module top_module (
    input wire clk,
    input wire reset,
    input wire [31:0] in,
    output reg [31:0] out
);
    reg [31:0] last;


    always @(posedge clk) begin
        last <= in;

        if (reset) out <= 32'b0;
        else       out <= (last & ~in) | out;
    end

endmodule
