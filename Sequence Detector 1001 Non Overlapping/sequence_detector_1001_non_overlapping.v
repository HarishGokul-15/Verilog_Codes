`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2023 12:49:07
// Design Name: 
// Module Name: sequence_detector_1001_non_overlapping
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


module sequence_detector_1001_non_overlapping(
    input clk,rst,din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    parameter s2=3;
    parameter s3=4;
    
    reg [2:0] state=idle;
    
    always@(posedge clk)
    begin
    if(rst==1'b1)
    begin
        state<=idle;
        dout<=1'b0;
    end
    else
    begin
        case(state)
        idle:   begin
                state<=s0;
                dout<=1'b0;
                end
        s0:     begin
                if(din==1'b1)
                begin
                state<=s1;
                dout<=1'b0;
                end
                else
                begin
                state<=s0;
                dout<=1'b0;
                end
                end
        s1:     begin
                if(din==1'b1)
                begin
                state<=s1;
                dout<=1'b0;
                end
                else
                begin
                state<=s2;
                dout<=1'b0;
                end
                end
       s2:     begin
                if(din==1'b1)
                begin
                state<=s1;
                dout<=1'b0;
                end
                else
                begin
                state<=s3;
                dout<=1'b0;
                end
                end    
        s3:     begin
                if(din==1'b1)
                begin
                state<=s0;
                dout<=1'b1;
                end
                else
                begin
                state<=s0;
                dout<=1'b0;
                end
                end 
                endcase   
    end
    end
endmodule
