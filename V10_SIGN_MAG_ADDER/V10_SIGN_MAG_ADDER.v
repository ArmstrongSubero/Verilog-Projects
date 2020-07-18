/*
 * File:   V10_SIGN_MAG_ADDER.v
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
 * Armstrong Subero      1.0     17/07/2020    Initial Release
 *
 */


module V10_SIGN_MAG_ADDER
  #(
   parameter N = 4
  )
  (
   input wire [N-1:0] a, b,
   output reg [N-1:0] sum
  );
  
  // signal declaration
  reg [N-2:0] mag_a, mag_b, mag_sum, max, min;
  reg sign_a, sign_b, sign_sum;
  
  // body
  always @*
  begin
		// separate magntute and sign_a
		mag_a = a[N-2:0];
		mag_b = b[N-2:0];
		sign_a = a[N-1];
		sign_b = b[N-1];
		
		// soft according to magnitude
		if(mag_a > mag_b)
		   begin
			   max = mag_a;
				min = mag_b;
				sign_sum = sign_a;
			end
		else
			begin
			   max = mag_b;
				min = mag_a;
				sign_sum = sign_b;
			end
			
		// add/sub magnitude
		if (sign_a == sign_b)
			mag_sum = max + min;
		else
			mag_sum = max - min;
		
		// form output
		sum = {sign_sum, mag_sum};
	end
endmodule
  
  
  
  