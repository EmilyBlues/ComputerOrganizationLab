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
    input [31:0] IAddr,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [15:0] immediate,
    output [4:0] sa,
    output [25:0] lowins
    );
    
    reg [7:0] mem[0:127];
    reg [31:0] address;
    reg [31:0] instruction;
    
    initial begin
        mem[0] = 8'b00000100;
        mem[1] = 8'b00000001;
        mem[2] = 8'b00000000;
        mem[3] = 8'b00001000;
        mem[4] = 8'b01000000;
        mem[5] = 8'b00000010;
        mem[6] = 8'b00000000;
        mem[7] = 8'b00000010;
        mem[8] = 8'b00000000;
        mem[9] = 8'b01000001;
        mem[10] = 8'b00011000;
        mem[11] = 8'b00000000;
        mem[12] = 8'b00001000;
        mem[13] = 8'b01100010;
        mem[14] = 8'b00101000;
        mem[15] = 8'b00000000;
        mem[16] = 8'b01000100;
        mem[17] = 8'b10100010;
        mem[18] = 8'b00100000;
        mem[19] = 8'b00000000;
        mem[20] = 8'b01001000;
        mem[21] = 8'b10000010;
        mem[22] = 8'b01000000;
        mem[23] = 8'b00000000;
        mem[24] = 8'b01100000;
        mem[25] = 8'b00001000;
        mem[26] = 8'b01000000;
        mem[27] = 8'b01000000;
        mem[28] = 8'b11000101;
        mem[29] = 8'b00000001;
        mem[30] = 8'b11111111;
        mem[31] = 8'b11111110;
        mem[32] = 8'b01101100;
        mem[33] = 8'b01000110;
        mem[34] = 8'b00000000;
        mem[35] = 8'b00001000;
        mem[36] = 8'b01101100;
        mem[37] = 8'b11000111;
        mem[38] = 8'b00000000;
        mem[39] = 8'b00000000;
        mem[40] = 8'b00000100;
        mem[41] = 8'b11100111;
        mem[42] = 8'b00000000;
        mem[43] = 8'b00001000;
        mem[44] = 8'b11000000;
        mem[45] = 8'b11100001;
        mem[46] = 8'b11111111;
        mem[47] = 8'b11111110;
        mem[48] = 8'b10011000;
        mem[49] = 8'b00100010;
        mem[50] = 8'b00000000;
        mem[51] = 8'b00000100;
        mem[52] = 8'b10011100;
        mem[53] = 8'b00101001;
        mem[54] = 8'b00000000;
        mem[55] = 8'b00000100;
        mem[56] = 8'b11100000;
        mem[57] = 8'b00000000;
        mem[58] = 8'b00000000;
        mem[59] = 8'b00010000;
        mem[60] = 8'b00000100;
        mem[61] = 8'b00001010;
        mem[62] = 8'b00000000;
        mem[63] = 8'b00001010;
        mem[64] = 8'b11111100;
        mem[65] = 8'b00000000;
        mem[66] = 8'b00000000;
        mem[67] = 8'b00000000;
        instruction = 0;
    end
    
    always @(IAddr) begin
        address = IAddr[6:2] << 2;
        instruction = (mem[address]<<24) + (mem[address+1]<<16) + (mem[address+2]<<8) + mem[address+3];
    end
    
    assign op = instruction[31:26];
    assign rs = instruction[25:21];
    assign rt = instruction[20:16];
    assign rd = instruction[15:11];
    assign immediate = instruction[15:0];
    assign sa = instruction[10:6];
    assign lowins = instruction[25:0];
    
endmodule
