/*
 * File:   V15_UNIVERSAL_SHIFT_REG.v
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

module V15_UNIVERSAL_SHIFT_REG
	#(parameter N=8)
	(
		input wire clk, reset,
		input wire [1:0] ctrl,
		input wire [N-1:0] d,
		output wire [N-1:0] q
	);
	
	// signal declarations
	reg [N-1:0] r_reg, r_next;
	
	// reg declarations since we are using
	// case
	reg[31:0] counter;
	reg clk2;
	
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
	always @(posedge clk2, negedge reset)
		if (!reset)
			r_reg <= 0;
		else
			r_reg <= r_next;
			
	// next state logic
	always @*
		case(ctrl)
			2'b00: r_next = r_reg;
			2'b01: r_next = {r_reg[N-2:0], d[0]};
			2'b10: r_next = {d[N-1], r_reg[N-1:1]};
			default : r_next = d;
	   endcase
		
	// output logic
	assign q = r_reg;
	
endmodule