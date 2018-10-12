`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 10:11:28
// Design Name: 
// Module Name: DataMemory
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


module DataMemory(
    input CLK,
    input mRD,
    input mRW,
    input DBDataSrc,
    input [31:0] DAddr,
    input [31:0] DataIn,
    output [31:0] DataOut
    );
    
    reg [7:0] memory[0:60];
    wire [31:0] tempOut;

    integer i;
    initial begin
        for(i = 0; i < 61; i = i + 1)
            memory[i] = 0;
    end
    
    assign tempOut[7:0] = (mRD == 1) ? memory[DAddr + 3] : 8'bz;
    assign tempOut[15:8] = (mRD == 1) ? memory[DAddr + 2] : 8'bz;
    assign tempOut[23:16] = (mRD == 1) ? memory[DAddr + 1] : 8'bz;
    assign tempOut[31:24] = (mRD == 1) ? memory[DAddr] : 8'bz;

    assign DataOut = (DBDataSrc == 1) ? tempOut : DAddr;

    always @(negedge CLK) begin
        if (mRW) begin
            memory[DAddr] <= DataIn[31:24];
            memory[DAddr + 1] <= DataIn[23:16];
            memory[DAddr + 2] <= DataIn[15:8];
            memory[DAddr + 3] <= DataIn[7:0];
        end
    end
endmodule
