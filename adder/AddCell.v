//		
//	Does Addition of both bits with carry, generate g,p for carry look ahead circuits
//	
//	port		:	a 		: in	: term
//				:	b		: in	: term
//				:	cin		: in	: carry from lower bit addition
//				:	sum		: out	: sum  of a, b, cin
//				:	p		: out	: Propagate prediction
//				:	g		: out	: Generate prediction
//				
//			Harith Manoj (C) 2021


module AddCell(a, b, cin, p, g, sum);

	input a, b, cin;
	output sum, p, g;
	
	assign p = a | b;
	assign g = a & b;
	assign sum = a ^ b ^ cin;
	
endmodule