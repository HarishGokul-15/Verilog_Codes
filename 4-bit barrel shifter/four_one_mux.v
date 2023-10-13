`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.10.2023 23:35:15
// Design Name: 
// Module Name: four_one_mux
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


module four_one_mux(
    input d0,d1,d2,d3,
    output reg y,
    input [1:0] sel
    );
    
    always@(*)
    begin
    case(sel)
    2'b00: y=d0;
    2'b01: y=d1;
    2'b10: y=d2;
    2'b11: y=d3;
    endcase
    end
endmodule
