// RAM

module RAM(
	output reg [3:0] data_out,
	input [8:0] write_address,	//will be changed by b1,b2 in ext
	input [8:0] read_address,	//comes from display process, will go to rom
	input write, 					//b0
	input s0, s1, s2, s3			//switch inputs
	input clk
	);

	reg [3:0] RAM [0:511];
	reg [3:0] data;
	assign data = {s0,s1,s2,s3};	//data to write
	
	always@(posedge clk) begin
		if (write) begin
			RAM[address] <= data;
		end
		data_out <= RAM[address];
	end
	
endmodule 
	