// Test Bench for muxs
//		Harith Manoj (C) 2021


module mux_tb;
	
	reg [4:0] in;
	
	assign a = in[4];
	assign a1 = in[3];
	assign b = in[2];
	assign b1 = in[1];
	assign s = in[0];
	
	wire outgt, outbh, outData;
	wire [1:0] out2gt;
	
	Mux2_1_2Gate Gate2Bit(.d0(in[4:3]), .d1(in[2:1]), .sel(s), .out(out2gt));
	Mux2_1Behavioral Behavioral(.d0(a), .d1(b), .sel(s), .out(outbh));
	Mux2_1DataFlow DataFlow(.d0(a), .d1(b), .sel(s), .out(outData));
	Mux2_1Gate Gate(.d0(a), .d1(b), .sel(s), .out(outgt));
	
	initial begin
		
		$dumpfile("mux_tb.vcd");
		$dumpvars(2, mux_tb);
		
		#2 in = 5'd0;
		#2 in = 5'd1;
		#2 in = 5'd2;
		#2 in = 5'd3;
		#2 in = 5'd4;
		#2 in = 5'd5;
		#2 in = 5'd6;
		#2 in = 5'd7;
		#2 in = 5'd8;
		#2 in = 5'd9;
		#2 in = 5'd10;
		#2 in = 5'd11;
		#2 in = 5'd12;
		#2 in = 5'd13;
		#2 in = 5'd14;
		#2 in = 5'd15;
		#2 in = 5'd16;
		#2 in = 5'd17;
		#2 in = 5'd18;
		#2 in = 5'd19;
		#2 in = 5'd20;
		#2 in = 5'd21;
		#2 in = 5'd22;
		#2 in = 5'd23;
		#2 in = 5'd24;
		#2 in = 5'd25;
		#2 in = 5'd26;
		#2 in = 5'd27;
		#2 in = 5'd28;
		#2 in = 5'd29;
		#2 in = 5'd30;
		#2 in = 5'd31;
		#2 $finish;
	
	end
	
	initial 
		$monitor( "time: %t ; a = %1b; b = %1b; s = %1b; a[2] = %2b; b[2] = %2b; out 2 gate = %2b; out gate = %1b; out beh = %1b; out data = %1b;",
					$time, a, b, s, in[4:3], in[2:1], out2gt, outgt, outbh, outData);
					
	
endmodule
		