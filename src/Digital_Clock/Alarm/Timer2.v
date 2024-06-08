// define time intervals 
// load 5 for 6-cycle interval 5 to 0.
//响0.5秒停0.5秒
`define T_WIDTH 4
`define T_ON1  4'd4
`define T_ON2  4'd4
`define T_OFF  4'd4

//`define T_WIDTH 4
//`define T_ON1  4'd4
//`define T_ON2  4'd14
//`define T_OFF  4'd4
//----------------------------------------------------------------------
// Timer1 - count down timer
//   tload - loads timer 
//   tsel  - selects between `T_ON and `T_OFF for time interval in cycle
//           when tload is asserted
//   done - signals when selected time interval has completed.
//----------------------------------------------------------------------
module Timer2(clk, rst, tload, tsel, done, codd) ;
  parameter n=`T_WIDTH ;
  input clk, rst, tload, tsel, codd ;
  output done ;
  wire [n-1:0] count ; 
  reg  [n-1:0] next_count ;

  // state register
  CW_DFF #(n) state(clk, next_count, count) ;

  // signal done
  assign done = ~(|count) ;

  // next count logic
  always@(*) begin
    casex({rst, tload, tsel, done})
      4'b1xxx: next_count = `T_WIDTH'b0 ;
      4'b011x: next_count = codd? `T_ON1 :`T_ON2;
      4'b010x: next_count = `T_OFF ;
      4'b00x0: next_count = count - 1'b1 ;
      4'b00x1: next_count = count ;
      default: next_count = count ;
    endcase
  end
endmodule