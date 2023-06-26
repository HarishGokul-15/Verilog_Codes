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


module Half_adder_nor(
    input A,
    input B,
    output Sum,
    output Carry
    );
    wire x,y,z,not_A,not_b;
    //here we could implement in gate level
    nor(x,A,B);
    not(not_a,A);
    not(not_b,B);
    nor(Carry,not_a,not_b);
    nor(Sum,x,Carry);
    
endmodule
