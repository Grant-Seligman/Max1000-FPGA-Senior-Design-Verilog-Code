module stepdown_941Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [9:0] count;

    integer div = 530;

    initial begin count = 10'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == div) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
