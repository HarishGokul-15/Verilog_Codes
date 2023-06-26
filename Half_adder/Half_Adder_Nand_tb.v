`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2023 00:44:37
// Design Name: 
// Module Name: Halfadder_tb
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


module Halfadder_tb;
reg A,B;wire Sum,Carry;
Half_adder uut(.A(A),.B(B),.Sum(Sum),.Carry(Carry));
initial begin
#10 A=0;B=0;
#10 A=0;B=1;
#10 A=1;B=0;
#10 A=1;B=1;
#10 $finish;
end
endmodule
