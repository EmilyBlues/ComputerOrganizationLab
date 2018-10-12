`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 21:25:13
// Design Name: 
// Module Name: OutputFunc
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


module OutputFunc(
	input [2:0] state,
	input [5:0] opcode,
	input zero,
	input sign,
	output reg PCWre,
	output reg ALUSrcA,
	output reg ALUSrcB,
	output reg DBDataSrc,
	output reg WrRegDSrc,
	output reg RegWre,
	output reg InsMemRW,
	output reg mRD,
	output reg mWR,
	output reg IRWre,
	output reg ExtSel,
	output reg [1:0] PCSrc,
	output reg [1:0] RegDst,
	output reg [2:0] ALUOp
	);

	parameter [2:0] IF = 3'b000,
					ID = 3'b001,
					EXE = 3'b010,
					MEM = 3'b100,
					WB = 3'b011;
	parameter [5:0] add = 6'b000000,
					sub = 6'b000001,
					addi = 6'b000010,
					Or = 6'b010000,
					And = 6'b010001,
					ori = 6'b010010,
					sll = 6'b011000,
					slt = 6'b100110,
					sltiu = 6'b100111,
					sw = 6'b110000,
					lw = 6'b110001,
					beq = 6'b110100,
					bltz = 6'b110110,
					j = 6'b111000,
					jr = 6'b111001,
					jal = 6'b111010,
					halt = 6'b111111;

	initial begin
		PCWre <= 0;
		ALUSrcA <= 0;
		ALUSrcB <= 0;
		DBDataSrc <= 0;
		WrRegDSrc <= 0;
		RegWre <= 0;
		InsMemRW <= 1;
		mRD <= 0;
		mWR <= 0;
		IRWre <= 1;
		ExtSel <= 0;
		PCSrc <= 2'b00;
		RegDst <= 2'b00;
		ALUOp <= 3'b000;
	end

	always @(opcode or state or zero or sign) begin
		assign PCWre = (opcode != halt && state == IF) ? 1 : 0;
		assign ALUSrcA = (opcode == sll) ? 1 : 0;
		assign ALUSrcB = (opcode == addi || opcode == ori || opcode == sw || opcode == sltiu || opcode == lw) ? 1 : 0;
		assign DBDataSrc = (state == WB && opcode == lw) ? 1 : 0;
		assign RegWre = (state == WB || opcode == jal) ? 1 : 0;
		assign WrRegDSrc = (opcode == jal) ? 0 : 1;
		assign mRD = (opcode == lw && state == WB) ? 1 : 0;
		assign mWR = (opcode == sw && state == MEM) ? 1 : 0;
		assign ExtSel = (opcode == ori || opcode == sltiu) ? 0 : 1;
		assign IRWre = (state == ID) ? 1 : 0;

		RegDst[0] <= (opcode == addi || opcode == ori || opcode == sltiu || opcode == lw) ? 1 : 0;
		RegDst[1] <= (opcode == addi || opcode == ori || opcode == sltiu || opcode == lw || opcode == jal) ? 0 : 1;

		PCSrc[0] <= ((opcode == beq && zero == 1) || (opcode == bltz && sign == 1 && zero == 0) || opcode == jal || opcode == j) ? 1 : 0;
		PCSrc[1] <= (opcode == j || opcode == jal || opcode == jr) ? 1 : 0;

		ALUOp[0] <= (opcode == sub || opcode == Or || opcode == ori || opcode == slt || opcode == beq || opcode == bltz) ? 1 : 0;
		ALUOp[1] <= (opcode == And || opcode == slt || opcode == sltiu) ? 1 : 0;
		ALUOp[2] <= (opcode == Or || opcode == And || opcode == ori || opcode == sll) ? 1 : 0;

		if (state == IF) begin
			assign RegWre = 0;
			assign mRD = 0;
			assign mWR = 0;
		end
	end
endmodule
