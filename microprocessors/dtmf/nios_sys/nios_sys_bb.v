
module nios_sys (
	clk_clk,
	reset_reset_n,
	pio_keypad_export,
	pio_dtmf_export);	

	input		clk_clk;
	input		reset_reset_n;
	input	[3:0]	pio_keypad_export;
	output	[3:0]	pio_dtmf_export;
endmodule
