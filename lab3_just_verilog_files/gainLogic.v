module gainLogic( gain, M50, fsin_o, gainedOut);

input M50;
input reg [11:0] gain;
input [11:0] fsin_o;

reg [11:0] input_offset;
reg [23:0] gainProduct;

output reg [11:0] gainedOut;

always @(posedge M50)
begin
	input_offset <= fsin_o + 12'b100000000000;
	gainProduct <= input_offset * gain; 
	gainedOut[11:0] = gainProduct[23:12];
end

endmodule