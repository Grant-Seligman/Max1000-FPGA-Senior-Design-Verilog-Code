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
// 7-Segment Common Cathode Part # HDSP-F103 Pin layout
// A - pin 10
// B - pin 9
// C - pin 8
// DP - pin 7
// GND - pin 6
// D - pin 5
// E - pin 4
// G - pin 3
// F - pin 2
// GND - pin 1
///////////////////////////////////////////////////////////////////////////////

module decoder7(out, in);
  output reg [7:0] out;
  input wire [3:0] in;

  reg [6:0] hex = 7'h00;
	
  // Layout of bits are in order A-G
  parameter dp = 8'b0001_0000;
  parameter zero = 8'b1110_1110;
  parameter one = 8'0110_0000b;
  parameter two = 8'b1100_1101;
  parameter three = 8'b1110_1001;
  parameter four = 8'b0110_0011;
  parameter five = 8'b1010_1011;
  parameter six = 8'b1010_1111;
  parameter seven = 8'b1000_0110;
  parameter eight = 8'b1110_1111;
  parameter nine = 8'b1110_0011;
  parameter a = 8'b1110_0111;
  parameter b = 8'b0010_1111;
  parameter c = 8'b1000_1110;
  parameter d = 8'b0110_1100;
  parameter e = 8'b1000_1111;
  parameter f = 8'b1000_0111;

  always @(in) begin
    case (in)
      4'b0000 : out <= zero;
      4'b0001 : out <= one;
      4'b0010 : out <= two;
      4'b0011 : out <= three;
      4'b0100 : out <= four;
      4'b0101 : out <= five;
      4'b0110 : out <= six;
      4'b0111 : out <= seven;
      4'b1000 : out <= eight;
      4'b1001 : out <= nine;
      4'b1010 : out <= a;
      4'b1011 : out <= b;
      4'b1100 : out <= c;
      4'b1101 : out <= d;
      4'b1110 : out <= e;
      4'b1111 : out <= f;
      endcase
  end 
 
endmodule