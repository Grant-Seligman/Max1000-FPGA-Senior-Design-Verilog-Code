///////////////////////////////////////////////////////////////////////////////
// File downloaded from http://www.nandland.com
///////////////////////////////////////////////////////////////////////////////
// This file converts an input binary number into an output which can get sent
// to a 7-Segment LED.  7-Segment LEDs have the ability to display all decimal
// numbers 0-9 as well as hex digits A, B, C, D, E and F.  The input to this
// module is a 4-bit binary number.  This module will properly drive the
// individual segments of a 7-Segment LED in order to display the digit.
// Hex encoding table can be viewed at:
// http://en.wikipedia.org/wiki/Seven-segment_display
///////////////////////////////////////////////////////////////////////////////
// Modified by James Starks
// Converted module to be asynchronous, and use a data bus for the output.
///////////////////////////////////////////////////////////////////////////////

module decoder7(out, in);
  output reg [7:0] out;
  input wire [3:0] in;

  reg [6:0] hex = 7'h00;

  always @(in) begin
    case (in)
      4'b0000 : out <= 8'h7E;
      4'b0001 : out <= 8'h30;
      4'b0010 : out <= 8'h6D;
      4'b0011 : out <= 8'h79;
      4'b0100 : out <= 8'h33;          
      4'b0101 : out <= 8'h5B;
      4'b0110 : out <= 8'h5F;
      4'b0111 : out <= 8'h70;
      4'b1000 : out <= 8'h7F;
      4'b1001 : out <= 8'h7B;
      4'b1010 : out <= 8'h77;
      4'b1011 : out <= 8'h1F;
      4'b1100 : out <= 8'h4E;
      4'b1101 : out <= 8'h3D;
      4'b1110 : out <= 8'h4F;
      4'b1111 : out <= 8'h47;
      endcase
  end 
 
endmodule