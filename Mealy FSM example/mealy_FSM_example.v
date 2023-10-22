`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.10.2023 12:14:57
// Design Name: 
// Module Name: mealy_FSM_example
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


module mealy_FSM_example(
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
    if(rst==1'b1)
    begin
        dout<=1'b0;
        state<=idle;
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
                state<=s2;
                dout<=1'b0;
                end
                end
       s1:      begin
                if(din==1'b1)
                begin
                state<=s1;
                dout<=1'b1;
                end
                else
                begin
                state<=s2;
                dout<=1'b1;
                end
                end
        s2:      begin
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
                endcase
                end
                end
endmodule
