`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 13:27:01
// Design Name: 
// Module Name: down_counter_with_testbench
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


module down_counter_with_testbench(
    input clk,rst,ld,
    input [3:0] ldvalue,
    output reg [3:0] dout
    );
    
    initial begin
    dout<=4'b0000;
    end
  
    always@(posedge clk)
    begin
    if(rst==1'b1)
    begin
    dout<=4'b0000;
    end
    else
    begin
    if(ld==1'b1)
    begin
        dout<=ldvalue;
    end
    else
        dout<=dout-1;
    end
    end
endmodule
