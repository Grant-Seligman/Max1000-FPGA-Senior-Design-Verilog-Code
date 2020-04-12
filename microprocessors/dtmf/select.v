module select(out_row, out_column, select, row_0, row_1, row_2, row_3, column_0, column_1, column_2, column_3);
    output reg out_row;
    output reg out_column;
    
    input wire [3:0] select;

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
    
    assign rows = {row_3, row_2, row_1, row_0};
    assign columns = {column_3, column_2, column_1, column_0};

    always@(select) begin
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
endmodule
