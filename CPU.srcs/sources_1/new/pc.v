`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/18 19:31:39
// Design Name: 
// Module Name: pc
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


module pc(clk,rst,stop,type_pc,change_pc,pc_add);
    input wire clk,rst,stop;
    input wire[1:0] type_pc;
    input wire[11:0] change_pc;
    output reg[11:0] pc_add;
    
    initial begin
        pc_add=0;
    end
    
    always@(negedge clk) begin
        if(rst==1)
            pc_add=0;
        if(stop==0)
            case(type_pc)
                2'b00:pc_add=pc_add+1;
                2'b01:pc_add=change_pc;
                2'b10:pc_add=pc_add+change_pc;
            endcase
    end
endmodule
