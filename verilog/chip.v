parameter BYTECOUNT = (112*3);

module chip (
        output  SDO_1,
        output  DCLK_1,
        output  LE_1,
        output  GCLK_1,
        output  A_1,
        output  B_1,
        output  C_1,
        output  D_1,

        output  SDO_2,
        output  DCLK_2,
        output  LE_2,
        output  GCLK_2,
        output  A_2,
        output  B_2,
        output  C_2,
        output  D_2,

        output  SDO_3,
        output  DCLK_3,
        output  LE_3,
        output  GCLK_3,
        output  A_3,
        output  B_3,
        output  C_3,
        output  D_3,

        output LED_R,
        output LED_G,
        output LED_B,
	);

	wire clk;

	wire LED_R_PWM, LED_G_PWM, LED_B_PWM;

    SB_RGBA_DRV #(
        .CURRENT_MODE("0b1"),       // half current
        .RGB0_CURRENT("0b000001"),  // 4 mA
        .RGB1_CURRENT("0b000001"),  // 4 mA
        .RGB2_CURRENT("0b000001")   // 4 mA
    ) RGBA_DRIVER (
        .CURREN(1'b1),
        .RGBLEDEN(1'b1),
        .RGB0PWM(LED_B_PWM),       // Blue
        .RGB1PWM(LED_R_PWM),         // Red
        .RGB2PWM(LED_G_PWM),     // Green
        .RGB0(LED_B),
        .RGB1(LED_R),
        .RGB2(LED_G)
    );

	SB_HFOSC u_hfosc (
        	.CLKHFPU(1'b1),
        	.CLKHFEN(1'b1),
        	.CLKHF(clk)
    	);

	blink blink_1 (
		.clk(clk),
		.rst(0),
    		.led_r(LED_R_PWM),
    		.led_g(LED_G_PWM),
    		.led_b(LED_B_PWM)
	);

    matrix matrix_1 (
        .clk(clk),
        .rst(0),
        .sdo(SDO_1),
        .dclk(DCLK_1),
        .le(LE_1),
        .gclk(GCLK_1),
        .a(A_1),
        .b(D_1),
        .c(C_1),
        .d(B_1)
    );

    matrix matrix_2 (
        .clk(clk),
        .rst(0),
        .sdo(SDO_2),
        .dclk(DCLK_2),
        .le(LE_2),
        .gclk(GCLK_2),
        .a(A_2),
        .b(D_2),
        .c(C_2),
        .d(B_2)
    );

    matrix matrix_3 (
        .clk(clk),
        .rst(0),
        .sdo(SDO_3),
        .dclk(DCLK_3),
        .le(LE_3),
        .gclk(GCLK_3),
        .a(A_3),
        .b(D_3),
        .c(C_3),
        .d(B_3)
    );

endmodule
