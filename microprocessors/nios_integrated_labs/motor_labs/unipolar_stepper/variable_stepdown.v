/*
AUTHOR: JAMES STARKS
DATE: 4/24/2020
FROM: TXST SENRIOR DESIGN PROJECT FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
DESCRIPTION: This module is exactly like the previous stepdown
             clock dividers except the division factor is a
             16bit value that can be set by another module (in
             this case, NIOS).
*/
module variable_stepdown(out_clk, division, in_clk);
    output reg out_clk;
	input wire [15:0] division;
    input wire in_clk;
    
    reg [15:0] count;

    initial begin count = 16'b0; out_clk = 0; end

    always@(posedge in_clk) begin
        count = count + 1;
        if (count == division) begin
            out_clk = ~out_clk;
            count = 0;
        end
    end
endmodule
