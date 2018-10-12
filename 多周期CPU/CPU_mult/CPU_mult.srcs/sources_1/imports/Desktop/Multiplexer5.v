`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:26:30
// Design Name: 
// Module Name: Multiplexer5
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


module Multiplexer5(
	input [1:0] control,
	input [4:0] in1,
	input [4:0] in2,
	output reg [4:0] out
	);
	
	always @(control or in1 or in2) begin
		case(control)
			2'b00: out <= 5'b11111;
			2'b01: out <= in1;
			2'b10: out <= in2;
		endcase
	end
	
endmodule
