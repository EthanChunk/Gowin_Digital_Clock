module Counter_num (clk, rst, count);   
  parameter n =4, num = 10;  // 默认为10进制
  input rst, clk ;        
  output[n-1:0] count;  
  wire flag;
  
// if rst=0或count=num-1计数器复位，else 计数器加1
    wire [n-1:0]  next =(rst|flag)? 0: count+1;  
 
    assign  flag = (count == (num-1)) ? 1: 0;   
//if count=num-1，  flag =1，进位信号

    chunk_dff # (n)  cnt(clk, next, count); 

 endmodule
