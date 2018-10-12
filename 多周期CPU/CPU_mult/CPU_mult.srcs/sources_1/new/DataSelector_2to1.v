`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 21:03:55
// Design Name: 
// Module Name: DataSelector_2to1
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


module DataSelector_2to1(
    input control,
    input [31:0] PC4,
    input [31:0] DataOut,
    output reg [31:0] out
    );

	always @(PC4 or DataOut or control) begin
		if(control == 0)
			out <= PC4;
		else 
			out <= DataOut;
	end
endmodule
