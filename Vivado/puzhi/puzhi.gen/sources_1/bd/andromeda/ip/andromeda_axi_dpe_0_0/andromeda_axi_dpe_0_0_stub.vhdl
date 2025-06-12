-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
-- Date        : Thu Jun 12 10:05:30 2025
-- Host        : nuke running 64-bit Ubuntu 24.04.2 LTS
-- Command     : write_vhdl -force -mode synth_stub
--               /home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vivado/puzhi/puzhi.gen/sources_1/bd/andromeda/ip/andromeda_axi_dpe_0_0/andromeda_axi_dpe_0_0_stub.vhdl
-- Design      : andromeda_axi_dpe_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcku5p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity andromeda_axi_dpe_0_0 is
  Port ( 
    aclk : in STD_LOGIC;
    aresetn : in STD_LOGIC;
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arprot : in STD_LOGIC_VECTOR ( 2 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arvalid : out STD_LOGIC;
    m_axi_arready : in STD_LOGIC;
    m_axi_araddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_arlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_arsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_arprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_rvalid : in STD_LOGIC;
    m_axi_rready : out STD_LOGIC;
    m_axi_rdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_rresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_rlast : in STD_LOGIC;
    m_axi_awvalid : out STD_LOGIC;
    m_axi_awready : in STD_LOGIC;
    m_axi_awaddr : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_awlen : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axi_awsize : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awburst : out STD_LOGIC_VECTOR ( 1 downto 0 );
    m_axi_awprot : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_awcache : out STD_LOGIC_VECTOR ( 3 downto 0 );
    m_axi_wvalid : out STD_LOGIC;
    m_axi_wready : in STD_LOGIC;
    m_axi_wdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m_axi_wstrb : out STD_LOGIC_VECTOR ( 31 downto 0 );
    m_axi_wlast : out STD_LOGIC;
    m_axi_bvalid : in STD_LOGIC;
    m_axi_bready : out STD_LOGIC;
    m_axi_bresp : in STD_LOGIC_VECTOR ( 1 downto 0 );
    write_request_debug : out STD_LOGIC;
    read_request_debug : out STD_LOGIC;
    write_grant_debug : out STD_LOGIC;
    read_grant_debug : out STD_LOGIC;
    dma_start_debug : out STD_LOGIC;
    dma_busy_debug : out STD_LOGIC;
    dma_status_debug : out STD_LOGIC_VECTOR ( 1 downto 0 );
    master_state_debug : out STD_LOGIC_VECTOR ( 3 downto 0 );
    bytes_in_current_burst_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    read_transfer_count_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    rx_data_out_ila : out STD_LOGIC_VECTOR ( 255 downto 0 );
    ctrl_state_debug : out STD_LOGIC_VECTOR ( 1 downto 0 );
    read_state_debug : out STD_LOGIC_VECTOR ( 2 downto 0 );
    dpe_state_debug : out STD_LOGIC_VECTOR ( 1 downto 0 );
    write_state_debug : out STD_LOGIC_VECTOR ( 2 downto 0 );
    m_axi_arready_debug : out STD_LOGIC;
    m_axi_arvalid_r_debug : out STD_LOGIC;
    m_axi_rvalid_debug : out STD_LOGIC;
    m_axi_rready_r_debug : out STD_LOGIC;
    read_data_valid_debug : out STD_LOGIC;
    dpe_en_debug : out STD_LOGIC;
    dpe_start_debug : out STD_LOGIC;
    read_data_buffer_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    read_data_index_debug : out STD_LOGIC_VECTOR ( 7 downto 0 );
    rvalid_debug : out STD_LOGIC;
    wvalid_debug : out STD_LOGIC;
    dpe_wr_ready_out : out STD_LOGIC_VECTOR ( 255 downto 0 );
    write_valid : out STD_LOGIC;
    dpe_done : out STD_LOGIC;
    A_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    A_valid_debug : out STD_LOGIC;
    prod_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    prod_valid_debug : out STD_LOGIC;
    sum_stage0_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage0_debug : out STD_LOGIC;
    sum_stage1_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage1_debug : out STD_LOGIC;
    sum_stage2_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage2_debug : out STD_LOGIC;
    sum_stage3_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage3_debug : out STD_LOGIC;
    sum_stage4_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage4_debug : out STD_LOGIC;
    sum_stage5_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage5_debug : out STD_LOGIC;
    sum_stage6_debug : out STD_LOGIC_VECTOR ( 31 downto 0 );
    valid_stage6_debug : out STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of andromeda_axi_dpe_0_0 : entity is "andromeda_axi_dpe_0_0,axi_dpe,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of andromeda_axi_dpe_0_0 : entity is "andromeda_axi_dpe_0_0,axi_dpe,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=axi_dpe,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_ADDR_WIDTH=32,C_S_AXI_DATA_WIDTH=32,C_M_AXI_ADDR_WIDTH=32,C_M_AXI_DATA_WIDTH=256,C_M_AXI_BURST_LEN=128}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of andromeda_axi_dpe_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of andromeda_axi_dpe_0_0 : entity is "module_ref";
end andromeda_axi_dpe_0_0;

architecture stub of andromeda_axi_dpe_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "aclk,aresetn,s_axi_awvalid,s_axi_awready,s_axi_awaddr[31:0],s_axi_awprot[2:0],s_axi_wvalid,s_axi_wready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_bvalid,s_axi_bready,s_axi_bresp[1:0],s_axi_arvalid,s_axi_arready,s_axi_araddr[31:0],s_axi_arprot[2:0],s_axi_rvalid,s_axi_rready,s_axi_rdata[31:0],s_axi_rresp[1:0],m_axi_arvalid,m_axi_arready,m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arprot[2:0],m_axi_arcache[3:0],m_axi_rvalid,m_axi_rready,m_axi_rdata[255:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_awvalid,m_axi_awready,m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awprot[2:0],m_axi_awcache[3:0],m_axi_wvalid,m_axi_wready,m_axi_wdata[255:0],m_axi_wstrb[31:0],m_axi_wlast,m_axi_bvalid,m_axi_bready,m_axi_bresp[1:0],write_request_debug,read_request_debug,write_grant_debug,read_grant_debug,dma_start_debug,dma_busy_debug,dma_status_debug[1:0],master_state_debug[3:0],bytes_in_current_burst_debug[31:0],read_transfer_count_debug[31:0],rx_data_out_ila[255:0],ctrl_state_debug[1:0],read_state_debug[2:0],dpe_state_debug[1:0],write_state_debug[2:0],m_axi_arready_debug,m_axi_arvalid_r_debug,m_axi_rvalid_debug,m_axi_rready_r_debug,read_data_valid_debug,dpe_en_debug,dpe_start_debug,read_data_buffer_debug[31:0],read_data_index_debug[7:0],rvalid_debug,wvalid_debug,dpe_wr_ready_out[255:0],write_valid,dpe_done,A_debug[31:0],A_valid_debug,prod_debug[31:0],prod_valid_debug,sum_stage0_debug[31:0],valid_stage0_debug,sum_stage1_debug[31:0],valid_stage1_debug,sum_stage2_debug[31:0],valid_stage2_debug,sum_stage3_debug[31:0],valid_stage3_debug,sum_stage4_debug[31:0],valid_stage4_debug,sum_stage5_debug[31:0],valid_stage5_debug,sum_stage6_debug[31:0],valid_stage6_debug";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of aclk : signal is "xilinx.com:signal:clock:1.0 aclk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of aclk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of aclk : signal is "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi:s_axi, ASSOCIATED_RESET aresetn, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of aresetn : signal is "xilinx.com:signal:reset:1.0 aresetn RST";
  attribute X_INTERFACE_MODE of aresetn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of aresetn : signal is "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi AWVALID";
  attribute X_INTERFACE_MODE of s_axi_awvalid : signal is "slave";
  attribute X_INTERFACE_PARAMETER of s_axi_awvalid : signal is "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 333250000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of s_axi_awready : signal is "xilinx.com:interface:aximm:1.0 s_axi AWREADY";
  attribute X_INTERFACE_INFO of s_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 s_axi AWADDR";
  attribute X_INTERFACE_INFO of s_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 s_axi AWPROT";
  attribute X_INTERFACE_INFO of s_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi WVALID";
  attribute X_INTERFACE_INFO of s_axi_wready : signal is "xilinx.com:interface:aximm:1.0 s_axi WREADY";
  attribute X_INTERFACE_INFO of s_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 s_axi WDATA";
  attribute X_INTERFACE_INFO of s_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 s_axi WSTRB";
  attribute X_INTERFACE_INFO of s_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi BVALID";
  attribute X_INTERFACE_INFO of s_axi_bready : signal is "xilinx.com:interface:aximm:1.0 s_axi BREADY";
  attribute X_INTERFACE_INFO of s_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 s_axi BRESP";
  attribute X_INTERFACE_INFO of s_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi ARVALID";
  attribute X_INTERFACE_INFO of s_axi_arready : signal is "xilinx.com:interface:aximm:1.0 s_axi ARREADY";
  attribute X_INTERFACE_INFO of s_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 s_axi ARADDR";
  attribute X_INTERFACE_INFO of s_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 s_axi ARPROT";
  attribute X_INTERFACE_INFO of s_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 s_axi RVALID";
  attribute X_INTERFACE_INFO of s_axi_rready : signal is "xilinx.com:interface:aximm:1.0 s_axi RREADY";
  attribute X_INTERFACE_INFO of s_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 s_axi RDATA";
  attribute X_INTERFACE_INFO of s_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 s_axi RRESP";
  attribute X_INTERFACE_INFO of m_axi_arvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi ARVALID";
  attribute X_INTERFACE_MODE of m_axi_arvalid : signal is "master";
  attribute X_INTERFACE_PARAMETER of m_axi_arvalid : signal is "XIL_INTERFACENAME m_axi, DATA_WIDTH 256, PROTOCOL AXI4, FREQ_HZ 333250000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of m_axi_arready : signal is "xilinx.com:interface:aximm:1.0 m_axi ARREADY";
  attribute X_INTERFACE_INFO of m_axi_araddr : signal is "xilinx.com:interface:aximm:1.0 m_axi ARADDR";
  attribute X_INTERFACE_INFO of m_axi_arlen : signal is "xilinx.com:interface:aximm:1.0 m_axi ARLEN";
  attribute X_INTERFACE_INFO of m_axi_arsize : signal is "xilinx.com:interface:aximm:1.0 m_axi ARSIZE";
  attribute X_INTERFACE_INFO of m_axi_arburst : signal is "xilinx.com:interface:aximm:1.0 m_axi ARBURST";
  attribute X_INTERFACE_INFO of m_axi_arprot : signal is "xilinx.com:interface:aximm:1.0 m_axi ARPROT";
  attribute X_INTERFACE_INFO of m_axi_arcache : signal is "xilinx.com:interface:aximm:1.0 m_axi ARCACHE";
  attribute X_INTERFACE_INFO of m_axi_rvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi RVALID";
  attribute X_INTERFACE_INFO of m_axi_rready : signal is "xilinx.com:interface:aximm:1.0 m_axi RREADY";
  attribute X_INTERFACE_INFO of m_axi_rdata : signal is "xilinx.com:interface:aximm:1.0 m_axi RDATA";
  attribute X_INTERFACE_INFO of m_axi_rresp : signal is "xilinx.com:interface:aximm:1.0 m_axi RRESP";
  attribute X_INTERFACE_INFO of m_axi_rlast : signal is "xilinx.com:interface:aximm:1.0 m_axi RLAST";
  attribute X_INTERFACE_INFO of m_axi_awvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi AWVALID";
  attribute X_INTERFACE_INFO of m_axi_awready : signal is "xilinx.com:interface:aximm:1.0 m_axi AWREADY";
  attribute X_INTERFACE_INFO of m_axi_awaddr : signal is "xilinx.com:interface:aximm:1.0 m_axi AWADDR";
  attribute X_INTERFACE_INFO of m_axi_awlen : signal is "xilinx.com:interface:aximm:1.0 m_axi AWLEN";
  attribute X_INTERFACE_INFO of m_axi_awsize : signal is "xilinx.com:interface:aximm:1.0 m_axi AWSIZE";
  attribute X_INTERFACE_INFO of m_axi_awburst : signal is "xilinx.com:interface:aximm:1.0 m_axi AWBURST";
  attribute X_INTERFACE_INFO of m_axi_awprot : signal is "xilinx.com:interface:aximm:1.0 m_axi AWPROT";
  attribute X_INTERFACE_INFO of m_axi_awcache : signal is "xilinx.com:interface:aximm:1.0 m_axi AWCACHE";
  attribute X_INTERFACE_INFO of m_axi_wvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi WVALID";
  attribute X_INTERFACE_INFO of m_axi_wready : signal is "xilinx.com:interface:aximm:1.0 m_axi WREADY";
  attribute X_INTERFACE_INFO of m_axi_wdata : signal is "xilinx.com:interface:aximm:1.0 m_axi WDATA";
  attribute X_INTERFACE_INFO of m_axi_wstrb : signal is "xilinx.com:interface:aximm:1.0 m_axi WSTRB";
  attribute X_INTERFACE_INFO of m_axi_wlast : signal is "xilinx.com:interface:aximm:1.0 m_axi WLAST";
  attribute X_INTERFACE_INFO of m_axi_bvalid : signal is "xilinx.com:interface:aximm:1.0 m_axi BVALID";
  attribute X_INTERFACE_INFO of m_axi_bready : signal is "xilinx.com:interface:aximm:1.0 m_axi BREADY";
  attribute X_INTERFACE_INFO of m_axi_bresp : signal is "xilinx.com:interface:aximm:1.0 m_axi BRESP";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "axi_dpe,Vivado 2024.2";
begin
end;
