//`timescale 1ns / 1ns
//`include "para.v"

module CW_Clk_Div(i_CLK,o_CLK,i_Div);
  input i_CLK;
  output o_CLK;
  parameter WIDE = 32;

input [WIDE-1:0] i_Div ;

wire CLK_Odd,CLK_Even;

assign o_CLK = i_Div[0] ? CLK_Odd :CLK_Even ;

CW_Div_Odd DUT_Odd   (.i_Clk(i_CLK),.o_Clk(CLK_Odd),  .i_Div(i_Div));
		
CW_Div_Even DUT_Even (.i_Clk(i_CLK),.o_Clk(CLK_Even), .i_Div(i_Div));
		
		
endmodule