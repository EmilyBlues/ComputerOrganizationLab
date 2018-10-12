`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 19:46:08
// Design Name: 
// Module Name: IR
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


module IR(
	input CLK,
	input IRWre,
	input [31:0] i_data,
	output reg [31:0] data_out
	);
	
	always @(negedge CLK) begin
		if(IRWre) begin
			data_out = i_data;
		end
	end

endmodule
