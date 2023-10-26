`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 14:18:47
// Design Name: 
// Module Name: ring_counter_with_testbench
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


module ring_counter_with_testbench(
    input clk,rst,
    output reg [3:0] dout
    );
    
    always@(posedge clk)
    begin
    if(rst==1'b1) 
    begin
    dout<=4'b1000;
    end
    else
    begin
        dout[3]<=dout[2];
        dout[2]<=dout[1];
        dout[1]<=dout[0];
        dout[0]<=dout[3];
    end
    end
endmodule
