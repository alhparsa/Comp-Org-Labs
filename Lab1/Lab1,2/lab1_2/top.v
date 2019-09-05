`timescale 1ns / 1ps
module top(
		input wire RSTN,
		input wire [3:0] BTN_y,
		output wire [4:0] BTN_x,
		input wire [15:0] SW,
		input wire clk_100mhz,
		output wire CR,
		output wire RDY,
		output wire readn,
		output wire seg_clk,
		output wire seg_sout,
		output wire SEG_PEN,
		output wire seg_clrn,
		output wire [7:0]SEGMENT,
		output wire [3:0]AN,
		output wire [7:0]LED,
		output wire Buzzer,
		output wire LEDCLK,
		output wire LEDDT,
		output wire LEDEN,
		output wire LEDCLR
	 );

	 wire [4:0] U9_Keyout;
	 wire [3:0] Pulse;
	 wire [3:0] U9_BTNOK;
	 wire [15:0] U9_SWOK;
	 wire rst;
	 SAnti_jitter U9(.RSTN(RSTN), .clk(clk_100mhz), .Key_y(BTN_y), .Key_x(BTN_x),
						.SW(SW), .readn(readn), .CR(CR), .Key_out(U9_Keyout), .Key_ready(RDY),
						.pulse_out(Pulse), .BTN_OK(U9_BTNOK), .SW_OK(U9_SWOK), .rst(rst));
	 wire [31:0] U8_div;
	 wire U8_clkCPU;
	 clk_div U8(.clk(clk_100mhz), .rst(rst), .SW2(U9_SWOK[2]), .clkdiv(U8_div), .Clk_CPU(U8_clkCPU));

	 wire [31:0] M4_Ai;
	 wire [31:0] M4_Bi;
	 wire [7:0] M4_blink;
	 SEnter_2_32 M4(.clk(clk_100mhz), .Din(U9_Keyout), .D_ready(RDY), .BTN(U9_BTNOK[2:0]),
						 .Ctrl({U9_SWOK[7:5], U9_SWOK[15], U9_SWOK[0]}), .readn(readn), .Ai(M4_Ai),
						 .Bi(M4_Bi), .blink(M4_blink));


	wire [7:0] U5_leout;
	wire [7:0] U5_pointout;
	wire [31:0] U5_dispnum;

	Display U6(.clk(clk_100mhz), .rst(rst), .Start(U8_div[20]), .Text(U9_SWOK[0]), .flash(U8_div[25]),
					.Hexs(U5_dispnum), .point(U5_pointout), .LES(U5_leout), .segclk(seg_clk), .segsout(seg_sout),
					.SEGEN(SEG_PEN), .segclrn(seg_clrn));

	wire [31:0]ROM_D_Bus;
	wire [31:0]RAM_B_Bus;
	wire [9:0] nihao_1 = {5'b0, SW[3],U8_div[27:24]};
	wire invClk = ~clk_100mhz;
	ROM_B U2(.a(nihao_1),.spo(ROM_D_Bus));
	RAM_B U3(.clka(invClk), .wea(U9_SWOK[4]),  .addra(nihao_1), .dina(ROM_D_Bus), .douta(RAM_B_Bus));
	wire notLEDDT;
	assign LEDDT = ~notLEDDT;

	GPIO U7 (.clk(clk_100mhz), .rst(rst), .EN(1'b1), .Start(U8_div[10]), .P_Data({SW[13:0], U9_SWOK[15:0], 2'b0}), .counter_set(counter_set),
	.LED_out(led_out_U7), .GPIOf0(GPIOf0), .ledclk(LEDCLK), .ledsout(notLEDDT), .LEDEN(LEDEN), .ledclrn(LEDCLR));

	Multi_8CH32 U5(.clk(clk_100mhz), .rst(rst), .EN(1'b1), .Test(U9_SWOK[7:5]), .point_in({U8_div[31:0], U8_div[31:0]}),
						.LES(LES), .Data0(M4_Ai), .data1(M4_Bi), .data2(U8_div), .data3(32'b0), .data4(32'b0), .data5(32'b0),
						.data6(ROM_D_Bus), .data7(RAM_B_Bus), .Disp_num(U5_dispnum), .point_out(U5_pointout), .LE_out(U5_leout));


	Seg7_Dev U61(.Scan({U9_SWOK[1], U8_div[19:18]}), .SW0(U9_SWOK[0]), .flash(U8_div[25]),
		.Hexs(U5_dispnum), .point(U5_pointout), .LES(U5_leout), .SEGMENT(SEGMENT), .AN(AN));

	assign Buzzer = 1'b0;
	
	
	
	PIO U71(.clk(clk_100mhz), .rst(1'b0), .EN(1'b1), .PData_in(M4_Ai), .LED_out(LED));


endmodule
