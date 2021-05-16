// Test bench for 3-1 mux
// Harith Manoj (C) 2021

module mux3_1_tb;

	reg [4:0] in;
	
	initial
		in = 4'b0000;
	
	assign d0 = in[4];
	assign d1 = in[3];
	assign d2 = in[2];
	wire [1:0] sel;
	assign sel = in[1:0];
	wire out;
	
	
	Mux3_1Behavioral muxBeh3_1 (.d0(d0), .d1(d1), .d2(d2), .sel(sel), .out(out));
	
	always #2 in = in + 1;
	
	initial begin
		$dumpfile("mux3_1_tb.vcd");
		$dumpvars(2, mux3_1_tb);
		#80 $finish;
		
	end
		
	initial 
		$monitor("time : %t ; d[0:1:2] = %1b %1b %1b ; sel = %2b ; out = %1b ",
				$time, d0, d1, d2, sel, out);

endmodule