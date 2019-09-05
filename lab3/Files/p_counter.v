`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:26:13 04/21/2019 
// Design Name: 
// Module Name:    p_counter 
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
module p_counter(input clk,
					  input rst,
					  input en,
					  input [31:0] a,
					  output [31:0] res
    );

	reg [31:0] counter;
	always @(posedge clk or posedge rst)
		if (rst==1) counter = 32'b0;
		else if (en == 1) counter = a;
	
	assign res = counter;

endmodule
