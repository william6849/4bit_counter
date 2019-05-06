module counter_4bit2_cd(num, clk, rst_n,cop,sta,en);
	output [3:0] num;
	output cop;
	input clk, rst_n, sta, en;
	wire [3:0] next_num,next_numm;
	reg [3:0] num;

	assign next_num=en?num+1:num;
	assign next_numm=en?num-1:num;
	assign cop=((num==4'b0000 && sta==1)||(num==4'b1001 && sta==0))?1:0;

	always @ (posedge clk,negedge rst_n)
	begin
		if(!rst_n)begin
			num<=4'b0011;
		end else if(sta==0)begin
			num<=next_num;
		end else if(sta==1)begin
			num<=next_numm;
		end 
		
	end


	

endmodule
