/*fuck modularization, just put this shit in the main code file*/

module lab3(switch, chA, chB);

input switch, chA, chB;
reg [10:0] freq, amp;
reg ftop,fbot,atop,abot;

initial begin end

always @ (chB) begin
	
	ftop <= 1; fbot <= 1; atop <= 1; abot <= 1; 	// init/reset bound sense
	if (1 == freq) begin 								// test bounds
		fbot <= 0;
	end
	if (1000 == freq) begin
		ftop <= 0;
	end
	if (0 == amp) begin
		abot <= 0;
	end
	if (1000 == amp) begin
		atop <= 0;
	end

	freq <= freq + (switch & chA & ftop) - (switch & ~chA & fbot);		// inc/dec freq/amp
   amp <= amp + (~switch & chA & ftop) - (~switch & ~chA & fbot);

end  

endmodule
