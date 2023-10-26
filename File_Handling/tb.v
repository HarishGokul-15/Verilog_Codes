`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 15:49:03
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

integer file_id=0;
integer i=0;




reg [7:0] arr1 [25:0];
reg [7:0] arr2 [25:0];
reg [7:0] mem[51:0]; //the value range from 0 to 25 so 5 bit could accommodate the value and the for loop range from 0 to 25 so depth is 26
initial begin
file_id = $fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/file_handling/file_handling.srcs/sim_1/imports/Downloads/file.txt","w"); // Opening file in read mode with parameter (file location,type of operation)
for(i=0;i<=25;i=i+1)
begin
    /*$display is used to write data and contain three
    arguement :- File id, format(hex or bin),source of data)*/
    $fdisplay(file_id,"%x\t%x",i,5*i);
end

$fclose(file_id);

file_id = $fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/file_handling/file_handling.srcs/sim_1/imports/Downloads/file.txt","r"); // Opening file in read mode with parameter (file location,type of operation)
$readmemh("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/file_handling/file_handling.srcs/sim_1/imports/Downloads/file.txt",mem);

for(i=0;i<=51;i=i+1)
begin
$display("%d",mem[i]);
end

for(i=0;i<26;i=i+1)
begin
arr1[i]=mem[2*i];
arr2[i]=mem[2*i+1];
end
for(i=0;i<26;i=i+1)
begin
$display("%d\t%d",arr1[i],arr2[i]);
end
end
endmodule
