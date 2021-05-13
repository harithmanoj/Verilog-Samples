module shiftRight(a, b, in, out);

	input [7:0] a;
	input in;
	output [7:0] b;
	output out;
	
	
	assign b[7] = in;
	assign b[6] = a[7];
	assign b[5] = a[6];
	assign b[4] = a[5];
	assign b[3] = a[4];
	assign b[2] = a[3];
	assign b[1] = a[2];
	assign b[0] = a[1];
	assign out = a[0];
	
endmodule