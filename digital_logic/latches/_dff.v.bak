//D Flip Flop (Synchronous)
/*
AUTHOR: Gabe Garves
DATE: 11/15/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code
module dff(q, q0, d, clk);
	output wire q, q0;		//Technically 1 output. 

	input wire d, clk;		//2 inputs: d and clock.
	  						//if q=1 represents output is high and	
							//if q0=1 represents output is low.
							//if q=1 && q0=1 forbidden state

	wire [2:0] w;			//connecting wires

	not no1(w[0], d);
	nand na1(w[1], d, clk);
	nand na2(w[2], clk, w[0]);
	nand na3(q, w[1], q0);
	nand na4(q0, w[2], q);

endmodule
