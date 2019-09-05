`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:30:31 04/21/2019 
// Design Name: 
// Module Name:    sign_ext 
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
module sign_ext(input [15:0] a,
					 output [31:0] res
    );
	assign res = a[15]==1?{16'hffff,a}:{16'h0,a};
endmodule
