// State Machine
/*
AUTHOR: James Starks
DATE: 11/15/2019
FROM: TXST SENIOR DESIGN PROJECT FALL 2019
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
*/
// RTL Code

module state_machine_rtl(out, dir, rst, clk);

    // Store out value using 3 bits
    // This is where
    output reg [2:0] out;

    // State machine control signals
    input dir, rst, clk;

    // Assigned output states to have manageable names
    parameter s0 = 3'b000;
    parameter s1 = 3'b100;
    parameter s2 = 3'b110;
    parameter s3 = 3'b111;
    parameter s4 = 3'b101;
    parameter s5 = 3'b001;
    parameter s6 = 3'b011;
    parameter s7 = 3'b010;

    // Enter at every positive edge of clk
    always@(posedge clk) begin

        // If rst is low, return to state s0
        if (!rst)
            out = s0;
        
        // Check current state and if dir = 0 increment state, if dir = 1 decrement state
        case(out)

                s0: if(!dir) out = s1;
                    else     out = s7;  

                s1: if(!dir) out = s2;
                    else     out = s0;

                s2: if(!dir) out = s3;
                    else     out = s1;

                s3: if(!dir) out = s4;
                    else     out = s2;

                s4: if(!dir) out = s5;
                    else     out = s3;

                s5: if(!dir) out = s6;
                    else     out = s4;

                s6: if(!dir) out = s7;
                    else     out = s5;

                s7: if(!dir) out = s0;
                    else     out = s6;

        endcase


    end

endmodule
