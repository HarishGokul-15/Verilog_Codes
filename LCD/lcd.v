`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.10.2023 14:58:06
// Design Name: 
// Module Name: lcd
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


module lcd(
    input clk,
    output reg rs,rw,
    output reg [7:0] dout,
    output en
    );
    
    reg [7:0] data [11:0];
    integer count=0;
    integer i=0;
    reg ent=1'b0;
    parameter send_command=0,send_data=1;
    reg state=send_command;
     
initial begin
 
///////////command for LCD , rs = 0
data[0] <= 8'h38; /////2 Lines 5 x 7 matrix
data[1] <= 8'h01; /////CLEAR DISPLAY
data[2] <= 8'h0E;// Display On Cursor Blinking
data[3] <= 8'h06; ////increment cursor from left to right
data[4] <= 8'h80;///// force cursor from beginning of first line
 
////////Data for LCD, rs = 1
data[5]  <= 8'h76; /////ascii value for v
data[6]  <= 8'h65;  ///e
data[7]  <= 8'h72;  ///r
data[8]  <= 8'h69; ///i
data[9]  <= 8'h6c; ///l
data[10] <= 8'h6f; /// o
data[11] <= 8'h67; ///g
end
 
    always@(posedge clk)
    begin
    if(count<10)
        begin
        count<=count+1;
        end
   else
        begin
        count<=0;
        ent=~ent;
        end
   end
   
   
   always@(posedge ent)
   begin
   case(state)
   send_command:    begin
                    if(i<4)
                        begin
                        rw<=1'b0;
                        rs<=1'b0;
                        dout<=data[i];
                        i<=i+1;
                        state<=send_command;
                        end
                     else
                        begin
                        dout<=data[i];
                        i<=i+1;
                        state<=send_data;
                        end
                    end
    send_data:      begin
                    if(i<=11)
                        begin
                        rw<=1'b0;
                        rs<=1'b1;
                        i<=i+1;
                        dout<=data[i];
                        state<=send_data;
                        end
                   else
                        begin
                        i<=0;
                        state<=send_command;
                        rs    <= 1'b0;
                        rw    <= 1'b0;
                        dout  <= 8'h00;
                        end
                    end
                    
      endcase
      end
      assign en=ent;
endmodule
