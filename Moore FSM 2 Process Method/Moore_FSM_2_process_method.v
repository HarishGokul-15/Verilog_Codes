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


module moore_FSM_2_process_method(
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
    
   ///////////////Output decoder and next state decoder////////////
   
   always@(state,din)
   begin
   
   case(state)
   idle: 
   begin
        dout=1'b0;
        if(rst==1'b1)
            nextstate=idle;
        else
            nextstate=s0;
    end
    s0:
    begin
        dout=1'b0;
        if(din==1'b1)
            nextstate=s1;
        else
            nextstate=s0;
     end
    s1:
    begin
        dout=1'b1;
        if(din==1'b1)
            nextstate=s0;
        else
            nextstate=s1;
   end   
   endcase
   end
endmodule
