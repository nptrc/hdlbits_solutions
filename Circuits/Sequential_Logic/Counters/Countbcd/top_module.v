module top_module (
    input wire clk,
    input wire reset,
    output wire [3:1] ena,
    output reg [15:0] q
);

    assign ena[1] = (q[3:0] == 4'h9);
    assign ena[2] = (q[7:0] == 8'h99);
    assign ena[3] = (q[11:0] == 12'h999);

    always @(posedge clk) begin
        if (reset)
            q <= 16'b0;
        else begin
            if (ena[1])
                q[3:0] <= 4'b0;
            else
                q[3:0] <= q[3:0] + 1'b1;

            if (ena[1]) begin
                if (ena[2])
                    q[7:4] <= 4'b0;
                else
                    q[7:4] <= q[7:4] + 1'b1;
            end

            if (ena[2]) begin
                if (ena[3])
                    q[11:8] <= 4'b0;
                else
                    q[11:8] <= q[11:8] + 1'b1;
            end

            if (ena[3]) begin
                if (q[15:12] == 4'h9)
                    q[15:12] <= 4'b0;
                else
                    q[15:12] <= q[15:12] + 1'b1;
            end

        end
    end

endmodule
