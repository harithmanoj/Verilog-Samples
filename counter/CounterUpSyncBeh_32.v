//		16 bit up counter, synchronous reset; Behavioural
//		
//		Port	: clk		: in	: Synchronous clock
//				: reset		: in	: Resets counter to 0x0000
//				: enable	: in	: enable counting.
//				: Q			: out	: Output of counter
//				
//		

module CounterUpSyncBeh_32 ( clk, n_reset, enable, Q );

	input clk, n_reset, enable;
	
	output [31:0] Q;
	
	wire [15:0] Ql, Qu;
	
	assign uEnable = enable & (&Ql);
	
	CounterUpSyncBeh_16 upper(.clk(clk), .n_reset(n_reset), .enable(uEnable), .Q(Qu));
	CounterUpSyncBeh_16 lower(.clk(clk), .n_reset(n_reset), .enable(enable), .Q(Ql));
	
	assign Q = { Qu, Ql };
	
endmodule