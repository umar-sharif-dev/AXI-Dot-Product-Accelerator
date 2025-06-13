-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Thu Jun 12 05:38:31 2025
-- Host        : dust2 running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/malik/andromeda_ila/AXI-DPE-simulation/AXI-Dot-Product-Accelerator/Vivado/puzhi/puzhi.gen/sources_1/bd/andromeda/ip/andromeda_sd_controller_wrapper_0_0/andromeda_sd_controller_wrapper_0_0_stub.vhdl
-- Design      : andromeda_sd_controller_wrapper_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andromeda_sd_controller_wrapper_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    axilite_awvalid : in STD_LOGIC;
    axilite_awready : out STD_LOGIC;
    axilite_awaddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    axilite_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axilite_wvalid : in STD_LOGIC;
    axilite_wready : out STD_LOGIC;
    axilite_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    axilite_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    axilite_bvalid : out STD_LOGIC;
    axilite_bready : in STD_LOGIC;
    axilite_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axilite_arvalid : in STD_LOGIC;
    axilite_arready : out STD_LOGIC;
    axilite_araddr : in STD_LOGIC_VECTOR ( 6 downto 0 );
    axilite_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    axilite_rvalid : out STD_LOGIC;
    axilite_rready : in STD_LOGIC;
    axilite_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axilite_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_awvalid : out STD_LOGIC;
    axi_awready : in STD_LOGIC;
    axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    axi_wvalid : out STD_LOGIC;
    axi_wready : in STD_LOGIC;
    axi_wdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    axi_wstrb : out STD_LOGIC_VECTOR ( 3 downto 0 );
    axi_wlast : out STD_LOGIC;
    axi_bvalid : in STD_LOGIC;
    axi_bready : out STD_LOGIC;
    axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    sdclk : out STD_LOGIC;
    sdcmd : inout STD_LOGIC;
    sddat : in STD_LOGIC_VECTOR ( 3 downto 0 );
    card_type : out STD_LOGIC_VECTOR ( 1 downto 0 );
    card_stat : out STD_LOGIC_VECTOR ( 3 downto 0 );
    interrupt : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of andromeda_sd_controller_wrapper_0_0 : entity is "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of andromeda_sd_controller_wrapper_0_0 : entity is "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=sd_controller_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SIMULATION=0}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of andromeda_sd_controller_wrapper_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of andromeda_sd_controller_wrapper_0_0 : entity is "module_ref";
end andromeda_sd_controller_wrapper_0_0;

