// The MIT License (MIT)
// Copyright © 2023 <copyright C.W.>

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the “Software”), to deal in the Software withOut restriction,
// including withOut limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED “AS IS”, WITHOut WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
// Out OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


module CW_DFF ( i_Clk , i_Din , o_Qout );
	
    parameter n = 4;  
	
    input   i_Clk;
	input   [ n -1 :0 ]  i_Din;
	output  [ n -1 :0 ]  o_Qout;
	
    reg     [ n -1 :0 ]  o_Qout;
	
	always @ ( posedge i_Clk )
    
		o_Qout <= i_Din;
        
endmodule


