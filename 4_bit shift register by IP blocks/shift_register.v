`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 08:23:12
// Design Name: 
// Module Name: shift_register_d_flip_flop
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


module shift_register_d_flip_flop(
    input clk,
    input clr,
    input din,
    output reg dout
    );
    
    always@(posedge clk)
    begin
    if(clr==1'b1)
    begin
        dout<=1'b0;
    end
    else
    begin
        dout<=din;
    end
    end
endmodule
