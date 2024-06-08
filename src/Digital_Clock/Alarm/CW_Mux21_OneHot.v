
module CW_Mux21_OneHot (Data_Path_A, Data_Path_B, Sel, Data_Out);
     parameter n = 8 ;
   input[n-1:0] Data_Path_A; 
   input[n-1:0] Data_Path_B; 
   input [1:0] Sel; 
   output[n-1:0] Data_Out; 
   wire  [n-1:0] Data_Out;

   assign Data_Out = (Sel == 2'b01) ? Data_Path_A : 
                     (Sel == 2'b10) ? Data_Path_B : {n{1'b0}};
endmodule
