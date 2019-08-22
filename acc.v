module acc(
	input [7:0]q,
	input [7:0]m,
	input clk,
	input init,
	input busy,
	input reset,
	output reg [16:0]a
);
	
	always @(posedge clk) begin
		if(init) begin
			a[8:1] <= q;
		end
		else if (reset) begin
			a <= 0;
		end
		else if (busy) begin
			a<=$signed(a+(m<<9))>>>2;
		end
	end
endmodule