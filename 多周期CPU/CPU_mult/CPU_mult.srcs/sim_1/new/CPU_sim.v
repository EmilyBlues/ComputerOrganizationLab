`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/24 21:35:41
// Design Name: 
// Module Name: CPU_sim
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


module CPU_sim;

	reg CLK;
	reg Reset;
	wire [31:0] currentAddress;
	wire [31:0] nextAddress;
	wire [2:0] currentState;

	CPU_mult uut(
		.CLK(CLK),
		.Reset(Reset),
		.currentAddress(currentAddress),
		.nextAddress(nextAddress),
		.currentState(currentState)
	);

	always #50 CLK = ~CLK;
	initial begin
		CLK = 0;
		Reset = 0;
		#100 Reset = 1;
	end
endmodule
