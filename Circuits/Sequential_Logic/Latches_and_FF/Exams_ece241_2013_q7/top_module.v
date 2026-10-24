module top_module (
    input wire clk,
    input wire j,
    input wire k,
    output reg Q
); 
    reg q1;

    always @(*) begin
        case ({j, k})
            2'b00: q1 = Q;
            2'b01: q1 = 1'b0;
            2'b10: q1 = 1'b1;
            2'b11: q1 = ~Q;
        endcase
    end

    always @(posedge clk) begin
        Q <= q1;
    end

endmodule
