//		
//	Does 4 ripple carry bit Addition.
//	
//	port		:	a 		: in	: augend 
//				:	b		: in	: addend 
//				:	cin		: in	: carry of last operation
//				:	cout	: out	: carry of this operation
//				:	sum		: out	: sum of a, b, cin
//
//			Harith Manoj (C) 2021

module RippleAdder_4( a,  b, cin, cout, sum);

	input [3:0] a, b;
	input cin;
	
	output cout;
	output [3:0] sum;
	
	wire [2:0] c;
	
	FullAdder_1 f0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .cout(c[0]));
	FullAdder_1 f1(.a(a[1]), .b(b[1]), .cin(c[0]), .sum(sum[1]), .cout(c[1]));
	FullAdder_1 f2(.a(a[2]), .b(b[2]), .cin(c[1]), .sum(sum[2]), .cout(c[2]));
	FullAdder_1 f3(.a(a[3]), .b(b[3]), .cin(c[2]), .sum(sum[3]), .cout(cout));
	
endmodule;