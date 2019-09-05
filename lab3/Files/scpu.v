`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:30:01 04/21/2019 
// Design Name: 
// Module Name:    scpu 
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
module scpu(input clk,
				input rst,
				input [31:0]data_in,
				input [31:0] inst_in,
				input wire MIO_ready,
				input INT,
				output [31:0] pc_out, 
				output [31:0] addr_out,
				output [31:0] data_out,
				output wire mem_w,
				output wire cpu_mio
    );
	
	wire [2:0] alu_crtl;
//	input jump,
//					 input clk,
//					 input rst,
//					 input wr,
//					 input branch,
//					 input [2:0]alu_ctrl,
//					 input alu_src_b,
//					 input reg_dst,
//					 input [25:0]inst_field,
//					 input memtoreg,
//					 input [31:0] data_in,
//					 output [31:0] pc_out, 
//					 output [31:0] alu_out, 
//					 output [31:0] data_out
	datapath mod0(jump, clk, rst, regw, branch, alu_crtl, alusrc_b,
						 reg_dst, inst_in[25:0], memtoreg, data_in, pc_out,
						 addr_out, data_out);

//input [5:0] op, 
//						input [5:0] func,
//						input MIO_ready,
//						output [2:0] alu_crtl,
//						output branch,
//						output regw,
//						output regdst,
//						output memtoreg,
//						output alusrc_b,
//						output mem_w,
//						output jump
//    );
	controller mod1(inst_in[31:26], inst_in[5:0],MIO_ready,alu_crtl,
					  branch, regw, regdst, memtoreg, alusrc_b, mem_w,
					  jump);
endmodule
