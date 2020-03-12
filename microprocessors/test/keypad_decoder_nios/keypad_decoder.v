module keypad_decoder (rows, key, columns, clk, rst);
    output reg [3:0] rows;
    output reg [3:0] key;

    input wire [3:0] columns;
    input wire clk, rst;

    reg [1:0] state;
    reg [3:0] key_data [3:0][3:0];

    initial begin
		state = 4'b0;
        key_data[0][0] = 4'h1;
        key_data[0][1] = 4'h2;
        key_data[0][2] = 4'h3;
        key_data[0][3] = 4'hA;
        key_data[1][0] = 4'h4;
        key_data[1][1] = 4'h5;
        key_data[1][2] = 4'h6;
        key_data[1][3] = 4'hB;
        key_data[2][0] = 4'h7;
        key_data[2][1] = 4'h8;
        key_data[2][2] = 4'h9;
        key_data[2][3] = 4'hC;
        key_data[3][0] = 4'hE;
        key_data[3][1] = 4'h0;
        key_data[3][2] = 4'hF;
        key_data[3][3] = 4'hD;
    end

    integer i, j;

    parameter one   = 4'b0001;
    parameter two   = 4'b0010;
    parameter three = 4'b0100;
    parameter four  = 4'b1000;

    always @(posedge clk) begin
		key = (j <= 0) ? key_data[i][j] : 4'b0000;
		state = state + 1;
		
		case(state)
			2'b00: begin
				rows = one;
				i = 0;
			end
			2'b01: begin
				rows = two;
				i = 1;
			end
			2'b10: begin
				rows = three;
				i = 2;
			end
			2'b11: begin
				rows = four;
				i = 3;
			end
		endcase

		case(columns)
			one:	 j = 0;
			two: 	 j = 1;
			three:	 j = 2;
			four: 	 j = 3;
			default: j = -1;
		endcase
	
	end

endmodule
