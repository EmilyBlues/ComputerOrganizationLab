`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:29:49
// Design Name: 
// Module Name: PC
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


module PC(
	input CLK,
	input Reset,
	input PCWre,
	input [31:0] newAddress,
	output reg[31:0] Address
	);
	
	initial begin
		Address = 0;
	end
	
	always@(negedge Reset or negedge CLK) begin
		if(Reset == 0)
			Address <= 0;
		else if(PCWre == 1) begin
			Address <= newAddress;
		end
	end
	
endmodule
