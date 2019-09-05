`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:08:33 04/22/2019
// Design Name:   addsub32
// Module Name:   Y:/sfuvault/comp org/labs/lab4/add_test.v
// Project Name:  lab6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: addsub32
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module add_test;

	// Inputs
	reg sub;
	reg [31:0] a;
	reg [31:0] b;

	// Outputs
	wire co;
	wire [31:0] res;

	// Instantiate the Unit Under Test (UUT)
	addsub32 uut (
		.sub(sub), 
		.a(a), 
		.b(b), 
		.co(co), 
		.res(res)
	);

	initial begin
		// Initialize Inputs
		sub = 0;
		a = 32'h0000000;
		b = 32'h0000000;
		#100;
		sub = 1;
		a = 32'h0000000;
		b = 32'h0000000;
		#100;	
		sub = 0;
		a = 32'h0000001;
		b = 32'h0000000;
		#100;
		sub = 1;
		a = 32'h0000001;
		b = 32'h0000000;
		#100;	
		sub = 0;
		a = 32'h0000001;
		b = 32'h0000001;
		#100;
		sub = 1;
		a = 32'h0000001;
		b = 32'h0000001;
		#100;	

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end
      
endmodule

