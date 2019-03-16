`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:20:58 03/13/2019 
// Design Name: 
// Module Name:    Display 
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
module Display(input wire clk,
					input wire rst,
					input wire Start,
					input wire Text,
					input wire flash,
					input wire [31:0] Hexs,
					input wire [7:0]point,
					input wire [7:0]LES,
					output wire segclk,
					output wire segsout,
					output wire SEGEN,
					output wire segclrn
    );
	
	wire [63:0] a, b;
	HexTo8Seg SM1(.flash(flash), .Hexs(Hexs), .point(point), .LES(LES), .SEG_TXT(a));
	SSeg_map SM3(.Hexs(Hexs), .Seg_map(b));
	wire [63:0]SEGMENTS;
	MUX2T1_64 MUXSH2M(.sel(Text), .a(a), .b(b), .o(SEGMENTS)); 
//	input wire clk,		//parallel to serial
//						input wire rst,
//						input wire Serial,
//						input wire[DATA_BITS-1:0] P_Data,
//						output reg  s_clk,
//						output wire s_clrn,
//						output wire sout,
//						output reg  EN
	P2S M2(.clk(clk), .rst(rst), .Serial(Start),.P_Data(SEGMENTS), .s_clk(segclk), .sout(segsout), .EN(SEGEN),.s_clrn(segclrn));

endmodule
