module variable_stepdown(out_clk, division, in_clk);
    output reg out_clk;
	 input wire [15:0] division;
    input wire in_clk;

    reg [15:0] count;

    initial begin count = 16'b0; out_clk = 0; end

    always@(posedge in_clk) begin
        count = count + 1;
        if (count == division) begin
            out_clk = ~out_clk;
            count = 0;
        end
    end
endmodule