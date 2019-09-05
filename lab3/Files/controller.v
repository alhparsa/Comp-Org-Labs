`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:48:31 04/21/2019 
// Design Name: 
// Module Name:    controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module controller(input [5:0] op, 
						input [5:0] func,
						input MIO_ready,
						output [2:0] alu_crtl,
						output branch,
						output regw,
						output regdst,
						output memtoreg,
						output alusrc_b,
						output mem_w,
						output jump
    );
	 assign branch = ~op[5] & ~op[3] & op[2] & ~op[1] & ~op[0];
	 assign regdst = ~(op[0]|op[1]|op[2]|op[3]|op[4]|op[5]);
	 assign mem_w = op[0]& op[1]&~op[2] &op[3] &op[5];
	 assign jump = op[0]& ~op[1]&~op[2] &~op[3] &~op[5];
	 assign memtoreg = op[0]& op[1]&~op[2] &~op[3] &op[5];
	 assign regw = memtoreg|regdst;
	 assign alusrc_b = mem_w|memtoreg;
	 assign alu_crtl[2] = branch | (regdst&func[1]);
	 assign alu_crtl[1] = ~(regdst&func[2]);
	 assign alu_crtl[0] = regdst&(func[3]&(~func[1]&func[0]));

endmodule
