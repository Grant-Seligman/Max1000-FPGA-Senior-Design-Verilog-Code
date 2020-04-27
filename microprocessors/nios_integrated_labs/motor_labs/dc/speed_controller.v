module speed_controller(motor_driver_en, set_speed, clk);
    // PWM Signal for the motor driver enable pin
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