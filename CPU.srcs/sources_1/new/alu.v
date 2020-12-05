`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:26:28
// Design Name: 
// Module Name: alu
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


module alu(data_in1,data_in2,data_out,op);
    input wire[15:0] data_in1,data_in2;
    input wire[3:0] op;
    output reg[15:0] data_out;
    
    always@* begin
        case(op)
            4'b0000:data_out=data_in1+data_in2;
            4'b0001:data_out=data_in1-data_in2;
            4'b0010:data_out=data_in1&data_in2;
            4'b0011:data_out=data_in1|data_in2;
            4'b0100:data_out=data_in1>>1;
            4'b0101:data_out={data_in1[14:0],data_in1[15]};
            4'b0110:data_out=0; 
            4'b0111:data_out=~data_in1;
            4'b1000:data_out=data_in1;
            4'b1001:data_out=data_in2;
        endcase
    end
    
endmodule
