// Select two tone module
/*
AUTHOR: JAMES STARKS
DATE: 4/17/2020
FROM: TXST SENIOR DESIGN FALL 2019-SPRING2020
FOR: TEXAS STATE UNIVERSITY STUDENT AND INSTRUCTOR USE
DESCRIPTION: This module decodes a 4 bit input and selects the appropriate row and column. This
             is to be used for DTMF selection. 

    Below is a table of which this decoder is based on.
       c0 c1 c2 c3
      +-----------+
    r0|1 |2 |3 |A |
      +-----------+
    r1|4 |5 |6 |B |
      +-----------+
    r2|7 |8 |9 |C |
      +-----------+
    r3|E |0 |F |D |
      +-----------+

    Ex, A is passed in through select,
        out_row is set ot r0
        out_column is set to c3.
*/
module select(out_row, out_column, select, en, row_0, row_1, row_2, row_3, column_0, column_1, column_2, column_3);
    output reg out_row;
    output reg out_column;

    wire [3:0] rows;
    input wire row_0;
    input wire row_1;
    input wire row_2;
    input wire row_3;

    wire [3:0] columns;
    input wire column_0;
    input wire column_1;
    input wire column_2;
    input wire column_3;
    
    input wire [3:0] select;
    input wire en;

    // Group input rows&columns together to improve code readability.
    assign rows = {row_3, row_2, row_1, row_0};
    assign columns = {column_3, column_2, column_1, column_0};
    
    // This module is enable sensitive - the tone will stop if enable goes low.
    always@(en) begin
        case(en)
            1'b0: begin
                out_row = 0;
                out_column = 0;
            end
            1'b1: begin
                case(select)
                    4'h0: begin
                        out_row = rows[3];
                        out_column = columns[1];
                    end
                    4'h1: begin
                        out_row = rows[0];
                        out_column = columns[0];
                    end
                    4'h2: begin
                        out_row = rows[0];
                        out_column = columns[1];
                    end
                    4'h3: begin
                        out_row = rows[0];
                        out_column = columns[2];
                    end
                    4'h4: begin
                        out_row = rows[1];
                        out_column = columns[0];
                    end
                    4'h5: begin
                        out_row = rows[1];
                        out_column = columns[1];
                    end
                    4'h6: begin
                        out_row = rows[1];
                        out_column = columns[2];
                    end
                    4'h7: begin
                        out_row = rows[2];
                        out_column = columns[0];
                    end
                    4'h8: begin
                        out_row = rows[2];
                        out_column = columns[1];
                    end
                    4'h9: begin
                        out_row = rows[2];
                        out_column = columns[2];
                    end
                    4'hA: begin
                        out_row = rows[0];
                        out_column = columns[3];
                    end
                    4'hB: begin
                        out_row = rows[1];
                        out_column = columns[3];
                    end
                    4'hC: begin
                        out_row = rows[2];
                        out_column = columns[3];
                    end
                    4'hD: begin
                        out_row = rows[3];
                        out_column = columns[3];
                    end
                    4'hE: begin
                        out_row = rows[3];
                        out_column = columns[0];
                    end
                    4'hF: begin
                        out_row = rows[3];
                        out_column = columns[2];
                    end
                endcase
            end
        endcase
    end
endmodule
