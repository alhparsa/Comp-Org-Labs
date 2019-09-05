`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    16:28:37 03/25/2019
// Design Name:
// Module Name:    top
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
module top(input RSTN,
				   input [3:0]BTN_y,
					output [4:0] BTN_x,
					input [15:0] SW,
					input clk_100mhz,
					output led_clk,
					output led_sout,
					output LED_PEN,
					output led_clrn,
					output seg_clk,
					output seg_sout,
					output SEG_PEN,
					output seg_clrn,
					output CR,
					output RDY,
					output readn,
					output[7:0]SEGMENT,
					output [3:0]AN);

	wire [3:0] Pulse;
	wire [3:0] BTN_OK;
	wire [15:0] SW_OK;
	wire [4:0] Din;
	wire rst;
	SAnti_jitter U9(.clk(clk_100mhz), .RSTN(RSTN), .Key_y(BTN_y), .Key_x(BTN_x),
						 .SW(SW), .readn(readn), .Key_ready(RDY), .CR(CR), .Key_out(Din), .pulse_out(Pulse),
						 .BTN_OK(BTN_OK), .SW_OK(SW_OK), .rst(rst));

	wire [31:0] Ai;
	wire [31:0] Bi;
	wire [7:0] blink;

	SEnter_2_32 M4(.clk(clk_100mhz), .Din(Din), .D_ready(RDY), .BTN(BTN_OK[2:0]), .Ctrl({SW_OK[7:5], SW_OK[15], SW_OK[0]})
					  ,.readn(readn), .Ai(Ai), .Bi(Bi), .blink(blink));


	wire [31:0] Div;
	clk_div U8(.clk(clk_100mhz), .rst(rst), .SW2(SW_OK[2]), .clkdiv(Div), .Clk_CPU(CLK_CPU));



	wire [31:0] inst, ram_data_in, ram_data_out;
	wire [9:0] ram_addr;
	wire data_ram_we;

	RAM_B U3 (.clka(~clk_100mhz), .addra(ram_addr), .wea(data_ram_we), .dina(ram_data_in), .douta(ram_data_out));
	ROM_B U2 (.a(PC[11:2]), .spo(inst));

	wire [31:0] counter_out, CPU2IO;
	wire [1:0] counter_ch;

	
	Counter U10(.clk(~CLK_CPU), .rst(rst), .clk0(Div[6]), .clk1(Div[9]), .clk2(Div[11]),
					.counter_we(counter_we), .counter_val(CPU2IO), .counter_ch(counter_ch),
					.counter0_OUT(counter0_out), .counter1_OUT(counter1_out), .counter2_OUT(counter2_out),
					.counter_out(counter_out));

	wire [31:0] PC, Addr_out, Data_in, Data_out;

	SCPU U1 (.clk(CLK_CPU), .reset(rst), .inst_in(inst), .INT(counter0_out), .PC_out(PC), .WR(mem_w),
				.Addr_out(Addr_out), .Data_out(Data_out), .Data_in(Data_in));



	wire [15:0] LED_out;

	MIO_BUS U4(.clk(clk_100mhz), .rst(rst), .BTN(BTN_OK), .SW(SW_OK), .mem_w(mem_w), .addr_bus(Addr_out),
				  .Cpu_data4bus(Data_in), .Cpu_data2bus(Data_out), .ram_data_in(ram_data_in), .data_ram_we(data_ram_we),
				  .ram_addr(ram_addr),.ram_data_out(ram_data_out), .Peripheral_in(CPU2IO), .GPIOe0000000_we(EN), 
				  .GPIOf0000000_we(GPIOF),.led_out(LED_out), .counter_out(counter_out), .counter0_out(counter0_out), 
				  .counter1_out(counter1_out),.counter2_out(counter2_out), .counter_we(counter_we));

	wire [7:0] LE_out, point_out;
	wire [31:0] Disp_num;


	Multi_8CH32 U5(.clk(~CLK_CPU), .rst(rst), .EN(EN), .Test(SW_OK[7:5]), .point_in({Div, Div}), .LES(64'b0),
								 .Data0(CPU2IO), .data1({2'b0, PC[31:2]}), .data2(inst), .data3(counter_out), .data4(Addr_out),
								 .data5(Data_out), .data6(Data_in), .data7(PC), .Disp_num(Disp_num), .LE_out(LE_out), .point_out(point_out));


	GPIO U7(.clk(~CLK_CPU), .rst(rst), .EN(GPIOF), .Start(Div[20]), .P_Data(CPU2IO), .counter_set(counter_ch), .LED_out(LED_out),
					.ledclk(led_clk), .ledsout(led_sout), .LEDEN(LED_PEN), .ledclrn(led_clrn));


	Display U6(.clk(clk_100mhz), .rst(rst), .Start(Div[20]), .Text(SW_OK[0]), .flash(Div[25]), .Hexs(Disp_num), .point(point_out),
						 .LES(LE_out), .segclk(seg_clk), .segsout(seg_sout), .SEGEN(SEG_PEN), .segclrn(seg_clrn));

		Seg7_Dev U61(.Scan({SW_OK[1], Div[19:18]}), .SW0(SW_OK[0]), .flash(Div[25]),
						 .Hexs(Disp_num), .point(point_out), .LES(LE_out), .SEGMENT(SEGMENT), .AN(AN));
endmodule
