`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.10.2023 09:11:52
// Design Name: 
// Module Name: mealy_FSM_2_process
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


module mealy_FSM_2_process(
    input clk,
    input rst,
    input din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    
    reg [1:0] state,nstate;
    
    ////////Reset logic/////////
    
    always@(posedge clk)
    begin
    if(rst==1'b1)   state<=idle;
    else            state<=nstate;
    end
    
    ////////Output decoder + Next State Decoder/////////
    
    always@(state,din)
    begin
    case(state)
    idle:   begin
            if(rst==1'b1)
                begin
                nstate=idle;
                dout=1'b0;
                end
            else
                begin
                nstate=s0;
                dout=1'b0;
                end
            end             
    s0:     begin
            if(din==1'b1)
                   begin
                   nstate=s1;
                   dout=1'b0;
                   end
            else   
                    begin
                    nstate=s0;
                    dout=1'b0;
                    end
            end
    s1:     begin
            if(din==1'b1)
                    begin
                    nstate=s0;
                    dout=1'b1;
                    end
            else
                    begin
                    nstate=s1;
                    dout=1'b0;
                    end
            end
     default: begin
              dout=1'b0;
              nstate=idle;
              end
       endcase
       end         
endmodule
