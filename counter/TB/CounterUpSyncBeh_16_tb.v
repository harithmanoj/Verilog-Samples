// Counter Test Bench
//	

module CounterUpSyncBeh_16_tb;

	reg clk, n_reset, enable;
	
	wire [15:0] Q;
	
	CounterUpSyncBeh_16 counterBeh(.clk(clk), .n_reset(n_reset), .enable(enable), .Q(Q));
	
	always #0.5 clk = ~clk;
	
	always #160000 enable = ~enable;
	
	initial begin
		
		$dumpfile("CounterUpSyncBeh_16_tb.vcd");
		$dumpvars(2, CounterUpSyncBeh_16_tb);
		
		clk = 0;
		enable = 1;
		n_reset = 1;
		
		#170000   n_reset= 0;
		
		#26	  n_reset = 1;
		
		#33	  $finish;
		
	end
	
	//initial
		//$monitor("time : %t |  clk %1b | enable %1b | n_reset %1b | Q %4b |", $time, clk, enable, n_reset, Q);
		
endmodule