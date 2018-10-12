`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/26 23:49:13
// Design Name: 
// Module Name: PCj
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


module PCj(
    input [31:0] Address,
    input [25:0] immediate,
    output reg [31:0] newAddress
    );
    reg [27:0] temp;
    
    always @(immediate or Address) begin
        temp = immediate << 2;
        newAddress = {Address[31:28], temp[27:0]};
    end
    
endmodule
