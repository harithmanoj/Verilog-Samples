//		2:1 Mux created using data flow modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 0
//				:	d1	: in	: 2nd input, selected if sel is 1
//				:	sel	: in	: selection bit.
//				:	out : out 	: selected output
//
//		Harith Manoj (C) 2021



module Mux2_1DataFlow( d0, d1, sel, out);

	input d0, d1, sel;
	
	output out;
	
	assign out = sel ? d1 : d0;
	
endmodule
	
	