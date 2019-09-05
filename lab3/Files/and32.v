`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:12:41 04/21/2019 
// Design Name: 
// Module Name:    and32 
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
module and32(input [31:0]a,
				 input [31:0]b,
				 output [31:0]out
    );
	assign out = a & b;

endmodule
