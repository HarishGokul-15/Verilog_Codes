`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 18:04:36
// Design Name: 
// Module Name: ring_johnson_counter
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


module ring_johnson_counter(
    input clk,
    input rst,
    output reg [3:0] doutr,
    output reg [3:0] doutj
    );
    //////////////////////Ring counter
    always@(posedge clk)
    begin
        if(rst==1'b1)
            doutr<=2'b01; //provide a start value of 1 in second flip flop
        else
            begin
                 doutr[1]<=doutr[0];
                 doutr[0]<=doutr[1];
            end
     end
    //////////////////////Johnson counter
    always@(posedge clk)
    begin
        if(rst==1'b1)
            doutj<=2'b00; //provide a start value of 1 in second flip flop
        else
            begin
                 doutj[1]<=~doutj[0];
                 doutj[0]<=doutj[1];
            end
     end
    
endmodule
