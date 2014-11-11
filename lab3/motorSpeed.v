module motorSpeed(A, B, clk, switch, encoder_tick, dir, F_en, A_en);


input A, B, clk, switch;
reg aOld;
output reg encoder_tick, dir, F_en, A_en;

always @(posedge clk)
	begin
		encoder_tick <= A&~aOld;
		dir <= B;
		F_en <= switch;
		A_en <= ~switch;
		aOld <= A;
	end
	
endmodule