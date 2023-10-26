`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 13:30:09
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
    reg clk=0,rst=0,ld=0;
    reg [3:0] ldvalue=0;
    wire  [3:0] dout;
    integer i;
    down_counter_with_testbench dut(clk,rst,ld,ldvalue,dout);
    
    always #5 clk=~clk;
    
    initial begin
    rst=1'b1;
    #50;
    rst=1'b0;
    end
    
    task count;
    begin
    #50;
    @(posedge clk)
    ld=1'b1;
    ldvalue=$urandom();
    @(posedge clk)
    ld=1'b0;
    repeat(20) @(posedge clk);
    end
    endtask
    
    initial begin
    for(i=0;i<5;i=i+1)
    begin
    count();
    end
    end
    
    initial  begin
    #1000;
    $finish;
    end    
    
    
endmodule
