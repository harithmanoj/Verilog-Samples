module mux8_2_1(a, b, s, o);
	
	input [7:0] a;
	input [7:0] b;
	input s;
	output [7:0] o;
	
	assign o[0] = (s & a[0]) | (b[0] & (~s));
	assign o[1] = (s & a[1]) | (b[1] & (~s));
	assign o[2] = (s & a[2]) | (b[2] & (~s));
	assign o[3] = (s & a[3]) | (b[3] & (~s));
	assign o[4] = (s & a[4]) | (b[4] & (~s));
	assign o[5] = (s & a[5]) | (b[5] & (~s));
	assign o[6] = (s & a[6]) | (b[6] & (~s));
	assign o[7] = (s & a[7]) | (b[7] & (~s));
	
endmodule