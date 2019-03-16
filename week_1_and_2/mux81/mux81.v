`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:24:44 03/04/2019 
// Design Name: 
// Module Name:    mux81 
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
module mux81(input wire [7:0]in,
				 input wire [2:0]s,
				 output wire out
    );
	assign out = in[s];
endmodule
