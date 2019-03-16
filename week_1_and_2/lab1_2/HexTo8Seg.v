`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:13 03/13/2019 
// Design Name: 
// Module Name:    HexTo8Seg 
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
module HexTo8Seg(input wire flash,
					  input wire [7:0]LES,
					  input wire [7:0]point,
					  input wire [31:0]Hexs,
					  output wire [63:0] SEG_TXT);
		
		
		wire And0 = flash & ~LES[0];
		wire Point0= ~point[0];
		MC14495_ZJU m0(.in(Hexs[3:0]), .LE(And0), .point(Point0), .o(SEG_TXT[7:0]));
			
		
		wire And1 = flash & ~LES[1];
		wire Point1= ~point[1];
		MC14495_ZJU m1(.in(Hexs[7:4]), .LE(And1), .point(Point1), .o(SEG_TXT[15:8]));
	
		wire And2 = flash & ~LES[2];
		wire Point2= ~point[2];
		MC14495_ZJU m2(.in(Hexs[11:8]), .LE(And2), .point(Point2), .o(SEG_TXT[23:16]));
		
		wire And3 = flash & ~LES[3];
		wire Point3= ~point[3];
		MC14495_ZJU m3(.in(Hexs[15:12]), .LE(And3), .point(Point3), .o(SEG_TXT[31:24]));
		
		wire And4 = flash & ~LES[4];
		wire Point4= ~point[4];
		MC14495_ZJU m4(.in(Hexs[19:16]), .LE(And4), .point(Point4), .o(SEG_TXT[39:32]));
		
		wire And5 = flash & ~LES[5];
		wire Point5= ~point[5];
		MC14495_ZJU m5(.in(Hexs[23:20]), .LE(And5), .point(Point5), .o(SEG_TXT[47:40]));
		
		wire And6 = flash & ~LES[6];
		wire Point6= ~point[6];
		MC14495_ZJU m6(.in(Hexs[27:24]), .LE(And6), .point(Point6), .o(SEG_TXT[55:48]));
	
		wire And7 = flash & ~LES[7];
		wire Point7= ~point[7];
		MC14495_ZJU m7(.in(Hexs[31:28]), .LE(And7), .point(Point7), .o(SEG_TXT[63:56]));
		
endmodule
