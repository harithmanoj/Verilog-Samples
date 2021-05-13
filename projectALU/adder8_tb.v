module test;

	reg [7:0] a, b;
	reg cin;
	wire [7:0] sum;
	wire cout;
	
	initial begin
	
		#5	a = 8'h20;
			b = 8'haf;
			cin = 1;
	
		#5	a = 8'h45;
			b = 8'h2f;
			cin = 1;
	
		#5  a = 8'ha1;
			b = 8'h1f;
			cin = 1;
	
		#5	a = 8'hbb;
			b = 8'h0a;
			cin = 1;
	
		#5	a = 8'h04;
			b = 8'h4f;
			cin = 1;
	
		#5	a = 8'hd0;
			b = 8'hf1;
			cin = 0;
	
		#5	a = 8'h23;
			b = 8'h5e;
			cin = 1;
	
		#5	a = 8'he0;
			b = 8'h1f;
			cin = 1;
	
		#5	a = 8'h0f;
			b = 8'h34;
			cin = 1;
	
		#5	a = 8'h00;
			b = 8'hff;
			cin = 0;
			
		#5 ;
	end 
	
	//ripple8 ripple(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	adder8 add8Bit(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	
	initial
		$monitor(" time : %t Sum : %2h (%3d) ; Cout : %1b << A : %2h (%3d) + B : %2h (%3d) + Cin %1b ",
					$time, sum, sum, cout, a, a, b, b, cin);

endmodule