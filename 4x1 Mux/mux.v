`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 10:26:11
// Design Name: 
// Module Name: mux
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


module mux(
    input a,
    input b,
    input c,
    input d,
    input [1:0] sel,
    output reg y
    );
    
//    always@(*)
//    begin
//    if(sel==2'b00)                  //Mux using if-else if-else implementatiom
//        y=a;
//    else if(sel==2'b01)
//        y=b;
//    else if(sel==2'b10)
//        y=c;
//    else
//        y=d;
//    end

        always@(*)
        begin
        case(sel)
        2'b00:y=a;
        2'b01:y=b;
        2'b10:y=c;
        2'b11:y=d;
        endcase
        end

endmodule
