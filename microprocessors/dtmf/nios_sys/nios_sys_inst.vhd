	component nios_sys is
		port (
			clk_clk           : in  std_logic                    := 'X';             -- clk
			reset_reset_n     : in  std_logic                    := 'X';             -- reset_n
			pio_keypad_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			pio_dtmf_export   : out std_logic_vector(3 downto 0)                     -- export
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk           => CONNECTED_TO_clk_clk,           --        clk.clk
			reset_reset_n     => CONNECTED_TO_reset_reset_n,     --      reset.reset_n
			pio_keypad_export => CONNECTED_TO_pio_keypad_export, -- pio_keypad.export
			pio_dtmf_export   => CONNECTED_TO_pio_dtmf_export    --   pio_dtmf.export
		);

