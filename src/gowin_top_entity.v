module gowin_top_entity(
Sys_clk  ,
Beep ,
Key , 
Sw ,
Uart_rxd ,
Uart_txd ,
Blue_Led ,
Tri_color_LED_1,
Tri_color_LED_2,
Tri_color_LED_3,
Tri_color_LED_4,
Dig_Seg_Sel  ,
Seg_Blue_Led
);
///////////////
    //global clock
    input            Sys_clk  ;        // 全局时钟信号
           
    output       Beep ; //蜂鸣器控制信号

    input   [8:1]  Key ;          //按键信号  按下为低电平   
    input   [4:1]  Sw ;           // 拨上为高电平，拨下为低电平

    input           Uart_rxd ;            //UART接收端口
    output          Uart_txd ;           //UART发送端口

    output  [8:1]  Blue_Led ;           //蓝色LED  Blue Led  1 light 0 unlight
    
    output  [2:0] Tri_color_LED_1;        // 三色Led1
    output  [2:0] Tri_color_LED_2;       // 三色Led2
    output  [2:0] Tri_color_LED_3;       // 三色Led3
    output  [2:0] Tri_color_LED_4;       // 三色Led4
    
//seg_led interface
    output    [3:0]  Dig_Seg_Sel  ;        // 数码管位选信号
    output    [7:0]  Seg_Blue_Led  ;        // 数码管段选信号

//////////////////////////////////////////////////////////////////////////

/////////////// /////////////   unused harware ////////////////// 
//三色LED接口， 低电平点亮  
//"Tri_color_LED_1[0]" 114 Green;  
//"Tri_color_LED_1[1]" 113 yellow ; 
//"Tri_color_LED_1[2]" 112 red;

//assign Tri_color_LED_1 = 3'b000;
assign Tri_color_LED_2 = 3'b000;
assign Tri_color_LED_3 = 3'b000;
//assign Tri_color_LED_4 = 3'b000;

assign Uart_txd = 1'b1;

/////////////   unused harware //////////////////







//=======================================================//////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
///  虚拟硬件 声明
///
//////////////////////////////////////////
//三色LED接口， 低电平点亮  
//"Tri_color_LED_1[0]" 114 Green;  
//"Tri_color_LED_1[1]" 113 yellow ; 
//"Tri_color_LED_1[2]" 112 red;

wire [2:0] virtul_Tri_color_LED_1;
wire [2:0] virtul_Tri_color_LED_2;
wire [2:0] virtul_Tri_color_LED_3;
wire [2:0] virtul_Tri_color_LED_4;

wire [19:0] virtul_key;

wire  virtul_Sys_Clk_50Mhz;

wire [4:1] virtul_Sw;

wire [8:1]  virtul_Blue_Led ; //蓝色LED  Blue Led  1 light 0 unlight

wire    [3:0]  virtul_Dig_Seg_Sel  ;        // 数码管位选信号
wire    [7:0]  virtul_Seg_Blue_Led  ;        // 数码管段选信号

wire virtul_Beep ; //蜂鸣器控制信号


////////////////////////////////////////////////////////////////////////////////////////////////////////////
///  虚拟硬件  与  真实  硬件 环境  接口转化层
///   For De2-115  
///////////////////////////////////////////////////


//wire Beep ; //蜂鸣器控制信号

/////////////////////////////////////



/*


assign {HEX4,HEX5,HEX6,HEX7} = {28{1'b1}};

assign {HEX0,HEX1,HEX2,HEX3} = {
~Dig_Seg_Sel[0]? ~virtul_Seg_Blue_Led[6:0] :7'b1111111,
~Dig_Seg_Sel[1]? ~virtul_Seg_Blue_Led[6:0]:7'b111_1111,
~Dig_Seg_Sel[2]? ~virtul_Seg_Blue_Led[6:0] :7'b111_1111,
~Dig_Seg_Sel[3]? ~virtul_Seg_Blue_Led[6:0] :7'b111_1111 } ;

assign LEDG[6:0] = ~Dig_Seg_Sel[0]?virtul_Seg_Blue_Led[6:0]:7'b000_0000  ;

assign LEDR[17:0] = {KEY[0],Sec_Cnt};

assign  Seg_Blue_Led = virtul_Seg_Blue_Led;

assign  Beep = virtul_Beep; //蜂鸣器控制信号

assign  virtul_key[0] = ~KEY[0] ;

assign  virtul_key[7:6] = ~KEY[3:2] ;

assign virtul_Sys_Clk_50Mhz = CLOCK_50;

assign virtul_Sw[1] = SW[1];
assign virtul_Sw[4] = SW[4];

*/


