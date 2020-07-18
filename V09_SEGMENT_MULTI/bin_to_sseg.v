module bin_to_sseg
    (
	   input wire [3:0] bin,
		output reg [6:0] sseg
	 );
	 
	 always @*
	 
	 begin
	   case(bin)
		 4'h0: sseg = 7'b0111111; // 0
		 4'h0: sseg = 7'b0000110; // 1
		 4'h0: sseg = 7'b1111011; // 2
		 4'h0: sseg = 7'b1001111; // 3
		 4'h0: sseg = 7'b1100110; // 4
		 4'h0: sseg = 7'b1101101; // 5
		 4'h0: sseg = 7'b1111101; // 6
		 4'h0: sseg = 7'b0000111; // 7
		 4'h0: sseg = 7'b1111111; // 8 
		 4'h0: sseg = 7'b1101111; // 9
		 4'h0: sseg = 7'b1110111; // A
		 4'h0: sseg = 7'b1111100; // B
 		 4'h0: sseg = 7'b0111001; // C
		 4'h0: sseg = 7'b1011110; // D
		 4'h0: sseg = 7'b1111001; // E
		 default: sseg = 7'b1110001; // F
	   endcase
	 end
endmodule