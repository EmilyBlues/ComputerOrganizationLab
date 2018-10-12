`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/18 19:56:12
// Design Name: 
// Module Name: ALU
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


module ALU(
    input [2:0] ALUopcode, 
    input [31:0] rega, 
    input [31:0] regb,
    input [31:0] inExt,
    input [4:0] insa,
    input ALUSrcA, 
    input ALUSrcB, 
    output reg [31:0] result, 
    output reg zero 
    );
    
    wire [31:0] A;
    wire [31:0] B;
    
    assign A = (ALUSrcA == 1) ? insa : rega;
    assign B = (ALUSrcB == 1) ? inExt : regb;
     
    always @( ALUopcode or rega or regb or ALUSrcA or ALUSrcB or A or B or inExt or insa) begin 
        case (ALUopcode) 
            3'b000 : begin
                         result = A + B;
                         zero = (result == 0) ? 1 : 0;
                     end          
            3'b001 : begin
                         result = A - B;
                         zero = (result == 0) ? 1 : 0;
                     end
            3'b010 : begin
                         result = B << A;
                         zero = (result == 0) ? 1 : 0;
                     end
            3'b011 : begin
                         result = A | B;
                         zero = (result == 0) ? 1 : 0;
                     end 
            3'b100 : begin
                         result = A & B;
                         zero = (result == 0) ? 1 : 0;
                     end 
            3'b101 : begin
                         result = (A < B) ? 1 : 0;
                         zero = (result == 0) ? 1 : 0;
                     end
            3'b110 : begin
                         if(A < B && (A[31] == B[31]))
                             result = 1; 
                         else if (A[31] == 1 && B[31] == 0) 
                             result = 1; 
                         else result = 0; 
                         zero = (result == 0) ? 1 : 0;
                     end 
            3'b111 : begin
                         result = A ^ B;
                         zero = (result == 0) ? 1 : 0;
                     end
            default : begin 
                          result = 32'h00000000; 
                          $display (" no match"); 
                      end 
       endcase 
   end
endmodule
