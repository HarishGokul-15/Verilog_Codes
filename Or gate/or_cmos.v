`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 22:15:32
// Design Name: 
// Module Name: or_cmos
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


module or_cmos(
    input a,
    input b,
    output y
    );
    
    supply1 vdd;
    supply0 gnd;
    
    wire t1;
    wire t2;
    wire t3;
    
    pmos p1(t1,vdd,a);
    pmos p2(t2,t1,b);
    nmos n1(t2,gnd,a);
    nmos n2(t2,gnd,b);
    pmos p3(y,vdd,t2);
    nmos n3(y,gnd,t2);
endmodule
