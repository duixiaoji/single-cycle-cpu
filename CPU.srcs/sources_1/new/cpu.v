`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/06/19 18:30:38
// Design Name: 
// Module Name: cpu
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


module cpu(clk,rst,no);
    input wire clk,rst;
    output wire no;
    
    wire stop,acc_we,ram_we,is_ban;
    wire [11:0] change_pc,ram_add,pc_add;
    wire [15:0] ins,data_in1,data_in2,data_out;
    wire [3:0] op;
    wire [1:0] type_pc;
    
    pc pc(.clk(clk), .rst(rst), .stop(stop), .type_pc(type_pc),
        .change_pc(change_pc), .pc_add(pc_add));
            
    ins_ram ins_ram(.ins(ins),.ins_add(pc_add));
    
    acc acc(.clk(clk),.we(acc_we),
        .data_in(data_out),.data_out(data_in1),.is_ban(is_ban));
    
    alu alu(.data_in1(data_in1),.data_in2(data_in2),
        .data_out(data_out),.op(op));
    
    data_ram data_ram(.clk(clk),.we(ram_we),.add(ram_add),
        .data_in(data_out),.data_out(data_in2));
    
    cu cu(.ins(ins),.is_ban(is_ban),.stop(stop),
        .change_pc(change_pc),.type_pc(type_pc),
        .acc_we(acc_we),.ram_add(ram_add),.ram_we(ram_we),.op(op));
    
            
endmodule
