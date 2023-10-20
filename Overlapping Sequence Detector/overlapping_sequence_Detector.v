`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 11:56:25
// Design Name: 
// Module Name: overlapping_sequence_Detector
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


module overlapping_sequence_Detector(
    input clk,rst,din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    parameter s2=3;

    reg [1:0] state=idle;
    
    always@(posedge clk)
    begin
    case(state)
    idle:   begin
            dout<=1'b0;
            if(rst==1'b1)   state<=idle;
            else            state<=s0;
            end
    s0:     begin
            if(din==1'b1)
            begin
            dout<=1'b0;
            state<=s1;
            end
            else
            begin
            dout<=1'b0;
            state<=s0;
            end
            end        
    s1:     begin
            if(din==1'b1)
            begin
            dout<=1'b0;
            state<=s2;
            end
            else
            begin
            dout<=1'b0;
            state<=s0;
            end
            end
    s2:     begin
            if(din==1'b1)
            begin
            dout<=1'b1;
            state<=s2;
            end
            else
            begin
            dout<=1'b0;
            state<=s0;
            end
            end
    default: begin
             dout<=1'b0;
             state<=idle;
             end
             endcase
             end
endmodule
