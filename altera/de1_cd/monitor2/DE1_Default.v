
module DE1_Default
	(
	//	Clock Input		 
		CLOCK_24,						//	24 MHz
		CLOCK_27,						//	27 MHz
		CLOCK_50,						//	50 MHz
		EXT_CLOCK,						//	External Clock
		KEY,							//	Pushbutton[3:0]
		SW,								//	Toggle Switch[9:0]

	////////////////////	VGA		////////////////////////////
		VGA_HS,							//	VGA H_SYNC
		VGA_VS,							//	VGA V_SYNC
		VGA_R,   						//	VGA Red[3:0]
		VGA_G,	 						//	VGA Green[3:0]
		VGA_B,  						//	VGA Blue[3:0]
		
	);

// Clock Input	
input	[1:0]	CLOCK_24;				//	24 MHz
input	[1:0]	CLOCK_27;				//	27 MHz
input			CLOCK_50;				//	50 MHz
input			EXT_CLOCK;				//	External Clock

input	[3:0]	KEY;					//	Pushbutton[3:0]

input	[9:0]	SW;						//	Toggle Switch[9:0]

// VGA	
output			VGA_HS;					//	VGA H_SYNC
output			VGA_VS;					//	VGA V_SYNC
output	[3:0]	VGA_R;   				//	VGA Red[3:0]
output	[3:0]	VGA_G;	 				//	VGA Green[3:0]
output	[3:0]	VGA_B;   				//	VGA Blue[3:0]
            
 
wire	VGA_CTRL_CLK;
wire	AUD_CTRL_CLK;
   
wire	[9:0]	mVGA_X;
wire	[9:0]	mVGA_Y;
wire	[9:0]	mVGA_R;
wire	[9:0]	mVGA_G;
wire	[9:0]	mVGA_B;

wire	[9:0]	mPAR_R;
wire	[9:0]	mPAR_G;
wire	[9:0]	mPAR_B;

wire	[9:0]	mPAR1_R;
wire	[9:0]	mPAR1_G;
wire	[9:0]	mPAR1_B;

wire	[9:0]	mPAR2_R;
wire	[9:0]	mPAR2_G;
wire	[9:0]	mPAR2_B;

wire	[9:0]	mPAR3_R;
wire	[9:0]	mPAR3_G;
wire	[9:0]	mPAR3_B;

wire	[9:0]	mPAR4_R;
wire	[9:0]	mPAR4_G;
wire	[9:0]	mPAR4_B;

wire	[9:0]	mPAR5_R;
wire	[9:0]	mPAR5_G;
wire	[9:0]	mPAR5_B;

wire	[9:0]	mOSD_R;
wire	[9:0]	mOSD_G;
wire	[9:0]	mOSD_B;
wire	[9:0]	oVGA_R;
wire	[9:0]	oVGA_G;
wire	[9:0]	oVGA_B;

wire	[19:0]	mVGA_ADDR;
reg	[27:0]	Cont;
reg	ST;

always@(posedge CLOCK_50)		Cont	<=	Cont+1'b1;



//	VGA Data 10-bit to 4-bit
assign	VGA_R		=	oVGA_R[9:6];
assign	VGA_G		=	oVGA_G[9:6];
assign	VGA_B		=	oVGA_B[9:6];

//	VGA Source Select
/* assign	mVGA_R		=	SW[0]	?	mPAR_R	:	mOSD_R	;
   assign	mVGA_G		=	SW[0]	?	mPAR_G	:	mOSD_G	;
   assign	mVGA_B		=	SW[0]	?	mPAR_B	:	mOSD_B	;
*/
   assign	mVGA_R		=	( SW[0] & !SW[1] & !SW[2] ) ? mPAR1_R : ( !SW[0] & SW[1] & !SW[2]  ) ? mPAR2_R : ( !SW[0] & !SW[1] & SW[2]  ) ? mPAR3_R : mPAR4_R ;
	assign	mVGA_G		=	( SW[0] & !SW[1] & !SW[2] ) ? mPAR1_G : ( !SW[0] & SW[1] & !SW[2]  ) ? mPAR2_G : ( !SW[0] & !SW[1] & SW[2]  ) ? mPAR3_G : mPAR4_G ;
	assign	mVGA_B		=	( SW[0] & !SW[1] & !SW[2] ) ? mPAR1_B : ( !SW[0] & SW[1] & !SW[2]  ) ? mPAR2_B : ( !SW[0] & !SW[1] & SW[2]  ) ? mPAR3_B : mPAR4_B ;
	
VGA_Audio_PLL 		u1	(	.inclk0(CLOCK_27[0]),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK)	); 

VGA_Controller		u2	(	//	Host Side
							.iCursor_RGB_EN(4'h7),	
							.oAddress(mVGA_ADDR),					
							.oCoord_X(mVGA_X),
							.oCoord_Y(mVGA_Y),
							.iRed(mVGA_R),
							.iGreen(mVGA_G),
							.iBlue(mVGA_B),
							//	VGA Side
							.oVGA_R(oVGA_R),
							.oVGA_G(oVGA_G),
							.oVGA_B(oVGA_B),
							.oVGA_H_SYNC(VGA_HS),
							.oVGA_V_SYNC(VGA_VS),
							//	Control Signal
							.iCLK(VGA_CTRL_CLK),
							.iRST_N(KEY[0])	);

VGA_Pattern			u3	(	//	Read Out Side
							.oRed(mPAR1_R),
							.oGreen(mPAR1_G),
							.oBlue(mPAR1_B),
							.iVGA_X(mVGA_X),
							.iVGA_Y(mVGA_Y),
							.iVGA_CLK(VGA_CTRL_CLK),
							//	Control Signals
							.iRST_N(KEY[0])	);

VGA_Pattern2			u4	(	//	Read Out Side
							.oRed(mPAR2_R),
							.oGreen(mPAR2_G),
							.oBlue(mPAR2_B),
							.iVGA_X(mVGA_X),
							.iVGA_Y(mVGA_Y),
							.iVGA_CLK(VGA_CTRL_CLK),
							//	Control Signals
							.iRST_N(KEY[0])	);

VGA_Pattern3			u5	(	//	Read Out Side
							.oRed(mPAR3_R),
							.oGreen(mPAR3_G),
							.oBlue(mPAR3_B),
							.iVGA_X(mVGA_X),
							.iVGA_Y(mVGA_Y),
							.iVGA_CLK(VGA_CTRL_CLK),
							//	Control Signals
							.iRST_N(KEY[0])	);
							
VGA_Pattern4			u6	(	//	Read Out Side
							.oRed(mPAR4_R),
							.oGreen(mPAR4_G),
							.oBlue(mPAR4_B),
							.iVGA_X(mVGA_X),
							.iVGA_Y(mVGA_Y),
							.iVGA_CLK(VGA_CTRL_CLK),
							//	Control Signals
							.iRST_N(KEY[0])	);

 
endmodule