////////////////////////////////////////////////////////

 
///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////
 
///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////
///  虚拟硬件  与  真实  硬件 环境  接口转化层
///   For gowin Poackit Lab kit
////////////////////////////////////////////////
/*
wire [8:1]  Blue_Led ; //蓝色LED  Blue Led  1 light 0 unlight

wire [8:1]  key;

wire [4:1]  Sw; // 拨上为高电平，拨下为低电平

wire Beep ; //蜂鸣器控制信号

wire Sys_clk  ;        // 全局时钟信号
*/
////////////////////////////////////////////////////////

wire [8:1]  Blue_Led ; //蓝色LED  Blue Led  1 light 0 unlight

wire [8:1]  Key;

wire [4:1]  Sw; // 拨上为高电平，拨下为低电平

wire Beep ; //蜂鸣器控制信号

wire Sys_clk  ;        // 全局时钟信号

// 7seg_led interface
wire    [3:0]  Dig_Seg_Sel  ;        // 数码管位选信号
wire    [7:0]  Seg_Blue_Led  ;        // 数码管段选信号

// Key pressed 0 unpress 1 ; Sw On 1 Off 0
//Blue Led  1 light 0 unlight



//wire [8:1]  Blue_Led ; //蓝色LED  Blue Led  1 light 0 unlight

//wire [8:1]  key;

//wire [4:1]  Sw; // 拨上为高电平，拨下为低电平

//wire Beep ; //蜂鸣器控制信号

//wire Sys_clk  ;        // 全局时钟信号



//assign  Dig_Seg_Sel = virtul_Dig_Seg_Sel  ;
assign  Dig_Seg_Sel = {virtul_Dig_Seg_Sel[0],virtul_Dig_Seg_Sel[1],virtul_Dig_Seg_Sel[2],virtul_Dig_Seg_Sel[3]}  ;
assign  Seg_Blue_Led = ~virtul_Seg_Blue_Led;

//assign  Seg_Blue_Led = ~（{virtul_Seg_Blue_Led,virtul_Seg_Blue_Led,virtul_Seg_Blue_Led,virtul_Seg_Blue_Led[3:0]}）;

assign  Beep  = virtul_Beep; //蜂鸣器控制信号


assign  virtul_key[0] = ~Key[1] ;

assign  virtul_key[7:6] = ~Key[8:7] ;

assign virtul_Sys_Clk_50Mhz = Sys_clk;

assign virtul_Sw[1] = Sw[1];
assign virtul_Sw[2] = Sw[2];
assign virtul_Sw[3] = Sw[3];
assign virtul_Sw[4] = Sw[4];

assign Tri_color_LED_1 = virtul_Tri_color_LED_1 ;

//assign Tri_color_LED_2 = virtul_Tri_color_LED_2 ;
//assign Tri_color_LED_3 = virtul_Tri_color_LED_3 ;

assign Tri_color_LED_4 = virtul_Tri_color_LED_4 ;

assign virtul_Tri_color_LED_1[0] = virtul_key[0] ;
assign virtul_Tri_color_LED_1[2] = 1'b0 ;
assign virtul_Tri_color_LED_1[1] = Reset_Delay;

assign Blue_Led = virtul_Blue_Led;


