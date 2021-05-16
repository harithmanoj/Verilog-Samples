// Counter Test Bench
//	Harith Manoj (C) 2021

module CounterUpSyncBeh_4_tb;

	reg clk, n_reset, enable;
	
	wire [3:0] Q;
	
	CounterUpSyncBeh_4 counterBeh(.clk(clk), .n_reset(n_reset), .enable(enable), .Q(Q));
	
	always #0.5 clk = ~clk;
	
	always #20 enable = ~enable;
	
	initial begin
		
		$dumpfile("CounterUpSyncBeh_4_tb.vcd");
		$dumpvars(2, CounterUpSyncBeh_4_tb);
		
		clk = 0;
		enable = 1;
		n_reset = 1;
		
		#25   n_reset= 0;
		
		#26	  n_reset = 1;
		
		#33	  $finish;
		
	end
	
	initial
		$monitor("time : %t |  clk %1b | enable %1b | n_reset %1b | Q %4b |", $time, clk, enable, n_reset, Q);
		
endmodule