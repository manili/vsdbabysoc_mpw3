module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire \CORE_to_DAC_DATA[0] ;
 wire \CORE_to_DAC_DATA[1] ;
 wire \CORE_to_DAC_DATA[2] ;
 wire \CORE_to_DAC_DATA[3] ;
 wire \CORE_to_DAC_DATA[4] ;
 wire \CORE_to_DAC_DATA[5] ;
 wire \CORE_to_DAC_DATA[6] ;
 wire \CORE_to_DAC_DATA[7] ;
 wire \CORE_to_DAC_DATA[8] ;
 wire \CORE_to_DAC_DATA[9] ;
 wire PLL_to_CORE_CLK;

 avsddac dac (.OUT(analog_io[7]),
    .vssd1(vssd1),
    .vccd1(vccd1),
    .VREFH(analog_io[8]),
    .VREFL(analog_io[9]),
    .D({\CORE_to_DAC_DATA[9] ,
    \CORE_to_DAC_DATA[8] ,
    \CORE_to_DAC_DATA[7] ,
    \CORE_to_DAC_DATA[6] ,
    \CORE_to_DAC_DATA[5] ,
    \CORE_to_DAC_DATA[4] ,
    \CORE_to_DAC_DATA[3] ,
    \CORE_to_DAC_DATA[2] ,
    \CORE_to_DAC_DATA[1] ,
    \CORE_to_DAC_DATA[0] }));
 user_proj_example mprj (.CLK(PLL_to_CORE_CLK),
    .reset(la_data_in[0]),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .OUT({\CORE_to_DAC_DATA[9] ,
    \CORE_to_DAC_DATA[8] ,
    \CORE_to_DAC_DATA[7] ,
    \CORE_to_DAC_DATA[6] ,
    \CORE_to_DAC_DATA[5] ,
    \CORE_to_DAC_DATA[4] ,
    \CORE_to_DAC_DATA[3] ,
    \CORE_to_DAC_DATA[2] ,
    \CORE_to_DAC_DATA[1] ,
    \CORE_to_DAC_DATA[0] }));
 avsdpll pll (.REF(wb_clk_i),
    .ENb_VCO(la_data_in[8]),
    .ENb_CP(la_data_in[4]),
    .VCO_IN(analog_io[10]),
    .CLK(PLL_to_CORE_CLK),
    .vccd1(vccd1),
    .vssd1(vssd1));
endmodule
