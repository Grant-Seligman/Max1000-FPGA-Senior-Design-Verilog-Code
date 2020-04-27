/*
AUTHOR: GABE GARVES
DATE: 3/25/2020
FROM: TXST SENRIOR DESIGN PROJECT FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/

module stepper_controller(drive, clk, direction);
	output reg [3:0] drive;		//Signals driving the unipolar motor windings.
	input clk, direction;				//Clock can also be PWM signal. btn toggles spin direction

	always @ (posedge clk) begin											 
		case (drive)
			4'b1110: drive = (direction) ? 4'b1101 : 4'b0111;	//If btn is true drive will move to b state, else move to d
			4'b1101: drive = (direction) ? 4'b1011 : 4'b1110;	//If btn is true drive will move to c state, else move to a
			4'b1011: drive = (direction) ? 4'b0111 : 4'b1101;	//If btn is true drive will move to d state, else move to b
			4'b0111: drive = (direction) ? 4'b1110 : 4'b1011;  //If btn is true drive will move to a state, else move to c
			default: drive = 4'b1110;
		endcase
	end
endmodule