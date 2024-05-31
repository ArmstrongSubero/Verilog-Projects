/*
 * File:   V13_REGISTER_8_BIT.v
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

module V13_REGISTER_8_BIT 
	(
	  input wire clk, reset,
	  input wire [7:0] d,
	  output reg[7:0] q 
	);
	
	// body
	always @(posedge clk, posedge reset)
		if(reset)	
			q <= 0;
		else
			q <= d;
endmodule
	