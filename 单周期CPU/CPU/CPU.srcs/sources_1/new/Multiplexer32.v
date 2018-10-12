`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:27:43
// Design Name: 
// Module Name: Multiplexer32
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


module Multiplexer32(
    input [1:0] control,
    input [31:0] in0,
    input [31:0] in1,
    input [31:0] in2,
    output reg [31:0] out
    );
    
    always @(control or in0 or in1 or in2) begin
        case(control)
            2'b00: out <= in0;
            2'b01: out <= in1;
            2'b10: out <= in2;
        endcase
    end
endmodule
