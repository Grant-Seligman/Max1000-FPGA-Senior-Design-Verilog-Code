/*module keypad_decoder(columns, key, rows, clk)
    output reg [3:0] columns, key;

    input wire [3:0] rows;
    input wire clk;

    reg [3:0] state;

always@(posedge clk) begin
    case(state)
end

endmodule

function check_column;
    input [3:0] column; begin
        
    end
endfunction
*/
module keypad_decoder(out, key, in);
    output reg out;
    output reg [3:0] key;

    input wire [3:0] in;

    parameter one = 1000;
    parameter two = 0100;
    parameter three = 0010;
    parameter a = 0001;

    always@(in) begin
        case(in)
            one: key = 0001;
            two: key = 0010;
            three: key = 0011;
            a: key = 1010;
        endcase
    end


endmodule