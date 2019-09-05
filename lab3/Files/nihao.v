`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:53:58 04/21/2019
// Design Name:   alu32
// Module Name:   Y:/Documents/lab6/nihao.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module nihao;

	// Inputs
	reg [2:0] ctrl;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire co;
	wire overflow;
	wire zero;
	wire [31:0] res;

	// Instantiate the Unit Under Test (UUT)
	alu32 uut (
		.ctrl(ctrl), 
		.a(a), 
		.b(b), 
		.co(co), 
		.overflow(overflow), 
		.zero(zero), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		ctrl = 0;
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

