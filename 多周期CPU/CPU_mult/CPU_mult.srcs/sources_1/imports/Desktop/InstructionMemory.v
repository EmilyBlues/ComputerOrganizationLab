`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:03:59
// Design Name: 
// Module Name: InstructionMemory
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


module InstructionMemory(
    input RW,
    input [31:0] IAddr,
    output [31:0] inst
    );
    
    reg [7:0] mem[0:127];
    
    initial begin
        $readmemb("D:/data.txt", mem);
    end
    
    assign inst[7:0] = (RW == 1) ? mem[IAddr + 3] : 8'bz;
    assign inst[15:8] = (RW == 1) ? mem[IAddr + 2] : 8'BZ;
    assign inst[23:16] = (RW == 1) ? mem[IAddr + 1] : 8'bz;
    assign inst[31:24] = (RW == 1) ? mem[IAddr + 0] : 8'bz;
    
endmodule
