//		
//	Magnitude Comparator, 4 bit.
//	
//	port		:	a 		: in	: term 
//				:	b		: in	: term
//				:	gt		: out	: 1 if a > b
//				:	lt		: out	: 1 if a < b
//				:	eq		: out	: 1 if a == b
//


module Compare_4(a, b, gt, lt, eq);

	input [3:0] a, b;
	
	output gt, lt, eq;
	
	assign gt = a > b;
	assign lt = a < b;
	assign eq = ~(gt | lt);
	
endmodule