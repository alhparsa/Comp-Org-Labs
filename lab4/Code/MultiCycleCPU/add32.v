`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:18:53 04/21/2019 
// Design Name: 
// Module Name:    add32 
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
module add32(input [31:0] a,
				 input [31:0] b,
				 input cin,
				 output [31:0] res,
				 output co,
				 output overflow
    );
	assign {co,res} = a+b+cin;

endmodule
