`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 11:55:24
// Design Name: 
// Module Name: binary_to_excess_3_with_tb
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


module binary_to_excess_3_with_tb(
    input [3:0] a,
    output reg [4:0] y
    );
    
    always@(*)
    begin
    y={1'b0,a}+5'b00011;
    end
endmodule
