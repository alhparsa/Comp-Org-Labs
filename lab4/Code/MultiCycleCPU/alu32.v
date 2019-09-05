`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:42:00 04/21/2019 
// Design Name: 
// Module Name:    alu32 
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
module alu32(input [2:0]ctrl,
				 input [31:0] a,
				 input [31:0] b,
				 output co,
				 output overflow,
				 output zero,
				 output [31:0]res
    );
	wire [31:0] and32out, or32out, xor32out,
					nor32out, srl32out, addsub32out;
	and32 mod0(a,b, and32out);
	or32 mod1(a,b, or32out);
	xor32 mod2(a,b, xor32out);
	nor32 mod3(a,b, nor32out);
	srl32 mod4(a,b, srl32out);
	addsub32 mod5(ctrl[2], a,b,co,addsub32out);	
	mux8to1 mod6(.crtl(ctrl),.and32(and32out),.or32(or32out),
					 .add32(addsub32out), .xor32(xor32out),
					 .nor32(nor32out),.srl32(srl32out),
					 .sub32(and32out),.slt({31'b0,addsub32out[31]}),.out(res));
	assign zero = (res==32'b0)?1:0;

endmodule
