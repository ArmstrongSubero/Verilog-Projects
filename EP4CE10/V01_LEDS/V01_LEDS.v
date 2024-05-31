/*
 * File:   V01_LEDS.v
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
 * Armstrong Subero      1.0     15/07/2020    Initial Release
 *
 */


module V01_LEDS(
     // net group
     input nrst,
	  input clk,
	  inout reg[3:0]led
   );
	
	
	// reg declarations since we are using
	// case
	reg[31:0] counter;
	reg clk2;
	reg[7:0] i;
	reg[3:0] led_reg;
	
	
	////////////////////////////////////////
	// Verilog Block
	// Clock Divider
	////////////////////////////////////////
	always@(posedge clk, negedge nrst) begin
	
	   // if reset pressed 
		// clear everything
	   if(!nrst)begin
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
	
	
	////////////////////////////////////////
	// Verilog Block
	// Scroll LEDs
	////////////////////////////////////////
	always@(posedge clk2, negedge nrst) begin
	   // if reset pressed
	   if(!nrst)
			led <= 4'd0;
			
	   // else scroll LEDs
	   else
			case(i)
				0: 
				  begin led <= 4'b0001;
				        i <= i + 1;
				  end
				1:
				  begin led <= 4'b0010;
				        i <= i + 1;
				  end
				2:
					begin led <= 4'b0100;
						  i <= i + 1;
					end
				3:
					begin led <= 4'b1000;
					     i <= i <= 0;
				   end
			endcase
	end
	// end verilog block

endmodule