# aclk {FREQ_HZ 333250000 CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk PHASE 0.00} aclk1 {FREQ_HZ 100000000 CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk PHASE 0}
# Clock Domain: andromeda_ddr4_0_0_c0_ddr4_ui_clk
create_clock -name aclk -period 3.001 [get_ports aclk]
# Generated clocks
create_generated_clock -name aclk1 -source [get_ports aclk] -multiply_by 400 -divide_by 1333 [get_ports aclk1]
