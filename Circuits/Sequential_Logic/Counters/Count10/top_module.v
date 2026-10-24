module top_module (
    input wire clk,
    input wire reset,
    output reg [3:0] q
);
    always @(posedge clk) begin
        if (reset)
            q <= 4'b0;
        else begin
            if (q == 4'd9) begin
                q <= 4'b0;
            end 
            else
                q <= q + 1'b1;
        end
    end
endmodule
