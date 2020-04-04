module adder_tb;

    reg  [2:0] a, b;
    wire [2:0] s;
    wire cout;

    adder dut1(s, cout, a, b);

    initial begin
        repeat(10) begin
            a=$random;	b=$random;
            $monitor("%b + %b = %b_%b", a , b, cout, s);
            #100;
        end
    end

endmodule
