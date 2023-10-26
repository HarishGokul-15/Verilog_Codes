`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 14:01:59
// Design Name: 
// Module Name: demux_1x4
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


module demux_1x4(
    input din,
    input [1:0] s,
    output reg d3,d2,d1,d0
    );
    initial begin
    d3=0;
    d2=0;
    d1=0;
    d0=0;
    end
    always@(*)
    begin
    case(s)
    2'b11: begin d3=din;d1=0;d2=0;d0=0; end
    2'b10: begin d3=0;d1=din;d2=0;d0=0; end
    2'b01: begin d3=0;d1=0;d2=din;d0=0; end
    2'b00: begin d3=0;d1=0;d2=0;d0=din; end
    endcase
    end
endmodule
