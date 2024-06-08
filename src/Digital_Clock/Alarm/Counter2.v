// defines for pulse counter
// load with 3 for four pulses
`define C_WIDTH 5
`define C_COUNT 20 - 1
//响3次后停1秒。



module Counter2(clk, rst, cload, cdec, cdone) ;
  parameter n=`C_WIDTH ;
  input clk, rst, cload, cdec ;
  output cdone;
  wire [n-1:0] count ; 
  reg  [n-1:0] next_count ;
  wire cdone , codd ;

  // state register
  CW_DFF #(n) state(clk, next_count, count) ;

  // signal done
  assign cdone = ~(|count) ;
  //assign codd = rst ?  1'b0 :  count[0] ;

  // next count logic
  always@(*) begin
    casex({rst, cload, cdec, cdone})
      4'b1xxx: next_count = `C_WIDTH'b0 ;
      4'b01xx: next_count = `C_COUNT ;
      4'b0010: next_count = count - 1'b1 ;
      4'b00x1: next_count = count ;
      default: next_count = count ;
    endcase
  end
endmodule