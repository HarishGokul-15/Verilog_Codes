`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 18:09:58
// Design Name: 
// Module Name: mux4_!
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

module mux2_1(input a,b,sel,output y);
assign y=(sel==1'b0)?a:b;
endmodule

module mux4_1(
    input i0,
    input i1,
    input i2,
    input i3,
    input [1:0] sel,
    output y
    );
    wire t1,t2;
    
    mux2_1 mux1(.a(i0),.b(i1),.sel(sel[0]),.y(t1));
    mux2_1 mux2(.a(i2),.b(i3),.sel(sel[0]),.y(t2));
    mux2_1 mux3(.a(t1),.b(t2),.sel(sel[1]),.y(y));
endmodule
