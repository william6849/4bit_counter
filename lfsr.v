module lfsr(clk,rst_n,led);
	
	input clk,rst_n;
	output [7:0]led;
	
	reg[7:0]led;
	reg[7:0]Y;
	
	parameter initial_state = 8'b1001_0001; 
	parameter [7:0]Tap_Coefficient = 8'b1000_1110;
	
	always @(posedge clk)
    	if (!rst_n) led <= initial_state;    // Active-low reset to initial state
      		else begin
        		led[0] <= led[7];
        		led[1] <= Tap_Coefficient[7] ? led[0] ^ led[7] : led[0];
        		led[2] <= Tap_Coefficient[6] ? led[1] ^ led[7] : led[1];
        		led[3] <= Tap_Coefficient[5] ? led[2] ^ led[7] : led[2];
        		led[4] <= Tap_Coefficient[4] ? led[3] ^ led[7] : led[3];
        		led[5] <= Tap_Coefficient[3] ? led[4] ^ led[7] : led[4];
        		led[6] <= Tap_Coefficient[2] ? led[5] ^ led[7] : led[5];
        		led[7] <= Tap_Coefficient[1] ? led[6] ^ led[7] : led[6];
    	end //Galois LFSR


endmodule