`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:07:12 03/13/2019 
// Design Name: 
// Module Name:    MUX2T1_64 
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
module MUX2T1_64(input wire sel,
					  input wire [63:0] a,
					  input wire [63:0] b,
					  output wire [63:0] o
    );
	 assign o = sel? a: b;


endmodule
