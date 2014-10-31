/* EECS 301 - LAB 3 
Benjamin Davis 
Michael Steere 
Sergio Martinez Rios 
*/

module lab3(clk, sclk, speaker);
	input clk;
	output reg speaker;
	output reg sclk ; 
	initial 
			begin 
		sclk <= (500000000/ 440 /4); 
			end 
	parameter clkdivider = 50000000/440/4 ;
	reg [ 23: 0] tone;
	reg [ 15:0]  counter; 
		always @ ( posedge clk) begin
			tone <= tone + 1 ;
			if (counter ==0 ) begin 
			counter <= (tone [23] ? clkdivider -1: clkdivider/2-1); 
			end else begin 
			counter <= counter + 1 ; 
			end 
		end
		always @ ( posedge clk) begin 
			if ( counter == 0 ) begin
				speaker <= ~ speaker; 
			end 
		end 
endmodule 
