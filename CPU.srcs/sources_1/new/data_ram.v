`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:26:28
// Design Name: 
// Module Name: data_ram
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


module data_ram(clk,we,add,data_in,data_out);
    input wire clk,we;
    input wire[11:0] add;
    input wire[15:0] data_in;
    output wire[15:0] data_out;
    
    reg [15:0] data_ram[12'b111111111111:0];
    
    initial begin
        for(integer i=0;i<10;i=i+1)
            data_ram[i]=i+1;
    end
    
    assign data_out=data_ram[add];
    
    always@(negedge clk) begin
        if(we==1)
            data_ram[add]=data_in;
    end
    
endmodule
