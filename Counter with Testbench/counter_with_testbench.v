`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 12:43:18
// Design Name: 
// Module Name: counter_with_testbench
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


module counter_with_testbench(
    input clk,rst,ld,
    input [3:0] ldvalue,
    output [3:0] dout
    );
    
    reg [3:0] temp;
    
    always@(posedge clk)
    begin
    if(rst==1'b1) temp<=4'b0000;
    else
    begin
    if(ld==1'b1)
        temp<=ldvalue;
    else
        temp<=temp+1;
    end
    end
    assign dout=temp;
    
endmodule
