module stepdown_697Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [9:0] count;

    initial begin count = 10'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == 717) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
