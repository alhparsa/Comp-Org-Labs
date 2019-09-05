`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   20:14:20 04/22/2019
// Design Name:   nor32
// Module Name:   Y:/sfuvault/comp org/labs/lab4/nor32_test.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: nor32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nor32_test;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	nor32 uut (
		.a(a), 
		.b(b), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		a= 0;
		b = 0;
		#100;
      a = 1;
		b = 0;
		#50;
		a = 32'haaaaaaaa;
		b = 32'hbbbbbbbb;
		#50;
		a = 32'habcabcab;
		b = 32'habcabcab;
	end
      
endmodule

