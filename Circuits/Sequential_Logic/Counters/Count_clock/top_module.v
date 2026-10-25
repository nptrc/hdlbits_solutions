module top_module(
    input wire clk,
    input wire reset,
    input wire ena,
    output reg pm,
    output reg [7:0] hh,
    output reg [7:0] mm,
    output reg [7:0] ss
);

    always @(posedge clk) begin
        if (reset) begin
            pm <= 1'b0;
            hh <= 8'h12;
            mm <= 8'b0;
            ss <= 8'b0;
        end 
        else begin
            if (ena) begin
                if (ss == 8'h59)
                    ss <= 8'h00;
                else begin
                    if (ss[3:0] == 4'h9) begin
                        ss[3:0] <= 4'h0;
                        if (ss[7:4] == 4'h9)
                            ss[7:4] <= 4'h0;
                        else
                            ss[7:4] <= ss[7:4] + 1'b1;
                    end
                    else
                        ss[3:0] <= ss[3:0] + 1'b1;
                end

                if (ss == 8'h59) begin
                    if (mm == 8'h59)
                        mm <= 8'h0;
                    else begin
                        if (mm[3:0] == 4'h9) begin
                            mm[3:0] <= 4'h0;
                            if (mm[7:4] == 4'h9)
                                mm[7:4] <= 4'h0;
                            else
                                mm[7:4] <= mm[7:4] + 1'b1;
                        end
                        else
                            mm[3:0] <= mm[3:0] + 1'b1;
                    end
                end

                if (mm == 8'h59 && ss == 8'h59) begin
                    if (hh == 8'h12)
                        hh <= 8'h1;
                    else begin
                        if (hh[3:0] == 4'h9) begin
                            hh[3:0] <= 4'h0;
                            if (hh[7:4] == 4'h1)
                                hh[7:4] <= 4'h0;
                            else
                                hh[7:4] <= hh[7:4] + 1'b1;
                        end
                        else
                            hh[3:0] <= hh[3:0] + 1'b1;
                    end
                end

                if (hh == 8'h11 && mm == 8'h59 && ss == 8'h59) begin
                    pm <= ~pm;
                end
            end
        end
    end

endmodule
