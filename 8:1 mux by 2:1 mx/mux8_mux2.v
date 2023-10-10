`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 19:12:03
// Design Name: 
// Module Name: mux8_mux2
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
module mux2_mux1(input a,b,sel,output y);

assign y=(sel==1'b0)?a:b;
endmodule
//////////////////////////2x1mux...............................

module mux8_mux2(
    input [7:0] i,
    input [2:0] sel,
    output y
    );
    
    wire t1,t2,t3,t4,t5,t6;
    mux2_mux1 mux1(i[0],i[1],sel[0],t1);
    mux2_mux1 mux2(i[2],i[3],sel[0],t2);
    mux2_mux1 mux3(i[4],i[5],sel[0],t3);
    mux2_mux1 mux4(i[6],i[7],sel[0],t4);
    mux2_mux1 mux5(t1,t2,sel[1],t5);
    mux2_mux1 mux6(t3,t4,sel[1],t6);
    mux2_mux1 mux7(t5,t6,sel[2],y); 
    
endmodule
