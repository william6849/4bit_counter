
module main (seg,com,clk,rst_n,btn,led);

	output[7:0] seg,led;
	output[3:0] com;
	input clk,rst_n;
	input [7:0]btn;
	wire[3:0] d4,d3,d2,d1;//led reg
	wire[7:0] led;
	wire nclk,nclk2,nclk3;//clk_div
	wire [7:0]btn_debed;
	wire co1,co2,co3,co4;
	wire working_sig;
	wire add_point;

	
	clk_div clk_gen(nclk,clk,rst_n);//normal
	clk_div2 clk_gen2(nclk2,clk,rst_n);//slow
	clk_div3 clk_gen3(nclk3,clk,rst_n);//1s
	
	counter_4bit_cd bcdx(d2,nclk3,rst_n,co3,1'b1,working_sig);
	counter_4bit2_cd bcdx2(d1,co3,rst_n,co4,1'b1,working_sig);
	
	counter_4bit point(d4,add_point,rst_n,co1,1'b0);
	counter_4bit2 point2(d3,co1,rst_n,co2,1'b0);
	
	assign working_sig = (d1==d2==0)?0:1;
	
	seven_seg sev(seg,com,nclk2,rst_n,d4,d3,d2,d1);//led d1>d4
	
	led_control lc(clk,nclk3,rst_n,working_sig,btn_deb,led,add_point);
	
	generate
		genvar gi;
 		for (gi=0;gi<7;gi=gi+1)begin:btn_ctl
    		btn_deb bta(clk,rst_n,btn[gi],btn_debed[gi]);
  		end
	endgenerate

endmodule