// 4-Bit Counter
/*
AUTHOR: James Starks
DATE: 11/15/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
// RTL Code

module counter_rtl(state, rst, clk);

    // Store state value using 4 bits and 
    output reg [3:0] state;

    // Counter control signals
    input rst, clk;

    // Map states to easy to read paramater names
    parameter s0 = 4'b0011;
    parameter s1 = 4'b0110;
    parameter s2 = 4'b1100;
    parameter s3 = 4'b1001;

    // Enter at every positive edge of clk
    always@(posedge clk)

        // If rst is low, return state to s0
        if (!rst)
            state = s0;

        // Increment to next state
        else
            case(state)
                // If state is at s0 change state to s1 (if (4'b0011) state = 4'b0110)
                s0: state = s1;
                s1: state = s2;
                s2: state = s3;
                s3: state = s0;
            endcase

endmodule

