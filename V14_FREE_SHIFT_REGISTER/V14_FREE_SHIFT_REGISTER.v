/*
 * File:   V14_FREE_SHIFT_REGISTER.v
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
 * Armstrong Subero      1.0     19/07/2020    Initial Release
 *
 */

module V14_FREE_SHIFT_REGISTER
	#(parameter N=8)
	(
	  input wire clk, reset,
	  input wire s_in,
	  output wire s_out
	);
	
	// reg declarations since we are using
	// case
	reg[31:0] counter;
	reg clk2;
	
	// signal declarations
	reg [N-1:0] r_reg;
	wire [N-1:0] r_next;
	
	
	////////////////////////////////////////
	// Verilog Block
	// Clock Divider
	////////////////////////////////////////
	always@(posedge clk, negedge reset) begin
	
	   // if reset pressed 
		// clear everything
	   if(!reset)begin
			counter <= 0;
			clk2 <= 0;
		end
		
		// else on count
		// toggle clock
		else if(counter == 24999999) begin
			counter <= 0;
			clk2 = ~clk2;
		end
		
		// increment counter
		else
			counter <= counter + 32'd1;
	end
	//end verilog block
	
	
	
	
	// body
	// register
	always @(posedge clk2, posedge reset)
		if (reset)
			r_reg <= 0;
		else
			r_reg <= r_next;
	
	// next state logic
	assign r_next = {s_in, r_reg[N-1:1]};
	
	// output logic
	assign s_out = r_reg[0];

endmodule