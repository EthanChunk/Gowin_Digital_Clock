
// define states for flash1
`define SWIDTH 4
`define S_OFF   4'b0000
`define S_A     4'b0001
`define S_B     4'b0010
`define S_C     4'b0011
`define S_D     4'b0100
`define S_E     4'b0101
`define S_OFF_1 4'b1001
`define S_OFF_2 4'b1010
`define S_OFF_3 4'b1011
`define S_OFF_4 4'b1100
`define S_OFF_5 4'b1101
`define S_OFF_6 4'b1110
`define S_OFF_7 4'b1111
`define S_OFF_8 4'b1000
`define S_OFF_9 4'b0111

//----------------------------------------------------------------------
// Flash module
//----------------------------------------------------------------------
module Flash(clk, rst, in, out) ;
  input clk, rst, in ; // in triggers start of flash sequence
  output out ;	       // out drives LED
  reg  out ;                       // output
  wire [`SWIDTH-1:0] state, next ; // current state
  reg  [`SWIDTH-1:0] next1  ;      // next state without reset
  reg  tload, tsel ;               // timer inputs
  wire done ;                      // timer output

  // instantiate state register
  CW_DFF #(`SWIDTH) state_reg(clk, next, state) ;

  // instantiate timer
  Timer1 timer(clk, rst, tload, tsel, done) ;

  always @(*) begin
    case(state) 
      `S_OFF: {out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, in ? `S_A : `S_OFF } ;
      `S_A:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b0, done ? `S_B : `S_A } ;
      `S_B:   {out, tload, tsel, next1} = 
              {1'b0, done, 1'b1, done ? `S_C : `S_B } ;
      `S_C:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b0, done ? `S_D : `S_C } ;
      `S_D:   {out, tload, tsel, next1} = 
              {1'b0, done, 1'b1, done ? `S_E : `S_D } ;
      `S_E:   {out, tload, tsel, next1} = 
              {1'b1, done, 1'b1, done ? `S_OFF_1 : `S_E } ;

      `S_OFF_1 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_2 } ;
      `S_OFF_2 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_3 } ;
      `S_OFF_3 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_4 } ;
      `S_OFF_4 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_5 } ;
      `S_OFF_5 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_6 } ;
        `S_OFF_6 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_7 } ;
        `S_OFF_7 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_8 } ;
        `S_OFF_8 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF_9 } ;
        `S_OFF_9 :{out, tload, tsel, next1} = 
              {1'b0, 1'b1, 1'b1, `S_OFF } ;
      default:{out, tload, tsel, next1} = 
              {1'b1, done, 1'b1, done ? `S_OFF : `S_E } ;
    endcase
  end

  assign next = rst ? `S_OFF : next1 ;
endmodule 