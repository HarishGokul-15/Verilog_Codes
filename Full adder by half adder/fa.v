`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 17:56:54
// Design Name: 
// Module Name: fa
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

module ha(input a,b,output s,c);
assign s=a^b;
assign c=a&b;
endmodule
//////////////////////HALF ADDER///////////////////

module fa(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    ha h1(.a(a),.b(b),.s(t1),.c(t2));
    ha h2(.a(t1),.b(cin),.s(s),.c(t3));
    assign cout=t2|t3;
endmodule
