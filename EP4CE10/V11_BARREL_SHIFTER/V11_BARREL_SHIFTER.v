module V11_BARREL_SHIFTER
  (
    input wire[2:0] key,
	 input wire[7:0] sw,
	 output wire[7:0] led
  );
  
  // instantiate shifter
  barrel_shifter_stage shift_unit
	(.a(sw), .amt(~key), .y(led));
	
endmodule