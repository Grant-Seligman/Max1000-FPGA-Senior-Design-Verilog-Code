	component nios_sys is
		port (
			clk_clk                                          : in  std_logic                    := 'X';             -- clk
			reset_reset_n                                    : in  std_logic                    := 'X';             -- reset_n
			pio_sven_seg_decoder_external_connection_export  : out std_logic_vector(3 downto 0);                    -- export
			pio_keypad_decoder_in_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk                                          => CONNECTED_TO_clk_clk,                                          --                                       clk.clk
			reset_reset_n                                    => CONNECTED_TO_reset_reset_n,                                    --                                     reset.reset_n
			pio_sven_seg_decoder_external_connection_export  => CONNECTED_TO_pio_sven_seg_decoder_external_connection_export,  --  pio_sven_seg_decoder_external_connection.export
			pio_keypad_decoder_in_external_connection_export => CONNECTED_TO_pio_keypad_decoder_in_external_connection_export  -- pio_keypad_decoder_in_external_connection.export
		);

