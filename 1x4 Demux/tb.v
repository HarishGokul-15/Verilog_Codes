`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 14:05:31
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
reg din=0;
reg [1:0] s;
wire d3,d2,d1,d0;
integer i;
demux_1x4 dut(din,s,d3,d2,d1,d0);

always #5 din=~din;
initial begin
for(i=0;i<20;i=i+1)
begin
s=$urandom_range(0,3);
#20;
end
end
endmodule
