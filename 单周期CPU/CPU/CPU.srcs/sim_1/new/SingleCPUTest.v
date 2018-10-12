`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 17:09:32
// Design Name: 
// Module Name: SingleCPUTest
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


module SingleCPUTest;

    reg CLK;
    reg Reset;
    
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] sa;
    wire [4:0] WriteReg;
    wire [15:0] immediate;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [31:0] DataOut;
    wire [31:0] nextAddress;
    wire [31:0] result;
    wire [2:0] ALUOp;
    wire [31:0] currentAddress;
    wire zero, PCWre, ALUSrcA, ALUSrcB, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst, DBDataSrc;
    wire [1:0] PCSrc;
    
    SingleCPU uut(
        .CLK(CLK),
        .Reset(Reset),
        .op(op),
        .rs(rs),
        .rt(rt),
        .rd(rd),
        .sa(sa),
        .WriteReg(WriteReg),
        .immediate(immediate),
        .ReadData1(ReadData1),
        .ReadData2(ReadData2),
        .nextAddress(nextAddress),
        .result(result),
        .ALUOp(ALUOp),
        .PCSrc(PCSrc),
        .currentAddress(currentAddress),
        .DataOut(DataOut),
        .zero(zero),
        .PCWre(PCWre),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .RegWre(RegWre),
        .InsMemRW(InsMemRW),
        .mRD(mRD),
        .mWR(mWR),
        .ExtSel(ExtSel),
        .RegDst(RegDst),
        .DBDataSrc(DBDataSrc)
    );
    
    initial begin
        CLK = 0;
        Reset = 0;
        
        #20;
            CLK = 1;
        #20;
            Reset = 1;
        forever #20 begin
            CLK = !CLK;
        end
    end
endmodule
