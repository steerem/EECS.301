//needs to be modified to output f (figure out where output goes)

module fCounter(encoder_tick, dir, F_en, F_set);

input encoder_tick, dir, F_en;
output reg [9:0] F_set;


initial
	begin
		F_set <= 10'b0000000001;	
	end



always @ (posedge encoder_tick) 
	begin				
		if (F_en)
			begin
				if (F_set >= 10'b0000000001 && F_set <= 10'b1101000111)
				
					begin
						if (dir)      
							begin 
								F_set <= F_set + 10'b0000000001;			
							end
						else	
							begin
								F_set <= F_set - 10'b0000000001;			
							end
					end
			end
	end

	
endmodule