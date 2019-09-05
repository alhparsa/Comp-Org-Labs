`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:51:14 05/30/2019 
// Design Name: 
// Module Name:    MCPU 
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
module MCPU(input wire INT,
            input wire clk,
            input wire reset,
            input wire MIO_ready,
            input wire [31:0] Data_in,
            output wire mem_w,
            output wire [31:0] PC_out,
            output wire [31:0] inst_out,
            output wire [31:0] Data_out,
            output wire [31:0] Addr_out,
            output wire CPU_MIO
    );

    
    wire [1:0] RegDst, MemtoReg, ALUSrcB, PCSource;
    wire [2:0] ALU_operation;
    wire [31:0] Inst;
    wire zero, overflow;
    controller m(.clk(clk), .Inst_in(Inst), .reset(reset), .MIO_ready(MIO_ready), .zero(zero), .overflow(overflow),
                .MemRead(MemRead) ,.MemWrite(MemWrite), .ALU_operation(ALU_operation), .CPU_MIO(CPU_MIO), .IorD(IorD),
                .IRWrite(IRWrite), .RegDst(RegDst), .RegWrite(RegWrite), .MemtoReg(MemtoReg), .ALUSrcA(ALUSrcA), 
                .ALUSrcB(ALUSrcB), .PCSource(PCSource), .PCWrite(PCWrite), .PCWriteCond(PCWriteCond), .Branch(Branch));

    assign mem_w = (~MemRead)&MemWrite;
	 
    datapath m2(.clk(clk), .reset(reset), .MIO_ready(MIO_ready), .branch(Branch), .pc_write(PCWrite), .pcwritecond(PCWriteCond),
              .IorD(IorD), .AluSrcA(AluSrcA), .ALUSrcB(ALUSrcB), .IRwrite(IRWrite), .PCSource(PCSource), .RegDst(RegDst), 
              .MemToReg(MemtoReg), .ALU_ops(ALU_operation), .data_to_Cpu(Data_in), .PC_current(PC_out), .M_addr(Addr_out),
              .data_out(Data_out), .inst(Inst), .zero(zero), .overflow(overflow));


endmodule

