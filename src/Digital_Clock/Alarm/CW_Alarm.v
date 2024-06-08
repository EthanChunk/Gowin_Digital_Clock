module CW_Alarm(Clk_10hz,p_Global_Rst,Clock_Sec_Cnt,Sw,Key,BeepCtrl,Alarm_Hour_min);
input Clk_10hz,p_Global_Rst,Sw;
input [1:0] Key;
input [16:0] Clock_Sec_Cnt;
output BeepCtrl;
output [16:0]  Alarm_Hour_min;
//wire [16:0] Hour_min;
wire [16:0] Alarm_Sec_Cnt;

wire Clk_10hz;

wire EQ_Flag;

wire Beepctrl;




// 比较 数字钟走时与定时是否相等
CW_EqComp #(17) Dut_Eqcomp_zero (.a(Alarm_Hour_min), .b(Clock_Sec_Cnt), .eq(EQ_Flag) );

// 相等 启动 按规则 闹铃
Flash2 Dut_Flash2 (.clk(Clk_10hz), .rst(p_Global_Rst), .in(EQ_Flag), .out(BeepCtrl)) ;// pRst


///////////////////////////////////

CW_UDL_Count #(17,17'd86399,17'd3660) Dut_CW_UDL_Count_Alarm(
.Clk(Clk_10hz), .pRst(p_Global_Rst), .Inc(1'b0), .Dec(1'b0), .Load(Sw), 
.i_Data(Alarm_Sec_Cnt), .o_Qout(Alarm_Hour_min)) ;

 


 wire [3:0] Alarm_Mod_Cnt_oneHot ;
 wire [11:0] Alarm_Adjust_Increase;


 
 
 Dec24 Dut_Key2Onehot(.a(Key[1:0]),.b( Alarm_Mod_Cnt_oneHot)) ;
 
CW_Mux21_OneHot #(12) Dut_CW_Mux21_Alarm_Sec_Cnt(
	.Data_Path_A(12'd3600), 
	.Data_Path_B(12'd60), 
//	.Data_Path_C(12'b1),
	.Sel(Alarm_Mod_Cnt_oneHot[2:1]),
	.Data_Out(Alarm_Adjust_Increase) );

wire [16:0] Alarm_Sec_Cnt_tmp;
assign Alarm_Sec_Cnt =  Alarm_Sec_Cnt_tmp > 17'd86399 ? 17'd0 : Alarm_Sec_Cnt_tmp ;	
assign Alarm_Sec_Cnt_tmp = Sw  ?   Alarm_Hour_min + Alarm_Adjust_Increase : Alarm_Hour_min ;

endmodule
