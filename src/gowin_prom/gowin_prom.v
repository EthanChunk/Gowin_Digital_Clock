//Copyright (C)2014-2023 Gowin Semiconductor Corporation.
//All rights reserved.
//File Title: IP file
//GOWIN Version: V1.9.9 Beta-5
//Part Number: GW1N-UV9LQ144C6/I5
//Device: GW1N-9
//Device Version: C
//Created Time: Sat Nov 25 08:55:55 2023

module Gowin_pROM (dout, clk, oce, ce, reset, ad);

output [3:0] dout;
input clk;
input oce;
input ce;
input reset;
input [7:0] ad;

wire [27:0] prom_inst_0_dout_w;
wire gw_gnd;

assign gw_gnd = 1'b0;

pROM prom_inst_0 (
    .DO({prom_inst_0_dout_w[27:0],dout[3:0]}),
    .CLK(clk),
    .OCE(oce),
    .CE(ce),
    .RESET(reset),
    .AD({gw_gnd,gw_gnd,gw_gnd,gw_gnd,ad[7:0],gw_gnd,gw_gnd})
);

defparam prom_inst_0.READ_MODE = 1'b0;
defparam prom_inst_0.BIT_WIDTH = 4;
defparam prom_inst_0.RESET_MODE = "ASYNC";
defparam prom_inst_0.INIT_RAM_00 = 256'h5555555558558883399886555667709999999999955555222666688865553333;
defparam prom_inst_0.INIT_RAM_01 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam prom_inst_0.INIT_RAM_02 = 256'h0000000000000000000000000000000000000000000000000000000000000000;
defparam prom_inst_0.INIT_RAM_03 = 256'h0000000000000000000000000000000000000000000000000000000000000000;

endmodule //Gowin_pROM
