/*

	alu op code
	
	addc, subb
	add, sub
	not a
	and, 
	or, 
	xor
	sal, sar
	sll, slr
	rl, rr
	rlc, rrc
	

	0000 add
	0001 addc
	0010 sub
	0011 subb
	0100 not
	0101 and
	0110 or
	0111 xor
	1000 sal
	1001 sar
	1010 sll
	1011 slr
	1100 rl
	1101 rr
	1110 rlc
	1111 rrc
*/


module alu(a, b, op, Cin, Zin, Sin, Pin, C, Z, S, P out);

	input [7:0] a;
	input [7:0] b;
	input [3:0] op;
	
	input Cin;
	input Zin;
	input Sin;
	input Pin;
	
	output C;
	output Z;
	output S;
	output P;
	
	output [7:0] out;
	
	wire [7:0] addA;
	wire [7:0] addB;
	wire [7:0] signedB;
	wire [7:0] addInB;
	wire [7:0] zero;
	wire [7:0] arithOut;
	wire [7:0] arithCarry;
	assign zero = 8'h00;
	
	assign shouldAdd = ~( op[3] | op[2] );
	
	mux8_2_1 selectAddA(.a(a), .b(zero), .s(shouldAdd), .o(addA));
	mux8_2_1 selectAddB(.a(b), .b(zero), .s(shouldAdd), .o(addB));
	twosConvertor subIn(.a(addB), .minA(signedB));
	mux8_2_1 selectSignB(.a(addB), .b(signedB), .s(op[1]), .o(addInB));
	assign carry = (op[0] & C);
	adder8 adder( .a(addA), .b(addInB), .cin(carry), .sum(arithOut), .cout(arithCarry));
	
	assign shouldLogic = (~op[3]) & op[2];
	
	assign notRes = ~a;
	assign andRes = a & b;
	assign orRes  = a | b;
	assign xorRes = a ^ b;
	
	wire [7:1] notAndSelect;
	wire [7:1] orXorSelect;
	wire [7:1] LogicOut;
	mux8_2_1 selectLogic10(.a(notRes), .b(andRes), .s(op[0]), .o(notAndSelect));
	mux8_2_1 selectLogic11(.a(orRes), .b(xorRes), .s(op[0]), .o(orXorSelect));
	mux8_2_1 selectLogic0(.a(notAndSelect), .b(orXorSelect), .s(op[1]), .o(LogicOut));
	
	wire [7:1] leftOut;
	wire [7:1] rightOut;
	wire [7:1] shiftLeftIn;
	wire [7:1] shiftRightIn;
	
	
	assign shouldShiftLeft = op[3]  & (~op[0]);
	assign shouldSiftRight = op[3] & op[0];
	
	mux8_2_1 shiftLeftInSelect(.a(zero), .b(a), .s(shouldShiftLeft), .o(shiftLeftIn));
	mux8_2_1 shiftRightInSelect(.a(zero), .b(a), .s(shouldShiftRight), .o(shiftRightIn));
	
	assign inZero = op[3] & (~op[2]) & ( op[0] + op[1]);
	assign inMSB = op[3] & (~op[1]) & (op[2] ^ op[0]);
	assign inLSB = op[3] & op[2] & op[0] & (~op[1]);
	assign inCarry = op[3] & op[2] & op[1];
	
	wire genShiftCarryL;
	wire genShiftCarryR;
	
	assign in = (zero[0] & inZero) | (a[7] & inMSB) | (a[0] & LSB) | (Cin & inCarry);
	
	
	shiftLeft left( .a(shiftLeftIn), .b(leftOut), .in(in), .out(genShiftCarryL));
	shiftRight right( .a(shiftRightIn), .b(rightOut), in(in), .out(genShiftCarryR));
	
	assign genShiftCarry = (genShiftCarryL & shouldShiftLeft) | ( genShiftCarryR & shouldShiftRight);
	
	wire [7:1] shiftOut;
	
	mux8_2_1 shiftOutSelect( .a(leftOut), .b(rightOut), .s(shouldShiftRight), .o(shiftOut));
	
	wire [7:1] logicArithOut;
	mux8_2_1 logicArithSelect(  .a(arithOut), .b(LogicOut), .s(op[2]), .o(logicArithOut));
	
	mux8_2_1 generateOut( .a(logicArithOut), .b(shiftOut), .s(op[3]), .o(out));
	
	assign Csample = ((~op[3]) & (~op[2]) & arithCarry) | (op[3] & op[2] & op[1] & genShiftCarry);
	assign shouldGenC = ((~op[3]) & (~op[2])) | (op[3] & op[2] & op[1]);
	assign C = ((~shouldGenC) & Cin) | (shouldGenC & Csample);
	
	assign Z = ~(|out);
	assign S = op[7];
	assign P = ^out;
	
endmodule
	
	
	
	