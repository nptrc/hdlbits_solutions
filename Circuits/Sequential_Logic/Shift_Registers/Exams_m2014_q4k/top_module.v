module top_module (
    input wire clk,
    input wire resetn,
    input wire in,
    output wire out
);
    reg [3:0] dff;

    assign out = dff[0];

    always @(posedge clk) begin
        if (!resetn)
            dff <= 4'b0;
        else begin
            dff <= {in, dff[3:1]};
        end
    end

endmodule
