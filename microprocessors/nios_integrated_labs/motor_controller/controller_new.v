// Motor Controller Module
/*
    AUTHOR: GABE GARVES
    DATE: 3/25/2020
    FROM: TXST SENIOR DESIGN PROJECT FALL 2019-SPRING 2020
    FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
    DESCRIPTION: Full motor controller.
*/

module controller(drive, );
    output reg [3:0] drive;
    input clk, direction;

    always @ (posedge clk) begin
        case(drive)
            4'b1110: drive = direction ? 4'b0111 : 4'b1101;
            4'b1101: drive = direction ? 4'b1110 : 4'b1011;
            4'b1011: drive = direction ? 4'b1101 : 4'b0111;
            4'b0111: drive = direction ? 4'b1011 : 4'b1110;
            default: drive = 4'b1110;
        endcase
    end
endmodule
