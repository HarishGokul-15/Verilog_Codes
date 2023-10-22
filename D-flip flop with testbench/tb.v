`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 12:09:41
// Design Name: 
// Module Name: tb
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


module tb;
reg din,clk;
wire q,q_bar;

initial begin
    clk=0;din=0;
end
d_flipflop_with_tb dut(clk,din,q,q_bar);
always #5 clk=~clk;
integer i;
initial begin
for(i=0;i<20;i=i+1)
begin
@(posedge clk);
din=$urandom;
end
end
endmodule
