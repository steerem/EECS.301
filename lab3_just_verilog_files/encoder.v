module encoder(A, B, M50, switch, encoder_tick, dir, F_en, A_en);


input A, B, M50, switch;
reg aOld;
output reg encoder_tick, dir, F_en, A_en;

always @(posedge M50)
	begin
		encoder_tick <= A&~aOld;
		dir <= B;
		F_en <= switch;
		A_en <= ~switch;
		aOld <= A;
	end
	
endmodule