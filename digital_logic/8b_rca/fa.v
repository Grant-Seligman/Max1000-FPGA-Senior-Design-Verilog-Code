//Full Adder in Verilog
/*
AUTHOR: Gabe Garves
DATE: 11/8/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code

module fa(sum, cout, a, b, cin);
	output sum, cout;	//2 outputs

	input a, b, cin;	//3 inputs
	
	wire w1, w2, w3;	//connecting wires
	
	//module var_name(output1, output2, input1, input2);
	
	ha ha1(w1, w2, a, b);		//uses the HA module to add x and y
	ha ha2(sum, w3, cin, w1);	//add cin and carry from x and y
	or o1(cout, w3, w2);		//calculating carry
	
endmodule
