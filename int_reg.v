module int_reg(
	input clk,
	input init,
	input reset,
	input [7:0]a_in,
	output reg [7:0]a_out
);
	
	always @(posedge clk) begin
		if (reset) a_out<=0;
		else if(init) a_out<=a_in; 
	end
endmodule