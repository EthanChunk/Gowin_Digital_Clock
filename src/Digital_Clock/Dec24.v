//n-m译码器
//a—输入为二进制数（宽度为n）
//b—输出为独热码（宽度为m）
module Dec24(a,b) ;
   parameter n=2 ;
   parameter m=4 ;
   input  [n-1:0] a ;
   output [m-1:0] b ;
   assign b = 4'b1<<a ;
endmodule