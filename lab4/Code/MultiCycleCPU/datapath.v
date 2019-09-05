`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:13:45 05/27/2019 
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
module datapath(input wire clk,
					 reset,
					 MIO_ready,
					 pc_write,
					 pcwritecond,
					 branch,
					 IorD,
					 AluSrcA,
					 regwrite,
					 IRwrite,
					 input wire [1:0] PCSource,
					 ALUSrcB,
					 RegDst,
					 MemToReg,
					 input wire [2:0] ALU_ops,
					 input wire [31:0] data_to_Cpu,
					 output wire [31:0] PC_current,
					 M_addr,
					 data_out,
					 inst,
					 output wire zero, overflow
    );


	wire [31:0] mdr, ALU_out, wt_data, rdata_a, rdata_b, imm_32, A, B, res, out_2;
	wire [4:0] rs = inst[25:21];
	wire [4:0] rt = inst[20:16];
	wire [4:0] rd = inst[15:11];
	wire [4:0] wr_add;
	assign data_out = rdata_b;
	reg32 m0 (.clk(clk), .rst(reset), .CE(IRwrite), .D(data_to_Cpu), .Q(inst));
	reg32 m1 (.clk(clk), .rst(1'b0), .CE(1'b1), .D(data_to_Cpu), .Q(mdr));
	mux4_1 m3 (.switch(RegDst), .in_1(rt), .in_2(rd), .in_3(5'b11111), .in_4(5'b0), .o(wr_add));
	mux4_1_32 m4 (.switch(MemToReg), .in_1(ALU_out), .in_2(mdr), .in_3({inst[15:0], 16'b0}), .in_4(PC_current), .o(wt_data));
	regs m5 (.clk(clk), .rst(reset), .R_addr_A(rs), .R_addr_B(rt), .Wt_addr(wr_add), .Wt_data(wt_data), .L_S(regwrite), .rdata_A(rdata_a), .rdata_B(rdata_b));	
	sign_extension m6(.inp(inst[15:0]), .out(imm_32));
	mux2_1 m7 (.s(AluSrcA), .inp_0(PC_current), .inp_1(rdata_a), .out(A));
	mux4_1_32 m8 (.switch(ALUSrcB), .in_1(rdata_b), .in_2(32'd4), .in_3(imm_32), .in_4({imm_32[29:0], 2'b0}), .o(B));
	alu32 m9 (.ctrl(ALU_ops), .a(A), .b(B), .overflow(overflow), .zero(zero), .res(res));
	mux4_1_32 m10 (.switch(PCSource), .in_1(res), .in_2(ALU_out), .in_3({PC_current[31:28], inst[25:0], 2'b0}), .in_4(ALU_out), .o(out_2));
	wire ce = (((~(zero ^ branch) & pcwritecond) | pc_write) & MIO_ready);
	reg32 m11 (.clk(clk), .rst(reset), .CE(ce), .D(out_2), .Q(PC_current));
	reg32 m12 (.clk(clk), .rst(1'b0), .CE(1'b1), .D(res), .Q(ALU_out));
	mux2_1 m13 (.s(IorD), .inp_0(PC_current), .inp_1(ALU_out), .out(M_addr));


endmodule
