module test;

	reg [7:0] a;
	reg [7:0] b;
	reg [3:0] op;
	reg C, S, Z, P;
	
	wire Cout, Sout, Zout, Pout;
	wire [7:0] out;
	
	initial begin
		$dumpfile("alu.vcd");
		$dumpvars(0,test);
		#5 	a = 8'h00;
			b = 8'h20;
			op = 4'h0;
			C = 0;
			S = 0;
			Z = 0;
			P = 0;
		#5	a = 8'hef;
			b = 8'hff;
			op = 4'h0;
		#5	a = 8'h00;
			b = 8'haa;
			op = 4'h1;
		#5	a = 8'hff;
			op = 4'h4;
		#5	a = 8'hae;
			b = 8'h86;
			op = 4'h5;
		#5	a = 8'ha5;
			b = 8'hf6;
			op = 4'h6;
		#5	a = 8'hd5;
			b = 8'he3;
			op = 4'h7;
		#5	a = 8'h01;
			C = 1;
			op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5  op = 4'b1110;
		#5 ;
	end
	
	alu modAlu(.a(a), .b(b), .op(op), .Cin(C), .Zin(Z), .Sin(S), .Pin(P), .C(Cout), .Z(Zout) , .S(Sout), .P(Pout), .out(out));
	
	initial 
		$monitor(" A = %8b (%2h) ( %3d) ; B = %8b (%2h) ( %3d); op = %4b (%1h) ; CSZP (in) %1b%1b%1b%1b ; out = %4b (%1h) ( %2d); CSZP %1b%1b%1b%1b",
					a,a,a,b,b,b,op,op,C,S,Z,P, out,out,out, Cout, Sout, Zout, Pout);
	
	always @(out, Cout, Sout, Zout, Pout) begin
		a <= out;
		C <= Cout;
		S <= Sout;
		Z <= Zout;
		P <= Pout;
	end

endmodule