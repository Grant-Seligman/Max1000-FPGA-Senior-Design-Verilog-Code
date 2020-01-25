//Gated SR Latch (Asynchronous)
/*
AUTHOR: Gabe Garves
DATE: 11/15/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code
module gated_sr(q, q0, s, r, e);
	output q, q0;			//Technically 1 output. 
	input s, r, e;			//3 inputs: set, rest, and enable.
							//q represents output is high and	
							//q0 represents output is low.
	wire [1:0] w;			//connecting wires
	
	//gate var_name(output1, input1, input2);
	
	and a1(w[0], r, e);		//The logic
	and a2(w[1], s, e);
	nor n1(q0, w[1], q);
	nor n2(q, w[0], q0);

endmodule
