`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 23:47:28
// Design Name: 
// Module Name: PCi
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


module PCi(
    input [31:0] Address,
    input [31:0] immediate,
    output [31:0] newAddress
    );
    
    assign newAddress = Address + (immediate << 2);
    
endmodule
