`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.10.2023 11:58:06
// Design Name: 
// Module Name: up_down_counter
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


module up_down_counter(
    input clk,
    input rst,
    input mode,
    output reg [3:0] y
    );
    
    always@(posedge clk)
    begin
    if(rst==1'b1)
    begin
    y<=4'b0000;
    end
    else
    begin
    if(mode==1'b1) y<=y+1;
    else y<=y-1;
    end
    end
endmodule
