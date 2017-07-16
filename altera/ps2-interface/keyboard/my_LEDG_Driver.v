module my_LEDG_Driver(LED,iCLK,iRST_N,data);
output	[7:0]	LED;
input			iCLK;
input			iRST_N;
input [7:0] data;
reg		[20:0]	Cont;
reg		[7:0]	mLED;

always@(posedge iCLK)	Cont	<=	Cont+1'b1;

always@(posedge Cont[20] or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		mLED	<=	8'b00000000;
	end
	else
	begin
		mLED <= data;
	end
end

assign	LED	=	mLED;

endmodule