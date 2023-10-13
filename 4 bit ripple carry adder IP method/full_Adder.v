`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 08:45:47
// Design Name: 
// Module Name: full_Adder
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


module full_Adder(
    input a,
    input b,
    input cin,
    output s,
    output cout
    );
    
    assign {cout,s}={1'b0,a}+{1'b0,b}+{1'b0,cin};
endmodule
