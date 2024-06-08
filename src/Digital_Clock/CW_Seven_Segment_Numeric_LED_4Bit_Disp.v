//Seven_Segment_Numeric_LED_Disp for mini fpga
//by chunk 2021-12-16 fixed
// add dot support 

// eg.
//Seven_Segment_Numeric_LED_Disp Seven_Segment_Numeric_LED_Disp_DUT 
//(
//	.CLK(clk_400hz), .RSTn(RST_n), 
//	.idata_valid(data_valid),.oData_fetched(oLed_Out[7]),
//	//.idata_valid(data_valid|1'b1),.oData_fetched(oLed_Out[7]),
//	//.iLed_FourCode({10'b11111_11111,20'b01111_01111_01111_01111}), 
//	.iLed_FourCode({10'b11111_11111,Distance_date}),                //11111 => _Dark 
//	.Seven_Segment_Code_Out(Seven_Segment_Code_Out), .Bit_Sel_Out(Bit_Sel_Out)
//);



module  CW_Seven_Segment_Numeric_LED_4Bit_Disp
(
	CLK, RSTn, idata_valid,oData_fetched,iLed_FourCode, Seven_Segment_Code_Out, Bit_Sel_Out
);
	input  CLK, RSTn, idata_valid;
	input  [23:0] iLed_FourCode;
	output [7:0]  Seven_Segment_Code_Out; 
	output [4:1]  Bit_Sel_Out;
	output oData_fetched;

	////////////////////////////
	parameter	
	         bit_3 		= 6'b1101,
				bit_2 		= 6'b1011,
				bit_1 		= 6'b0111,
				bit_4 		= 6'b1110,
				bit_dark   	= 6'b1111,
				bit_all 	= 6'b0000;



	reg   [5:0]  Single_Seven_Segment_Code;
	wire  [23:0] Led_FourCode;
	wire  [23:0] Led_FourCode_TMP;
	//reg  [23:0] Led_FourCode_TMP;
	
	wire [4:1] BIT_CS_Current;
   	wire  clk_400hz = CLK;
	
	CW_DFF #(24) Led_FourCode_DFF(.i_Clk(clk_400hz),.i_Din(Led_FourCode_TMP),.o_Qout(Led_FourCode));
	
	assign oData_fetched = idata_valid == 1'b1 &&  BIT_CS_Current == bit_2;
	
	
	
//	assign Led_FourCode_TMP = 	( RSTn == 1'b0 )  ?  {6'd40,6'd41,6'd63,6'd63} : 	// show hi
//	(idata_valid ==1'b1 &&  BIT_CS_Current == bit_1 ? iLed_FourCode : Led_FourCode_TMP);

//		assign Led_FourCode_TMP = 	( RSTn == 1'b0 )  ?  {6'd40,6'd41,6'd63,6'd63} : 	// show hi
//	(idata_valid ==1'b1 &&  BIT_CS_Current == bit_1 ? iLed_FourCode : Led_FourCode_TMP);// {6'd40,6'd41,6'd63,6'd63});

//CW_DFF #(24) Led_FourCode_DFF(.i_Clk(clk_400hz),.i_Din(Led_FourCode_TMP),.o_Qout(Led_FourCode_TMP));	
	
