/*external control

enable on rise of chB
selects amplitude or frequency based on state of switch
adds or subtracts based on state of chA and boundaries
*/

module control(chA,freq,amp,switch, freq_new,amp_new)

function control;

input chA, switch;
input reg [10:0] freq;
input reg [10:0] amp;
output reg [10:0] freq_new;
output reg [10:0] amp_new;
wire reg ftop = 1, fbot = 1, atop = 1, abot = 1;

begin
	
	if (1 == freq) begin
		fbot = 0;
	end
	if (1000 == freq) begin
		ftop = 0;
	end
	if (0 == amp) begin
		abot = 0;
	end
	if (1000 == amp) begin
		atop = 0;
	end
	
	freq_new = freq + (switch & chA & ftop) - (switch & ~chA & fbot);
   amp_new = amp + (~switch & chA & ftop) - (~switch & ~chA & fbot);

endmodule
	