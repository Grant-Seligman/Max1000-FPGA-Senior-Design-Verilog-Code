//keypad to 7 seg display
//Gabe Garves
//hex[7] = A
//always #1 clock = ~clock;

/*
	Pinout on 4x4 keypad and which wire they are expected to be mapped to.
	  R1 - row[0]
	  R2 - row[1]
	  R3 - row[2]
	  R4 - row[3]
	  C1 - column[0]
	  C2 - column[1]
	  C3 - column[2]
	  C4 - column[3]
*/

module keypad_decoder(key, row, column, clk);
	input wire clk;
	input wire [3:0] column;
	output reg [3:0] row, key;

	initial #0 row = 4'b0111;

	always @ (posedge clk) begin
		case (row)
			4'b0111: 
				if 		(!column[0]) key = 4'b0001; //1	
				else if (!column[1]) key = 4'b0010; //2
				else if (!column[2]) key = 4'b0011; //3
				else if (!column[3]) key = 4'b1010; //A 
				else row = 4'b1011;
			4'b1011: 
				if      (!column[0]) key = 4'b0100; //4
				else if (!column[1]) key = 4'b0101; //5
				else if (!column[2]) key = 4'b0110; //6
				else if (!column[3]) key = 4'b1011; //B
				else row = 4'b1101;
			4'b1101: 
				if 		(!column[0]) key = 4'b0111;//7 -- changed 011 to 0111
				else if (!column[1]) key = 4'b1000; //8
				else if (!column[2]) key = 4'b1001; //9
				else if (!column[3]) key = 4'b1100; //C
				else row = 4'b1110;
			4'b1110: 
				if 		(!column[0]) key = 4'b1110; // star * or E
				else if (!column[1]) key = 4'b0000; // 0
				else if (!column[2]) key = 4'b1111; // pound # or F
				else if (!column[3]) key = 4'b1101; // D
				else row = 4'b0111;
		endcase
	end
endmodule