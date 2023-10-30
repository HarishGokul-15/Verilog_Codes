`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 14:20:49
// Design Name: 
// Module Name: pwm
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


module pwm(
    input clk,
    input rst,
    output reg  dout
    );
    
    integer ton=0;
    parameter pos=0;
    parameter neg=1;
    integer flag=pos;
    parameter period=100;
    integer count=0;
    reg ncycle=1'b0;
    always@(posedge clk)
    begin
        if(rst==1'b1)
               begin
               count<=0;
               ton<=1'b0;
               ncycle<=1'b0;
               end
        else
               begin
               if(count<=ton)
                     begin
                     count<=count+1;
                     ncycle<=1'b0;
                     dout<=1'b1;
                     end
               else if(count<period)
                     begin
                     count<=count+1;
                     dout<=1'b0;
                     ncycle<=1'b0;
                     end
               else
                      begin
                      ncycle<=1'b1;
                      count<=0;
                      end
               end  
          end
          
         always@(posedge clk)
         begin
         if(rst==1'b0)
         begin
            if(ncycle==1'b1)
                begin
                    if(ton<period && flag==pos )
                        ton<=ton+5;
                    else if(ton==period)
                        begin
                        ton<=ton-5;
                        flag<=neg;
                        end
                    else if(ton<period &&flag==neg && ton>0)
                        begin
                        ton<=ton-5;
                        end
                    else if(ton==0)
                    begin
                        ton<=0;
                        flag<=pos;
                        end
                end
         end   
         end              
endmodule
