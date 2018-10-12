`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 20:29:40
// Design Name: 
// Module Name: ALUOutDR
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


module ALUOutDR(
	input CLK,
	input [31:0] i_data,
	output reg [31:0] o_data
	);

	always @(negedge CLK) begin
		o_data = i_data;
	end
endmodule
