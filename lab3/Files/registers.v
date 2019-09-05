`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:09 04/21/2019 
// Design Name: 
// Module Name:    registers 
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
module registers(input clk,
					  input rst,
					  input [4:0] Addr_A_R, 
					  input [4:0] Addr_B_R, 
					  input [4:0] Write_Addr,
					  input [31:0] Write_data,
					  input R_or_W,
					  output [31:0] A_data, 
					  output [31:0] B_data				  
    );

	reg [31:0] regs [0:31];
	assign A_data = regs[Addr_A_R];
	assign B_data = regs[Addr_B_R];
	always @(posedge clk or posedge rst)begin
		if (rst == 1)
			for (integer i = 0; i<32; i = i+1)
				regs[i] = 32'b0;
		else
			if ( R_or_W == 1 && Write_Addr!=0 )
				regs[Write_Addr] = Write_data;
	end
endmodule
