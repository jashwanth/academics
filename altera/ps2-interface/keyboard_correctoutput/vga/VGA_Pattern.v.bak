module	VGA_Pattern	(	//	Read Out Side
						oRed,
						oGreen,
						oBlue,
						iVGA_X,
						iVGA_Y,
						iVGA_CLK,
						//	Control Signals
						iRST_N	);
//	Read Out Side
output	reg	[9:0]	oRed;
output	reg	[9:0]	oGreen;   
output	reg	[9:0]	oBlue;
input	[9:0]		iVGA_X;
input	[9:0]		iVGA_Y;
input				iVGA_CLK;
//	Control Signals
input				iRST_N;

reg[9:0]  count1;
reg[9:0]  count2;


always@(posedge iVGA_CLK or negedge iRST_N)
begin
      count1 <= iVGA_X;
		count2 <= iVGA_Y;
end

always@(posedge iVGA_CLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oRed	<=	0;
		oGreen	<=	0;
		oBlue	<=	0;
	end
	else
	begin
	//   oRed  <= ((iVGA_X>=100 && iVGA_X<=105 && iVGA_Y>=100 && iVGA_Y<=102)||(iVGA_X>=100 && iVGA_X<=105 && iVGA_Y>=120 && iVGA_Y<=122)) ? 256 : 1023;
		oRed	<=	(iVGA_Y<120)					?			256	:
					(iVGA_Y>=120 && iVGA_Y<240)		?			512	:
					(iVGA_Y>=240 && iVGA_Y<360)		?			768	:
																1023;
		oGreen	<=	(iVGA_Y<120)					?			256	:
					(iVGA_Y>=120 && iVGA_Y<240)		?			512	:
					(iVGA_Y>=240 && iVGA_Y<360)		?			768	:
			                           				1023;
	   oBlue	<=	(iVGA_Y<120)					?			256	:
					(iVGA_Y>=120 && iVGA_Y<240)		?			512	:
					(iVGA_Y>=240 && iVGA_Y<360)		?			768	:
																1023;
	//	oGreen	<=	1023;
		//oBlue	   <=	1023;
	end
end

endmodule




