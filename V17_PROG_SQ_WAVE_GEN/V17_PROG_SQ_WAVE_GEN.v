/*
 * File:   V17_PROG_SQ_WAVE_GEN.v
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


module V17_PROG_SQ_WAVE_GEN
    #(parameter interval_quant_ns = 5)
   (
     // net group
     output reg waveform,
	  input wire clk, reset,
	  input wire [3:0] on,
	  input wire [3:0] off
   );
	
	localparam interval_quant_count_to = interval_quant_ns - 1;
	
	reg[3:0] clk_tick_count;
	reg[3:0] count;
	
	always @(posedge clk, negedge reset) begin
		if (!reset) 
		  begin
			waveform <= 0;
			clk_tick_count <= 0;
			count <= 0;
		  end
		  
		 else
			begin
			 clk_tick_count <= clk_tick_count + 1;
			 
			 if(clk_tick_count == interval_quant_count_to)
				begin
					count <= count - 1;
					clk_tick_count <= 0;
				end
				
			 if (count == 0) 
				begin
				  count <= (waveform == 1) ? off : on;
				  waveform <= ~waveform;
				end
				  
			  end
			
			end
	
endmodule