// Finite State Machine which follows State Diagram : 
//
//		000 -----> 001 -----> 011 -----> 101 -----> 111 -----> 010
//       ^                                                      |
//	     |                                                      |
//       +------------------------------------------------------+
//
//		Has synchronous reset, 
//		Port	: clk		: in	: Synchronous clock
//				: n_reset	: in	: Resets fsm to 000
//				: in    	: in	: change state to next if 1 else remains same.
//				: Q			: out	: Output of fsm
//				
//		

module fsm001( clk, n_reset, in, Q);

	input clk, n_reset, in;
	output reg [2:0] Q;
	
	initial
		Q = 3'b000;
		
	always@(posedge clk or in) begin
		
		if( !n_reset)
			Q = 3'b000;
		else if(in)
			case(Q)
				3'b000 : Q = 3'b001;
				3'b001 : Q = 3'b011;
				3'b011 : Q = 3'b101;
				3'b101 : Q = 3'b111;
				3'b111 : Q = 3'b010;
				3'b010 : Q = 3'b000;
				default: Q = 3'b000;
			endcase
	end
	
endmodule
		


