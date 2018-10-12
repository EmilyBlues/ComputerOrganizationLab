`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 20:03:59
// Design Name: 
// Module Name: DFlipFlop
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


module DFlipFlop(
    input RST,
    input CLK,
    input [2:0] i_state,
    output reg [2:0] o_state
    );

	always @(posedge CLK) begin
		if(!RST)
			o_state = 3'b000;
		else 
			o_state = i_state;
	end
endmodule
