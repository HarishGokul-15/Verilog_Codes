`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.10.2023 18:14:15
// Design Name: 
// Module Name: adder_with_file_handling
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


module adder_with_file_handling(
    input [7:0] a,
    input [7:0] b,
    output [8:0] y
    );
    
    assign y=a+b;
endmodule


module tb;
reg [7:0] a,b;
wire [8:0] y;
reg [8:0] result;
integer file; // to store file ID
integer i=0; //loop control variable
reg [8:0] mem [74:0]; //store 25 operand a and 25 operand b and 25 result value each 8 bit
integer err=0;
adder_with_file_handling dut(a,b,y);
initial begin
file=$fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/adder_with_file_handling/adder_with_file_handling.srcs/sim_1/imports/Downloads/data.txt","w");
for(i=0;i<=25;i=i+1)
begin
    $fdisplay(file,"%x\t%x\t%x",i,i,2*i);
end
$fclose(file);

file=$fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/adder_with_file_handling/adder_with_file_handling.srcs/sim_1/imports/Downloads/data.txt","r");
for(i=0;i<=25;i=i+1)
begin
    $readmemh("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/adder_with_file_handling/adder_with_file_handling.srcs/sim_1/imports/Downloads/data.txt",mem);
end

$fclose(file);

for(i=0;i<25;i=i+1)
begin
a=mem[3*i];
b=mem[3*i+1];
result=mem[3*i+2];

#10;
$display("The addition of %d and %d is %d and expected result:%d",a,b,y,result);

if(result!=y)   err=err+1;
end

if(err==0) $display("-----------------TEST PASSED------------");
else       $display("-----------------TEST FAILED------------");

end
endmodule
