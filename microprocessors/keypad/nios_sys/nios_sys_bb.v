
module nios_sys (
	clk_clk,
	reset_reset_n,
	pio_sven_seg_decoder_external_connection_export,
	pio_keypad_decoder_in_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[3:0]	pio_sven_seg_decoder_external_connection_export;
	input	[3:0]	pio_keypad_decoder_in_external_connection_export;
endmodule
