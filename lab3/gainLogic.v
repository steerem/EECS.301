module gainLogic( gain, MHz50Clk, fsin_o, gainedOut);

input MHz50Clk;
input reg [11:0] gain;
input [11:0] fsin_o;

reg [11:0] input_offset;
reg [23:0] gainProduct;

output reg [11:0] gainedOut;

always @(posedge MHz50Clk)
begin
	input_offset <= fsin_o + 12'b100000000000;
	gainProduct <= input_offset * gain; 
	gainedOut[11:0] = gainProduct[23:12];
end

endmodule