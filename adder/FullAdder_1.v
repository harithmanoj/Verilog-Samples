//		
//	Does 1 bit Addition.
//	
//	port		:	a 		: in	: augend 
//				:	b		: in	: addend 
//				:	cin		: in	: carry of last operation
//				:	cout	: out	: carry of this operation
//				:	sum		: out	: sum of a, b, cin
//
//		Harith Manoj (C) 2021


module FullAdder_1( a, b, cin, sum, cout);

	input a, b, cin;
	output sum, cout;
	
	assign sum = a ^ b ^ cin;
	assign cout = ( a&b) | (b & cin) | (a &cin);

endmodule;