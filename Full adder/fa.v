`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 09:32:09
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


module fa(
    input a,
    input b,
    input c,
    output s,
    output cout
    );
    
    wire t1,t2,t3; //undefined nets
    
    assign t1=a^b;
    assign t2=t1&c;
    assign t3=a&b;
    assign s=t1^c;
    assign cout=t2|t3;
endmodule
