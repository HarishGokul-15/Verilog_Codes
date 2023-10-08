`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.10.2023 17:36:38
// Design Name: 
// Module Name: upcounter
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


module upcounter(
    input clk,
    input rst, //active reset
    input ld,  //ld provide signal to load the counter with initial value
    input [3:0] ld_value, //the load value
    output [3:0] y
    );
    
    reg [3:0] temp;
    
    initial begin
    temp=0;
    end
    
    always@(posedge clk)
    begin
    if(rst==1'b1)           //synchronous reset
        temp<=4'b0000;
    else
        begin
            if(ld==1'b1)
                temp<=ld_value;
            else
                temp<=temp+1;
        end
    end
    assign y=temp;
endmodule
