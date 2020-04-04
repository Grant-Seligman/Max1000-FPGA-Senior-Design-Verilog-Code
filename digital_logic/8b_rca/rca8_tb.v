module rca8_tb;
    wire [7:0] sum;
    wire cout;
    wire [1:0] out;

    reg [7:0] a, b;
    reg cin;

    rca8 rca(sum, cout, a, b, cin);

    initial begin
        repeat (10) begin
            a = $random; b = $random; cin = 0;
            $monitor("%b_%b + %b_%b = %b_%b_%b", a[7:4], a[3:0], b[7:4], b[3:0], cout, sum[7:4], sum[3:0]);
            #100;
        end
    end

endmodule
