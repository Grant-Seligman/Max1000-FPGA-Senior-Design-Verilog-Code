/*
AUTHOR: GABE GARVES
DATE: 3/25/2020
FROM: TXST SENRIOR DESIGN PROJECT FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
DESCRIPTION: This module is a state machine used for controlling
			 a stepper motor. If direction is high, the state 
			 machine reverses direction.
			 [3:0]Drive breakdown
			 Index values in drive			 [3][2][1][0]
			 Stepper Motor Winding terminals  A	 B  C  D
*/
module stepper_controller(drive, clk, direction);
	output reg [3:0] drive;		//Signals driving the unipolar motor windings.
	input clk, direction;		//Clock can also be PWM signal. btn toggles spin direction

	always @ (posedge clk) begin											 
		case (drive)
			4'b1110: drive = (direction) ? 4'b1101 : 4'b0111;
			4'b1101: drive = (direction) ? 4'b1011 : 4'b1110;
			4'b1011: drive = (direction) ? 4'b0111 : 4'b1101;
			4'b0111: drive = (direction) ? 4'b1110 : 4'b1011;  
			default: drive = 4'b1110;
		endcase
	end
endmodule

