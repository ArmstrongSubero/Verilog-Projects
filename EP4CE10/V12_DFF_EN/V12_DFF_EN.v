/*
 * File:   V12_DFF_EN.v
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
 * Armstrong Subero      1.0     19/07/2020    Initial Release
 *
 */

module V12_DFF_EN
	(
	  input wire clk, reset,
	  input wire en,
	  input wire d,
	  output reg q
	);
	
	// body
	always @(posedge clk, posedge reset)
		if(reset)
			q <= 1'b0;
		else if (en)
			q <= d;
endmodule