//50 Hz clock

module stepdown_clk(clkout, clkin);

output reg clkout;
input clkin;
reg [23:0] counter; //need at least 24 bits 

initial 
begin
    counter = 0;
    clkout = 0;
end

always @(posedge clkin) 
begin
    if (counter == 0) 
		begin
        counter <= 18000000; // 12E6 / 50 = 240,000
        clkout <= ~clkout;
		end 
	 else 
		begin
        counter <= counter -1;
		end
end		
endmodule