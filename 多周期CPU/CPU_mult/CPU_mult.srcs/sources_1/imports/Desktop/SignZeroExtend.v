`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:08:17
// Design Name: 
// Module Name: SignZeroExtend
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


module SignZeroExtend(
    input ExtSel,
    input [15:0] immediate,
    output reg [31:0] extendImmediate
    );

	integer i;
	initial begin
		extendImmediate = 0;
	end

	always @(ExtSel or immediate) begin
		for(i = 0; i < 16; i = i + 1) begin
			extendImmediate[i] <= immediate[i];
		end

		if(ExtSel) begin
			for(i = 16; i < 32; i = i + 1) begin
				extendImmediate[i] <= immediate[15];
			end
		end
		else begin
			for(i = 16; i < 32; i = i + 1) begin
				extendImmediate[i] <= 0;
			end
		end
	end

endmodule
