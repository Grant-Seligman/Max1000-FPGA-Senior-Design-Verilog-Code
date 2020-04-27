
module nios_sys (
	clk_clk,
	reset_reset_n,
	pio_speed_export,
	pio_direction_export);	

	input		clk_clk;
	input		reset_reset_n;
	output	[7:0]	pio_speed_export;
	output		pio_direction_export;
endmodule
