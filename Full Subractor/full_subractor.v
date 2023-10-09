`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 09:48:52
// Design Name: 
// Module Name: full_subractor
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


module full_subractor(
    input a,
    input b,
    input c,
    output diff,
    output borrow
    );
    
    wire t1,t2,t3;
    
    assign t1=a^b;
    assign t2=~a&b;
    assign t3=~t1&c;
    assign diff=t1^c;
    assign borrow=t2|t3;

endmodule
