`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 18:18:36
// Design Name: 
// Module Name: johnson_counter_by_dff
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
module dff(input clk,rst,d,output reg q);
always@(posedge clk,posedge rst)
begin
if(rst==1'b1) q<=1'b0;
else q<=d;
end
endmodule
//////////////////////D-flip flop/////////////////////////

module johnson_counter_by_dff(
    input clock,
    input reset,
    output  [3:0] dout,
    output [3:0] dout_bar
    );
    wire [3:0] d;
    //wire [3:0] d_bar;
    
  
    dff d1(clock,reset,d[0],dout[0]);
    dff d2(clock,reset,d[1],dout[1]);
    dff d3(clock,reset,d[2],dout[2]);
    dff d4(clock,reset,d[3],dout[3]);
    
    assign d[3]=~dout[0];
    assign d[2]=dout[3];
    assign d[1]=dout[2];
    assign d[0]=dout[1];
    assign dout_bar=~dout;
    endmodule
