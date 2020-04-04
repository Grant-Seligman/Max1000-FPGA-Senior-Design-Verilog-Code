
module nios_sys (
	clk_clk,
	pio_keypad_export,
	pio_seven_segment_export,
	reset_reset_n);	

	input		clk_clk;
	input	[3:0]	pio_keypad_export;
	output	[3:0]	pio_seven_segment_export;
	input		reset_reset_n;
endmodule
