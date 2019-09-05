`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:34:08 04/21/2019 
// Design Name: 
// Module Name:    mux8to1 
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
module mux8to1(input [2:0]crtl,
					input [31:0]and32,
					or32,
					add32,
					xor32,
					nor32,
					srl32,
					sub32,
					slt,
					output reg [31:0] out
    );
	 
	 always @* begin
		case(crtl)
			3'd0: out = and32;
			3'd1: out = or32;
			3'd2: out = add32;
			3'd3: out = xor32;
			3'd4: out = nor32;
			3'd5: out = srl32;
			3'd6: out = sub32;
			3'd7: out = slt;
		endcase
	 end

endmodule
