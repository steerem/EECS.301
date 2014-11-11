module clock(motorSpeedReset, serialClock, syncDAC, syncNCO, faEnable);

input MHz50Clk; 
output reg motorSpeedReset, syncDAC, syncNCO, faEnable, serialClock;
reg countSerialClock;
reg syncDACold;
reg [22:0] countMotorSpeedReset;
reg [6:0] countSyncDAC;
reg [15:0] countFaEnable;

initial
	begin
		faEnable <= 0;
		syncDACold <= 0;
	end
	
always @(posedge MHz50Clk)
	begin
		
		serialClock <= MHz50Clk;
		
		countMotorSpeedReset = countMotorSpeedReset + 1;
		if (countMotorSpeedReset == 5000000)					
			begin
				countMotorSpeedReset	<= 0;
				motorSpeedReset <= 1;
			end
			
		else if(countMotorSpeedReset == 1)
			begin
				motorSpeedReset <= 0;
			end
		
		countSyncDAC = countSyncDAC + 1;							
			if (countSyncDAC == 32)
				syncDAC <= 1;
			else if (countSyncDAC == 82)
				begin
					syncDAC <= 0;
					countSyncDAC <= 0;
				end
			
		if (~syncDACold && syncDAC)
			begin
				syncNCO <= 1;
			end
		
		else
			syncNCO <= 0;
			
		syncDACold <= syncDAC;
		
		countFaEnable = countFaEnable + 1; 			//pretty sure we don't need this
		if (countFaEnable == 25000)
			begin
			faEnable <= ~faEnable;
			end
		else if (countFaEnable == 50000)
			begin	
				faEnable <= ~faEnable;
				countFaEnable <= 0;
			end
	end

endmodule