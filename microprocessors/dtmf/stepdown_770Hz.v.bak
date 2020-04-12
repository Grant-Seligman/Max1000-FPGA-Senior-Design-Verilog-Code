module stepdown_770Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [4:0] count;

    initial begin count = 5'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == 26) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