CW_Mux31 #(24) Dut_CW_Mux31(
	.Data_Path_A({6'd40,6'd41,6'd63,6'd63}), 
	.Data_Path_B(iLed_FourCode), 
	.Data_Path_C(Led_FourCode),
	.Sel(
	{ RSTn == 1'b0,
	~(RSTn == 1'b0) && idata_valid==1'b1 && BIT_CS_Current==4'b0111,
	~(RSTn == 1'b0|(idata_valid==1'b1 && BIT_CS_Current==4'b0111))}),
	.Data_Out(Led_FourCode_TMP) ); 
	
//	always @(*)
//	begin
//	//Led_FourCode_TMP =   Led_FourCode_TMP ;
//	casex({RSTn,idata_valid,BIT_CS_Current})   //1+1+4
//	6'b0x_xxxx: Led_FourCode_TMP = 	{6'd40,6'd41,6'd63,6'd63};
//	6'b11_0111: Led_FourCode_TMP = 	iLed_FourCode;
//	default:    Led_FourCode_TMP =   Led_FourCode_TMP ;
//	endcase
//	end
	
	
	//段选共阳极低电平段有效, 位选低电平数码管被选中。
    // Dp_gfedcba
	parameter		_0    = 8'b1100_0000, 	 //显示数字 0
					_1    = 8'b1111_1001, 	//显示数字 1
					_2    = 8'b10100100,	//显示数字 2
					_3    = 8'b10110000,	//显示数字 3
					_4    = 8'b10011001,	//显示数字 4
					_5    = 8'b10010010,	//显示数字 5
					_6    = 8'b10000010,	//显示数字 6
					_7    = 8'b11111000,	//显示数字 7
					_8    = 8'b10000000,	//显示数字 8
					_9    = 8'b10010000,	//显示数字 9
					
					_A    = 8'b11001110,	//显示数字 A
					_b    = 8'b11000111,	//显示数字 b
					_C    = 8'b11000011,	//显示数字 C
					_D    = 8'b11100001, 	//显示数字 D
					_E    = 8'b11010001,	//显示数字 E
					_F    = 8'b11010000,	//显示数字 F
					
					
					_0dot = 8'b0100_0000,
					_1dot = 8'b0111_1001, 
					_2dot = 8'b00100100,
					_3dot = 8'b00110000,
					_4dot = 8'b00011001,
					_5dot = 8'b00010010,
					_6dot = 8'b00000010,
					_7dot = 8'b01111000,
					_8dot = 8'b00000000,
					_9dot = 8'b00010000,
					_Adot = 8'b01001110,
					_bdot = 8'b01000111,
					_Cdot = 8'b01000011,
					_Ddot = 8'b01100001, 
					_Edot = 8'b01010001,
					_Fdot = 8'b01010000,
					

 					_neg  = 8'b10111111,           //显示负号(-)
					_h    = 8'b0000_1011,
					_i    = 8'b1101_1111, 
					_M    = 8'b0000_0000, // 8. for test
					_Dark  = 8'b1111_1111; // 8'b11111111;           //不显示任何字符

				
	always @ (*)
	 begin
		case (BIT_CS_Current)
			bit_1:     Single_Seven_Segment_Code = Led_FourCode[5:0];
			bit_2:     Single_Seven_Segment_Code = Led_FourCode[11:6];
			bit_3:     Single_Seven_Segment_Code = Led_FourCode[17:12];
			bit_4:     Single_Seven_Segment_Code = Led_FourCode[23:18];			
			default :  Single_Seven_Segment_Code = Led_FourCode[5:0];
		endcase
	end
				
   
	
	// translate hex code to 7 seg
	reg [7:0] seven_segment_code;
	
	always @ (*)	
	  begin
		case(Single_Seven_Segment_Code)
			
			6'd0:   seven_segment_code = _0;
			6'd1:   seven_segment_code = _1;
			6'd2:   seven_segment_code = _2;
			6'd3:   seven_segment_code = _3;
			6'd4:   seven_segment_code = _4;
			6'd5:   seven_segment_code = _5;
			6'd6:   seven_segment_code = _6;
			6'd7:   seven_segment_code = _7;
			6'd8:   seven_segment_code = _8;
			6'd9:   seven_segment_code = _9;
			6'd10:  seven_segment_code = _A;
			6'd11:  seven_segment_code = _b;
			6'd12:  seven_segment_code = _C;
			6'd13:  seven_segment_code = _D;
			6'd14:  seven_segment_code = _E;
			6'd15:  seven_segment_code = _F;
			
			6'd16:  seven_segment_code = _0dot;
			6'd17:  seven_segment_code = _1dot;
			6'd18:  seven_segment_code = _2dot;
			6'd19:  seven_segment_code = _3dot;
			6'd20:  seven_segment_code = _4dot;
			6'd21:  seven_segment_code = _5dot;
			6'd22:  seven_segment_code = _6dot;
			6'd23:  seven_segment_code = _7dot;
			6'd24:  seven_segment_code = _8dot;
			6'd25:  seven_segment_code = _9dot;
			6'd26:  seven_segment_code = _Adot;
			6'd27:  seven_segment_code = _bdot;
			6'd28:  seven_segment_code = _Cdot;
			6'd29:  seven_segment_code = _Ddot;
			6'd30:  seven_segment_code = _Edot;
			6'd31:  seven_segment_code = _Fdot;
					
			6'd40:  seven_segment_code = _h;
			6'd41:  seven_segment_code = _i;
					
			6'd62:  seven_segment_code = _M;
			6'd63:  seven_segment_code = _Dark;
			
		 default:  seven_segment_code = _Dark;
		endcase
	end
				
	assign Seven_Segment_Code_Out = ~seven_segment_code; // 输出的共阴极七段码

	assign Bit_Sel_Out = BIT_CS_Current;
			

	reg [3:0] BIT_CS_next;
	//CW_DFF ( i_Clk , i_Din , o_Qout );
	CW_DFF #(4) BIT_CS_DFF(.i_Clk(clk_400hz),.i_Din(BIT_CS_next),.o_Qout(BIT_CS_Current));
	
	
	//next state
	always @ (*)
	 begin
	  case (BIT_CS_Current)

			bit_1: BIT_CS_next = bit_2;
			bit_2: BIT_CS_next = bit_3;
			bit_3: BIT_CS_next = bit_4;
			bit_4: BIT_CS_next = bit_1;
			
		  default:BIT_CS_next = bit_1;
	  endcase
	end
	
endmodule


