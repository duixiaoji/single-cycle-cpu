`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:26:28
// Design Name: 
// Module Name: cu
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


module cu(ins,is_ban,stop,change_pc,type_pc,acc_we,ram_add,ram_we,op);
    input wire [15:0] ins;
    input wire is_ban;
    output reg stop,acc_we,ram_we;
    output reg [11:0] change_pc,ram_add;
    output reg [1:0] type_pc;
    output reg [3:0] op;
    
    initial begin
        stop=0;
        change_pc=0;
        type_pc=0;
        acc_we=0;
        ram_add=0;
        ram_we=0;
        op=4'b1111;
    end
    
    always@(ins) begin
        case(ins[15:12])
            4'b0000: begin //CLA
                op=4'b0110;
                acc_we=1;
                type_pc=2'b00;
                ram_we=0;
            end
            4'b0001: begin //COM
                op=4'b0111;
                acc_we=1;
                type_pc=2'b00;
                ram_we=0;
            end
            4'b0010: begin //SHR
                op=4'b0100;
                acc_we=1;
                type_pc=2'b00;
                ram_we=0;
            end
            4'b0011: begin //CSL
                op=4'b0101;
                acc_we=1;
                type_pc=2'b00;
                ram_we=0;
            end
            4'b0100: begin //STOP
                stop=1;  
                op=4'b1111;
            end
            4'b0101: begin //ADD
                op=4'b0000;
                ram_add=ins[11:0];
                ram_we=0;
                acc_we=1; 
                type_pc=2'b00;
            end 
            4'b0110: begin //STA
                op=4'b1000;
                ram_add=ins[11:0];
                ram_we=1;
                acc_we=0; 
                type_pc=2'b00;
            end
            4'b0111: begin //LDA
                op=4'b1001;
                ram_add=ins[11:0];
                ram_we=0;
                acc_we=1; 
                type_pc=2'b00;
            end
            4'b1000: begin //JMP
                op=4'b1111;
                ram_we=0;
                acc_we=0; 
                change_pc=ins[11:0];
                type_pc=2'b01;
            end
            4'b1001: begin //BAN
                op=4'b1111;
                ram_we=0;
                acc_we=0; 
                change_pc=ins[11:0];
                if(is_ban==1)
                    type_pc=2'b10;
                else type_pc=2'b00;
            end
        endcase
    end
endmodule
