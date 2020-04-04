//Making a 10Hz clock out of a down counter
//Setting up a register that will allow me to handle the right amount of bits needed
//I want a 10Hz clock from a 12MHz clock so I first need to calculate the number of bits I need.
//   log(Input_Clock)/log(2) = # of bits needed. Always round up to the highest number of bits 

//In Verilog, <= represents a blocked statement.
//Usually all actions happen in parallel but with
//a block statement, the arguements are executed from 
//top-down as seen similarly in C/C++. 

// Clock Converter: 12MHz to 10Hz
/*
AUTHOR: Grant Seligman
DATE: 02/09/2020
FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
ORIGINAL CODE SOURCE:
https://electronics.stackexchange.com/questions/202876/
how-can-i-generate-a-1-hz-clock-from-50-mhz-clock-coming-from-an-altera-board
*/
module clk_stepdown(clkout, clkin); //ports

output reg clkout;

input clkin;

reg [23:0] counter; //need at least 24 bits 

//happens first and only once
initial begin
    counter = 0;
    clkout = 0;
end

//Counts down until it reaches zero then resets
always @(posedge clkin) begin
    if (counter == 0) begin
        counter <= 1199999; //Blocking statement. Remember you start counting at zero.
        clkout <= ~clkout;  //Blocking statement. ~clkout is the same as !clkout
	end else begin
        counter <= counter -1; //Blocking statement
	end
end

endmodule
