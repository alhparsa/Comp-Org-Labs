`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:30 04/21/2019 
// Design Name: 
// Module Name:    addsub32 
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
module addsub32(input sub,
					 input [31:0] a,
					 input [31:0] b,
					 output co,
					 output [31:0] res
    );
	 wire [31:0] operand = sub==1? b ^ 1 : b;
	 add32 mod0(.a(a), .b(operand), .cin(sub),
					.co(co), .res(res));


endmodule
