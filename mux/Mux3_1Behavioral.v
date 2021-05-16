//		3:1 Mux created using multiple 2:1 Mux Behavioral modeling
//		
//		Ports	:	d0	: in	: 1st input, selected if sel is 00
//				:	d1	: in	: 2nd input, selected if sel is 01
//				:	d2	: in	: 3rd input, selectes if sel is 10 or 11
//				:	sel	: in	: selection bits.
//				:	out : out 	: selected output
//
//		Harith Manoj (C) 2021



module Mux3_1Behavioral( d0, d1, d2, sel, out);

	input d0, d1, d2;
	input [1:0] sel;
	
	output wire out;
	
	wire lowerSelect;
	
	Mux2_1Behavioral lowerMux(.d0(d0), .d1(d1), .sel(sel[0]), .out(lowerSelect));
	Mux2_1Behavioral upperMux(.d0(lowerSelect), .d1(d2), .sel(sel[1]), .out(out));
	
endmodule
	
	