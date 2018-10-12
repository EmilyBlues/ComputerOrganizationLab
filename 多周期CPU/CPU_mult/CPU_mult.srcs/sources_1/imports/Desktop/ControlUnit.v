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
	input CLK,
	input [5:0] opcode,
	input zero,
	input sign,
	input rst,
	output PCWre,
	output ALUSrcA,
	output ALUSrcB,
	output DBDataSrc,
	output WrRegDSrc,
	output RegWre,
	output InsMemRW,
	output mRD,
	output mWR,
	output IRWre,
	output ExtSel,
	output [1:0] PCSrc,
	output [1:0] RegDst,
	output [2:0] ALUOp
	);

	wire [2:0] i_state, o_state;

	DFlipFlop Df(rst, CLK, i_state, o_state);
	NextState Ns(opcode, o_state, i_state);
	OutputFunc Of(o_state, opcode, zero, sign, PCWre, ALUSrcA, ALUSrcB, DBDataSrc, WrRegDSrc, RegWre, InsMemRW, mRD, mWR, IRWre, ExtSel, PCSrc, RegDst, ALUOp);
	
endmodule
