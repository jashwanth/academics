module	VGA_Pattern	(	//	Read Out Side
						oRed,
						oGreen,
						oBlue,
						oval, // ascii value from keyboard from 0-9
						iVGA_X,
						iVGA_Y,
						iVGA_CLK,
						//	Control Signals
						iRST_N,	
						// cursor pos
						icur_x,icur_y,
						//ascii value
						iascii);
//	Read Out Side
output	reg	[9:0]	oRed;
output	reg	[9:0]	oGreen;
output	reg	[9:0]	oBlue;
output   reg   [3:0] oval;
input	[9:0]		iVGA_X;
input	[9:0]		iVGA_Y;
input [7:0]    iascii;
input				iVGA_CLK;
input  [9:0] icur_x;
input  [9:0] icur_y;
reg  [9:0] icureg_x;
reg  [9:0] icureg_y;
//	Control Signals
input				iRST_N;
reg [9:0] flag;

/*always@(posedge iVGA_CLK or negedge iRST_N)
begin
 if(!iRST_N)
 begin
 icureg_x <= (icur_x << 3)+(icur_x << 5);
 icureg_x <= (icur_x << 3)+(icur_x << 5);
 end
 else
  begin
  icureg_x <= 0;
  icureg_y <= 0;
 end
end
*/
always@(posedge iVGA_CLK or negedge iRST_N )
begin
	if(!iRST_N)
	begin
		oRed	<=	0;
		oGreen	<=	0;
		oBlue	<=	0;
		oval <= 0; 
	end
	else
	begin
	  flag[0] <= (iVGA_X-icur_x >= 4 && iVGA_X-icur_x <= 34 && iVGA_Y-icur_y==4);
	  flag[3] <= (iVGA_X-icur_x >= 4 && iVGA_X-icur_x <= 34 && iVGA_Y-icur_y==34);
	  flag[1] <= (iVGA_X-icur_x==34 && iVGA_Y-icur_y >= 4  && iVGA_Y-icur_y <= 19);
	  flag[2] <= (iVGA_X-icur_x==34 && iVGA_Y-icur_y > 19  && iVGA_Y-icur_y <= 34);
	  flag[4] <= (iVGA_X-icur_x==4   && iVGA_Y-icur_y > 19  && iVGA_Y-icur_y <= 34);
	  flag[5] <= (iVGA_X-icur_x==4  && iVGA_Y-icur_y >= 4  && iVGA_Y-icur_y <= 19);
	  flag[6] <= (iVGA_Y-icur_y==19 && iVGA_X-icur_x >= 4  && iVGA_X-icur_x <= 34);
	  casez(iascii)
				8'h30:
				begin
				  oval <= 4'b0000;
				  if(flag[0] || flag[5] || flag[4] || flag[3] || flag[2] || flag[1])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				  	
				8'h31: 
				 begin
				  oval <= 4'b0001;
	/*			  if((iVGA_X-icur_x>=20)&&(iVGA_Y-icur_y>=5 && iVGA_Y-icur_y<=35))
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end   */
				  if(flag[1] || flag[2])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				
				
				8'h32: 
				begin
				  oval <= 4'b0010;
				  if(flag[0] || flag[1] || flag[6] || flag[4] || flag[3])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				
				
				8'h33: 
				begin
				  oval <= 4'b0011;
				  if(flag[0] || flag[1] || flag[6] || flag[2] || flag[3])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				
				8'h34: 
				begin
				  oval <= 4'b0100;
				  if( flag[5] || flag[6] || flag[1] || flag[2])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				8'h35:
				begin
				  oval <= 4'b0101;
				  if(flag[0] || flag[5] || flag[6] || flag[2] || flag[3])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				8'h36: 
				begin
				  oval <= 4'b0110;
				  if(flag[0] || flag[5] || flag[4] || flag[3] || flag[2] || flag[6] )
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				8'h37: 
				begin
				  oval <= 4'b0111;
				  if(flag[0] || flag[1] || flag[2])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				8'h38: 
				begin
				  oval <= 4'b0010;
				  if(flag[0] || flag[1] || flag[6] || flag[4] || flag[3] || flag[2] || flag[5])
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				8'h39: 
				begin
				  oval <= 4'b1001;
				  if(flag[0] || flag[5] || flag[6] || flag[1] || flag[2] )
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
				default:
				begin
				  oval <= 4'b0000;
				  if(flag[0] || flag[5] || flag[4] || flag[3] || flag[2] || flag[1] )
				  begin
				    oRed <= 1023;
					 oGreen <= 0;
					 oBlue <= 0;
				  end
				  else
				   begin
					 oRed <= 0;
					 oGreen <= 0;
					 oBlue <= 0;
					 end
				end
	  endcase
	  
	/*	oRed	<=	(iVGA_Y<120)					?			256	:
					(iVGA_Y>=120 && iVGA_Y<240)		?			512	:
					(iVGA_Y>=240 && iVGA_Y<360)		?			768	:
																1023;
		oGreen	<=	(iVGA_X<80)						?			128	:
					(iVGA_X>=80 && iVGA_X<160)		?			256	:
					(iVGA_X>=160 && iVGA_X<240)		?			384	:
					(iVGA_X>=240 && iVGA_X<320)		?			512	:
					(iVGA_X>=320 && iVGA_X<400)		?			640	:
					(iVGA_X>=400 && iVGA_X<480)		?			768	:
					(iVGA_X>=480 && iVGA_X<560)		?			896	:
																1023;
		oBlue	<=	(iVGA_Y<60)						?			1023:
					(iVGA_Y>=60 && iVGA_Y<120)		?			896	:
					(iVGA_Y>=120 && iVGA_Y<180)		?			768	:
					(iVGA_Y>=180 && iVGA_Y<240)		?			640	:
					(iVGA_Y>=240 && iVGA_Y<300)		?			512	:
					(iVGA_Y>=300 && iVGA_Y<360)		?			384	:
					(iVGA_Y>=360 && iVGA_Y<420)		?			256	:
																128	;  */
	end
end

endmodule