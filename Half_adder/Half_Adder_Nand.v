`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.06.2023 00:41:46
// Design Name: 
// Module Name: Half_adder
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


module Half_adder_nand(
    input A,
    input B,
    output Sum,
    output Carry
    );
    wire x,y,z;
    //here we could implement in gate level
    nand(z,A,B);
    nand(y,A,z);
    nand(x,B,z);
    nand(Sum,y,x);
    nand(Carry,z,z);
    
endmodule
