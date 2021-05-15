// Full Adder Test Bench 1 bit
// Harith Manoj (C) 2021

module FullAdder_1_tb;

	reg [2:0] in;
	
	assign a = in[2];
	assign b = in[1];
	assign cin = in[0];
	wire sum, cout;
	
	FullAdder_1 fullAdder1Bit(.a(a), .b(b), .cin(cin), .sum(sum), .cout(cout));
	
	initial begin
	
		$dumpfile("FullAdder_1_tb.vcd");
		$dumpvars(2, FullAdder_1_tb);
		
		#2 in = 3'd0;
		#2 in = 3'd1;
		#2 in = 3'd2;
		#2 in = 3'd3;
		#2 in = 3'd4;
		#2 in = 3'd5;
		#2 in = 3'd6;
		#2 in = 3'd7;
		#2 $finish;
	end
	
	initial
		$monitor( " a ( %1b ) + b ( %1b ) + cin ( %1b ) = sum ( %1b) + cout ( %1b )",
			a, b, cin, sum, cout);
			
	

endmodule