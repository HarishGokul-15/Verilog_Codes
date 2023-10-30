`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.10.2023 06:55:24
// Design Name: 
// Module Name: Serial_Peripheral_Interface
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


module Serial_Peripheral_Interface(
    input clk,
    input [11:0] din,
    input start_op,
    output reg cs,
    output reg mosi,
    output reg done,
    output sclk
    );
    
    reg sclkt=1'b0;
    integer count=0;
    
    always@(posedge clk)
    begin
        if(count<10)    count<=count+1;
        else
            begin
            count<=0;
            sclkt=~sclkt;
            end
     end
     
     reg [11:0] temp;
     integer bitcount=0;
     parameter idle=0,start=1,send=2,end_tx=3;
     reg [1:0] state=idle;
     
     always@(posedge sclkt)
     begin
        case(state)
        idle:   begin
                mosi<=1'b0;
                cs<=1'b1;
                done<=1'b0;
                if(start_op==1'b1)
                    state<=start;
                 else
                    state<=idle;
                end
        start:  begin
                cs<=1'b0;
                temp<=din;
                state<=send;
                end
        send:   begin
                if(bitcount<=11)
                    begin
                        bitcount<=bitcount+1;
                        mosi<=temp[bitcount];
                        state<=send;
                    end
                else
                    begin
                        bitcount<=0;
                        state<=end_tx;
                        mosi<=1'b0;
                    end
                end
        end_tx: begin
                cs<=1'b1;
                done<=1'b1;
                mosi<=1'b0;
                state<=idle;
                end
         default:   state<=idle;
         
        endcase
        end
assign sclk=sclkt;
     
endmodule
