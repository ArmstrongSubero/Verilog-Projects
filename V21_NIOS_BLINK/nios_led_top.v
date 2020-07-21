module nios_led_top
	(
	  input wire clk,
	  input wire[7:0] sw,
	  output wire [1:0] ledg
	);
	
	// body
	// instantiate nios_led_top
	nios_led cpu_unit
	(
	  .clk_clk(clk),
	  .switch_external_connection_export(sw),
	  .led_external_connection_export(ledg)
	);
	
endmodule