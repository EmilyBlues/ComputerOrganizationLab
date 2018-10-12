`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/05/25 20:30:30
// Design Name: 
// Module Name: SingleCPU
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


module SingleCPU(
    input CLK_Q,
    input CLK,
    input Reset,
    input [1:0] SW_in,
    output reg [10:0] display_out
    );
    wire [31:0] currentAddress;
    wire [31:0] result;
    wire [5:0] op;
    wire [4:0] rs;
    wire [4:0] rt;
    wire [4:0] rd;
    wire [4:0] sa;
    wire [4:0] WriteReg;
    wire [15:0] immediate;
    wire [31:0] ReadData1;
    wire [31:0] ReadData2;
    wire [2:0] ALUOp;
    wire [1:0] PCSrc;
    wire [31:0] o_pc, o_pc_i, o_pc_4, o_pc_j;
    wire [31:0] DataOut;
    wire [31:0] inExt;
    wire zero, PCWre, ALUSrcA, ALUSrcB, RegWre, InsMemRW, mRD, mWR, ExtSel, RegDst, DBDataSrc;
    wire [25:0] lowins;
    
    parameter T1MS = 50000;
    reg [19:0] count = 0;
    reg [2:0] sel = 0;
    
    reg [3:0] op1;
    reg [3:0] op2;
    reg [3:0] curop1;
    reg [3:0] curop2;
    reg [3:0] rs1;
    reg [3:0] rs2;
    reg [3:0] rsNum1;
    reg [3:0] rsNum2;
    reg [3:0] rt1;
    reg [3:0] rt2;
    reg [3:0] rtNum1;
    reg [3:0] rtNum2;
    reg [3:0] alu1;
    reg [3:0] alu2;
    reg [3:0] db1;
    reg [3:0] db2;

    wire [7:0] op1_d;
    wire [7:0] op2_d;
    wire [7:0] curop1_d;
    wire [7:0] curop2_d;
    wire [7:0] rs1_d;
    wire [7:0] rs2_d;
    wire [7:0] rsNum1_d;
    wire [7:0] rsNum2_d;
    wire [7:0] rt1_d;
    wire [7:0] rt2_d;
    wire [7:0] rtNum1_d;
    wire [7:0] rtNum2_d;
    wire [7:0] alu1_d;
    wire [7:0] alu2_d;
    wire [7:0] db1_d;
    wire [7:0] db2_d;
    
    PC pc(CLK, Reset, PCWre, currentAddress, o_pc);
    PC4 pc4(o_pc, o_pc_4);
    InstructionMemory im(o_pc, op, rs, rt, rd, immediate, sa, lowins);
    ControlUnit cu(op, zero, PCWre, ExtSel, InsMemRW, RegDst, RegWre, ALUSrcA, ALUSrcB, ALUOp, PCSrc, mRD, mWR, DBDataSrc);
    SignZeroExtend ext(ExtSel, immediate, inExt);
    Multiplexer5 mp5(RegDst, rd, rt, WriteReg);
    Reg rf(CLK, Reset, RegWre, rs, rt, WriteReg, DataOut, ReadData1, ReadData2);
    DataMemory dm(CLK, mRD, mWR, DBDataSrc, result, ReadData2, DataOut);
    PCi pci(o_pc_4, inExt, o_pc_i);
    ALU alu(ALUOp, ReadData1, ReadData2, inExt, sa, ALUSrcA, ALUSrcB, result, zero);
    PCj pcj(o_pc_4, lowins, o_pc_j);
    Multiplexer32 mp32(PCSrc, o_pc_4, o_pc_i, o_pc_j, currentAddress);
    
    always @(o_pc or currentAddress or rs or rt or result or DataOut or ReadData1 or ReadData2) begin
        op1 = o_pc[7:4];
        op2 = o_pc[3:0];
        curop1 = currentAddress[7:4];
        curop2 = currentAddress[3:0];
        rs1 = 4'b0000;
        rs2 = rs[3:0];
        rsNum1 = ReadData1[7:4];
        rsNum2 = ReadData1[3:0];
        rt1 = 4'b0000;
        rt2 = rt[3:0];
        rtNum1 = ReadData2[7:4];
        rtNum2 = ReadData2[3:0];
        alu1 = result[7:4];
        alu2 = result[3:0];
        db1 = DataOut[7:4];
        db2 = DataOut[3:0];
    end

    SegLED seg1(op1, op1_d);
    SegLED seg2(op2, op2_d);
    SegLED seg3(curop1, curop1_d);
    SegLED seg4(curop2, curop2_d);
    SegLED seg5(rs1, rs1_d);
    SegLED seg6(rs2, rs2_d);
    SegLED seg7(rsNum1, rsNum1_d);
    SegLED seg8(rsNum2, rsNum2_d);
    SegLED seg9(rt1, rt1_d);
    SegLED seg10(rt2, rt2_d);
    SegLED seg11(rtNum1, rtNum1_d);
    SegLED seg12(rtNum2, rtNum2_d);
    SegLED seg13(alu1, alu1_d);
    SegLED seg14(alu2, alu2_d);
    SegLED seg15(db1, db1_d);
    SegLED seg16(db2, db2_d);

    always @(posedge CLK_Q) begin
        if(SW_in == 2'b00) begin
            case(sel)
                0: begin
                    display_out[10:7] = 4'b0111;
                    display_out[6:0] = op1_d;
                end
                1: begin
                    display_out[10:7] = 4'b1011;
                    display_out[6:0] = op2_d;
                end
                2: begin
                    display_out[10:7] = 4'b1101;
                    display_out[6:0] = curop1_d;
                end
                3: begin
                    display_out[10:7] = 4'b1110;
                    display_out[6:0] = curop2_d;
                end
            endcase
        end
        else if(SW_in == 2'b01) begin
            case(sel)
                0: begin
                    display_out[10:7] = 4'b0111;
                    display_out[6:0] = rs1_d;
                end
                1: begin
                    display_out[10:7] = 4'b1011;
                    display_out[6:0] = rs2_d;
                end
                2: begin
                    display_out[10:7] = 4'b1101;
                    display_out[6:0] = rsNum1_d;
                end
                3: begin
                    display_out[10:7] = 4'b1110;
                    display_out[6:0] = rsNum2_d;
                end
            endcase
        end
        else if(SW_in == 2'b10) begin
            case(sel)
                0: begin
                    display_out[10:7] = 4'b0111;
                    display_out[6:0] = rt1_d;
                end
                1: begin
                    display_out[10:7] = 4'b1011;
                    display_out[6:0] = rt2_d;
                end
                2: begin
                    display_out[10:7] = 4'b1101;
                    display_out[6:0] = rtNum1_d;
                end
                3: begin
                    display_out[10:7] = 4'b1110;
                    display_out[6:0] = rtNum2_d;
                end
            endcase
        end
        else if(SW_in == 2'b11) begin
            case(sel)
                0: begin
                    display_out[10:7] = 4'b0111;
                    display_out[6:0] = alu1_d;
                end
                1: begin
                    display_out[10:7] = 4'b1011;
                    display_out[6:0] = alu2_d;
                end
                2: begin
                    display_out[10:7] = 4'b1101;
                    display_out[6:0] = db1_d;
                end
                3: begin
                    display_out[10:7] = 4'b1110;
                    display_out[6:0] = db2_d;
                end
            endcase
        end
    end
    
    always@(posedge CLK_Q) begin
        count<=count+1;
        if(count==T1MS)
            begin
            count<=0;
            sel<=sel+1;
            if(sel==4)
                sel<=0;
            end
    end
endmodule
