module nios_led_top
   (
	  input wire clk,
	  output wire [3:0]led
	);
	
	led_nios cpu_unit
		(
		  .clk_clk(clk),
		  .led_external_connection_export(led)
		);
		
endmodule