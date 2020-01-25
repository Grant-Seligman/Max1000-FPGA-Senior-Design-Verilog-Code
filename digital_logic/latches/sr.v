//SR Latch (Asynchronous)
/*
AUTHOR: Gabe Garves
DATE: 11/15/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code
module sr(q, q0, s, r);
	output q, q0;		//Technically 1 output. 

	input r, s;			//2 inputs: set and reset
						//q represents output is high and	
						//q0 represents output is low.
	
	//gate var_name(output1, input1, input2);
	
	nor n1(q0, s, q);	//The logic
	nor n2(q, r, q0);	

endmodule

