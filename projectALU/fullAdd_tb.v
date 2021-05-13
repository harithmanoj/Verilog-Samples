/* single bit adder */

module test;

	reg a;
	reg b;
	reg c;
	
	wire out;
	wire Cout;
	
	initial begin
	
		$dumpfile("test.vcd");
		$dumpvars(0,test);
		#1	a = 0;
			b = 0;
			c = 0;
			
		#6	a = 0;
			b = 0;
			c = 1;
			
		#11	a = 0;
			b = 1;
			c = 0;
			
		#16	a = 0;
			b = 1;
			c = 1;
			
		#21	a = 1;
			b = 0;
			c = 0;
			
		#26	a = 1;
			b = 0;
			c = 1;
			
		#31	a = 1;
			b = 1;
			c = 0;
			
		#36	a = 1;
			b = 1;
			c = 1;
			
		#41 	;
	end
	
	
	fullAdd add(.a(a), .b(b), .out(out), .Cin(c), .Cout(Cout));
	
	
	initial
		$monitor( " %0b %0b %0b %0b %0b ", a, b, c, out, Cout);
	
endmodule