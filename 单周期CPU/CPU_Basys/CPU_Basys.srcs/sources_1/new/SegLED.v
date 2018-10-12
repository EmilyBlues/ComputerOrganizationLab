`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/29 21:32:54
// Design Name: 
// Module Name: 7_SegLED
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


module SegLED(
    input [3:0] display_data,
    input [6:0] dispCode
    );
    
    always @(display_data) begin
        case (num)
             4'b0000 : dispcode = 8'b100_0000;  //0£ª'0'-¡¡µ∆£¨'1'-œ®µ∆
             4'b0001 : dispcode = 8'b111_1001;  //1
             4'b0010 : dispcode = 8'b010_0100;  //2
             4'b0011 : dispcode = 8'b011_0000;  //3
             4'b0100 : dispcode = 8'b001_1001;  //4
             4'b0101 : dispcode = 8'b001_0010;   //5
             4'b0110 : dispcode = 8'b000_0010;  //6 
             4'b0111 : dispcode = 8'b101_1000;  //7
             4'b1000 : dispcode = 8'b000_0000;  //8
             4'b1001 : dispcode = 8'b001_0000;  //9
             4'b1010 : dispcode = 8'b000_1000;  //A
             4'b1011 : dispcode = 8'b000_0011;  //b
             4'b1100 : dispcode = 8'b100_0110;  //C
             4'b1101 : dispcode = 8'b010_0001;  //d
             4'b1110 : dispcode = 8'b000_0110;  //E
             4'b1111 : dispcode = 8'b000_1110; //F
             default : dispcode = 8'b000_0000;  //≤ª¡¡
         endcase  
    end
endmodule
