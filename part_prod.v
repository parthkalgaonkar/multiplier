module part_prod(
	input [2:0]x,
	input [7:0]a,
	output reg [7:0]m
);
	
	always @(*) begin
		case(x)
			0: m = 0;
			1: m = a;
			2: m = a;
			3: m = a<<1;
			4: m = -(a<<1);
			5: m = -a;
			6: m = -a;
			7: m = 0;
		default: m = 0;
		endcase
	end
endmodule