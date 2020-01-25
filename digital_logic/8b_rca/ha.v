//Half Adder in Verilog
/*
AUTHOR: Gabe Garves
DATE: 11/8/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code

module ha(sum, cout, a, b);
	output sum, cout;	//2 outputs

	input a, b;		//2 inputs
	
	//gate var_name(output, input1, input2);
	
	xor xor1(sum, a, b);	//Logic for half adder
	and and1(cout, a, b);	

endmodule
