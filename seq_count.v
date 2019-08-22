module seq_count(
	input clk,
	input reset,
	input init,
	output reg busy
);
	
	reg [3:0]a;

	always @(posedge clk) begin
		if(reset) a <= 0;
		else if (init) a <= 4;
		else if(a>0) a <= a-1;
	end

	always @(*) begin
		if(a==0) busy = 0;
		else busy = 1;
	end
endmodule