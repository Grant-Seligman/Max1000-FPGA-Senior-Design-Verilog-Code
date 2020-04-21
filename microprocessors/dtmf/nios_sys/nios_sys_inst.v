	nios_sys u0 (
		.clk_clk                (<connected-to-clk_clk>),                //             clk.clk
		.pio_dtmf_select_export (<connected-to-pio_dtmf_select_export>), // pio_dtmf_select.export
		.pio_keypad_export      (<connected-to-pio_keypad_export>),      //      pio_keypad.export
		.reset_reset_n          (<connected-to-reset_reset_n>),          //           reset.reset_n
		.pio_dtmf_enable_export (<connected-to-pio_dtmf_enable_export>)  // pio_dtmf_enable.export
	);

