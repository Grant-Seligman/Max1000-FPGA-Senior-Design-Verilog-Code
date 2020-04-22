//Full Motor Driver Module
//Author: Grant Seligman

module Motor_Driver(PWM_Out,dir_pin_1,dir_pin_2,button1,button2,nios_cnt_num,clk);

	input wire clk,button1,button2;
	//Student inputs desired frequency in NIOS C code
	//Code converts it to the number the converter module
	//counts to.
	input wire [23:0] nios_cnt_num; 

	output reg PWM_Out; //goes to enable pin of driver
	output reg dir_pin_1;
	output reg dir_pin_2;

	reg [7:0] pwm_counter = 0;
	reg [23:0] clk_counter;
	reg internal_clk;
	reg [1:0]b1_counter;

	initial 
	begin
		clk_counter = 0;
		internal_clk = 0;
		b1_counter = 0;
		
	end
	//Clock Converter
	always@(posedge clk) begin
		if (clk_counter == 0) begin
			clk_counter = 47999; // drops 12Mhz input clk to 250Hz -- (47999 aka nios sample)
			// clk_counter = NIOS_input. Have NIOS do the divider math
			internal_clk = ~internal_clk;
		end else begin
			clk_counter = clk_counter -1;
		end
		
		//When buttons are pressed the state changes
		if(button1) begin
			b1_counter = b1_counter + 1;
		end

		//Changing the direction of motor
		if(button2) begin
			dir_pin_1 = 1;
			dir_pin_2 = 0;
		end else begin
			dir_pin_1 = 0;
			dir_pin_2 = 1;
		end
	end
	// Uses new clock as input
	always@(posedge internal_clk) begin
		//PWM Comparator 
		if(pwm_counter < 101) begin
			pwm_counter <= pwm_counter + 1;
		end else begin
			pwm_counter <= 0;
		end

		case(b1_counter)
			// create 25% duty cycle
			2'b00: begin
				PWM_Out = (pwm_counter < 25) ? 1:0;
			end
			// create 50% duty cycle
			2'b01: begin
				PWM_Out = (pwm_counter < 50) ? 1:0;
			end
			// create 75% duty cycle
			2'b10: begin
				PWM_Out = (pwm_counter < 75) ? 1:0;
			end
			//create 100% duty cycle
			2'b11: begin
				PWM_Out = (pwm_counter < 100) ? 1:0;
			end
		endcase
		
	end

endmodule