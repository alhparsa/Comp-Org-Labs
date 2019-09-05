`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer[7:1] 
// 
// Create Date:    13:32:02 03/13/2019 
// Design Name: 
// Module Name:    MC14495_ZJU 
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
module MC14495_ZJU(input wire [3:0] in,
						 input wire LE,
						 input wire point,
						 output reg [7:0]o
						 );
	
	always @*begin
		if (LE)  o = 8'hff;
		else begin
			o[7] = point?0:1;
			case(in)
			4'h0:  o[6:0] = {7'h1000_000};
			4'h1:  o[6:0] = {7'b1111_001};
			4'h2:  o[6:0] = {7'b0100_100};
			4'h3:  o[6:0] = {7'b0110_000};
			4'h4:  o[6:0] = {7'b0011_001};
			4'h5:  o[6:0] = {7'b0010_010};
			4'h6:  o[6:0] = {7'b0000010};
			4'h7:  o[6:0] = {7'b1111000};
			4'h8:  o[6:0] = {7'b1111_111};
			4'h9:  o[6:0] = {7'b0010000};
			4'ha:  o[6:0] = {7'b0001000};
			4'hb:  o[6:0] = {7'b0000011};
			4'hc:  o[6:0] = {7'b1000110};
			4'hd:  o[6:0] = {7'b1011110};
			4'he:  o[6:0] = {7'b1111001};
			4'hf:  o[6:0] = {7'b1110001};
			endcase
		end
	end

endmodule
