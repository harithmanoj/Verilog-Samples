//		2bit 2:1 Mux created using gate level modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 0
//				:	d1	: in	: 2nd input, selected if sel is 1
//				:	sel	: in	: selection bit.
//				:	out : out 	: selected output
//
//		



module Mux2_1_2Gate( d0, d1, sel, out);

	input[1:0] d0, d1;
	input sel;
	
	output [1:0] out;
	
	wire [1:0] min0, min1;
	wire nSel;
	
	not (nSel, sel);
	
	and term00(min0[0], d0[0], nSel);
	and term01(min0[1], d0[1], nSel);
	
	and term10(min1[0], d1[0], sel);
	and term11(min1[1], d1[1], sel);
	
	or ar0(out[0], min0[0], min1[0]);
	or ar1(out[1], min0[1], min1[1]);
	
endmodule
	
	