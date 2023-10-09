`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09.10.2023 08:37:24
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder(
    input [7:0] din,
    output reg [2:0] out,
    output reg  fdru  //False data rejection Unit
    );
    
    always@(*)
    begin
    casex(din)
    8'b00000001:
        begin
        out=3'b000;
        fdru=1'b1;
        end
    8'b0000001x:
        begin
        out=3'b001;
        fdru=1'b1;
        end
    8'b000001xx:
        begin
        out=3'b010;
        fdru=1'b1;
        end
    8'b00001xxx:
        begin
        out=3'b011;
        fdru=1'b1;
        end
   8'b0001xxxx:
        begin
        out=3'b100;
        fdru=1'b1;
        end
    8'b001xxxxx:
        begin
        out=3'b101;
        fdru=1'b1;
        end
    8'b01xxxxxx:
        begin
        out=3'b110;
        fdru=1'b1;
        end
    8'b1xxxxxxx:
        begin
        out=3'b111;
        fdru=1'b1;
        end
    default:
        begin
        out=3'b000;
        fdru=1'b0;
        end
    
    endcase
    end
    
    
endmodule
