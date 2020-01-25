module counter_tb();

    reg clk, rst;
    wire [3:0] out;

    counter dut(out, rst, clk);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $monitor("rst:%b\tclk:%b\tout:%b\ttime:%d", rst, clk, out, $time);
        rst = 1;
        #10 rst = 0;
    end


endmodule
