//Keypad Decoder Module
/*

*/

/*
AUTHOR: GABE GARVES
EDITED BY: GRANT SELIGMAN
DATE: 2/25/2020
EDITED: 4/13/2020
FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
DESCRIPTION:  
	Expected Pinout on 4x4 keypad and which wire they are expected to be mapped to.
	  column_in[3]	Input	PIN_K10
	  column_in[2]	Input	PIN_H5
	  column_in[1]	Input	PIN_J1
	  column_in[0]	Input	PIN_J2
	  ------------------------
	  row_out[3]	Output	PIN_K11
	  row_out[2]	Output	PIN_J13
	  row_out[1]	Output	PIN_J12
	  row_out[0]	Output	PIN_L12

*/

module keypad_decoder(key, row, column, clk);
	output reg [3:0] key;
	output reg [3:0] row;

	input wire clk;
	input wire [3:0] column;

	always @ (posedge clk) begin
		case (row)
			4'b1110:
				case (column)
					4'b1110 : key = 4'b0001;
					4'b1101 : key = 4'b0010;
					4'b1011 : key = 4'b0011;
					4'b0111 : key = 4'b1010;
					default : row = 4'b1101;
				endcase
			4'b1101:
				case (column)
					4'b1110 : key = 4'b0100;
					4'b1101 : key = 4'b0101;
					4'b1011 : key = 4'b0110;
					4'b0111 : key = 4'b1011;
					default : row = 4'b1011;
				endcase	
			4'b1011:
				case (column)
					4'b1110 : key = 4'b0111;
					4'b1101 : key = 4'b1000;
					4'b1011 : key = 4'b1001;
					4'b0111 : key = 4'b1100;
					default : row = 4'b0111;
				endcase
			4'b0111:
				case (column)
					4'b1110 : key = 4'B1110;
					4'b1101 : key = 4'b0000;
					4'b1011 : key = 4'b1111;
					4'b0111 : key = 4'b1101;
					default : row = 4'b1110;
				endcase
			default: row = 4'b1110;
		endcase
	end
endmodule