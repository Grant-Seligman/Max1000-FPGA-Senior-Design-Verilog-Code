module dff_tb;

reg d, clk;
wire q, q0;
wire [1:0] out;

_dff dut(q, q0, d, clk);

initial
begin
$monitor ("clk=%b d=%b q=%b q0=%b", clk, , q, q0);
   d = 0; clk = 0;
#1 d = 0; clk = 1;
#1 d = 1; clk = 0;
#1 d = 1; clk = 1;
#1 d = 0; clk = 0;
#1 d = 0; clk = 1;
end

endmodule
