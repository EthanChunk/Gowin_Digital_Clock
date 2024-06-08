module CW_UDL_Count(Clk, pRst, Inc, Dec, Load, i_Data, o_Qout) ;

  parameter n = 8 , num = 100,initial_value = 17'd3661;
  
  input Clk, pRst, Inc, Dec, Load ;
  input  [n-1:0] i_Data ;
  output [n-1:0] o_Qout ;
  
  reg    [n-1:0]   next ;  
  wire carry_add,carry_sub;
  
  CW_DFF #(n) Dut_UDL_Count( .i_Clk(Clk) , .i_Din(next) , .o_Qout(o_Qout) );
  
  assign  carry_add = pRst ? 1'b0 : ( Dec == 1'b0  &&   (o_Qout > (num - 1 ) ) ? 1'b1  :  1'b0 );
  
  //assign  carry_add = pRst ? 1'b0 : ( Dec == 1'b0  &&   (o_Qout >= (num - {{(n-1){1'b0}}, 1'b1}) ) ? 1'b1  :  1'b0 );
  assign  carry_sub = pRst ? 1'b0 : ( Dec == 1'b1  &&    o_Qout == {         n{1'b0}          }    ? 1'b1  :  1'b0 );
  
  always@(*) begin
    
	 casex( {pRst,carry_add, carry_sub,  Inc, Dec, Load} )
        
		  //6'b1xx_xxx: next = {n{1'b0}} ; //rst
		  
		  6'b1xxxxx: next = initial_value ; //rst
		  
		  6'b0xxxx1: next = i_Data ;    // load
		  
		  6'b010x0x: next = {n{1'b0}} ; // add carry not sub >= 23 59 59
		  
        6'b001010: next = n - {{(n-1){1'b0}}, 1'b1} ;// sub carry

        6'b000100: next = o_Qout + {{(n-1){1'b0}}, 1'b1}; // inc
        6'b000010: next = o_Qout - {{(n-1){1'b0}}, 1'b1}; // dec
		  
        default: next = o_Qout ;
    endcase
  end
endmodule
