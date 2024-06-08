`timescale 1ns / 1ps

module Shift_Register1_TB;

// Import the necessary module
parameter n = 4;
reg clk, rst, sin;
wire [n-1:0] out;

// Instantiate the unit under test (UUT)
Shift_Register1 uut (
    .clk(clk),
    .rst(rst),
    .sin(sin),
    .out(out)
);

// Clock generator
always #5 clk = ~clk;

initial begin
    // Initialize inputs
    clk = 0;
    rst = 1;
    sin = 0;
    
    // Wait for reset to settle
    #10 rst = 0;

    // Test sequence
    @(posedge clk) sin = 1;    // First data in
    @(posedge clk) sin = 1;    // Second data in
    @(posedge clk) sin = 0;    // Third data in
    @(posedge clk) sin = 1;    // Fourth data in
    @(posedge clk) $display("Output after 4 clock cycles: %b", out); // Display output
    
    // Additional testing as needed...

    // Simulation end
    #20 $finish;
end

  initial
        begin            
            $dumpfile("Shift_Register1_TB.vcd");
            $dumpvars(0,Shift_Register1_TB); end
endmodule