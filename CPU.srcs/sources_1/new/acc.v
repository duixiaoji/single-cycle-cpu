`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:13:37
// Design Name: 
// Module Name: acc
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


module acc(clk,we,data_in,data_out,is_ban);
    input wire clk,we;
    input wire [15:0] data_in;
    output wire [15:0] data_out;
    output wire is_ban;
    
    reg [15:0] acc;
    
    initial begin
        acc=0;
    end
    
    assign data_out=acc;
    assign is_ban=acc[15];
    
    always@(negedge clk) begin
        if(we==1)
            acc=data_in;
    end
    
endmodule
