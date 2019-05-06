module clk_div3(new_clk, clk, rst_n);
	output new_clk;
	input clk, rst_n;
	reg [31:0] num;
	always @(posedge clk or negedge rst_n) begin
		if (!rst_n) num <= 0;
		else num <= num+1;
	end
	assign new_clk = (num==25'b1100110111111110011000000)?1:0 ;
endmodule
