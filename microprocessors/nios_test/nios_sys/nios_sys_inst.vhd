	component nios_sys is
		port (
			byte_pio_export : out std_logic_vector(3 downto 0);        -- export
			clk_clk         : in  std_logic                    := 'X'; -- clk
			reset_reset_n   : in  std_logic                    := 'X'  -- reset_n
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			byte_pio_export => CONNECTED_TO_byte_pio_export, -- byte_pio.export
			clk_clk         => CONNECTED_TO_clk_clk,         --      clk.clk
			reset_reset_n   => CONNECTED_TO_reset_reset_n    --    reset.reset_n
		);

