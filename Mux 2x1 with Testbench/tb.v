`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 22.10.2023 11:40:48
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
reg a,b,sel;
wire y;

initial begin
a=0;b=0;sel=0;
end

mux_2_1 dut(a,b,sel,y);

always #5 a=~a;
always #10 b=~b;

always #20 sel=~sel;

initial begin
#100;
$finish;
end

endmodule
