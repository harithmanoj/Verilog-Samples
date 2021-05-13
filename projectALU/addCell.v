/* Adder Cell */

module addCell(a, b, cin, p, g, sum);

	input a, b, cin;
	output sum, p, g;
	
	assign p = a | b;
	assign g = a & b;
	assign sum = a ^ b ^ cin;
	
endmodule