// 外部虚拟硬件相关 部分 ///////////////////////////////////////
wire Reset_Delay; 
//CW_Clk_Div Dut_CW_Clk_Div_1khz  (.i_CLK(virtul_Sys_Clk_50Mhz),.o_CLK(Clk_1khz),.i_Div(50_000_000/1_000));
CW_Reset_Delay			DUT_Reset_Delay	(	
							 .i_Clk(virtul_Sys_Clk_50Mhz),  //CLOCK_50 
							 .i_Key(virtul_key[0]), // 高电平触发复位
							 .o_Reset(Reset_Delay));//输出低电平复位信号

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//=======================================================
//  WIRE declarations  global signal
//=======================================================

wire p_Global_Rst;
assign p_Global_Rst = ~ Reset_Delay ;							 
							 
							 

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//  Internal connections
//////////////////////////////////////
//=======================================================
//  REG/WIRE declarations
//=======================================================



wire Clk_1khz,Clk_1hz, rst_clock;
wire [16:0] Sec_Cnt;



wire [3:0] hour_tens;
wire [3:0] hour_ones;
wire [3:0] minute_tens;
wire [3:0] minute_ones;
wire [3:0] sec_tens;
wire [3:0] sec_ones;

wire Clock_Load;

assign Clock_Load = virtul_Sw[1];



wire Adjust_Clock_Load ;

assign Adjust_Clock_Load = ~Clock_Load;

wire [16:0] Adjust_Sec_Cnt;
wire [16:0] next_Adjust_Sec_Cnt;
wire [16:0] next1_Adjust_Sec_Cnt;
wire [11:0] Adjust_Increase;
//=======================================================
//  Structural coding
//=======================================================
//   在这里添加代码



CW_Clk_Div Dut_CW_Clk_Div_1khz  (.i_CLK(virtul_Sys_Clk_50Mhz),.o_CLK(Clk_1khz),.i_Div(50_000_000/1_000));

CW_Clk_Div  Dut_CW_Clk_Div_1hz   (.i_CLK(Clk_1khz),.o_CLK(Clk_1hz),.i_Div(1_000/1));

CW_UDL_Count #(17,17'd86399,17'd0) Dut_CW_UDL_Count_Run(.Clk(Clk_1hz), .pRst(p_Global_Rst), .Inc(1'b1), .Dec(1'b0), .Load(Clock_Load), .i_Data(Adjust_Sec_Cnt), .o_Qout(Sec_Cnt)) ;

/*CW_UDL_Count #(17,86399) Dut_CW_UDL_Count_Adjust(.Clk(Clk_1hz), .pRst(p_Global_Rst), .Inc( virtul_key[7]), .Dec( virtul_key[6]), .Load(Adjust_Clock_Load), .i_Data(Sec_Cnt), .o_Qout(Adjust_Sec_Cnt)) ;*/

 //CW_DFF #(17) Dut_Adjust_Sec_Cnt( .i_Clk(Clk_1hz) , .i_Din(next_Adjust_Sec_Cnt) , .o_Qout(Adjust_Sec_Cnt) );
 


 wire [1:0] Mod_Cnt_bin ;
 wire [2:0] Mod_Cnt_oneHot ;

reg previous_Sw,Sw_Pulse;
//assign 
always @(posedge Clk_10hz)
begin
previous_Sw<=virtul_Sw[1];
end 

