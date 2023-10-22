`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 11:56:47
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
reg [3:0] a=0;
wire [4:0] y;

binary_to_excess_3_with_tb dut(a,y);
integer i;
initial begin
for(i=0;i<20;i=i+1)
begin
    a=$urandom();
    #20;
    $display("The value of a:%0d and output is y:%0d",a,y);
end
end

endmodule
