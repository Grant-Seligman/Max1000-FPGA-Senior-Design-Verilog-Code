	component nios_sys is
		port (
			clk_clk                : in  std_logic                    := 'X';             -- clk
			pio_dtmf_select_export : out std_logic_vector(3 downto 0);                    -- export
			pio_keypad_export      : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			reset_reset_n          : in  std_logic                    := 'X';             -- reset_n
			pio_dtmf_enable_export : out std_logic                                        -- export
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk                => CONNECTED_TO_clk_clk,                --             clk.clk
			pio_dtmf_select_export => CONNECTED_TO_pio_dtmf_select_export, -- pio_dtmf_select.export
			pio_keypad_export      => CONNECTED_TO_pio_keypad_export,      --      pio_keypad.export
			reset_reset_n          => CONNECTED_TO_reset_reset_n,          --           reset.reset_n
			pio_dtmf_enable_export => CONNECTED_TO_pio_dtmf_enable_export  -- pio_dtmf_enable.export
		);

