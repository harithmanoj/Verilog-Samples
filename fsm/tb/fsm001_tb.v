// fsm001 Test Bench
//	

module fsm001_tb;

	reg clk, n_reset, in;
	
	wire [2:0] Q;
	
	fsm001 fsm(.clk(clk), .n_reset(n_reset), .in(in), .Q(Q));
	
	always #0.5 clk = ~clk;
	
	
	initial begin
		
		$dumpfile("fsm001_tb.vcd");
		$dumpvars(2, fsm001_tb);
		
		clk = 0;
		in = 1;
		n_reset = 1;
		
		#30   n_reset= 0;
		#2	  in = 0;
		#1	  n_reset = 1;
		#10   in = 1;
		#10	  $finish;
		
	end
	
	initial
		$monitor("time : %t |  clk %1b | in %1b | n_reset %1b | Q %4b |", $time, clk, in, n_reset, Q);
		
endmodule