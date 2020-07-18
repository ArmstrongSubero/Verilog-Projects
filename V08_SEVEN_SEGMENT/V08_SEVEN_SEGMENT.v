/*
 * File:   V08_SEVEN_SEGMENT.v
 * Author: Armstrong Subero
 * Processor: EP4CE10F17C8 @ 50MHz, 3.3v
 * Program: HDL file for application
 * Compiler: Quartus II 64-bit 13.0 SP1
 * Program Version 1.0
 * Program Description: This is the main file
 * Hardware Description: Uses the Waveshare Cyclone IV EP4CE10 
 *                       core board with DVK600 base board 
 *
 * Modified From: FPGA4FUN
 * 
 * Change History:
 *
 * Author                Rev     Date          Description
 * Armstrong Subero      1.0     15/07/2020    Initial Release
 *
 */


module V08_SEVEN_SEGMENT
  (
    input clk,
	 output segA, segB, segC, segD, segE, segF, segG
  );
  
   // cnt is used as a prescaler
   reg [23:0] cnt;
   always @(posedge clk) 
	   cnt <= cnt+24'h1;
   wire cntovf = &cnt;

  // BCD is a counter that counts from 0 to 9
  reg [4:0] BCD;
  
  always @(posedge clk) 
     if(cntovf) 
	    BCD <= (BCD==5'h15 ? 5'h0 : BCD+5'h1);

  reg [7:0] sseg;
  always @*
	 
	 begin
	   case(BCD)
		  4'h0: sseg = 7'b1111110; // 0
        4'h1: sseg = 7'b0110000; // 1
		  4'h2: sseg = 7'b1101101; // 2
		  4'h3: sseg = 7'b1111001; // 3
		  4'h4: sseg = 7'b0110011; // 4
		  4'h5: sseg = 7'b1011011; // 5
		  4'h6: sseg = 7'b1011111; // 6
		  4'h7: sseg = 7'b1110000; // 7
		  4'h8: sseg = 7'b1111111; // 8
		  4'h9: sseg = 7'b1111011; // 9
		  4'ha: sseg = 7'b1110111; // A
		  4'hb: sseg = 7'b0011111; // B
 		  4'hc: sseg = 7'b1001110; // C
		  4'hd: sseg = 7'b0111101; // D
		  4'he: sseg = 7'b1001111; // E
		 default: sseg = 7'b1000111; // F
	   endcase 
	 end

	 assign {segA, segB, segC, segD, segE, segF, segG} = sseg;

endmodule