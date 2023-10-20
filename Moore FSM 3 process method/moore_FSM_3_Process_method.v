`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 10:40:24
// Design Name: 
// Module Name: moore_FSM_3_Process_method
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


module moore_FSM_3_Process_method(
    input clk,
    input rst,
    input din,
    output reg dout
    );
    
    ////////////Moore FSM by 3 process method////////////
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    
    reg [1:0] state=idle,nextstate=idle;
    ///////////Reset Logic///////////////
    always@(posedge clk)
    begin
    if(rst==1'b1)   state<=idle;    ///Reset must be a sequential process
    else            state<=nextstate;
    end
    
    ////////Output Decoder
    
    always@(state,din)
    begin
    case(state)
    idle: dout=1'b0;
    s0:dout=1'b0;
    s1:dout=1'b1;
    default:dout=1'b0;
    endcase
    end    
    
    /////Next state Decoder
    always@(state,din)
    begin
    case(state)
    idle:begin
            if(rst==1'b1)
            nextstate=idle;
            else
            nextstate=s0;
         end
    s0:begin
            if(din==1'b1) nextstate=s1;
            else nextstate=s0;
       end
    s1:begin
            if(din==1'b1) nextstate=s0;
            else nextstate=s1;
       end
    default: nextstate=idle;
    
    endcase
    end
    
    
endmodule
