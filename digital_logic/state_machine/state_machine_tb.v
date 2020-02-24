module state_machine_tb();

    reg dir, rst, clk;
    wire [2:0] out;

    state_machine dut(out, dir, rst, clk);

    initial begin
        clk = 0;
        forever #2 clk = ~clk;
    end

    initial begin
        $monitor("rst:%b\tclk:%b\tdir:%b\tout:%b\ttime:%d", rst, clk, dir, out, $time);
        rst = 1; dir = 0;
        #10 rst = 0;
        #16 dir = 1;
        #10 dir = 0;
        #4 dir = 1;
    end

endmodule