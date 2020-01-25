//8-Bit Ripple Carry in Verilog
/*
AUTHOR: Gabe Garves
DATE: 11/8/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
//Structural Code

module rca8(sum, cout, a, b, cin);
	output [7:0] sum;	//8-Bit output
	output cout;		//carry out

	input [7:0] a, b;	//2 8-Bit inputs
	input cin;			//carry in

	wire w[6:0];			//connecting wires

	//module var_name(output1, output2, input1, input2, input3);
	
	fa fa0(sum[0], w[0], a[0], b[0],  cin);		//Calling on the FA
	fa fa1(sum[1], w[1], a[1], b[1], w[0]);		//module 8 times for
	fa fa2(sum[2], w[2], a[2], b[2], w[1]);		//each of the inputs
	fa fa3(sum[3], w[3], a[3], b[3], w[2]);	
	fa fa4(sum[4], w[4], a[4], b[4], w[3]);	
	fa fa5(sum[5], w[5], a[5], b[5], w[4]);
	fa fa6(sum[6], w[6], a[6], b[6], w[5]);
	fa fa7(sum[7], cout, a[7], b[7], w[6]); 

endmodule
