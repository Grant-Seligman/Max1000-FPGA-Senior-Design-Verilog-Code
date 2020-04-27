// Stepdown 1MHz input clock to 60Hz
/*
AUTHOR: JAMES STARKS
DATE: 4/17/2020
FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
module stepdown_60Hz(outclk, inclk);
    output reg outclk; 
    input wire inclk;
	
    // div = 1E6/60/2
	integer div = 8333;
    // LOG2(div), and round up to get number of bits required for count.
    reg [13:0] count;

    initial begin count = 14'b0; outclk = 0; end
    // Note, this always block only activates on the posedge this is why
    // when calculating the div we get a factor of 0.5
    always@(posedge inclk) begin
        count = count + 1;
        if (count == div) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
