
module seven_seg ( oSEG7 , oCOM , clk , rst_n , d4 , d3 , d2 , d1 ) ;
	input clk, rst_n ;
	input [3:0] d4, d3, d2, d1 ;
	output [7:0] oSEG7 ;
	output [3:0] oCOM ;
	reg [7:0] oSEG7 ;
	reg [1:0] stat ;
	reg [3:0] digit ;
	reg [3:0] oCOM ;
	

	// FSM
	always @ ( posedge clk or negedge rst_n ) begin
		if ( !rst_n ) begin
			stat <= 2'b00 ;
		end else begin
			stat <= stat + 1'b1 ;
		end
	end
	
	// Mux
	always @ (*) begin
		if ( stat == 2'b00 ) digit = d1 ;
		else if ( stat == 2'b01 ) digit = d2 ;
		else if ( stat == 2'b10 ) digit = d3 ;
		else digit = d4 ;
	end
	
	// Decoder_1
	always @ (*) begin
		if ( stat == 2'b00 ) oCOM = 4'b0111 ;
		else if ( stat == 2'b01 ) oCOM = 4'b1011 ;
		else if ( stat == 2'b10 ) oCOM = 4'b1101 ;
		else oCOM = 4'b1110 ;
	end
	
	// Decoder_2
	always @ (*) begin
		if 		( digit == 4'b0000 &&stat==2'b10 ) oSEG7 = 8'b11111111 ;
		else if ( digit == 4'b0000 ) oSEG7 = 8'b10010000 ;
		else if ( digit == 4'b0001 ) oSEG7 = 8'b10011111 ;
		else if ( digit == 4'b0010 ) oSEG7 = 8'b01011000 ;
		else if ( digit == 4'b0011 ) oSEG7 = 8'b00011001 ;
		else if ( digit == 4'b0100 ) oSEG7 = 8'b00010111 ;
		else if ( digit == 4'b0101 ) oSEG7 = 8'b00110001 ;
		else if ( digit == 4'b0110 ) oSEG7 = 8'b00110000 ;
		else if ( digit == 4'b0111 ) oSEG7 = 8'b10011101 ;
		else if ( digit == 4'b1000 ) oSEG7 = 8'b00010000 ;
		else if ( digit == 4'b1001 ) oSEG7 = 8'b00010101 ;
		
		else if ( digit == 4'b1010 ) oSEG7 = 8'b00010110 ;//x
		else if ( digit == 4'b1011 ) oSEG7 = 8'b00010011 ;//y
		else if ( digit == 4'b1100 ) oSEG7 = 8'b00010100 ;//a
		else if ( digit == 4'b1101 ) oSEG7 = 8'b00110001 ;//s
		else if ( digit == 4'b1110 ) oSEG7 = 8'b01111111 ;//-
		else if ( digit == 4'b1111 ) oSEG7 = 8'b11111111 ;//
		else oSEG7 = 8'b10000000 ;
	end
	
endmodule