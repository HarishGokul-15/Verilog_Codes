`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 13:04:38
// Design Name: 
// Module Name: single_port_RAM_with_testbench
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


module single_port_RAM_with_testbench(
    input clk,rst,we,
    input [7:0] din,
    input [7:0] addr,
    output reg [7:0] dout
    );
    
    reg [7:0] mem [15:0];
    integer i;
    always@(posedge clk)
    begin
    if(rst==1'b1) 
    begin
    dout<=8'h00;
    for(i=0;i<16;i=i+1)
    begin
        mem[i]<=8'h00;
   end
   end
    else
    begin
    if(we==1'b1)
        mem[addr]<=din;
    else
        dout<=mem[addr];
    end
    end
endmodule
