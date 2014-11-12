module DAC(gainedOut, M50, ldac, dIn, sclk, clk, out_valid, clken);

input [11:0] gainedOut;
input M50, out_valid;
reg [5:0] count;
output reg ldac, dIn, clk, sclk, clken;
reg sclk;
reg [11:0] data;

initial
	begin
		ldac <= 0;
		count <= 0;
		dIn <= 0;
		sclk <= 0;
		clk <= 1;		//sync.DAC
		clken <= 1;
	end
	
always @(posedge M50)
	begin
		sclk <= ~sclk;
		
		if (out_valid && count <= 50) begin
			data <= gainedOut;
		end
		
		if (count == 50) begin
			clk <= 0;
		end
		
		if (~clk && sclk)begin	
			if (count <= 60) begin
				dIn <= 0;
			end else if (count <= 64) begin
				dIn <= 1;
			end else if (count <= 72) begin
				dIn <= 0;
			end else if (count <= 96) begin
				dIn <= data[23-count];
			end else if (count <= 112) begin
				dIn <= 0;
			end
		end
				
		count <= count + 1;
		
		if (count == 114) begin
			clk <= 1;
			count <= 0;
		end

	end			
								
endmodule
