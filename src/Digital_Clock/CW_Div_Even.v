//`include "para.v"
//`define WIDE 16
`timescale 1ns / 1ps

module CW_Div_Even (i_Clk,o_Clk,i_Div);
input i_Clk;
parameter WIDE = 32;
input [WIDE-1:0] i_Div;
output o_Clk;
reg outCLK;
initial outCLK = 1'b0;

reg [WIDE-1:0 ]Cnt ;
initial Cnt = 0;

 always @ (posedge i_Clk)
 begin
 if (Cnt < (i_Div[WIDE-1:1]-1)  ) Cnt <= Cnt +32'b1;  // div /2  eg. div2 is 1 div 4 is 2 
 else begin Cnt <= 0; outCLK <= ~outCLK; end
 end
 
 assign o_Clk = (i_Div != 32'd1 ) ?  outCLK :i_Clk ;
 endmodule
 