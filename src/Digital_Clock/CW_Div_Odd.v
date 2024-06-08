//`include "para.v"
`define WI 32
`timescale 1ns / 1ps

module CW_Div_Odd (i_Clk,o_Clk,i_Div);

input i_Clk;

parameter WIDE = 32;

input [WIDE-1:0] i_Div;

output o_Clk;
wire o_Clk;

reg outCLK;

reg Cout;

reg [WIDE-1:0 ] Cnt ;

initial  Cnt = 0;

wire inCLK;

reg Cc;

initial Cc = 0;

always @(posedge  Cout) 	Cc <= ~ Cc; 

assign inCLK  = i_Clk ^ Cc;

 always @ (posedge inCLK)
	 begin
		 if ( Cnt < (i_Div[WIDE-1:1])) begin   Cnt <=  Cnt +32'b1;  Cout <= 1'b0; end// i_Div /2  eg. i_Div2 is 1 i_Div 4 is 2 
		 else begin  Cnt <= 0 ; Cout <= 1'b1;end
	 end

 always @ (negedge i_Clk) 	outCLK <= Cout; 

 assign o_Clk = (i_Div != 32'd1 ) ?  Cc :i_Clk ;

 endmodule
 