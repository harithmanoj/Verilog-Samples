//		
//	Does Carry Look Ahead Addition / Subtraction.
//	
//	parameter	:	WIDTH 	: width of integer to add / subtract
//	port		:	a 		: in	: augend or minuhend
//				:	b		: in	: addend or subtrahend
//				:	cin		: in	: carry or Borrow of last operation
//				:	enable	: in	: enable / disable chip
//				:	addSub	: in 	: 1 for subtraction, 0 for addition
//				:	cout	: out	: carry or Borrow of this operation
//				:	out		: out	: sum or difference of a, b, C
//
// Harith Manoj (C) 2021


module LookAheadAdder 
	#(parameter WIDTH = 8) 
		( a, b, cin, enable, addSub, cout, out );
		
	
	input[WIDTH-1:0]	a,b;
    input				cin;
	input				enable;
	input				addSub;

	output[WIDTH-1:0]	out;
	output				cout;

	wire[WIDTH-1:0]		g, p;
	wire[WIDTH:0]		c;

	assign c[0] = cin & enable;
	assign cout = c[WIDTH];
	
	wire [WIDTH-1:0]	enA, enB;
	assign enA = {8{enable}} & a;
	assign enB = {8{enable}} & b;
	
	assign g = enA & enB;
	assign p = enA | enB;
	assign out = enA ^ enB ^ c[WIDTH-1:0];
	
	genvar i, j;

    generate 
        for (i = 0; i < WIDTH ; i = i + 1)
        begin
            // Example
            // c[3] = g[2]      + g[1].p[2]     + g[0].p[1].p[2]    + c[0].p[0].p[1].p[2]
            //        temp[3]     temp[2]         temp[1]             temp[0]
            wire[i+1:0] temp;
            
            assign temp[0] = &{c[0], p[i:0]};
            assign temp[i+1] = g[i];

            for (j = 1; j < i+1; j = j + 1)
                assign temp[j] = &{g[j-1], p[i:j]};

            assign c[i+1] = |(temp);
        end         
    endgenerate