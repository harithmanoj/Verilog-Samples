module adder8 ( a, b, cin, sum, cout);

	input [7:0] a;
	input [7:0] b;
	input cin;
	output [7:0] sum;
	output cout;
	
	wire [7:0] p;
	wire [7:0] g;
	wire [7:0] c;
	
	addCell add0(.a(a[0]), .b(b[0]), .cin(cin), .p(p[0]), .g(g[0]), .sum(sum[0]));
	addCell add1(.a(a[1]), .b(b[1]), .cin(c[0]), .p(p[1]), .g(g[1]), .sum(sum[1]));
	addCell add2(.a(a[2]), .b(b[2]), .cin(c[1]), .p(p[2]), .g(g[2]), .sum(sum[2]));
	addCell add3(.a(a[3]), .b(b[3]), .cin(c[2]), .p(p[3]), .g(g[3]), .sum(sum[3]));
	addCell add4(.a(a[4]), .b(b[4]), .cin(c[3]), .p(p[4]), .g(g[4]), .sum(sum[4]));
	addCell add5(.a(a[5]), .b(b[5]), .cin(c[4]), .p(p[5]), .g(g[5]), .sum(sum[5]));
	addCell add6(.a(a[6]), .b(b[6]), .cin(c[5]), .p(p[6]), .g(g[6]), .sum(sum[6]));
	addCell add7(.a(a[7]), .b(b[7]), .cin(c[6]), .p(p[7]), .g(g[7]), .sum(sum[7]));

	carryLookAhead carry( .cin(cin), .p(p), .g(g), .c(c));
	assign cout = c[7];
	
endmodule

