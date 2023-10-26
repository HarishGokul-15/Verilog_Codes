`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 12:46:11
// Design Name: 
// Module Name: tb
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


module tb;
reg clk=0,rst=0,ld=0;
reg [3:0] ldvalue;
wire [3:0] dout;

counter_with_testbench dut(clk,rst,ld,ldvalue,dout);
integer i;
initial begin
rst=1'b1;
#50;
rst=1'b0;
end


always #5 clk=~clk;

task counter;
begin
#50;
@(posedge clk);
ld=1'b1;
ldvalue=$urandom();
@(posedge clk);
ld=1'b0;
repeat(20) @(posedge clk);
end
endtask

initial begin
for(i=0;i<20;i=i+1)
begin
    counter();
end
end

initial begin
#700;
$finish;
end

endmodule
