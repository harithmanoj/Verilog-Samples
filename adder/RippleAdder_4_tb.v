// Ripple Adder Test Bench 4 bit
// Harith Manoj (C) 2021

module RippleAdder_4_tb;

	reg [3:0] a, b;
	reg cin;
	wire [3:0]sum;
	wire cout;
	
	RippleAdder_4 rippleAdder4Bit(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	
	initial begin
		
		$dumpfile("RippleAdder_4_tb.vcd");
		$dumpvars(3, RippleAdder_4_tb);
	
		#2 	a = 4'd14;
			b = 4'd10;
			cin = 1;
		#2 	a = 4'd8;
			b = 4'd9;
			cin = 0;
		#2 	a = 4'd1;
			b = 4'd6;
			cin = 1;
		#2 	a = 4'd7;
			b = 4'd12;
			cin = 0;
		#2 	a = 4'd9;
			b = 4'd2;
			cin = 1;
		#2 	a = 4'd15;
			b = 4'd3;
			cin = 0;
		#2	$finish;
	end
	
	initial
		$monitor( " a ( %1h : %2d ) + b ( %1h : %2d ) + cin ( %1b ) = sum ( %1h : %2d ) + cout ( %1b )",
			a, a, b, b, cin, sum, sum, cout);
			
	

endmodule