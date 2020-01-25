module sr_tb;

reg r, s;
wire q, q0;
wire [1:0] out;

sr dut(q, q0, r, s);

initial
begin
$monitor ("s=%b r=%b q=%b q0=%b", s, r, q, q0);
   s = 1;    r = 0;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 0;    r = 0;
#1 s = 0;    r = 1;
#1 s = 1;    r = 0;
#1 s = 1;    r = 0;
end

endmodule
