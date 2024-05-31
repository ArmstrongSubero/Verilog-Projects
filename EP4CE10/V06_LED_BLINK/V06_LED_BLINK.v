/*
 * File:   V06_LED_BLINK.v
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
 * Armstrong Subero      1.0     16/07/2020    Initial Release
 *
 */



module V06_LED_BLINK(clk, LED);
   // net group
	input clk;
	output LED;
	
	// create a binary counter
	reg[23:0] cnt;
	
	// increment count
	always@(posedge clk) cnt <= cnt + 1;
	
	
	// blink LED using 23rd bit of the counter
	// blinks at 5.96 Hz
	assign LED = cnt[22];


endmodule