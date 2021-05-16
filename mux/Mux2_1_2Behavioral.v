//		2 bit 2:1 Mux created using Behavioral modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 0
//				:	d1	: in	: 2nd input, selected if sel is 1
//				:	sel	: in	: selection bit.
//				:	out : out 	: selected output
//
//		Harith Manoj (C) 2021



module Mux2_1_2Behavioral( d0, d1, sel, out);

	input [1:0] d0, d1;
	input sel;
	
	output reg [1:0] out;
	
	always @(d0 or d1 or sel) begin
		
		if(sel) 
			out = d1;
		else
			out = d0;
			
	end
	
endmodule
	
	