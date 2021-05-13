module twosConvertor(a, minA);

	input [7:0] a;
	
	output [7:0] minA;
	
	wire [5:0] c;
	
	function genMin;
		input a, c;
		begin
			genMin = (~a) ^ c;
		end
	endfunction
	
	function genCar;
		input a, c;
		begin
			genCar = (~a) & c;
		end
	endfunction
	
	assign minA[0] = a[0];
	
	assign minA[1] = genMin(a[1], a[0]);
	assign c[0] = genCar(a[1], a[0]);
	
	assign minA[2] = genMin(a[2], c[0]);
	assign c[1] = genCar(a[2], c[0]);
	
	assign minA[3] = genMin(a[3], c[1]);
	assign c[2] = genCar(a[3], c[1]);
	
	assign minA[4] = genMin(a[4], c[2]);
	assign c[3] = genCar(a[4], c[2]);
	
	assign minA[5] = genMin(a[5], c[3]);
	assign c[4] = genCar(a[5], c[3]);
	
	assign minA[6] = genMin(a[6], c[4]);
	assign c[5] = genCar(a[6], c[4]);
	
	assign minA[7] = genMin(a[7], c[5]);
	
endmodule
	