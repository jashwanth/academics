	//`timescale 1ps / 1ps
	module keyboard(
		 CLOCK_24,						//	24 MHz
		 CLOCK_27,						//	27 MHz
		 CLOCK_50,						//	50 MHz
		 EXT_CLOCK,						//	External Clock
		 KEY,							//	Pushbutton[3:0]
		 SW,								//	Toggle Switch[9:0]
		 // VGA
		 VGA_HS,							//	VGA H_SYNC
		 VGA_VS,							//	VGA V_SYNC
		 VGA_R,   						//	VGA Red[3:0]aaa
		 VGA_G,	 						//	VGA Green[3:0]
		 VGA_B,  						//	VGA Blue[3:0]
		 
		 ////////////////	Audio CODEC		////////////////////////
			AUD_ADCLRCK,					//	Audio CODEC ADC LR Clock
			AUD_ADCDAT,						//	Audio CODEC ADC Data
			AUD_DACLRCK,					//	Audio CODEC DAC LR Clock 
			AUD_DACDAT,						//	Audio CODEC DAC Data
			AUD_BCLK,						//	Audio CODEC Bit-Stream Clock
			AUD_XCK,						//	Audio CODEC Chip Clock
			
		 ////////////////////	PS2		////////////////////////////
			PS2_DAT,						//	PS2 Data
			PS2_CLK,						//	PS2 Clock
	 
		 ////////////////////	7-SEG Dispaly	////////////////////
			HEX0,							//	Seven Segment Digit 0
			HEX1,							//	Seven Segment Digit 1
			HEX2,							//	Seven Segment Digit 2
			HEX3,							//	Seven Segment Digit 3
			////////////////////////	LED		////////////////////////
			LEDG,							//	LED Green[7:0]
			LEDR,							//	LED Red[9:0]
	 
	 );
	parameter  lowrate_count = 400000;
	 
	input	[1:0]	CLOCK_24;				//	24 MHz
	input	[1:0]	CLOCK_27;				//	27 MHz
	input			CLOCK_50;				//	50 MHz
	input			EXT_CLOCK;				//	External Clock
	////////////////////////	Push Button		////////////////////////
	input	[3:0]	KEY;					//	Pushbutton[3:0]
	////////////////////////	DPDT Switch		////////////////////////
	input	[9:0]	SW;						//	Toggle Switch[9:0]
	////////////////////////	7-SEG Dispaly	////////////////////////
	output	[6:0]	HEX0;					//	Seven Segment Digit 0
	output	[6:0]	HEX1;					//	Seven Segment Digit 1
	output	[6:0]	HEX2;					//	Seven Segment Digit 2
	output	[6:0]	HEX3;					//	Seven Segment Digit 3
	////////////////////////////	LED		////////////////////////////
	output	[7:0]	LEDG;					//	LED Green[7:0]
	output	[9:0]	LEDR;					//	LED Red[9:0]
	////////////////////////	PS2		////////////////////////////////
	input		 	PS2_DAT;				//	PS2 Data
	input			PS2_CLK;				//	PS2 Clock
	////////////////////////	VGA			////////////////////////////
	output			VGA_HS;					//	VGA H_SYNC
	output			VGA_VS;					//	VGA V_SYNC
	output	[3:0]	VGA_R;   				//	VGA Red[3:0]
	output	[3:0]	VGA_G;	 				//	VGA Green[3:0]
	output	[3:0]	VGA_B;   				//	VGA Blue[3:0]
	////////////////////	Audio CODEC		////////////////////////////
	output			AUD_ADCLRCK;			//	Audio CODEC ADC LR Clock
	input			AUD_ADCDAT;				//	Audio CODEC ADC Data
	output			AUD_DACLRCK;			//	Audio CODEC DAC LR Clock
	output			AUD_DACDAT;				//	Audio CODEC DAC Data
	inout			AUD_BCLK;				//	Audio CODEC Bit-Stream Clock
	output			AUD_XCK;				//	Audio CODEC Chip Clock
	
	
	wire my_clk_vga;
	reg my_clk_vga_reg;
	assign my_clk_vga = my_clk_vga_reg;
	
	//	SEG7
	wire [31:0] mSEG7_DIG;
	//	PS2
	wire [7:0] PS2_ASCII;
	wire PS2_Error,PS2_Ready;
	wire [7:0] trigger;
	reg [7:0] ascii_conv;
	
	// code edit by me
	wire [15:0] inpto7seg;
	
	// VGA
	wire	VGA_CTRL_CLK;
	wire	AUD_CTRL_CLK;
		
	wire	[9:0]	mVGA_X;
	wire	[9:0]	mVGA_Y;
	wire	[9:0]	mVGA_R;
	wire	[9:0]	mVGA_G;
	wire	[9:0]	mVGA_B;
	wire	[9:0]	mPAR1_R;
	wire	[9:0]	mPAR1_G;
	wire	[9:0]	mPAR1_B;
	
	wire	[9:0]	mOSD_R;
	wire	[9:0]	mOSD_G;
	wire	[9:0]	mOSD_B;
	wire	[9:0]	oVGA_R;
	wire	[9:0]	oVGA_G;
	wire	[9:0]	oVGA_B;
	
	wire	[19:0]	mVGA_ADDR;
	reg	[20:0]	Cont;
	//code by me
	wire   [9:0] col_no ;
	reg   [5:0] col_no_index;
	wire   [9:0] row_no ;
	reg   [5:0] row_no_index;
   //upto here 
	reg	ST;
	wire		DLY_RST;
reg [2:0] count;	

 // ram internal
 reg [5:0] ram_add;
reg my_ram_wen;
wire [7:0] ram_out;
reg my_clock;
	
