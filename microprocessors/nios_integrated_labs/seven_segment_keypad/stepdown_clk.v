// 60Hz clock
/*
AUTHOR: GABE GARVES
DATE: 4/3/2020
FROM: TXST SENIOR DESIGN FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTIOR USE
*/

module stepdown_clk(clk_out, clk_in);
	output reg clk_out;
	input clk_in;

	reg [23:0] counter; //need at least 24 bits 

	initial begin
		#0    counter = 0;
		#0    clk_out  = 0;
	end

	always @(posedge clk_in) begin
		if (counter == 0) begin
			counter <= 200000; // 12 MHz / 60 Hz = 200,000
			clk_out <= ~clk_out;
		end else counter <= counter -1;
	end		
endmodule



