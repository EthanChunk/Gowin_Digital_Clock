
module CW_Shift_Register1(clk, rst,out) ;
  parameter n = 4 ;
  input clk, rst;
  output [n-1:0] out ;

  //wire [n-1:0] next = rst ? {{n-1{1'b0}},1'b1} : {out[n-2:0],out[n-1]} ;
wire [n-1:0] next =  {out[n-2:0],out[n-1]} ;

  CW_rDFF #(n) Dut_Shift_Register1(clk,rst, next, out) ;
endmodule