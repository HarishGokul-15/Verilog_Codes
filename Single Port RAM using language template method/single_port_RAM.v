`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 18:07:44
// Design Name: 
// Module Name: single_port_RAM
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


module single_port_RAM(
    input clk,
    input [7:0] din,
    input [5:0] addr,
    input we,
    output [7:0] dout
    );
    
    reg [7:0] mem [63:0];
    
    always@(posedge clk)
    begin
    if(we==1'b1) mem[addr]<=din;
    end
    assign dout=mem[addr];
endmodule
