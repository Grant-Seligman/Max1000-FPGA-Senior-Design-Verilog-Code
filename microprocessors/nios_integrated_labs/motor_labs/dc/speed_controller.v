// Variable speed controller for DC motor.
/*
AUTHOR: GRANT SELIGMAN
DATE: 4/3/2020
EDITED BY: JAMES STARKS
DATE: 3/3/2020
FROM: TXST SENIOR DESIGN FALL 2019-SPRING 2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTIOR USE
DESCRIPTION: This module generates a PWM signal based on the 
			 input set_speed value. This is an 8bit value
			 with 256 possible values. To calculate the duty
			 of the PWM generated, divide set_speed/256.
*/
module speed_controller(motor_driver_en, set_speed, clk);
    // PWM signal for the motor driver enable pin
    output reg motor_driver_en;
    // Speed value provided by NIOS in the software layer
    input wire [7:0] set_speed;
    // Base input clock value to modifity
    input wire clk;

    reg [7:0] counter;

    initial begin
        counter = 8'b0;
        motor_driver_en = 1'b0;
    end 

    always@(posedge clk) begin
        // Check to see if counter is higher than set_speed
        motor_driver_en = (counter > set_speed) ? 0 : 1;
        counter = counter + 1;
    end
endmodule

