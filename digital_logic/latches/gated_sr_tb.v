//Gated SR latch TB
module gated_sr_tb;

reg r, s, e;
wire q, q0;
wire [1:0] out;

gated_sr dut(q, q0, r, s, e);

initial
begin
$monitor ("s=%b r=%b e=%b q=%b q0=%b", s, r, e, q, q0);
   s = 1;    r = 0;	e = 1;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 1;    r = 0;
#1 s = 1;    r = 0;	e = 0;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 1;    r = 0;
end

endmodule
