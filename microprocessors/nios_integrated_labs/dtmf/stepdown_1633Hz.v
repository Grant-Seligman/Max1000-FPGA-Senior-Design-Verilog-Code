module stepdown_1633Hz(outclk, inclk);
    output reg outclk;
    input wire inclk;

    reg [8:0] count;

    integer div = 305;

    initial begin count = 9'b0; outclk = 0; end

    always@(posedge inclk) begin
        count = count + 1;
        if (count == div) begin
            outclk = ~outclk;
            count = 0;
        end
    end
endmodule
