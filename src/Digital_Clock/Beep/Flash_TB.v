`timescale 1ns / 1ps  

`define SWIDTH 4
 
module Flash_TB();  
  

  
    // Testbench signals  
    reg clk;  
    reg rst;  
    reg in;  
    wire out;  
    wire [`SWIDTH-1:0] state; // Assuming we can observe the internal state for test purposes  
  
    // Instantiate the Flash module  
    Flash flash_dut(  
        .clk(clk),  
        .rst(rst),  
        .in(in),  
        .out(out)  
        // Assuming we can add an output for the state for test purposes  
        // .state(state) // Uncomment this if you have an output for state in your Flash module  
    );  
  
    // Clock generation  
    initial begin  
        clk = 0;  
        forever #5 clk = ~clk; // Assuming a 100MHz clock (5ns period)  
    end  
  
    // Test sequence  
    initial begin  
        // Initialize  
        rst = 1;  
        in = 0;  
        #10 rst = 0; // Apply reset for 10ns  
  
        // Test sequence A to OFF_1  
        in = 1; #10; // Trigger start of sequence  
        in = 0; #50; // Wait for sequence to complete (assuming timer duration is ~40ns)  
  
        // Test other states if needed...  
  
        // Finish the test  
        #100 $finish;  
    end  
  
    // Optionally, you can add assertions to check the behavior of out and state  
    // For example:  
    // initial begin  
    //     // ... (Assertions for specific states and outputs)  
    // end  
  
  initial begin
  // 打开VCD文件以记录信号变化  
    $dumpfile("Flash_TB.vcd");  
    // 开始记录所有当前可见的变量和内存  
    $dumpvars(0, Flash_TB); // 0表示所有层次，top_level_module是顶层模块的名字  
  end
endmodule
