module btn_deb (clk,rst_n,key_in,key_out);
	input clk,rst_n,key_in;
	output key_out;
	wire key_out;
	reg [3:0]num;

always @(posedge clk or negedge rst_n) begin
	if (!rst_n) begin num <= 4'b0000; end

	else if ( key_in == 1 ) begin num <= 4'b0000 ;end
	else if (num < 4'b0010 )begin 
		num <= num+1; end
	end 


assign key_out = ( num==4'b0001) ? 0 : 1 ;




endmodule