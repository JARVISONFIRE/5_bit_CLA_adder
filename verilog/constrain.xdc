## Clock Signal (100MHz)

set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { clk }];

create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];


## Switches (16 Total)

## A Input (sw 0-4)

set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }];

set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];

set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { sw[2] }];

set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { sw[3] }];

set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { sw[4] }];


## B Input (sw 5-9)

set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { sw[5] }];

set_property -dict { PACKAGE_PIN R1    IOSTANDARD LVCMOS33 } [get_ports { sw[6] }];

set_property -dict { PACKAGE_PIN P2    IOSTANDARD LVCMOS33 } [get_ports { sw[7] }];

set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { sw[8] }];

set_property -dict { PACKAGE_PIN N2    IOSTANDARD LVCMOS33 } [get_ports { sw[9] }];


## Unused Switches (10-14) - Mapped just in case

set_property -dict { PACKAGE_PIN N1    IOSTANDARD LVCMOS33 } [get_ports { sw[10] }];

set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { sw[11] }];

set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { sw[12] }];

set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { sw[13] }];

set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { sw[14] }];


## Carry In (sw 15)

set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { sw[15] }];



## LEDs (16 Total)

## Sum Output (led 0-4)

set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { led[0] }];

set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { led[1] }];

set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { led[2] }];

set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { led[3] }];

set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led[4] }];


## Unused LEDs (5-14)

set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { led[5] }];

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { led[6] }];

set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { led[7] }];

set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { led[8] }];

set_property -dict { PACKAGE_PIN C3    IOSTANDARD LVCMOS33 } [get_ports { led[9] }];

set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { led[10] }];

set_property -dict { PACKAGE_PIN A2    IOSTANDARD LVCMOS33 } [get_ports { led[11] }];

set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { led[12] }];

set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { led[13] }];

set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { led[14] }];


## Carry Out (led 15)

set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { led[15] }];

## Clock Signal (100MHz)

set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { clk }];

create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk }];


## Switches (16 Total)

## A Input (sw 0-4)

set_property -dict { PACKAGE_PIN V2    IOSTANDARD LVCMOS33 } [get_ports { sw[0] }];

set_property -dict { PACKAGE_PIN U2    IOSTANDARD LVCMOS33 } [get_ports { sw[1] }];

set_property -dict { PACKAGE_PIN U1    IOSTANDARD LVCMOS33 } [get_ports { sw[2] }];

set_property -dict { PACKAGE_PIN T2    IOSTANDARD LVCMOS33 } [get_ports { sw[3] }];

set_property -dict { PACKAGE_PIN T1    IOSTANDARD LVCMOS33 } [get_ports { sw[4] }];


## B Input (sw 5-9)

set_property -dict { PACKAGE_PIN R2    IOSTANDARD LVCMOS33 } [get_ports { sw[5] }];

set_property -dict { PACKAGE_PIN R1    IOSTANDARD LVCMOS33 } [get_ports { sw[6] }];

set_property -dict { PACKAGE_PIN P2    IOSTANDARD LVCMOS33 } [get_ports { sw[7] }];

set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { sw[8] }];

set_property -dict { PACKAGE_PIN N2    IOSTANDARD LVCMOS33 } [get_ports { sw[9] }];


## Unused Switches (10-14) - Mapped just in case

set_property -dict { PACKAGE_PIN N1    IOSTANDARD LVCMOS33 } [get_ports { sw[10] }];

set_property -dict { PACKAGE_PIN M2    IOSTANDARD LVCMOS33 } [get_ports { sw[11] }];

set_property -dict { PACKAGE_PIN M1    IOSTANDARD LVCMOS33 } [get_ports { sw[12] }];

set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { sw[13] }];

set_property -dict { PACKAGE_PIN K2    IOSTANDARD LVCMOS33 } [get_ports { sw[14] }];


## Carry In (sw 15)

set_property -dict { PACKAGE_PIN K1    IOSTANDARD LVCMOS33 } [get_ports { sw[15] }];



## LEDs (16 Total)

## Sum Output (led 0-4)

set_property -dict { PACKAGE_PIN G1    IOSTANDARD LVCMOS33 } [get_ports { led[0] }];

set_property -dict { PACKAGE_PIN G2    IOSTANDARD LVCMOS33 } [get_ports { led[1] }];

set_property -dict { PACKAGE_PIN F1    IOSTANDARD LVCMOS33 } [get_ports { led[2] }];

set_property -dict { PACKAGE_PIN F2    IOSTANDARD LVCMOS33 } [get_ports { led[3] }];

set_property -dict { PACKAGE_PIN E1    IOSTANDARD LVCMOS33 } [get_ports { led[4] }];


## Unused LEDs (5-14)

set_property -dict { PACKAGE_PIN E2    IOSTANDARD LVCMOS33 } [get_ports { led[5] }];

set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { led[6] }];

set_property -dict { PACKAGE_PIN E5    IOSTANDARD LVCMOS33 } [get_ports { led[7] }];

set_property -dict { PACKAGE_PIN E6    IOSTANDARD LVCMOS33 } [get_ports { led[8] }];

set_property -dict { PACKAGE_PIN C3    IOSTANDARD LVCMOS33 } [get_ports { led[9] }];

set_property -dict { PACKAGE_PIN B2    IOSTANDARD LVCMOS33 } [get_ports { led[10] }];

set_property -dict { PACKAGE_PIN A2    IOSTANDARD LVCMOS33 } [get_ports { led[11] }];

set_property -dict { PACKAGE_PIN B3    IOSTANDARD LVCMOS33 } [get_ports { led[12] }];

set_property -dict { PACKAGE_PIN A3    IOSTANDARD LVCMOS33 } [get_ports { led[13] }];

set_property -dict { PACKAGE_PIN B4    IOSTANDARD LVCMOS33 } [get_ports { led[14] }];


## Carry Out (led 15)

set_property -dict { PACKAGE_PIN A4    IOSTANDARD LVCMOS33 } [get_ports { led[15] }];
