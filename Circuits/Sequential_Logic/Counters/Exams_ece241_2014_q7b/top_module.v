module top_module (
    input wire clk,
    input wire reset,
    output reg OneHertz,
    output wire [2:0] c_enable
);
    wire [3:0] q1, q2, q3;

    assign c_enable[0] = reset ? 1'b0 : 1'b1;
    assign c_enable[1] = reset ? 1'b0 : (q1 == 4'd9);
    assign c_enable[2] = reset ? 1'b0 : (q2 == 4'd9) & c_enable[1];

    always @(posedge clk) begin
        if (reset)
            OneHertz <= 1'b0;
        else
            OneHertz <= ({q3, q2, q1} == 12'b1001_1001_1000);
    end

    bcdcount counter1 (.clk(clk), .reset(reset), .enable(c_enable[0]), .Q(q1));
    bcdcount counter2 (.clk(clk), .reset(reset), .enable(c_enable[1]), .Q(q2));
    bcdcount counter3 (.clk(clk), .reset(reset), .enable(c_enable[2]), .Q(q3));

endmodule
