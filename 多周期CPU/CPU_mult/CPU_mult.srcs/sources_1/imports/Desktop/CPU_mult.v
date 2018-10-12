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


module CPU_mult(
	input CLK,
	input Reset,
	output [31:0] currentAddress,
	output [31:0] nextAddress,
	output [2:0] currentState
	);

	parameter endReg = 5'b111111;

	wire [2:0] nextState;
	wire zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, RegWre, InsMemRW, mRD, mWR, IRWre, ExtSel;
	wire [1:0] PCSrc, RegDst;
	wire [2:0] ALUOp;
	wire [31:0] instr_i, instr;
	wire [5:0] op;
	wire [4:0] rs, rt, rd, sa, WriteReg;
	wire [15:0] immediate;
	wire [31:0] inExt, saExt, rega, regb;
	wire [31:0] WriteData, ReadData1_i, ReadData2_i, ReadData1, ReadData2;
	wire [31:0] o_pc_i, o_pc_4, o_pc_j, o_pc_rs;
	wire [31:0] result, DAddr;
	wire [31:0] DataOut_i, DataOut;
	wire [25:0] lowins;
	PC pc(CLK, Reset, PCWre, nextAddress, currentAddress);
	PC4 pc4(currentAddress, o_pc_4);
	PCi pci(o_pc_4, inExt, o_pc_i);
	PCj pcj(o_pc_4, lowins, o_pc_j);
	Multiplexer32 mp32(PCSrc, o_pc_4, o_pc_i, ReadData1_i, o_pc_j, nextAddress);

	InstructionMemory im(InsMemRW, currentAddress, instr_i);
	IR ir(CLK, IRWre, instr_i, instr);
	InstructionDiv Idiv(instr, op, rs, rt, rd, sa, immediate, lowins);
	
	Multiplexer5 mp5(RegDst, rt, rd, WriteReg);	
	DataSelector_2to1 Ds(WrRegDSrc, o_pc_4, DataOut, WriteData);
	Reg rf(CLK, Reset, RegWre, rs, rt, WriteReg, WriteData, ReadData1_i, ReadData2_i);
	ADR Adr(CLK, ReadData1_i, ReadData1);
	BDR Bdr(CLK, ReadData2_i, ReadData2);

	DFlipFlop Df(Reset, CLK, nextState, currentState);
	NextState Nstate(op, currentState, nextState);
	OutputFunc Ofunc(currentState, op, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, RegWre, InsMemRW, mRD, mWR, IRWre, ExtSel, PCSrc, RegDst, ALUOp);
	SignZeroExtend ext(ExtSel, immediate, inExt);
	
	SaExtend se(sa, saExt);
	DataSelector_2to1 DsA(ALUSrcA, ReadData1, saExt, rega);
	DataSelector_2to1 DsB(ALUSrcB, ReadData2, inExt, regb);
	ALU alu(ALUOp, rega, regb, result, zero, sign);
	ALUOutDR ALUdr(CLK, result, DAddr);
	DataMemory dm(CLK, mRD, mWR, DBDataSrc, result, DAddr, ReadData2, DataOut_i);
	DBDR Ddr(CLK, DataOut_i, DataOut);
endmodule
