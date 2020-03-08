
module keypad_decoder(out, in, clk)
    output reg [3:0] byte;
    input wire [7:0] index;
    input wire clk;

    assign r = [3:0] index;
    assign c = [7:4] index;

    parameter r_1 = 4'b1000;
    parameter r_2 = 4'b0100;
    parameter r_3 = 4'b0010;
    parameter r_4 = 4'b0001;

    parameter c_1 = 4'b1000;
    parameter c_2 = 4'b0100;
    parameter c_3 = 4'b0010;
    parameter c_4 = 4'b0001;

    initial begin
        state = 4'b0;
    end

    always@(posedge clk)begin
        case(r)
            r_1: 
            r_2:
            r_3:
            r_4:
        endcase

    end

endmodule

function check_column;
    case(r)

    endcase
endfunction
