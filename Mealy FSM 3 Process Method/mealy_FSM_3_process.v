`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 08:45:02
// Design Name: 
// Module Name: mealy_FSM_3_process
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


module mealy_FSM_3_process(
    input clk,
    input rst,
    input din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    
    reg [1:0] state=idle,nstate=idle;
    ////////////Reset logic/////////
    always@(posedge clk)
    begin
    if(rst==1'b1)   state<=idle;
    else            state<=nstate;
    end

    ///////////Output Decoder.....
    always@(state,din)
    begin
    case(state)
    idle: dout=1'b0;
    s0: begin
        if(din==1'b1) dout=1'b1;
        else          dout=1'b0;
        end
    s1: begin
        if(din==1'b1) dout=1'b0; 
        else          dout=1'b0;
        end
    default: dout=1'b0;
    endcase
    end
    
    /////////Next state decoder////////
    
    always@(state,din)
    begin
    case(state)
    idle: begin
          if(rst==1'b1) nstate=idle;
          else          nstate=s0;
          end
    s0:   begin
          if(din==1'b1) nstate=s1;
          else          nstate=s0;
          end
    s1:   begin
          if(din==1'b1) nstate=s0;
          else          nstate=s1;
          end
    default: nstate=idle;
    endcase
    end
endmodule
