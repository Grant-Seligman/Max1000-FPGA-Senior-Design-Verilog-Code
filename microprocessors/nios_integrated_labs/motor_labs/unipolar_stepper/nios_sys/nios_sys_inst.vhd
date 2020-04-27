	component nios_sys is
		port (
			clk_clk              : in  std_logic                     := 'X'; -- clk
			reset_reset_n        : in  std_logic                     := 'X'; -- reset_n
			pio_division_export  : out std_logic_vector(15 downto 0);        -- export
			pio_direction_export : out std_logic                             -- export
		);
	end component nios_sys;

	u0 : component nios_sys
		port map (
			clk_clk              => CONNECTED_TO_clk_clk,              --           clk.clk
			reset_reset_n        => CONNECTED_TO_reset_reset_n,        --         reset.reset_n
			pio_division_export  => CONNECTED_TO_pio_division_export,  --  pio_division.export
			pio_direction_export => CONNECTED_TO_pio_direction_export  -- pio_direction.export
		);

