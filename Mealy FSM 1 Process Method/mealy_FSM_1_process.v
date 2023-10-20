`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 14:03:26
// Design Name: 
// Module Name: mealy_FSM_1_process
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


module mealy_FSM_1_process(
    input clk,rst,din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    
    reg [1:0] state;
    
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
        idle: begin
              state<=s0;
              dout<=1'b0;
              end
        s0:   begin
              if(din==1'b1)
              begin
              state<=s1;
              dout<=1'b1;
              end
              else
              begin
              state<=s0;
              dout<=1'b0;
              end    
              end
        s1:   begin
              if(din==1'b1)
              begin
              state<=s0;
              dout<=1'b0;
              end
              else
              begin
              state<=s1;
              dout<=1'b0;
              end    
              end
         default:begin
                 dout<=1'b0;
                 state<=idle;
                 end
          endcase
          end
          end
endmodule
