//		2:1 Mux created using gate level modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 0
//				:	d1	: in	: 2nd input, selected if sel is 1
//				:	sel	: in	: selection bit.
//				:	out : out 	: selected output
//
//		Harith Manoj (C) 2021



module Mux2_1Gate( d0, d1, sel, out);

	input d0, d1, sel;
	
	output out;
	
	wire min0, min1, nSel;
	
	not (nSel, sel);
	
	and term0(min0, d0, nSel);
	and term1(min1, d1, sel);
	
	or (out, min0, min1);
	
endmodule
	
	