module led_control(clk,clk_real,rst_n,working_sig,btn,led,add_point);

	input clk,clk_real,rst_n,working_sig;
	input [7:0]btn;
	output [7:0]led;
	output add_point;
	
	wire [7:0]attack_signal;
	reg [7:0]led;
	wire [7:0]led_stat;
	reg add_point;
	wire [7:0]btn_u; 
	reg press_stat;
	
	assign  btn_u = ~btn;
	 
	generate
		genvar gi;
 		for (gi=0;gi<7;gi=gi+1)begin:assig
    		assign attack_signal[gi]=(led_stat[gi]==btn_u[gi]==1'b1)?1:0;
  		end
	endgenerate
/*	
	generate
		genvar gi2;
		for (gi2=0;gi2<7;gi2=gi2+1)begin:att
    		if(attack_signal[gi2]==1)
  		end
	endgenerate
*/	
	
	lfsr lf (clk_real,rst_n,led_stat);
	
	always @ (posedge clk or posedge clk_real or negedge rst_n )begin
		if(!rst_n)begin
			add_point<=1'b0;
		end else if(clk_real)begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led<=led_stat;
				add_point<=1'b0;
			end
		end else 
		
		if(attack_signal[0])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[0]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[1])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[1]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[2])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[2]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[3])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[3]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[4])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[4]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[5])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[5]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[6])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[6]<=1'b0;
				add_point<=1'b1;
			end
		end	else if(attack_signal[7])begin
			if(!working_sig)begin 
				led<=8'b11111111;
			end else begin
				led[7]<=1'b0;
				add_point<=1'b1;
			end
		end	else begin
			add_point<=1'b0;
		end
	
	
			
	end
	
	
	
endmodule