`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 12:08:35
// Design Name: 
// Module Name: d_flipflop_with_tb
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


module d_flipflop_with_tb(
    input clk,din,
    output reg q,q_bar
    );
    
    always@(posedge clk)
    begin
    q<=din;
    q_bar<=~din;
    end
    
endmodule
