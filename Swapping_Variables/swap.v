`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06.10.2023 12:35:47
// Design Name: 
// Module Name: swap
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


module swap;
reg [15:0] a=16'hAAAA,b=16'hBBBB; //Swapping using  blocking
reg [15:0] c=16'hCCCC,d=16'hDDDD; // Swapping using non blocking

reg [15:0] temp;

initial begin
$display("The value of a:%0h, the value of b:%0h before swapping by blocking statement",a,b);
temp=a;
a=b;
b=temp;
$display("The value of a:%0h, the value of b:%0h after swapping by blocking statement",a,b);
end

initial begin
$display("The value of c:%0h, the value of d:%0h before swapping by non blocking statement",c,d);
c<=d;
d<=c;
#1;
$display("The value of c:%0h, the value of d:%0h after swapping by non blocking statement",c,d);
end
endmodule


