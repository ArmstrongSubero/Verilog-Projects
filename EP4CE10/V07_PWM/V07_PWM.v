/*
 * File:   V07_PWM.v
 * Author: Armstrong Subero
 * Processor: EP4CE10F17C8 @ 50MHz, 3.3v
 * Program: HDL file for application
 * Compiler: Quartus II 64-bit 13.0 SP1
 * Program Version 1.0
 * Program Description: This is the main file
 * Hardware Description: Uses the Waveshare Cyclone IV EP4CE10 
 *                       core board with DVK600 base board 
 *
 * Modified From: Waveshare Examples
 * 
 * Change History:
 *
 * Author                Rev     Date          Description
 * Armstrong Subero      1.0     16/07/2020    Initial Release
 *
 */


module V07_PWM(clk, LED);
   
	input clk;
	output LED;

	reg [23:0] cnt;
	
	always @(posedge clk) cnt<=cnt+1;
	
	wire [3:0] PWM_input = cnt[23] ? cnt[22:19] : ~cnt[22:19];    // ramp the PWM input up and down

	reg [4:0] PWM;
	
	always @(posedge clk) PWM <= PWM[3:0]+PWM_input;

	assign LED = PWM[4];
endmodule