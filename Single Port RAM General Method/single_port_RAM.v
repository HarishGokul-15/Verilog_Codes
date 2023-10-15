`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 14.10.2023 17:44:44
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

///////////////////////////////64x8 RAM//////////////////////////
module single_port_RAM(
    input clk,rst,
    input [7:0] din,
    input we,
    input [7:0] dout,
    input [5:0] addr
    );
    
    reg [7:0] memory [63:0];
    reg [7:0] temp;
    integer i;
    
    always@(posedge clk)
    begin
        if(rst==1'b1)
        begin
            for(i=0;i<64;i=i+1)
            begin
                memory[i]<=8'h00;
            end
        temp<=8'h00;
        end
        else
        begin
        if(we==1'b1)
        memory[addr]<=din;
        else
        temp<=memory[addr];
        end
        end
        assign dout=temp;
    
endmodule
