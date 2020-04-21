
module nios_sys (
	clk_clk,
	pio_dtmf_select_export,
	pio_keypad_export,
	reset_reset_n,
	pio_dtmf_enable_export);	

	input		clk_clk;
	output	[3:0]	pio_dtmf_select_export;
	input	[3:0]	pio_keypad_export;
	input		reset_reset_n;
	output		pio_dtmf_enable_export;
endmodule
