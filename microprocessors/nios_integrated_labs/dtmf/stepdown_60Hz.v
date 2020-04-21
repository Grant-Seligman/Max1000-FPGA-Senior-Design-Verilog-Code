module stepdown_60Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [13:0] count;
	 
	integer div = 8333;

    initial begin count = 9'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == div) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
