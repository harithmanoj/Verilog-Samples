//		2 bit 2:1 Mux created using data flow modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 0
//				:	d1	: in	: 2nd input, selected if sel is 1
//				:	sel	: in	: selection bit.
//				:	out : out 	: selected output
//
//		



module Mux2_1_2DataFlow( d0, d1, sel, out);

	input [1:0] d0, d1;
	input sel;
	
	output [1:0] out;
	
	assign out = sel ? d1 : d0;
	
endmodule
	
	