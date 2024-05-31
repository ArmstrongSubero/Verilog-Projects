/*
 * File:   V18_ROTATING_SQUARE.v
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


module V18_ROTATING_SQUARE(
     // net group
     input wire reset,
	  input wire clk,
	  output wire sel_1, sel_2, sel_3, sel_4,
	  output wire segA, segB, segC, segD, segE, segF, segG
   );

   // cnt is used as a prescaler
   reg [23:0] cnt;
   always @(posedge clk) 
	   cnt <= cnt+24'h1;
   wire cntovf = &cnt;

  // BCD is a counter that counts from 0 to 9
  reg [3:0] BCD;
  reg [3:0] SEGSEL;
  reg [3:0] counter = 4'b0000;
  
    always @(posedge clk) 
     if(cntovf) 
	  begin
	    SEGSEL <= (SEGSEL==4'h3 ? 4'h0 : SEGSEL+4'h1);
	  end
  		 
   
    always @(posedge clk) 
     if(cntovf) 
	  begin
	 
		 counter <= (counter == 4'b1000 ? 0 : counter+1);
		 
	    if (counter < 4'b0011)
	        BCD <= 4'h0;
			  
		 else if (counter > 4'b0111)
		     BCD <= 4'h1;
	 end

	
  // seven segment	
  reg [7:0] sseg;
  always @*
	 begin
	   case(BCD)
		  4'h0: sseg = 7'b1100011; // top
        4'h1: sseg = 7'b0011101; // bottom
	   endcase 
	 end
	 
	 
	// select segment
	reg [4:0] seldisp;
	always @*
	begin
		case(SEGSEL)
			4'h0: seldisp = 4'b0001;
			4'h1: seldisp = 4'b0010;
			4'h2: seldisp = 4'b0100;
			4'h3: seldisp = 4'b1000;
		endcase
	end
			
   // output
	assign {segA, segB, segC, segD, segE, segF, segG} = sseg;
   assign {sel_1, sel_2, sel_3, sel_4} = seldisp;
	
endmodule