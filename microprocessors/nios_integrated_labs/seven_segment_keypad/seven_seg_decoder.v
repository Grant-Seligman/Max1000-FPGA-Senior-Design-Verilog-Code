
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
//      DP G F E D C B A  GND
// Pin  7  3 2 4 5 8 9 10 1&6
///////////////////////////////////////////////////////////////////////////////
// out[0]  - A   | out[7]	Output	PIN_H13
// out[1]  - B   | out[6]	Output	PIN_E3
// out[2]  - C   | out[5]	Output	PIN_F1
// out[3]  - D   | out[4]	Output	PIN_E4
// out[4]  - E   | out[3]	Output	PIN_H8
// out[5]  - F   | out[2]	Output	PIN_H10
// out[6]  - G   | out[1]	Output	PIN_J10
// out[7]  - DP  | out[0]	Output	PIN_K12
///////////////////////////////////////////////////////////////////////////////
module seven_seg_decoder(out, in);
  output reg [7:0] out;
  input wire [3:0] in;
  
// Instead of running of a clock, this aways block waits for and input
// from the keypad. Thus making this module asynchronous. 

  always @(in) begin
    case (in)
      // Layout of bits, MSB is DP, then decending G-A
      //              [DP]GFE DCBA
      4'h0 :    out = 8'b0011_1111;
      4'h1 :    out = 8'b0000_0110;
      4'h2 :    out = 8'b0101_1011;
      4'h3 :    out = 8'b0100_1111;
      4'h4 :    out = 8'b0110_0110;
      4'h5 :    out = 8'b0110_1101;
      4'h6 :    out = 8'b0111_1101;
      4'h7 :    out = 8'b0000_0111;
      4'h8 :    out = 8'b0111_1111;
      4'h9 :    out = 8'b0110_0111;
      4'hA :    out = 8'b0111_0111;
      4'hB :    out = 8'b0111_1100;
      4'hC :    out = 8'b0011_1001;
      4'hD :    out = 8'b0101_1110;
      4'hE :    out = 8'b0111_1001;
      4'hF :    out = 8'b0111_0001;
  	  default : out = 8'b1000_0000;
    endcase
  end 
endmodule
