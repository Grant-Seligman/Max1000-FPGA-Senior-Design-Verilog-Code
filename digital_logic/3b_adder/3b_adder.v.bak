//3-bit Adder in Verilog
/*
AUTHOR: GABE GARVES
DATE: 10/30/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERITY STUDENT AND INSTURCTOR USE
*/
//Structural Code

module adder(s, cout, a, b);   //Port list 
	input [2:0] a , b;	    //array of length 3 for inputs
	output wire[2:0] s;		//array of length 3 for sum
	output wire cout;		//Final carry                      
	
	wire w[5:0];		//declaring 6 wire connections
	wire c[1:0];		//delcaring intermediate carries

    //gate var_name(output, inputs);
	
	xor xor2_1(s[0], a[0], b[0]);  //First adder module
	and and2_1(c[0], a[0], b[0]);  //Half Adder
	
	xor xor2_1(w[0], a[1], b[1]);  //Second adder module
	xor xor2_2(s[1], c[0], w[0]);  //Full Adder 
	and and2_2(w[1], a[1], b[1]);
	and and2_1(w[2], c[0], w[0]);
	or  or2_1 (c[1], w[1], w[2]);
	
	xor xor2_4(w[3], a[2], b[2]); //Third adder module
	xor xor2_5(s[2], c[1], w[3]); //Full Adder
	and and2_4(w[4], a[2], b[2]);
	and and2_5(w[5], c[1], w[3]);
	or  or2_2 (cout, w[4], w[5]);
	
endmodule
