module counter_4bit(num, clk, rst_n,cop,sta);
	output [3:0] num;
	output cop;
	input clk, rst_n, sta;
	wire [3:0] next_num,next_numm;
	reg [3:0] num;
	
	assign next_num=num+1;
	assign next_numm=num-1;
	assign cop=((num==4'b0000 && sta==1)||(num==4'b1001 && sta==0))?1:0;

	always @ (posedge clk,negedge rst_n)
	begin
		if(!rst_n)begin
			num<=4'b0000;
		end else if(num>=4'b1001&&sta==0)begin
			num<=4'b0000;
		end else if(num==4'b0000&&sta==1)begin
			num<=4'b1001;
		end else if(sta==0)begin
			num<=next_num;
		end else if(sta==1)begin
			num<=next_numm;
		end 
		
	end


	

endmodule
