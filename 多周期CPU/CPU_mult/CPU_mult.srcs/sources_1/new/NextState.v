`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/22 20:06:13
// Design Name: 
// Module Name: NextState
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


module NextState(
    input [5:0] OPCode,
    input [2:0] i_state,
    output reg [2:0] next_state
    );

	parameter [2:0] sIF = 3'b000,
					sID = 3'b001,
					sEXE = 3'b010,
					sMEM = 3'b100,
					sWB = 3'b011;

	initial begin
		next_state <= 3'b000;
	end

	always @(i_state or OPCode) begin
		case(i_state)
			sIF: next_state = sID;
			sID: begin
			     	case(OPCode[5:3])
			     		3'b111: next_state = sIF;
			     		default: next_state = sEXE;
			     	endcase
			     end
			sEXE: begin
					if(OPCode == 6'b110000 || OPCode == 6'b110001)
						next_state = sMEM;
					else if(OPCode == 6'b110100 || OPCode == 6'b110110)
						next_state = sIF;
					else
						next_state = sWB;
				  end
			sWB: next_state = sIF;
			sMEM: begin
					if(OPCode == 6'b110000)
						next_state = sIF;
					else if(OPCode == 6'b110001)
						next_state = sWB;
				  end
			default: next_state = sIF;
		endcase

	end
endmodule
