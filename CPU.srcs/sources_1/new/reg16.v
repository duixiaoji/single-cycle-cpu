`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:29:58
// Design Name: 
// Module Name: reg16
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


module reg16(clk,we,read1,read2,write,data_write,data_read1,data_read2);
    input wire clk,we;
    input wire [2:0] read1,read2,write;
    input wire [15:0] data_write;
    output wire [15:0] data_read1,data_read2;
    
    reg[15:0] reg16[7:0];
    
    initial begin
        for(integer i=0;i<8;i=i+1)
            reg16[i]=i;
    end
    
    assign data_read1=reg16[read1];
    assign data_read2=reg16[read2];
    
    always@(negedge clk)
    begin
        if(we==1)
            reg16[write]=data_write;
    end
    
endmodule
