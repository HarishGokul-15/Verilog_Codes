`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 18:21:18
// Design Name: 
// Module Name: fourmux_by_2mux
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


module fourmux_by_2mux(
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel,
    output  y
    );
    
    wire temp1;
    wire temp2;
    
    twoxone mux1(a,b,sel[0],temp1);
    twoxone mux2(c,d,sel[0],temp2);
    twoxone mux3(temp1,temp2,sel[1],y);
    
    endmodule
    
    module twoxone(input x,y,sel,output reg z);
    
    always@(*)
    begin
        if(sel==1'b1) z=y;
        else z=x;
    end
    endmodule
    
