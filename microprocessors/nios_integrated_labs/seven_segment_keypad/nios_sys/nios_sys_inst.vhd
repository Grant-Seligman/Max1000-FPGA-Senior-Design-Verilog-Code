	component nios_sys is
		port (
			clk_clk                  : in  std_logic                    := 'X';             -- clk
			pio_keypad_export        : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			pio_seven_segment_export : out std_logic_vector(3 downto 0);                    -- export
			reset_reset_n            : in  std_logic                    := 'X'              -- reset_n
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk                  => CONNECTED_TO_clk_clk,                  --               clk.clk
			pio_keypad_export        => CONNECTED_TO_pio_keypad_export,        --        pio_keypad.export
			pio_seven_segment_export => CONNECTED_TO_pio_seven_segment_export, -- pio_seven_segment.export
			reset_reset_n            => CONNECTED_TO_reset_reset_n             --             reset.reset_n
		);

