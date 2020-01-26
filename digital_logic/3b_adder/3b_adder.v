//3-bit Adder in Verilog
/*
AUTHOR: GABE GARVES
DATE: 10/30/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERITY STUDENT AND INSTURCTOR USE
*/
//Structural Code

module adder(sum, cout, a, b);   //Port list 
	output wire[2:0] sum;		//array of length 3 for sum
	output wire cout;		//Final carry  
	
	input [2:0] a, b;	    //array of length 3 for inputs               
	
	wire w[5:0];		//declaring 6 wire connections
	wire c[1:0];		//delcaring intermediate carries

    //gate var_name(output, inputs);
	
	xor xor_1(sum[0], a[0], b[0]);  //First adder module
	and and_1(c[0], a[0], b[0]);  //Half Adder
	
	xor xor_2(w[0], a[1], b[1]);  //Second adder module
	xor xor_3(sum[1], c[0], w[0]);  //Full Adder 
	and and_2(w[1], a[1], b[1]);
	and and_3(w[2], c[0], w[0]);
	or  or_1 (c[1], w[1], w[2]);
	
	xor xor_4(w[3], a[2], b[2]); //Third adder module
	xor xor_5(sum[2], c[1], w[3]); //Full Adder
	and and_4(w[4], a[2], b[2]);
	and and_5(w[5], c[1], w[3]);
	or  or_2 (cout, w[4], w[5]);
	
endmodule
