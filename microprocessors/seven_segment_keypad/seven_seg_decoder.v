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
//       A
//     -----
//    |     |
//  F |     | B
//    |  G  |
//     -----
//    |     |
//  E |     | C
//    |  D  |
//     -----     * DP
//
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

module seven_seg_decoder(out, in);
  output reg [7:0] out;
  input wire [3:0] in;

  // Layout of bits are in order A-G, LSB is DP
  //                   ABCD_EFG[DP]
  parameter dp    = 8'b0000_0001;
  parameter zero  = 8'b1111_1100;
  parameter one   = 8'b0110_0000;
  parameter two   = 8'b1101_1010;
  parameter three = 8'b1111_0010;
  parameter four  = 8'b0110_0110;
  parameter five  = 8'b1011_0110;
  parameter six   = 8'b1011_1110;
  parameter seven = 8'b1110_0000;
  parameter eight = 8'b1111_1110;
  parameter nine  = 8'b1110_0110;
  parameter a     = 8'b1110_1110;
  parameter b     = 8'b0011_1110;
  parameter c     = 8'b1001_1100;
  parameter d     = 8'b0111_1010;
  parameter e     = 8'b1001_1110;
  parameter f     = 8'b1000_1110;
  
//instead of running of a clock, this aways block waits for and input
//from the keypad. Thus making this module asynchronous. 

  always @(in) begin
    case (in)
      4'd0  : out = zero;
      4'd1  : out = one;
      4'd2  : out = two;
      4'd3  : out = three;
      4'd4  : out = four;
      4'd5  : out = five;
      4'd6  : out = six;
      4'd7  : out = seven;
      4'd8  : out = eight;
      4'd9  : out = nine;
      4'd10 : out = a;
      4'd11 : out = b;
      4'd12 : out = c;
      4'd13 : out = d;
      4'd14 : out = e;
      4'd15 : out = f;
  	  default : out = dp;
    endcase
  end 
endmodule
