`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10.10.2023 18:59:39
// Design Name: 
// Module Name: ripple_adder_4bit
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
module fa(input a,b,cin,output s,cout);

assign s=a^b^cin;
assign cout=(a&b)|(b&cin)|(a&cin);

endmodule

module ripple_adder_4bit(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] sum,
    output cout
    );
    wire [2:0] c;
    fa fa1(a[0],b[0],cin,sum[0],c[0]);
    fa fa2(a[1],b[1],c[0],sum[1],c[1]); 
    fa fa3(a[2],b[2],c[1],sum[2],c[2]); 
    fa fa4(a[3],b[3],c[2],sum[3],cout);  
endmodule
