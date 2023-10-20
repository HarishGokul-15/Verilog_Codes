`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.10.2023 12:41:53
// Design Name: 
// Module Name: Moore_FSM_one_process_method
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


module Moore_FSM_one_process_method(
    input clk,
    input rst,
    input din,
    output reg dout
    );
    
    parameter idle=0;
    parameter s0=1;
    parameter s1=2;
    
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
            idle:
                begin
                dout<=1'b0;
                state<=s0;
                end
            s0:
                begin
                dout<=1'b0;
                if(din==1'b1)
                    begin
                        dout<=1'b1;
                        state<=s1;
                    end
                else
                    begin
                        dout<=1'b0;
                        state<=s0;
                    end
                end
             s1:
                begin
                dout<=1'b1;
                if(din==1'b1)
                    begin
                        dout<=1'b0;
                        state<=s0;
                    end
                else
                    begin
                        dout<=1'b1;
                        state<=s1;
                    end
                end
                endcase
            end
            

end
endmodule
