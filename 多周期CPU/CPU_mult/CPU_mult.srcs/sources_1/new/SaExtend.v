`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/25 23:42:47
// Design Name: 
// Module Name: SaExtend
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


module SaExtend(
    input [4:0] sa,
    output wire [31:0] out
    );

	assign out = {{27{0}}, sa[4:0]};
endmodule
