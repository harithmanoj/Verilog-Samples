// BCD to Seven Segment convertor test bench


module BcdSevenSegment_tb;

	wire a, b, c, d, e, f, g, AA;

	reg n_enable;
	reg [3:0] bcd;
	reg clk;
	BcdSevenSegment bcdconv( .n_enable(n_enable), .bcd(bcd), .a(a), .b(b), .c(c), .d(d), .e(e), .f(f), .g(g), .AA(AA));
	
	initial begin
		$dumpfile("BcdSevenSegment_tb.vcd");
		$dumpvars(2, BcdSevenSegment_tb);
		
		n_enable = 0;
		bcd = 4'b1111;
		clk = 0;
		
		#30 $finish;
	end
	
	always #2 clk = ~clk;
	
	always @(clk) begin
		if(bcd == 4'b1001) begin
			n_enable = ~n_enable;
			bcd = 4'b1111;
		end
		
		bcd = bcd + 1;
		
	end
	
	initial
		$monitor("    %4b not enable %1b AA %1b =>\n      %1b \n     %1b %1b \n      %1b \n     %1b %1b \n      %1b\n",
					bcd, n_enable, AA, a, f, b, g, e, c, d);
endmodule