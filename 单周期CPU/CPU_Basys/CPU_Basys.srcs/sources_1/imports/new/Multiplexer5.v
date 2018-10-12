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
    input control,
    input [4:0] in1,
    input [4:0] in0,
    output reg [4:0] out
    );
    
    always @(control or in1 or in0) begin
   		out = (control == 1) ? in1 : in0;
    end
    
endmodule
