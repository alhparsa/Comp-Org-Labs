`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:57:40 04/21/2019 
// Design Name: 
// Module Name:    datapath 
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
module datapath(input jump,
					 input clk,
					 input rst,
					 input wr,
					 input branch,
					 input [2:0]alu_ctrl,
					 input alu_src_b,
					 input reg_dst,
					 input [25:0]inst_field,
					 input memtoreg,
					 input [31:0] data_in,
					 output [31:0] pc_out, 
					 output [31:0] alu_out, 
					 output [31:0] data_out
    );
		wire z;
		wire [31:0] branch_offset, pc_plus_4, branch_pc, mux_1, mux_2;
		
		p_counter mod0(clk, rst, 1'b1, mux_2,pc_out);
		assign pc_plus_4 = 3'd4+ pc_out;
		
		sign_ext mod1(inst_field[15:0], branch_offset);
		assign branch_pc = pc_plus_4 + branch_offset;
		assign mux_1 = z&branch == 0?pc_plus_4:branch_pc;
		
		wire [31:0] jump_addr = {pc_plus_4[31:28], inst_field[25:0], 2'b0}; 
		assign mux_2 = jump == 0? mux_1: jump_addr;
				
		
		wire [4:0] write_addr = reg_dst==0?inst_field[20:16]:inst_field[15:11];
		wire [31:0] write_data = memtoreg==0?alu_out:data_in;
		wire [31:0] A_data, B_data;
		
		registers mod2(.clk(clk), .rst(rst), .Addr_A_R(inst_field[25:21]),
							.Addr_B_R(inst_field[20:16]), .Write_Addr(write_addr), 
							.Write_data(write_data), .R_or_W(wr),.A_data(A_data), 
							.B_data(B_data));
		
		wire [31:0] inst_field_32, mux_3;
		sign_ext mod3(inst_field[15:0], inst_field_32);
		
		assign data_out = B_data;
		assign mux_3 = alu_src_b==0?B_data:inst_field_32;
		
		alu32 mod4(.ctrl(alu_ctrl), .a(A_data), .b(mux_3), .zero(z), 
					  .res(alu_out));
		
		
		
		
		
endmodule
