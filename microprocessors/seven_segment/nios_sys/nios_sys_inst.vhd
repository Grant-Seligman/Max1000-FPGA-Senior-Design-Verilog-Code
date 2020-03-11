	component nios_sys is
		port (
			clk_clk                 : in  std_logic                    := 'X'; -- clk
			pio_byte_display_export : out std_logic_vector(7 downto 0);        -- export
			reset_reset_n           : in  std_logic                    := 'X'  -- reset_n
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk                 => CONNECTED_TO_clk_clk,                 --              clk.clk
			pio_byte_display_export => CONNECTED_TO_pio_byte_display_export, -- pio_byte_display.export
			reset_reset_n           => CONNECTED_TO_reset_reset_n            --            reset.reset_n
		);

