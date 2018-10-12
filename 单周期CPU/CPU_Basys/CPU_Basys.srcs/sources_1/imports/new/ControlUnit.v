`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 19:02:11
// Design Name: 
// Module Name: ControlUnit
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


module ControlUnit(
    input [5:0] opCode,
    input zero,
    output reg PCWre,
    output reg ExtSel,
    output reg InsMemRW,
    output reg RegDst,
    output reg RegWre,
    output reg ALUSrcA,
    output reg ALUSrcB,
    output reg [2:0] ALUOp,
    output reg [1:0] PCSrc,
    output reg mRD,
    output reg mWR,
    output reg DBDataSrc
    );
    
    initial begin
        PCWre = 0;
        ExtSel = 0;
        InsMemRW = 1;
        RegDst = 0;
        RegWre = 1;
        ALUSrcA = 0;
        ALUSrcB = 0;
        ALUOp = 3'b000;
        PCSrc = 2'b00;
        mRD = 1;
        mWR = 0;
        DBDataSrc = 0;
    end
    
    always@(opCode or zero) begin
        PCWre = (opCode == 6'b111111) ? 0 : 1;
        InsMemRW = 0;
        ALUSrcA = (opCode == 6'b011000) ? 1 : 0;
        mRD = (opCode == 6'b100111) ? 1 : 0;
        mWR = (opCode == 6'b100110) ? 1 : 0;
        case(opCode)
            6'b000000: begin
                           ExtSel = 0;
                           RegDst = 1;
                           RegWre = 1;
                           ALUSrcB = 0;
                           ALUOp = 000;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b000001: begin
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 1;
                           ALUSrcB = 1;
                           ALUOp = 000;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b000010: begin
                           ExtSel = 0;
                           RegDst = 1;
                           RegWre = 1;
                           ALUSrcB = 0;
                           ALUOp = 001;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b010000: begin
                           ExtSel = 0;
                           RegDst = 0;
                           RegWre = 1;
                           ALUSrcB = 1;
                           ALUOp = 011;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b010001: begin
                           ExtSel = 0;
                           RegDst = 1;
                           RegWre = 1;
                           ALUSrcB = 0;
                           ALUOp = 100;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b010010: begin
                           ExtSel = 0;
                           RegDst = 1;
                           RegWre = 1;
                           ALUSrcB = 0;
                           ALUOp = 011;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b011000: begin
                           ExtSel = 0;
                           RegDst = 1;
                           RegWre = 1;
                           ALUSrcB = 0;
                           ALUOp = 010;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b011011: begin
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 1;
                           ALUSrcB = 1;
                           ALUOp = 110;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b100110: begin
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 0;
                           ALUSrcB = 1;
                           ALUOp = 000;
                           PCSrc = 00;
                           DBDataSrc = 0;
                       end
            6'b100111: begin
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 1;
                           ALUSrcB = 1;
                           ALUOp = 000;
                           PCSrc = 00;
                           DBDataSrc = 1;
                       end
            6'b110000: begin
                           if(zero == 0)
                               PCSrc = 00;
                           else if(zero == 1)
                               PCSrc = 01;
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 0;
                           ALUSrcB = 0;
                           ALUOp = 001;
                           DBDataSrc = 0;
                       end
            6'b110001: begin
                           if(zero == 0)
                               PCSrc = 01;
                           else if(zero == 1)
                               PCSrc = 00;
                           ExtSel = 1;
                           RegDst = 0;
                           RegWre = 0;
                           ALUSrcB = 0;
                           ALUOp = 001;
                           DBDataSrc = 0;
                       end
            6'b111000: begin
                           ExtSel = 0;
                           RegDst = 0;
                           RegWre = 0;
                           ALUSrcB = 0;
                           ALUOp = 000;
                           PCSrc = 10;
                           DBDataSrc = 0;
                       end
        endcase
    end
endmodule
