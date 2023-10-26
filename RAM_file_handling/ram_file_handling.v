`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.10.2023 05:24:56
// Design Name: 
// Module Name: ram_file_handling
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


module ram_file_handling(
    input clk,we,oe,
    input [15:0] din,
    input [7:0] addr,
    output [15:0] dout
    );
    
    reg [15:0] mem [255:0];
    reg [15:0] temp;
    
    always@(posedge clk)
    begin
    if(we==1'b1) mem[addr]<=din;
    else         temp<=mem[addr];
    end
    assign dout=(oe==1'b1)?temp:16'h0000;
  
endmodule


module tb;
reg clk,we,oe;
reg [15:0] din;
reg [7:0] addr;
wire [15:0] dout;

ram_file_handling dut(clk,we,oe,din,addr,dout);
initial begin
clk=1'b0;
end
always #5 clk=~clk;

reg [15:0] result;
integer file,i;
integer err=0;
reg [15:0] data [9:0]; //data register to store nine 16bit value

initial begin
file=$fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/ram_file_handling/ram_file_handling.srcs/sim_1/imports/Downloads/mem_file.txt","w");
for(i=0;i<10;i=i+1)
begin
    @(posedge clk);
    oe=1'b0;we=1'b1;addr=i;din=$urandom();
    $fdisplay(file,"%x",din);
end

$fclose(file);


#10;

file=$fopen("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/ram_file_handling/ram_file_handling.srcs/sim_1/imports/Downloads/mem_file.txt","r");
$readmemh("C:/Users/HARISH GOKUL J/OneDrive/Documents/Udemy_verilog/ram_file_handling/ram_file_handling.srcs/sim_1/imports/Downloads/mem_file.txt",data);
$fclose(file);

for(i=0;i<10;i=i+1)
begin
@(posedge clk);
    oe=1'b1;we=1'b0;addr=i;
    @(posedge clk);
    result=data[i];
    if(result!=dout) err=err+1;
    $display("The expected value:%d and the obtained value:%d",result,dout);
end

if(err!=0) $display("-----------------TEST FAILED-----------------");
else       $display("-----------------TEST PASSED-----------------");

end



endmodule

