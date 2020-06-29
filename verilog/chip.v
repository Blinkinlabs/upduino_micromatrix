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

	SB_HFOSC u_hfosc (
        	.CLKHFPU(1'b1),
        	.CLKHFEN(1'b1),
        	.CLKHF(clk)
    	);

	blink blink_1 (
		.clk(clk),
		.rst(0),
    		.led_r(LED_R),
    		.led_g(LED_G),
    		.led_b(LED_B)
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
