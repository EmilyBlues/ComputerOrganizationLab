`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/18 21:09:22
// Design Name: 
// Module Name: Reg
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


module Reg(
    input CLK,
    input Reset,
    input RegWre,
    input [4:0] ReadReg1,
    input [4:0] ReadReg2,
    input [4:0] WriteReg,
    input [31:0] WriteData,
    output [31:0] ReadData1,
    output [31:0] ReadData2
    );

    reg [31:0] regFile[0:31];
    integer i;

    initial begin
        for(i = 0; i < 32; i = i + 1) begin
            regFile[i] = 0;
        end
    end
    
    assign ReadData1 = (ReadReg1 == 0) ? 0 : regFile[ReadReg1];
    assign ReadData2 = (ReadReg2 == 0) ? 0 : regFile[ReadReg2];
   
    always @ (negedge CLK or negedge Reset) begin
        if (Reset==0) begin
            regFile[1] <= 32'b0000_0000_0000_0000_0000_0000_0000_1000; 
            for(i = 2; i < 32; i = i + 1) 
                regFile[i] <= 0; 
        end 
        else if(RegWre == 1 && WriteReg != 0)
            regFile[WriteReg] <= WriteData;
    end 
    
endmodule
