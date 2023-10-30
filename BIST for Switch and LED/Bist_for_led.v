`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2023 08:21:48
// Design Name: 
// Module Name: Bist_for_led
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


module Bist_for_led(
    input clk,
    input [3:0] sw,
    output [3:0] led
    );
    
    integer count=0;
    reg sclk=1'b0;
    
    always@(posedge clk)
    begin
    if(count<10)
        begin
        count<=count+1;
        end
    else
        begin
        sclk<=~sclk;
        count<=0;
        end
    end
    
    reg flag=1'b0;
    always@(posedge clk) //The switch change must be more sensitive so fast clock is preferred
    begin
    if(sw==4'b0000)
        begin
            flag<=1'b0;
        end
   else
        begin
            flag<=1'b1;
        end
    end
    
    reg [3:0] temp=4'b0000;
    integer index=0;
    always@(posedge clk)
    begin
        if(flag==1'b0)
            begin
                if(index<4)
                    begin
                    temp<={1'b1,temp[3:1]};
                    index<=index+1;
                    end
                else if(index<8)
                    begin
                    temp<={temp[2:0],1'b0};
                    index<=index+1;
                    end
                else
                    begin
                    temp<=4'b0000;
                    index<=0;
                    end
             end
         else
            begin
                temp<=sw;
            end
   end
   
    assign led=temp;            
           
endmodule
