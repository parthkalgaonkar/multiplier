module mult_8bit(
	input [7:0]a,
	input [7:0]b,
	input clk,
	input reset,
	input init,
	output [15:0]y,
	output busy
);
	
	wire [2:0]x;
	wire [7:0]m;
	wire [16:0]z;
	wire [7:0]c;

	seq_count sc(
		.clk(clk),
		.reset(reset),
		.init(init),
		.busy(busy)
	);

	int_reg ir(
		.clk(clk),
		.init(init),
		.reset(reset),
		.a_in(a),
		.a_out(c)
	);

	bit_extract be(
		.a(z),
		.x(x),
		.y(y)
	);

	part_prod pp(
		.x(x),
		.a(c),
		.m(m)
	);

	acc ac(
		.q(b),
		.m(m),
		.clk(clk),
		.init(init),
		.busy(busy),
		.reset(reset),
		.a(z)
	);
endmodule