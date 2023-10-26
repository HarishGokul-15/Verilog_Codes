`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 14:21:55
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb;
     reg clk=0,rst;
    wire [3:0] dout;
    
    ring_counter_with_testbench dut(clk,rst,dout);
    
    always #5 clk=~clk;
    
    initial begin
    rst=1'b1;
    #20;
    rst=1'b0;
    end
    
    initial begin
    #500;
    $finish;
    end
endmodule
