module direction(motor_driver_inputs, select_direction);
    output reg [1:0] motor_driver_inputs;
    input wire select_direction;

    always@(select_direction) begin
        case(select_direction)
            1'b0:    motor_driver_inputs = 2'b10;
            1'b1:    motor_driver_inputs = 2'b01;
            default: motor_driver_inputs = 2'b10;
        endcase
    end
endmodule
