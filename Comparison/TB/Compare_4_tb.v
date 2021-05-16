// Comparator Test Bench 4 bit
// 

module Compare_4_tb;

	reg [3:0] a, b;
	wire gt, lt, eq;
	
	Compare_4 compare4Bit(.a(a), .b(b), .gt(gt), .lt(lt), .eq(eq));
	
	initial begin
	
		$dumpfile("Compare_4_tb.vcd");
		$dumpvars(2, Compare_4_tb);
		
		#2 	a = 4'd14;
			b = 4'd10;
		#2 	a = 4'd8;
			b = 4'd9;
		#2 	a = 4'd1;
			b = 4'd6;
		#2 	a = 4'd7;
			b = 4'd12;
		#2 	a = 4'd9;
			b = 4'd2;
		#2 	a = 4'd15;
			b = 4'd3;
		#2	a = 4'd10;
			b = 4'd10;
		#2	$finish;
	end
	
	initial
		$monitor( " a ( %1h : %2d ) <=> b ( %1h : %2d ) | Greater? : %1b ; Lesser? : %1b ; Equal? : %1b",
			a, a, b, b, gt, lt, eq);
			
	

endmodule