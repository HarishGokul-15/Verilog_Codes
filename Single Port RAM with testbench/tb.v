`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.10.2023 13:10:20
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
 reg clk=0,rst=0,we=0;
    reg [7:0] din=0;
    reg [7:0] addr=0;
    wire  [7:0] dout;
    integer i;
    single_port_RAM_with_testbench dut(clk,rst,we,din,addr,dout);
    
    always #5 clk=~clk;
    
    task reset;
    begin
    rst=1'b1;
    repeat(10) @(posedge clk);
    end
    endtask
    
    task write;
    begin
    @(posedge clk)
    we=1'b1;
    rst=1'b0;
    for(i=0;i<20;i=i+1)
    begin
    din=$urandom();
    addr=$urandom_range(0,15);
    @(posedge clk);
    end
    end
    endtask
    
    task read;
    begin
    @(posedge clk);
    we=1'b0;
    rst=1'b0;
    for(i=0;i<20;i=i+1)
    begin
        addr=$urandom_range(0,15);
        din=0;
    repeat(2) @(posedge clk);
    end
    end
    endtask
    
    initial begin
    reset();
    write();
    read();
    end
    
endmodule
