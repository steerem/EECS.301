module aCounter(encoder_tick, dir, A_en, gain);

input encoder_tick, dir, A_en; 
output reg [11:0] gain;

initial
	begin
		gain = 12'b100000000000;    
	end	

always @ (posedge encoder_tick) 
	begin							
		if (A_en)
			begin
				if (gain >= 12'b000000000000 && gain <= 12'b111111110000)
					begin
						if (dir)      
							begin 
								gain <= gain + 12'b000000010000;			
							end
						else	
							begin
								gain <= gain - 12'b000000010000;			
							end
					end
			end
	end
	
endmodule