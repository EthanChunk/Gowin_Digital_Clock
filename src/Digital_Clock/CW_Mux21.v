
module CW_Mux21 (Data_Path_A, Data_Path_B, Sel, Data_Out);
     parameter n = 8 ;
   input[n-1:0] Data_Path_A; 
   input[n-1:0] Data_Path_B; 
   input Sel; 
   output[n-1:0] Data_Out; 
   wire  [n-1:0] Data_Out;

   assign Data_Out = (Sel == 1'b0) ? Data_Path_A : Data_Path_B ;
endmodule