architecture stub of andromeda_sd_controller_wrapper_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,axilite_awvalid,axilite_awready,axilite_awaddr[6:0],axilite_awprot[2:0],axilite_wvalid,axilite_wready,axilite_wdata[31:0],axilite_wstrb[3:0],axilite_bvalid,axilite_bready,axilite_bresp[1:0],axilite_arvalid,axilite_arready,axilite_araddr[6:0],axilite_arprot[2:0],axilite_rvalid,axilite_rready,axilite_rdata[31:0],axilite_rresp[1:0],axi_awvalid,axi_awready,axi_awaddr[31:0],axi_awprot[2:0],axi_awburst[1:0],axi_awlen[7:0],axi_awsize[2:0],axi_wvalid,axi_wready,axi_wdata[31:0],axi_wstrb[3:0],axi_wlast,axi_bvalid,axi_bready,axi_bresp[1:0],sdclk,sdcmd,sddat[3:0],card_type[1:0],card_stat[3:0],interrupt";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF axi:axilite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of axilite_awvalid : signal is "xilinx.com:interface:aximm:1.0 axilite AWVALID";
  attribute X_INTERFACE_MODE of axilite_awvalid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of axilite_awvalid : signal is "XIL_INTERFACENAME axilite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of axilite_awready : signal is "xilinx.com:interface:aximm:1.0 axilite AWREADY";
  attribute X_INTERFACE_INFO of axilite_awaddr : signal is "xilinx.com:interface:aximm:1.0 axilite AWADDR";
  attribute X_INTERFACE_INFO of axilite_awprot : signal is "xilinx.com:interface:aximm:1.0 axilite AWPROT";
  attribute X_INTERFACE_INFO of axilite_wvalid : signal is "xilinx.com:interface:aximm:1.0 axilite WVALID";
  attribute X_INTERFACE_INFO of axilite_wready : signal is "xilinx.com:interface:aximm:1.0 axilite WREADY";
  attribute X_INTERFACE_INFO of axilite_wdata : signal is "xilinx.com:interface:aximm:1.0 axilite WDATA";
  attribute X_INTERFACE_INFO of axilite_wstrb : signal is "xilinx.com:interface:aximm:1.0 axilite WSTRB";
  attribute X_INTERFACE_INFO of axilite_bvalid : signal is "xilinx.com:interface:aximm:1.0 axilite BVALID";
  attribute X_INTERFACE_INFO of axilite_bready : signal is "xilinx.com:interface:aximm:1.0 axilite BREADY";
  attribute X_INTERFACE_INFO of axilite_bresp : signal is "xilinx.com:interface:aximm:1.0 axilite BRESP";
  attribute X_INTERFACE_INFO of axilite_arvalid : signal is "xilinx.com:interface:aximm:1.0 axilite ARVALID";
  attribute X_INTERFACE_INFO of axilite_arready : signal is "xilinx.com:interface:aximm:1.0 axilite ARREADY";
  attribute X_INTERFACE_INFO of axilite_araddr : signal is "xilinx.com:interface:aximm:1.0 axilite ARADDR";
  attribute X_INTERFACE_INFO of axilite_arprot : signal is "xilinx.com:interface:aximm:1.0 axilite ARPROT";
  attribute X_INTERFACE_INFO of axilite_rvalid : signal is "xilinx.com:interface:aximm:1.0 axilite RVALID";
  attribute X_INTERFACE_INFO of axilite_rready : signal is "xilinx.com:interface:aximm:1.0 axilite RREADY";
  attribute X_INTERFACE_INFO of axilite_rdata : signal is "xilinx.com:interface:aximm:1.0 axilite RDATA";
  attribute X_INTERFACE_INFO of axilite_rresp : signal is "xilinx.com:interface:aximm:1.0 axilite RRESP";
  attribute X_INTERFACE_INFO of axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 axi AWVALID";
  attribute X_INTERFACE_MODE of axi_awvalid : signal is "master";
  attribute X_INTERFACE_PARAMETER of axi_awvalid : signal is "XIL_INTERFACENAME axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of axi_awready : signal is "xilinx.com:interface:aximm:1.0 axi AWREADY";
  attribute X_INTERFACE_INFO of axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 axi AWADDR";
  attribute X_INTERFACE_INFO of axi_awprot : signal is "xilinx.com:interface:aximm:1.0 axi AWPROT";
  attribute X_INTERFACE_INFO of axi_awburst : signal is "xilinx.com:interface:aximm:1.0 axi AWBURST";
  attribute X_INTERFACE_INFO of axi_awlen : signal is "xilinx.com:interface:aximm:1.0 axi AWLEN";
  attribute X_INTERFACE_INFO of axi_awsize : signal is "xilinx.com:interface:aximm:1.0 axi AWSIZE";
  attribute X_INTERFACE_INFO of axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 axi WVALID";
  attribute X_INTERFACE_INFO of axi_wready : signal is "xilinx.com:interface:aximm:1.0 axi WREADY";
  attribute X_INTERFACE_INFO of axi_wdata : signal is "xilinx.com:interface:aximm:1.0 axi WDATA";
  attribute X_INTERFACE_INFO of axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 axi WSTRB";
  attribute X_INTERFACE_INFO of axi_wlast : signal is "xilinx.com:interface:aximm:1.0 axi WLAST";
  attribute X_INTERFACE_INFO of axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 axi BVALID";
  attribute X_INTERFACE_INFO of axi_bready : signal is "xilinx.com:interface:aximm:1.0 axi BREADY";
  attribute X_INTERFACE_INFO of axi_bresp : signal is "xilinx.com:interface:aximm:1.0 axi BRESP";
  attribute X_INTERFACE_INFO of interrupt : signal is "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT";
  attribute X_INTERFACE_MODE of interrupt : signal is "master";
  attribute X_INTERFACE_PARAMETER of interrupt : signal is "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "sd_controller_wrapper,Vivado 2024.2";
begin
end;