always @(posedge Clk_10hz)
begin
if ({previous_Sw,virtul_Sw[1]}==2'b01)
   Sw_Pulse <= 1'b1;
else if ({previous_Sw,virtul_Sw[1]}==2'b10)
   Sw_Pulse <= 1'b0;
end

CW_Shift_Register1 #(3) Dut_CW_Shift_Register1(Sw_Pulse, p_Global_Rst, Mod_Cnt_oneHot) ;
 
assign virtul_Blue_Led [8:1] = {Mod_Cnt_oneHot,1'b0,virtul_key[7:6],1'b0,Sec_Cnt[0]};
 
 assign virtul_Tri_color_LED_4= Mod_Cnt_oneHot;
 
 CW_Mux31 #(12) Dut_CW_Mux31_Adjust_Sec_Cnt(
	.Data_Path_A(12'd3600), 
	.Data_Path_B(12'd60), 
	.Data_Path_C(12'b1),
	.Sel(Mod_Cnt_oneHot),
	.Data_Out(Adjust_Increase) );

wire [16:0] Adjust_Sec_Cnt_tmp;
assign Adjust_Sec_Cnt =  Adjust_Sec_Cnt_tmp > 17'd86399 ? 17'd0 : Adjust_Sec_Cnt_tmp ;
	
assign Adjust_Sec_Cnt_tmp = virtul_Sw[2]  ?   Sec_Cnt + Adjust_Increase : Sec_Cnt ;    
    



//////////


	 
	 

//assign Blue_Led [8:1] = Sec_Cnt[7:0];



wire [11:0] min_sec;

assign min_sec = Sec_Cnt%12'd3600;

wire Clk_10hz;

wire GT_zero,LT_twenty;

wire Beep_ctrl;

CW_GT_Comp #(12) Dut_GTcomp_zero (.a(min_sec), .b(12'b0), .eq(GT_zero) );
CW_LT_Comp #(12) Dut_LTcomp_20seconds (.a(min_sec), .b(12'd20), .eq(LT_twenty) );

CW_Clk_Div  Dut_CW_Clk_Div_10hz   (.i_CLK(Clk_1khz),.o_CLK(Clk_10hz),.i_Div(1_000/10));

Flash Dut_Flash (.clk(Clk_10hz), .rst(p_Global_Rst), .in(GT_zero&LT_twenty), .out(Beep_ctrl)) ;// pRst

wire Alarm_BeepCtrl;

assign virtul_Beep = (Clk_1khz & Beep_ctrl) | (Clk_1khz & Alarm_BeepCtrl);//



///////////////////////////////////////////

wire [16:0] Alarm_Sec_Cnt;
CW_Alarm Dut_alarm(
.Clk_10hz(Clk_10hz),
.p_Global_Rst(p_Global_Rst),
.Clock_Sec_Cnt(Sec_Cnt),
.Sw(virtul_Sw[3]),
.Key({~virtul_key[7],~virtul_key[6]}),
.BeepCtrl( Alarm_BeepCtrl ),
.Alarm_Hour_min(Alarm_Sec_Cnt));


wire [3:0] Alarm_hour_tens;
wire [3:0] Alarm_hour_ones;
wire [3:0] Alarm_minute_tens;
wire [3:0] Alarm_minute_ones;
wire [3:0] Alarm_sec_tens;
wire [3:0] Alarm_sec_ones;

wire [12:0] Alarm_tmp_line;
wire [11:0] Alarm_tmp_line_jia;
wire [7:0] Alarm_tmp_line_yi;
wire [5:0] Alarm_tmp_line_bing;
wire [1:0] Alarm_tmp_line_ding;
//wire [5:0] tmp_line_bing;
assign  { Alarm_tmp_line,Alarm_hour_tens} = Alarm_Sec_Cnt/16'd36_000;
assign  { Alarm_tmp_line_jia, Alarm_hour_ones} = (Alarm_Sec_Cnt%16'd36_000)/12'd3600 ;

assign   { Alarm_tmp_line_yi, Alarm_minute_tens} = (Alarm_Sec_Cnt%12'd3600)/10'd600;
assign   { Alarm_tmp_line_bing, Alarm_minute_ones } = (Alarm_Sec_Cnt%10'd600)/6'd60 ;

assign   { Alarm_tmp_line_ding, Alarm_sec_tens } = (Alarm_Sec_Cnt%6'd60)/4'd10 ;
assign   Alarm_sec_ones  =Alarm_Sec_Cnt%4'd10;

wire [3:0] Alarm_bit4_seg7 ;
wire [3:0] Alarm_bit3_seg7 ;
wire [3:0] Alarm_bit2_seg7 ;
wire [3:0] Alarm_bit1_seg7 ;

wire Alarm_data_fetched;
wire [23:0] Alarm_Hex_FourNum;

CW_Mux21 Alarm_Dut_mux_mod1 (.Data_Path_A({Alarm_hour_tens,Alarm_hour_ones}), .Data_Path_B({Alarm_minute_tens,Alarm_minute_ones}), .Sel(virtul_Sw[4]), .Data_Out({Alarm_bit4_seg7,Alarm_bit3_seg7}));
CW_Mux21 Alarm_Dut_mux_mod2 (.Data_Path_A({Alarm_minute_tens,Alarm_minute_ones}), .Data_Path_B({Alarm_sec_tens,Alarm_sec_ones}), .Sel(virtul_Sw[4]), .Data_Out({Alarm_bit2_seg7,Alarm_bit1_seg7}));



assign Alarm_Hex_FourNum = {{2'b01,Alarm_bit1_seg7,2'b01,Alarm_bit2_seg7,2'b01,Alarm_bit3_seg7,2'b01,Alarm_bit4_seg7}};

////////////////////
wire [12:0] tmp_line;
wire [11:0] tmp_line_jia;
wire [7:0] tmp_line_yi;
wire [5:0] tmp_line_bing;
wire [1:0] tmp_line_ding;
//wire [5:0] tmp_line_bing;
assign  { tmp_line,hour_tens} = Sec_Cnt/16'd36_000;
assign  { tmp_line_jia, hour_ones} = (Sec_Cnt%16'd36_000)/12'd3600 ;

assign   { tmp_line_yi, minute_tens} = (Sec_Cnt%12'd3600)/10'd600;
assign   { tmp_line_bing, minute_ones } = (Sec_Cnt%10'd600)/6'd60 ;

assign   { tmp_line_ding, sec_tens } = (Sec_Cnt%6'd60)/4'd10 ;
assign   sec_ones  =Sec_Cnt%4'd10;

wire [3:0] bit4_seg7 ;
wire [3:0] bit3_seg7 ;
wire [3:0] bit2_seg7 ;
wire [3:0] bit1_seg7 ;

wire data_fetched;
wire [23:0] Hex_FourNum;

CW_Mux21 Dut_mux_mod1 (.Data_Path_A({hour_tens,hour_ones}), .Data_Path_B({minute_tens,minute_ones}), .Sel(virtul_Sw[4]), .Data_Out({bit4_seg7,bit3_seg7}));
CW_Mux21 Dut_mux_mod2 (.Data_Path_A({minute_tens,minute_ones}), .Data_Path_B({sec_tens,sec_ones}), .Sel(virtul_Sw[4]), .Data_Out({bit2_seg7,bit1_seg7}));



assign Hex_FourNum = {{2'b00,bit1_seg7,2'b00,bit2_seg7,1'b0,Sec_Cnt[0],bit3_seg7,2'b00,bit4_seg7}};

///////////
wire [23:0] Hex_FourNum_path;
assign Hex_FourNum_path = virtul_Sw[3] ? Alarm_Hex_FourNum : Hex_FourNum ;

wire Clk_400hz;

CW_Clk_Div Dut_CW_Clk_400hz(.i_CLK(virtul_Sys_Clk_50Mhz),.o_CLK(Clk_400hz),.i_Div(50_000_000/400) );
/*
for de2 114
CW_Seven_Segment_Numeric_LED_4Bit_Disp  Dut_CW_Seven_Segment_Numeric_LED_Disp
(
	.CLK(Clk_400hz), .RSTn(~p_Global_Rst), .idata_valid(1'b1),.oData_fetched(data_fetched),
    .iLed_FourCode(Hex_FourNum_path), .Seven_Segment_Code_Out(virtul_Seg_Blue_Led), .Bit_Sel_Out(virtul_Dig_Seg_Sel) );
*/
	 
CW_Seven_Segment_Numeric_LED_4Bit_Disp  Dut_CW_Seven_Segment_Numeric_LED_Disp
(
	.CLK(Clk_400hz), .RSTn(~p_Global_Rst), .idata_valid(1'b1),.oData_fetched(data_fetched),
    .iLed_FourCode(Hex_FourNum_path), .Seven_Segment_Code_Out(virtul_Seg_Blue_Led), .Bit_Sel_Out(virtul_Dig_Seg_Sel) );	 


endmodule