always@(PS2_ASCII)
begin
 casez(PS2_ASCII)	
	8'h30: ascii_conv <= 8'h00;
	8'h31: ascii_conv <= 8'h01;
	8'h32: ascii_conv <= 8'h02;
	8'h33: ascii_conv <= 8'h03;
	8'h34: ascii_conv <= 8'h04;
	8'h35: ascii_conv <= 8'h05;
	8'h36: ascii_conv <= 8'h06;
	8'h37: ascii_conv <= 8'h07;
	8'h38: ascii_conv <= 8'h08;
	8'h39: ascii_conv <= 8'h09;
	default:ascii_conv <= 8'h00;
	endcase
end
	
/*  here row_no = 480/40 n col_no = 640/40 */
always@(posedge PS2_Ready) 
 begin
   if(Cont >= lowrate_count)my_clk_vga_reg <= 1;
	else my_clk_vga_reg <= 0;
	 
   if(count>2)
	 begin
	   my_ram_wen <= 1'b1;
		ram_add <= ram_add+1'b1;
		count <= count-2;
/*	  if(col_no >= 600) 
	   begin
	   col_no <= 0; // col_no & 10'b0000000000;
		col_no_index <= 0;
	   	if(row_no >= 440)begin row_no <= 0;row_no_index<=0; end //row_no & 10'b0000000000; 
	      else begin row_no <=  row_no+10'b0000101000;row_no_index<=row_no_index+1'b1; end
      end
	  else begin col_no <= col_no+10'b0000101000;col_no_index<=col_no_index+1'b1; end */
 	 end
	 else 
	 begin       
	   my_ram_wen <= 1'b0;
	   count <= count+1'b1;
	 end
/*	 else if(count!=4) 
	  begin 
	    count <= count+1'b1;
		 my_ram_wen<=0;
		 my_clock <= 0;
	  end */ 
 end  
 always@(posedge CLOCK_50)		 Cont	<=	Cont+1'b1;
	  
 //assign ram_add = (count==3) ? (ram_add+1'b1) : ram_add;
// assign	mSEG7_DIG	=	{	Cont[27:24],Cont[23:20],Cont[19:16],Cont[15:12]	};
	
	// code by me
// assign inpto7seg = {col_no[7:0],PS2_ASCII};
	assign inpto7seg = {col_no[7:0],ascii_conv};
	//	VGA Data 10-bit to 4-bit
	assign	VGA_R		=	oVGA_R[9:6];
	assign	VGA_G		=	oVGA_G[9:6];
	assign	VGA_B		=	oVGA_B[9:6];
	
	//	VGA Source Select
	/* assign	mVGA_R		=	SW[0]	?	mPAR_R	:	mOSD_R	;
		assign	mVGA_G		=	SW[0]	?	mPAR_G	:	mOSD_G	;
		assign	mVGA_B		=	SW[0]	?	mPAR_B	:	mOSD_B	;
	*/
	assign	mVGA_R		=	 mPAR1_R ;
	assign	mVGA_G		=	 mPAR1_G ;
	assign	mVGA_B		=	 mPAR1_B ;
	
	Reset_Delay			d0	(	.iCLK(CLOCK_50),.oRESET(DLY_RST)	);
		
	VGA_Audio_PLL 		p1	(	.areset(~DLY_RST),.inclk0(CLOCK_27[0]),.c0(VGA_CTRL_CLK),.c1(AUD_CTRL_CLK) );
	
	VGA_Controller		u8	( // row and cols for display	
	                       //  .irow_no(row_no),
								//	 .icol_no(col_no),
								//	Host Side
								.iCursor_RGB_EN({4'h7}),
								.iCursor_X(mCursor_x),
								.iCursor_Y(mCursor_y),
								.iCursor_R(mVGA_R),
								.iCursor_G(mVGA_G),
								.iCursor_B(mVGA_B),							
								.oAddress(mVGA_ADDR),
								.oCoord_X(mVGA_X),
								.oCoord_Y(mVGA_Y),
								.orow_no(row_no),
								.ocol_no(col_no),
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
								.iRST_N(DLY_RST)	);
								
	VGA_Pattern			u3	(	//	Read Out Side
								.oRed(mPAR1_R),
								.oGreen(mPAR1_G),
								.oBlue(mPAR1_B),
								.iVGA_X(mVGA_X),
								.iVGA_Y(mVGA_Y),
								.iVGA_CLK(VGA_CTRL_CLK),
								//	Control Signals
								.iRST_N(KEY[0]),
								.icur_x(col_no),
								.icur_y(row_no),
								.iascii(ram_out) );
								
	SEG7_LUT_4         u5(HEX0,HEX1,HEX2,HEX3,inpto7seg);
	
	ps2_keyboard		u6	(	.clk(CLOCK_50),.reset(~KEY[0]),
								.ps2_clk_i(PS2_CLK),.ps2_data_i(PS2_DAT),
								.rx_ascii(PS2_ASCII),.rx_data_ready(PS2_Ready),
								.rx_read(PS2_Ready),.rx_shift_key_on(trigger[0]),.rx_extended(trigger[1]),
							   .rx_released(trigger[2]),.rx_output_strobe(PS2_Error)	);

//	my_LEDG_Driver   m1(.LED(LEDG),.iCLK(CLOCK_50),.iRST_N(KEY[0]),.data({5'b11111,trigger[2:0]}));						
						
  ramlpm     r1(.address(ram_add),.clock(VGA_CTRL_CLK),.data(PS2_ASCII),.wren(my_ram_wen),.q(ram_out));					
				
			
	my_LEDG_Driver l1(.LED(LEDG),.iCLK(CLOCK_50),.data(ram_out),.iRST_N(KEY[0]));	
	
	endmodule
	