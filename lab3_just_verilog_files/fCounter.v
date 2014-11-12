module fCounter(encoder_tick, dir, F_en, phi_inc_i);

input encoder_tick, dir, F_en;
output reg [10:0] phi_inc_i;

initial
	begin
		phi_inc_i <= 11'b00000000001;	
	end

always @ (posedge encoder_tick) 
	begin				
		if (F_en)
			begin
				if (phi_inc_i >= 11'b00000000001 && phi_inc_i <= 11'b10111010111)		//between 20 and 20k Hz
					begin
						if (dir)      
							begin 
								phi_inc_i <= phi_inc_i + 11'b00000000001;			
							end
						else	
							begin
								phi_inc_i <= phi_inc_i - 11'b00000000001;			
							end
					end
			end
	end

	
endmodule