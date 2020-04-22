// PWM Module
/*
    AUTHOR: GRANT SELIGMAN
    DATE: 
    EDITED BY: JAMES STARKS
    DATE: 4/21/2020
    FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
    FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
    DESCRIPTION: Full motor controller.
*/
// Pulse width modulator with the ability to control the duty
// cycle. Increasing count by 1 increases the duty cycle by 
// 0.390625%.
module pwm(pwm_clk, duty_cycle, clk);
    output reg pwm_clk;

    input wire [7:0] duty_cycle;  // This should match count width or else something will truncate.
    input wire clk;
    
    reg [7:0] count;  // You can fine tune the duty cycle step by changing this. 

    always@(posedge clk) begin
        pwm_clk = (duty_cycle > count) ? 1 : 0;
    end
endmodule
