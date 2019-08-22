`timescale 1ns/1ps
module tb();
	reg [7:0]a;
	reg [7:0]b;
	reg clk;
	reg reset;
	reg init;
	wire [15:0]y;
	wire busy;

	mult_8bit dut(
		.a(a),
		.b(b),
		.clk(clk),
		.reset(reset),
		.init(init),
		.y(y),
		.busy(busy)
	);

	initial begin
		clk=0;
		forever #5 clk=~clk;
	end

	initial begin
		#000 a=0;
		#000 b=0;
		#000 reset=1;
		#000 init=0;
		#010 reset=0;
		#000 a=-11;
		#000 b=-5;
		#010 init=1;
		#010 init=0;
		#050 reset=1;
		#010 reset=0;
		#000 a=-11;
		#000 b=5;
		#010 init=1;
		#010 init=0;
		#100 $finish;
	end

	initial begin
		$dumpfile("wave.vcd");
		$dumpvars;
	end
endmodule