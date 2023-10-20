`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.10.2023 12:31:47
// Design Name: 
// Module Name: moore_1001_detector
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


module moore_1001_detector(
    input clk,rst,din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    parameter s2=3;
    parameter s3=4;
    parameter s4=5;
    
    reg [2:0] state=idle,nstate=idle;
    /////////////Reset Logic//////////////
    always@(posedge clk)
    begin
    if(rst==1'b1) state<=idle;
    else          state<=nstate;
    end
    ///////////Output///////
    always@(state,din)
    begin
    case(state)
    idle: dout=1'b0;
    s0:   dout=1'b0;
    s1:   dout=1'b0;
    s2:   dout=1'b0;
    s3:   dout=1'b0;
    s4:   dout=1'b1;
    endcase
    end
    ////////Next State////
    always@(state,din)
    begin
    case(state)
    idle: begin
          if(rst==1'b1) nstate=idle;
          else          nstate=s0;
          end
    s0: begin
          if(din) nstate=s1;
          else          nstate=s0;
          end
    s1: begin
          if(din) nstate=s1;
          else          nstate=s2;
          end   
    s2: begin
          if(din) nstate=s1;
          else          nstate=s3;
          end
    s3: begin
          if(din) nstate=s4;
          else          nstate=s0;
          end
   s4: begin
          if(din) nstate=s1;
          else          nstate=s0;
          end
endcase
end


endmodule
