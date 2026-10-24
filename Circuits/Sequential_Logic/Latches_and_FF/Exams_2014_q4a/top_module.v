module top_module (
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
