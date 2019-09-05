// Verilog test fixture created from schematic Y:\Documents\lab6\test.sch - Sun Apr 21 15:00:51 2019

`timescale 1ns / 1ps

module test_test_sch_tb();

// Inputs
   reg b;
   reg a;

// Output
   wire o;

// Bidirs

// Instantiate the UUT
   test UUT (
		.b(b), 
		.a(a), 
		.o(o)
   );
// Initialize Inputs
   `ifdef auto_init
       initial begin
		b = 0;
		a = 0;
		#50;
		b = 1;
		a = 0;
		#50;
		b =1;
		a = 1;
		#50;
		b = 0;
		a = 1;
		#50;
   `endif
endmodule
