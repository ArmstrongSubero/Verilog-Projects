/*
 * File:   V04_SIREN.v
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
 
module V04_SIREN(clk, speaker);

   // net group
	input clk;
	output speaker;
	
   // clk divider is for 440 Hz signal
	parameter clkdivider = 50000000/440/2;
	
	// first create a 24-bit binary counter
	reg[23:0]tone;
	
	////////////////////////////////////////
	// Verilog Block
	// Tone
	////////////////////////////////////////
	always@(posedge clk)
	    tone <= tone + 1;
	// end verilog block
	
	
   ////////////////////////////////////////
	// Verilog Block
	// Counter
	////////////////////////////////////////
	// create a 16-bit binary counter
	reg[15:0]counter;
	always@(posedge clk)
		if(counter==0)
			counter <= (tone[23] ? clkdivider-1 : 
			  clkdivider/2-1);
	   else
			counter <= counter - 1;
	// end verilog block
	
			
	////////////////////////////////////////
	// Verilog Block
	// Speaker Output
	////////////////////////////////////////
	reg speaker;
	always@(posedge clk)
	    if(counter==0)
		   speaker <= ~speaker;
	// end verilog block
	
endmodule