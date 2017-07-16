module	VGA_Pattern3	(	//	Read Out Side
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

always@(posedge iVGA_CLK or negedge iRST_N)
begin
	if(!iRST_N)
	begin
		oRed	 <=	0;
		oGreen <=	0;
		oBlue	 <=	0;
	end
	else
	begin
		oRed	 <=	 0;
		oGreen <=	 0;
		oBlue	 <=	 512 ;
	end
end

endmodule