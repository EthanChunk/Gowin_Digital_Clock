
module CW_Mux31 (Data_Path_A, Data_Path_B, Data_Path_C,Sel, Data_Out); 

   parameter n = 8 ;

   input[n-1:0] Data_Path_A; 
   input[n-1:0] Data_Path_B; 
   input[n-1:0] Data_Path_C; 
 
   input[2:0] Sel; 
   output[n-1:0] Data_Out; 
   wire  [n-1:0] Data_Out;

   assign Data_Out = (Sel ==  3'b100) ? Data_Path_A :
                     (Sel ==  3'b010) ? Data_Path_B :
                     (Sel ==  3'b001) ? Data_Path_C :  {n{1'bx}};
   
endmodule
