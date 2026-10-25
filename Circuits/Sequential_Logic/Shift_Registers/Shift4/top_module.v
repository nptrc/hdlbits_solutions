module top_module(
    input clk,
    input areset,
    input load,
    input ena,
    input [3:0] data,
    output reg [3:0] q
);

    always @(posedge clk or posedge areset) begin
        if (areset)
            q <= 4'b0;
        else begin
            if (load)
                q <= data;
            else if (ena)
                q <= q >> 1'b1;
            else
                q <= q;
        end
    end

endmodule
