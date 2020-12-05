`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 17:32:02
// Design Name: 
// Module Name: ins_ram
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


module ins_ram(ins_add,ins);
    input wire[11:0] ins_add;
    output reg[15:0] ins;
    
    reg [15:0] ins_ram[12'b111111111111:0];
    
    initial begin
        ins_ram[0]=16'b0111000000000000; //LDA 0
        ins_ram[1]=16'b0001000000000000; //COM
        ins_ram[2]=16'b0011000000000000; //CSL
        ins_ram[3]=16'b0010000000000000; //SHR
        ins_ram[4]=16'b0000000000000000; //CLA
        ins_ram[5]=16'b0111000000000000; //LDA 0
        ins_ram[6]=16'b0101000000000001; //ADD 1
        ins_ram[7]=16'b0110000000000011; //STA 3
        ins_ram[8]=16'b0111000000000011; //LDA 3
        ins_ram[9]=16'b1000000000001011; //JMP 11
        ins_ram[10]=16'b0000000000000000; //CLA
        ins_ram[11]=16'b0001000000000000; //COM
        ins_ram[12]=16'b1001000000001110; //BAN 14
        ins_ram[13]=16'b0000000000000000; //CLA
        ins_ram[14]=16'b0100000000000000; //STOP
        ins_ram[15]=16'b0000000000000000; //CLA
        
        
        ins_ram[0]=16'b0111000000000011; //LDA 3
        ins_ram[1]=16'b0101000000000100; //ADD 4
        ins_ram[2]=16'b0010000000000000; //SHR
        ins_ram[3]=16'b0011000000000000; //CSL
        ins_ram[4]=16'b0001000000000000; //COM
        ins_ram[5]=16'b0000000000000000; //CLA
        ins_ram[6]=16'b0110000000000111; //STA 7
        ins_ram[7]=16'b0111000000000111; //LDA 7
        ins_ram[8]=16'b0101000000000011; //ADD 3
        ins_ram[9]=16'b1000000000001011; //JMP 11
        ins_ram[10]=16'b0000000000000000; //CLA
        ins_ram[11]=16'b0001000000000000; //COM
        ins_ram[12]=16'b1001000000001110; //BAN 14
        ins_ram[13]=16'b0000000000000000; //CLA
        ins_ram[14]=16'b0100000000000000; //STOP
        ins_ram[15]=16'b0000000000000000; //CLA
    end
    
    always@(ins_add) begin
        ins=ins_ram[ins_add];
    end
endmodule
