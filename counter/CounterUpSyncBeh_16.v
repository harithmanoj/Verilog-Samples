//		16 bit up counter, synchronous reset; Behavioural
//		
//		Port	: clk		: in	: Synchronous clock
//				: reset		: in	: Resets counter to 0x0000
//				: enable	: in	: enable counting.
//				: Q			: out	: Output of counter
//				
//		

module CounterUpSyncBeh_16 ( clk, n_reset, enable, Q );

	input clk, n_reset, enable;
	
	output reg [15:0] Q = 16'h0000;
	
	always @(posedge clk) begin
		if (!n_reset)
			Q <= 16'h0000;
		else if ( enable)
			Q <= Q + 1;
	end
	
endmodule
