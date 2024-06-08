module CW_GT_Comp(a, b, eq) ;
  parameter k=8 ;
  input  [k-1:0]   a ;
  input  [k-1:0]   b ;
  output eq ;
  assign   eq = (a > b) ;
endmodule