module chunk_dff(CLK,D,Q);//模块名及参数定义，范围至endmodule。
parameter       k = 1 ;


input CLK;//输入端口定义

input [k-1:0]  D;

output [k-1:0]  Q;//输出端口定义
reg [k-1:0]  Q;//寄存器定义

always @(posedge CLK)//在CLK的上跳沿，执行以下语句。
Q <= D;

endmodule  //模块结束