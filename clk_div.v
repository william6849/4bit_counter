module clk_div(new_clk, clk, rst_n);
	output new_clk;
	input clk, rst_n;
	reg [31:0] num;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) num <= 0;
		else num <= num+1;
	end
	assign new_clk = num[21] ;
endmodule
