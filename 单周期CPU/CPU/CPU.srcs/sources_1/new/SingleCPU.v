`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 20:30:30
// Design Name: 
// Module Name: SingleCPU
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


module SingleCPU(
    input CLK,
    input Reset,
    output [5:0] op,
    output [4:0] rs,
    output [4:0] rt,
    output [4:0] rd,
    output [4:0] sa,
    output [4:0] WriteReg,
    output [15:0] immediate,
    output [31:0] ReadData1,
    output [31:0] ReadData2,
    output [31:0] nextAddress,
    output [31:0] result,
    output [2:0] ALUOp,
    output [1:0] PCSrc,
    output [31:0] currentAddress,
    output [31:0] DataOut,
    output zero, PCWre, ALUSrcA, ALUSrcB, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst, DBDataSrc
    );
    wire [31:0] inExt;
    wire [31:0] o_pc_i, o_pc_4, o_pc_j;
    wire [25:0] lowins;
    PC pc(CLK, Reset, PCWre, nextAddress, currentAddress);
    PC4 pc4(currentAddress, o_pc_4);
    InstructionMemory im(currentAddress, op, rs, rt, rd, immediate, sa, lowins);
    ControlUnit cu(op, zero, PCWre, ExtSel, InsMemRW, RegDst, RegWre, ALUSrcA, ALUSrcB, ALUOp, PCSrc, mRD, mWR, DBDataSrc);
    SignZeroExtend ext(ExtSel, immediate, inExt);
    Multiplexer5 mp5(RegDst, rd, rt, WriteReg);
    Reg rf(CLK, Reset, RegWre, rs, rt, WriteReg, DataOut, ReadData1, ReadData2);
    DataMemory dm(CLK, mRD, mWR, DBDataSrc, result, ReadData2, DataOut);
    PCi pci(o_pc_4, inExt, o_pc_i);
    ALU alu(ALUOp, ReadData1, ReadData2, inExt, sa, ALUSrcA, ALUSrcB, result, zero);
    PCj pcj(o_pc_4, lowins, o_pc_j);
    Multiplexer32 mp32(PCSrc, o_pc_4, o_pc_i, o_pc_j, nextAddress);

endmodule
