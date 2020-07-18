/*
 * File:   V20_VGA.v
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

module V20_VGA(mclk, vga_h_sync, vga_v_sync, vga_R,
               vga_G, vga_B);
					
    input mclk;
	 output vga_h_sync, vga_v_sync, vga_R, vga_G, vga_B;
	 
	 wire inDisplayArea;
    wire [9:0] CounterX;
    wire [8:0] CounterY;

	
    // convert 50 MHz clk to 25 MHz	
    reg clk; 
    always @(posedge mclk)
	    clk <= ~clk;

hvsync_generator syncgen(.clk(clk), .vga_h_sync(vga_h_sync), .vga_v_sync(vga_v_sync),
                            .inDisplayArea(inDisplayArea), .CounterX(CounterX), .CounterY(CounterY));

// Draw a border around the screen
wire border = (CounterX[9:3]==0) || (CounterX[9:3]==79) || (CounterY[8:3]==0) || (CounterY[8:3]==59);
wire R = border;
wire G = border;
wire B = border;

reg vga_R, vga_G, vga_B;
always @(posedge clk)
begin
  vga_R <= R & inDisplayArea;
  vga_G <= G & inDisplayArea;
  vga_B <= B & inDisplayArea;
end


endmodule