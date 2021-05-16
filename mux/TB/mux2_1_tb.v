// Test Bench for muxs
//		


module mux2_1_tb;
	
	reg [2:0] in;
	
	assign d0 = in[2];
	assign d1 = in[1];
	assign sel = in[0];
	
	wire outGate, outBehavioural, outDataFlow;
	
	Mux2_1Behavioral Behavioral(.d0(d0), .d1(d1), .sel(sel), .out(outBehavioural));
	Mux2_1DataFlow DataFlow(.d0(d0), .d1(d1), .sel(sel), .out(outDataFlow));
	Mux2_1Gate Gate(.d0(d0), .d1(d1), .sel(sel), .out(outGate));
	
	initial begin
		
		$dumpfile("mux2_1_tb.vcd");
		$dumpvars(2, mux2_1_tb);
		
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
		$monitor( "time: %t ; d0 = %1b; d1 = %1b; sel = %1b; out gate = %1b; out beh = %1b; out data = %1b;",
					$time, d0, d1, sel, outGate, outBehavioural, outDataFlow);
					
	
endmodule
		