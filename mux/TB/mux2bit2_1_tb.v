// Test Bench for muxs
//		


module mux2bit2_1_tb;
	
	reg [5:0] in = 5'd0;
	
	wire [1:0] a;
	assign a = in[4:3];
	wire [1:0] b;
	assign b = in[2:1];
	assign s = in[0];
	
	wire [1:0] out2Gate, out2Data, out2Behavioral;
	
	Mux2_1_2Gate muxGate1bit2_1( .d0(a), .d1(b), .sel(s), .out(out2Gate));
	Mux2_1_2Behavioral muxBehavioral1bit2_1( .d0(a), .d1(b), .sel(s), .out(out2Behavioral));
	Mux2_1_2DataFlow muxDataFlow1bit2_1( .d0(a), .d1(b), .sel(s), .out(out2Data));
	
	
	initial begin
		
		$dumpfile("mux2bit2_1_tb.vcd");
		$dumpvars(2, mux2bit2_1_tb);		
		#70 $finish;
	
	end
	
	always #2 in = in + 1;
	
	initial 
		$monitor("time %t | a = %2b | b = %2b | sel = %1b | Gate = %2b | Data = %2b | Beh = %2b",
			$time, a, b, s, out2Gate, out2Data, out2Behavioral);
					
	
endmodule
		