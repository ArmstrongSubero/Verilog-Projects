/*
 * File:   V03_BUZZER.v
 * Author: Armstrong Subero
 * Processor: EP4CE10F17C8 @ 50MHz, 3.3v
 * Program: HDL file for application
 * Compiler: Quartus II 64-bit 13.0 SP1
 * Program Version 1.0
 * Program Description: This is the main file
 * Hardware Description: Uses the Waveshare Cyclone IV EP4CE10 
 *                       core board with DVK600 base board 
 *
 * Modified From: None
 * 
 * Change History:
 *
 * Author                Rev     Date          Description
 * Armstrong Subero      1.0     15/07/2020    Initial Release
 *
 */
 
module V03_BUZZER(clk, speaker);

   // net group
	input clk;
	output speaker;
	
   // clk divider is for 1kHz signal
	parameter clkdivider = 50000000/1000/2;
	
	// first create a 16-bit binary counter
	reg[15:0]counter;
	
	////////////////////////////////////////
	// Verilog Block
	// Counter
	////////////////////////////////////////
	always@(posedge clk)
	  if (counter == 0) 
	    counter <= clkdivider - 1;
	  else
	    counter <= counter - 1;
		
	// end verilog block
	
	// use the MSB of the counter to 
	// drive the speaker
	// which is 1 kHz
	reg speaker;
	always@(posedge clk)
	    if(counter==0)
		   speaker <= ~speaker;
			
	// end verilog block
	
endmodule