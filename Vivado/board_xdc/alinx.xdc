#############SPI Configurate Setting##################
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.UNUSEDPIN Pullup [current_design]
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]

############## clock define##################
create_clock -period 5.000 [get_ports sys_clk_p]
create_clock -period 5.000 [get_ports sys_clk_n]
create_clock -period 20.000 [get_ports sd_clk]

set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_p]
set_property IOSTANDARD DIFF_SSTL15 [get_ports sys_clk_n]

set_property PACKAGE_PIN AF10 [get_ports sys_clk_n]
set_property PACKAGE_PIN AE10 [get_ports sys_clk_p]
############## key define##################
set_property PACKAGE_PIN AG27 [get_ports rst_n]
set_property IOSTANDARD LVCMOS25 [get_ports rst_n]
############## SD define##################
set_property IOSTANDARD LVCMOS25 [get_ports sd_clk]
set_property PACKAGE_PIN AH21 [get_ports sd_clk]

set_property IOSTANDARD LVCMOS25 [get_ports sd_cmd]
set_property PACKAGE_PIN AJ21 [get_ports sd_cmd]

set_property IOSTANDARD LVCMOS25 [get_ports {sd_data[0]}]
set_property PACKAGE_PIN AJ22 [get_ports {sd_data[0]}]

set_property IOSTANDARD LVCMOS25 [get_ports {sd_data[1]}]
set_property PACKAGE_PIN AJ23 [get_ports {sd_data[1]}]

set_property IOSTANDARD LVCMOS25 [get_ports {sd_data[2]}]
set_property PACKAGE_PIN AG20 [get_ports {sd_data[2]}]

set_property IOSTANDARD LVCMOS25 [get_ports {sd_data[3]}]
set_property PACKAGE_PIN AH20 [get_ports {sd_data[3]}]

### UART ###
set_property IOSTANDARD LVCMOS25 [get_ports uart_rx]
set_property PACKAGE_PIN AJ26 [get_ports uart_rx]

set_property IOSTANDARD LVCMOS25 [get_ports uart_tx]
set_property PACKAGE_PIN AK26 [get_ports uart_tx]

#############LED Setting##################
set_property PACKAGE_PIN A22 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[0]}]

set_property PACKAGE_PIN C19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[1]}]

set_property PACKAGE_PIN B19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[2]}]

set_property PACKAGE_PIN E18 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS15 [get_ports {led[3]}]
############## key define KEY2##################

set_property PACKAGE_PIN AG28 [get_ports key]
set_property IOSTANDARD LVCMOS25 [get_ports key]

## SDC 
#create_generated_clock -name sdclk -source [get_pins andromeda_i/clk_wiz_1/inst/clk_out1] -divide_by 2 [get_pins andromeda_i/sd_controller_wrapper_0/inst/sd_controller_inst/sd_reader_inst/sdcmd_ctrl_inst/sdclk_reg/Q]
create_generated_clock -name sdclk -source [get_pins andromeda_i/rst_mig_7series_0_100M/slowest_sync_clk] -divide_by 2 [get_pins andromeda_i/sd_controller_wrapper_0/inst/sd_controller_inst/sd_reader_inst/sdcmd_ctrl_inst/sdclk_reg/Q]

