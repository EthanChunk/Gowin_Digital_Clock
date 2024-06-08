// The MIT License (MIT)
// Copyright © 2023 <copyright Ethan>

// Permission is hereby granted, free of charge, to any person obtaining a copy of this software
// and associated documentation files (the “Software”), to deal in the Software without restriction,
// including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
// INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, 
// WHETHER IN AN ACTION OF CountRACT, TORT OR OTHERWISE, ARISING FROM, 
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module  CW_Reset_Delay ( i_Clk, i_Key, o_Reset);
input       i_Clk;
input       i_Key;
output      o_Reset;

reg o_Reset;
reg [27:0]  Count;

always @ ( posedge i_Clk or posedge  i_Key )
    begin
        if ( i_Key )
          Count=28'h0;
        else
            begin
            
                if(Count!=28'd10_000_000)
                    begin
                        Count   <=  Count+28'h1;
                        o_Reset  <=  1'b0;
                    end
                else
                    o_Reset <=  1'b1;
            end
            
    end

endmodule