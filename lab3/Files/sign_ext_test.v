`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:05:01 04/21/2019
// Design Name:   sign_ext
// Module Name:   Y:/Documents/lab6/sign_ext_test.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: sign_ext
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sign_ext_test;

	// Inputs
	reg [15:0] a;

	// Outputs
	wire [31:0] res;

	// Instantiate the Unit Under Test (UUT)
	sign_ext uut (
		.a(a), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		a = 16'h7777;

		// Wait 100 ns for global reset to finish
		#100;
		a = 16'h8888;
        
		// Add stimulus here

	end
      
endmodule

