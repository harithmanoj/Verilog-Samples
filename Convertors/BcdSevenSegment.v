//		Converts BCD to seven segment display control signals
//
//		Port	: enable	: in	: enable connection.
//				: bcd		: in	: bcd input.
//				: a -- g	: out 	: output control signals.
//				: AA		: out	: anode enable
//	
//			


module BcdSevenSegment 
	( n_enable, bcd, a, b, c, d, e, f, g, AA);
	
	input n_enable;
	input [3:0] bcd;
	
	output wire a, b, c, d, e, f, g, AA;
	
	reg [6:0] out;
	
	always@(bcd or n_enable) begin
		
		case(bcd)
			4'h0: 		out = 7'b0000001;
			4'h1: 		out = 7'b1001111;
			4'h2: 		out = 7'b0010010;
			4'h3: 		out = 7'b0000110;
			4'h4: 		out = 7'b1001100;
			4'h5: 		out = 7'b0100100;
			4'h6: 		out = 7'b0100000;
			4'h7:		out = 7'b0001111;
			4'h8: 		out = 7'b0000000;
			4'h9: 		out = 7'b0000100;
			default: 	out = 7'b0000001;
		endcase
		
	end
	
	assign AA = ~n_enable;
	
	assign a = out[6] | n_enable;
	assign b = out[5] | n_enable;
	assign c = out[4] | n_enable;
	assign d = out[3] | n_enable;
	assign e = out[2] | n_enable;
	assign f = out[1] | n_enable;
	assign g = out[0] | n_enable;
	
endmodule