//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
//Date        : Thu Jun 12 15:21:21 2025
//Host        : nuke running 64-bit Ubuntu 24.04.2 LTS
//Command     : generate_target andromeda.bd
//Design      : andromeda
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "andromeda,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=andromeda,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=19,numReposBlks=18,numNonXlnxBlks=0,numHierBlks=1,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "andromeda.hwdef" *) 
module andromeda
   (c0_ddr4_act_n,
    c0_ddr4_adr,
    c0_ddr4_ba,
    c0_ddr4_bg,
    c0_ddr4_ck_c,
    c0_ddr4_ck_t,
    c0_ddr4_cke,
    c0_ddr4_cs_n,
    c0_ddr4_dm_n,
    c0_ddr4_dq,
    c0_ddr4_dqs_c,
    c0_ddr4_dqs_t,
    c0_ddr4_odt,
    c0_ddr4_reset_n,
    c0_sys_clk_n,
    c0_sys_clk_p,
    sd_clk,
    sd_cmd,
    sd_data,
    sys_rstn,
    uart_rx,
    uart_tx);
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ACT_N" *) (* X_INTERFACE_MODE = "Master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c0_ddr4, AXI_ARBITRATION_SCHEME RD_PRI_REG, BURST_LENGTH 8, CAN_DEBUG false, CAS_LATENCY 19, CAS_WRITE_LATENCY 14, CS_ENABLED true, CUSTOM_PARTS no_file_loaded, DATA_MASK_ENABLED DM_NO_DBI, DATA_WIDTH 32, MEMORY_PART MT40A512M16LY-075, MEMORY_TYPE Components, MEM_ADDR_MAP ROW_COLUMN_BANK, SLOT Single, TIMEPERIOD_PS 750" *) output c0_ddr4_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ADR" *) output [16:0]c0_ddr4_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 BA" *) output [1:0]c0_ddr4_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 BG" *) output [0:0]c0_ddr4_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CK_C" *) output [0:0]c0_ddr4_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CK_T" *) output [0:0]c0_ddr4_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CKE" *) output [0:0]c0_ddr4_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CS_N" *) output [0:0]c0_ddr4_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DM_N" *) inout [3:0]c0_ddr4_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQ" *) inout [31:0]c0_ddr4_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQS_C" *) inout [3:0]c0_ddr4_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQS_T" *) inout [3:0]c0_ddr4_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ODT" *) output [0:0]c0_ddr4_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 RESET_N" *) output c0_ddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 c0_sys CLK_N" *) (* X_INTERFACE_MODE = "Slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c0_sys, CAN_DEBUG false, FREQ_HZ 200000000" *) input c0_sys_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 c0_sys CLK_P" *) input c0_sys_clk_p;
  output sd_clk;
  inout sd_cmd;
  input [3:0]sd_data;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SYS_RSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SYS_RSTN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input sys_rstn;
  input uart_rx;
  output uart_tx;

  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]A_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire A_valid_debug;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_dpe_0_m_axi_ARADDR;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_dpe_0_m_axi_ARBURST;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_dpe_0_m_axi_ARCACHE;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_dpe_0_m_axi_ARLEN;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_dpe_0_m_axi_ARPROT;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_ARREADY;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_dpe_0_m_axi_ARSIZE;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 ARVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_ARVALID;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_dpe_0_m_axi_AWADDR;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_dpe_0_m_axi_AWBURST;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_dpe_0_m_axi_AWCACHE;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_dpe_0_m_axi_AWLEN;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_dpe_0_m_axi_AWPROT;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_AWREADY;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_dpe_0_m_axi_AWSIZE;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 AWVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_AWVALID;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 BREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_BREADY;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 BRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_dpe_0_m_axi_BRESP;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 BVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_BVALID;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 RDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axi_dpe_0_m_axi_RDATA;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 RLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_RLAST;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 RREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_RREADY;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 RRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_dpe_0_m_axi_RRESP;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 RVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_RVALID;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 WDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axi_dpe_0_m_axi_WDATA;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 WLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_WLAST;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 WREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_WREADY;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 WSTRB" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_dpe_0_m_axi_WSTRB;
  (* CONN_BUS_INFO = "axi_dpe_0_m_axi xilinx.com:interface:aximm:1.0 AXI4 WVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_dpe_0_m_axi_WVALID;
  wire [4:0]axi_smc_M00_AXI_ARADDR;
  wire axi_smc_M00_AXI_ARREADY;
  wire axi_smc_M00_AXI_ARVALID;
  wire [4:0]axi_smc_M00_AXI_AWADDR;
  wire axi_smc_M00_AXI_AWREADY;
  wire axi_smc_M00_AXI_AWVALID;
  wire axi_smc_M00_AXI_BREADY;
  wire [1:0]axi_smc_M00_AXI_BRESP;
  wire axi_smc_M00_AXI_BVALID;
  wire [31:0]axi_smc_M00_AXI_RDATA;
  wire axi_smc_M00_AXI_RREADY;
  wire [1:0]axi_smc_M00_AXI_RRESP;
  wire axi_smc_M00_AXI_RVALID;
  wire [31:0]axi_smc_M00_AXI_WDATA;
  wire axi_smc_M00_AXI_WREADY;
  wire [3:0]axi_smc_M00_AXI_WSTRB;
  wire axi_smc_M00_AXI_WVALID;
  wire [3:0]axi_smc_M01_AXI_ARADDR;
  wire axi_smc_M01_AXI_ARREADY;
  wire axi_smc_M01_AXI_ARVALID;
  wire [3:0]axi_smc_M01_AXI_AWADDR;
  wire axi_smc_M01_AXI_AWREADY;
  wire axi_smc_M01_AXI_AWVALID;
  wire axi_smc_M01_AXI_BREADY;
  wire [1:0]axi_smc_M01_AXI_BRESP;
  wire axi_smc_M01_AXI_BVALID;
  wire [31:0]axi_smc_M01_AXI_RDATA;
  wire axi_smc_M01_AXI_RREADY;
  wire [1:0]axi_smc_M01_AXI_RRESP;
  wire axi_smc_M01_AXI_RVALID;
  wire [31:0]axi_smc_M01_AXI_WDATA;
  wire axi_smc_M01_AXI_WREADY;
  wire [3:0]axi_smc_M01_AXI_WSTRB;
  wire axi_smc_M01_AXI_WVALID;
  wire [6:0]axi_smc_M02_AXI_ARADDR;
  wire [2:0]axi_smc_M02_AXI_ARPROT;
  wire axi_smc_M02_AXI_ARREADY;
  wire axi_smc_M02_AXI_ARVALID;
  wire [6:0]axi_smc_M02_AXI_AWADDR;
  wire [2:0]axi_smc_M02_AXI_AWPROT;
  wire axi_smc_M02_AXI_AWREADY;
  wire axi_smc_M02_AXI_AWVALID;
  wire axi_smc_M02_AXI_BREADY;
  wire [1:0]axi_smc_M02_AXI_BRESP;
  wire axi_smc_M02_AXI_BVALID;
  wire [31:0]axi_smc_M02_AXI_RDATA;
  wire axi_smc_M02_AXI_RREADY;
  wire [1:0]axi_smc_M02_AXI_RRESP;
  wire axi_smc_M02_AXI_RVALID;
  wire [31:0]axi_smc_M02_AXI_WDATA;
  wire axi_smc_M02_AXI_WREADY;
  wire [3:0]axi_smc_M02_AXI_WSTRB;
  wire axi_smc_M02_AXI_WVALID;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE ARADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_smc_M03_AXI_ARADDR;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE ARPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M03_AXI_ARPROT;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE ARREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_ARREADY;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE ARVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_ARVALID;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE AWADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_smc_M03_AXI_AWADDR;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE AWPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M03_AXI_AWPROT;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE AWREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_AWREADY;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE AWVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_AWVALID;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE BREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_BREADY;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE BRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M03_AXI_BRESP;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE BVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_BVALID;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE RDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_smc_M03_AXI_RDATA;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE RREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_RREADY;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE RRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M03_AXI_RRESP;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE RVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_RVALID;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE WDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_smc_M03_AXI_WDATA;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE WREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_WREADY;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE WSTRB" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_smc_M03_AXI_WSTRB;
  (* CONN_BUS_INFO = "axi_smc_M03_AXI xilinx.com:interface:aximm:1.0 AXI4LITE WVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M03_AXI_WVALID;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [30:0]axi_smc_M04_AXI_ARADDR;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M04_AXI_ARBURST;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_smc_M04_AXI_ARCACHE;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_smc_M04_AXI_ARLEN;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARLOCK" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_smc_M04_AXI_ARLOCK;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M04_AXI_ARPROT;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARQOS" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_smc_M04_AXI_ARQOS;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_ARREADY;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M04_AXI_ARSIZE;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 ARVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_ARVALID;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWADDR" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [30:0]axi_smc_M04_AXI_AWADDR;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWBURST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M04_AXI_AWBURST;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWCACHE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_smc_M04_AXI_AWCACHE;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLEN" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]axi_smc_M04_AXI_AWLEN;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWLOCK" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [0:0]axi_smc_M04_AXI_AWLOCK;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWPROT" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M04_AXI_AWPROT;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWQOS" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]axi_smc_M04_AXI_AWQOS;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_AWREADY;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWSIZE" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]axi_smc_M04_AXI_AWSIZE;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 AWVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_AWVALID;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 BREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_BREADY;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 BRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M04_AXI_BRESP;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 BVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_BVALID;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 RDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axi_smc_M04_AXI_RDATA;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 RLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_RLAST;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 RREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_RREADY;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 RRESP" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]axi_smc_M04_AXI_RRESP;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 RVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_RVALID;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 WDATA" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]axi_smc_M04_AXI_WDATA;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 WLAST" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_WLAST;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 WREADY" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_WREADY;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 WSTRB" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]axi_smc_M04_AXI_WSTRB;
  (* CONN_BUS_INFO = "axi_smc_M04_AXI xilinx.com:interface:aximm:1.0 AXI4 WVALID" *) (* DEBUG = "true" *) (* MARK_DEBUG *) wire axi_smc_M04_AXI_WVALID;
  wire c0_ddr4_act_n;
  wire [16:0]c0_ddr4_adr;
  wire [1:0]c0_ddr4_ba;
  wire [0:0]c0_ddr4_bg;
  wire [0:0]c0_ddr4_ck_c;
  wire [0:0]c0_ddr4_ck_t;
  wire [0:0]c0_ddr4_cke;
  wire [0:0]c0_ddr4_cs_n;
  wire [3:0]c0_ddr4_dm_n;
  wire [31:0]c0_ddr4_dq;
  wire [3:0]c0_ddr4_dqs_c;
  wire [3:0]c0_ddr4_dqs_t;
  wire [0:0]c0_ddr4_odt;
  wire c0_ddr4_reset_n;
  wire c0_sys_clk_n;
  wire c0_sys_clk_p;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]ctrl_state_debug;
  wire ddr4_0_addn_ui_clkout1;
  wire ddr4_0_c0_ddr4_ui_clk_sync_rst;
  wire ddr4_0_c0_init_calib_complete;
  wire [511:0]ddr4_0_dbg_bus;
  wire ddr4_0_dbg_clk;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire dma_busy_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire dma_start_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]dma_status_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire dpe_done;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire dpe_en_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire dpe_start_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [1:0]dpe_state_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]dpe_wr_ready_out;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [3:0]master_state_debug;
  wire mdm_0_Debug_SYS_Rst;
  wire mdm_0_MBDEBUG_0_CAPTURE;
  wire mdm_0_MBDEBUG_0_CLK;
  wire mdm_0_MBDEBUG_0_DISABLE;
  wire [0:7]mdm_0_MBDEBUG_0_REG_EN;
  wire mdm_0_MBDEBUG_0_RST;
  wire mdm_0_MBDEBUG_0_SHIFT;
  wire mdm_0_MBDEBUG_0_TDI;
  wire mdm_0_MBDEBUG_0_TDO;
  wire mdm_0_MBDEBUG_0_UPDATE;
  wire microblaze_0_Clk;
  wire [31:0]microblaze_0_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_0_M_AXI_DP_ARPROT;
  wire microblaze_0_M_AXI_DP_ARREADY;
  wire microblaze_0_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_0_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_0_M_AXI_DP_AWPROT;
  wire microblaze_0_M_AXI_DP_AWREADY;
  wire microblaze_0_M_AXI_DP_AWVALID;
  wire microblaze_0_M_AXI_DP_BREADY;
  wire [1:0]microblaze_0_M_AXI_DP_BRESP;
  wire microblaze_0_M_AXI_DP_BVALID;
  wire [31:0]microblaze_0_M_AXI_DP_RDATA;
  wire microblaze_0_M_AXI_DP_RREADY;
  wire [1:0]microblaze_0_M_AXI_DP_RRESP;
  wire microblaze_0_M_AXI_DP_RVALID;
  wire [31:0]microblaze_0_M_AXI_DP_WDATA;
  wire microblaze_0_M_AXI_DP_WREADY;
  wire [3:0]microblaze_0_M_AXI_DP_WSTRB;
  wire microblaze_0_M_AXI_DP_WVALID;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]prod_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire prod_valid_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]read_data_buffer_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [7:0]read_data_index_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire read_data_valid_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire read_grant_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire read_request_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]read_state_debug;
  wire [0:0]rst_ddr4_0_100M_peripheral_aresetn;
  wire [0:0]rst_ddr4_0_333M_bus_struct_reset;
  wire rst_ddr4_0_333M_mb_reset;
  wire [0:0]rst_ddr4_0_333M_peripheral_aresetn;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire rvalid_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [255:0]rx_data_out_ila;
  wire sd_clk;
  wire sd_cmd;
  wire [31:0]sd_controller_wrapper_0_axi_AWADDR;
  wire [1:0]sd_controller_wrapper_0_axi_AWBURST;
  wire [7:0]sd_controller_wrapper_0_axi_AWLEN;
  wire [2:0]sd_controller_wrapper_0_axi_AWPROT;
  wire sd_controller_wrapper_0_axi_AWREADY;
  wire [2:0]sd_controller_wrapper_0_axi_AWSIZE;
  wire sd_controller_wrapper_0_axi_AWVALID;
  wire sd_controller_wrapper_0_axi_BREADY;
  wire [1:0]sd_controller_wrapper_0_axi_BRESP;
  wire sd_controller_wrapper_0_axi_BVALID;
  wire [31:0]sd_controller_wrapper_0_axi_WDATA;
  wire sd_controller_wrapper_0_axi_WLAST;
  wire sd_controller_wrapper_0_axi_WREADY;
  wire [3:0]sd_controller_wrapper_0_axi_WSTRB;
  wire sd_controller_wrapper_0_axi_WVALID;
  wire [3:0]sd_controller_wrapper_0_card_stat;
  wire [1:0]sd_controller_wrapper_0_card_type;
  wire [3:0]sd_data;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage0_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage1_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage2_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage3_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage4_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage5_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [31:0]sum_stage6_debug;
  wire sys_rstn;
  wire uart_rx;
  wire uart_tx;
  wire [0:0]util_vector_logic_0_Res;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage0_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage1_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage2_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage3_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage4_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage5_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire valid_stage6_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire write_grant_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire write_request_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire [2:0]write_state_debug;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire write_valid;
  (* DEBUG = "true" *) (* MARK_DEBUG *) wire wvalid_debug;

  andromeda_axi_dpe_0_0 axi_dpe_0
       (.A_debug(A_debug),
        .A_valid_debug(A_valid_debug),
        .aclk(microblaze_0_Clk),
        .aresetn(rst_ddr4_0_333M_peripheral_aresetn),
        .ctrl_state_debug(ctrl_state_debug),
        .dma_busy_debug(dma_busy_debug),
        .dma_start_debug(dma_start_debug),
        .dma_status_debug(dma_status_debug),
        .dpe_done(dpe_done),
        .dpe_en_debug(dpe_en_debug),
        .dpe_start_debug(dpe_start_debug),
        .dpe_state_debug(dpe_state_debug),
        .dpe_wr_ready_out(dpe_wr_ready_out),
        .m_axi_araddr(axi_dpe_0_m_axi_ARADDR),
        .m_axi_arburst(axi_dpe_0_m_axi_ARBURST),
        .m_axi_arcache(axi_dpe_0_m_axi_ARCACHE),
        .m_axi_arlen(axi_dpe_0_m_axi_ARLEN),
        .m_axi_arprot(axi_dpe_0_m_axi_ARPROT),
        .m_axi_arready(axi_dpe_0_m_axi_ARREADY),
        .m_axi_arsize(axi_dpe_0_m_axi_ARSIZE),
        .m_axi_arvalid(axi_dpe_0_m_axi_ARVALID),
        .m_axi_awaddr(axi_dpe_0_m_axi_AWADDR),
        .m_axi_awburst(axi_dpe_0_m_axi_AWBURST),
        .m_axi_awcache(axi_dpe_0_m_axi_AWCACHE),
        .m_axi_awlen(axi_dpe_0_m_axi_AWLEN),
        .m_axi_awprot(axi_dpe_0_m_axi_AWPROT),
        .m_axi_awready(axi_dpe_0_m_axi_AWREADY),
        .m_axi_awsize(axi_dpe_0_m_axi_AWSIZE),
        .m_axi_awvalid(axi_dpe_0_m_axi_AWVALID),
        .m_axi_bready(axi_dpe_0_m_axi_BREADY),
        .m_axi_bresp(axi_dpe_0_m_axi_BRESP),
        .m_axi_bvalid(axi_dpe_0_m_axi_BVALID),
        .m_axi_rdata(axi_dpe_0_m_axi_RDATA),
        .m_axi_rlast(axi_dpe_0_m_axi_RLAST),
        .m_axi_rready(axi_dpe_0_m_axi_RREADY),
        .m_axi_rresp(axi_dpe_0_m_axi_RRESP),
        .m_axi_rvalid(axi_dpe_0_m_axi_RVALID),
        .m_axi_wdata(axi_dpe_0_m_axi_WDATA),
        .m_axi_wlast(axi_dpe_0_m_axi_WLAST),
        .m_axi_wready(axi_dpe_0_m_axi_WREADY),
        .m_axi_wstrb(axi_dpe_0_m_axi_WSTRB),
        .m_axi_wvalid(axi_dpe_0_m_axi_WVALID),
        .master_state_debug(master_state_debug),
        .prod_debug(prod_debug),
        .prod_valid_debug(prod_valid_debug),
        .read_data_buffer_debug(read_data_buffer_debug),
        .read_data_index_debug(read_data_index_debug),
        .read_data_valid_debug(read_data_valid_debug),
        .read_grant_debug(read_grant_debug),
        .read_request_debug(read_request_debug),
        .read_state_debug(read_state_debug),
        .rvalid_debug(rvalid_debug),
        .rx_data_out_ila(rx_data_out_ila),
        .s_axi_araddr(axi_smc_M03_AXI_ARADDR),
        .s_axi_arprot(axi_smc_M03_AXI_ARPROT),
        .s_axi_arready(axi_smc_M03_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M03_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M03_AXI_AWADDR),
        .s_axi_awprot(axi_smc_M03_AXI_AWPROT),
        .s_axi_awready(axi_smc_M03_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M03_AXI_AWVALID),
        .s_axi_bready(axi_smc_M03_AXI_BREADY),
        .s_axi_bresp(axi_smc_M03_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M03_AXI_BVALID),
        .s_axi_rdata(axi_smc_M03_AXI_RDATA),
        .s_axi_rready(axi_smc_M03_AXI_RREADY),
        .s_axi_rresp(axi_smc_M03_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M03_AXI_RVALID),
        .s_axi_wdata(axi_smc_M03_AXI_WDATA),
        .s_axi_wready(axi_smc_M03_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M03_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M03_AXI_WVALID),
        .sum_stage0_debug(sum_stage0_debug),
        .sum_stage1_debug(sum_stage1_debug),
        .sum_stage2_debug(sum_stage2_debug),
        .sum_stage3_debug(sum_stage3_debug),
        .sum_stage4_debug(sum_stage4_debug),
        .sum_stage5_debug(sum_stage5_debug),
        .sum_stage6_debug(sum_stage6_debug),
        .valid_stage0_debug(valid_stage0_debug),
        .valid_stage1_debug(valid_stage1_debug),
        .valid_stage2_debug(valid_stage2_debug),
        .valid_stage3_debug(valid_stage3_debug),
        .valid_stage4_debug(valid_stage4_debug),
        .valid_stage5_debug(valid_stage5_debug),
        .valid_stage6_debug(valid_stage6_debug),
        .write_grant_debug(write_grant_debug),
        .write_request_debug(write_request_debug),
        .write_state_debug(write_state_debug),
        .write_valid(write_valid),
        .wvalid_debug(wvalid_debug));
  andromeda_axi_smc_0 axi_smc
       (.M00_AXI_araddr(axi_smc_M00_AXI_ARADDR),
        .M00_AXI_arready(axi_smc_M00_AXI_ARREADY),
        .M00_AXI_arvalid(axi_smc_M00_AXI_ARVALID),
        .M00_AXI_awaddr(axi_smc_M00_AXI_AWADDR),
        .M00_AXI_awready(axi_smc_M00_AXI_AWREADY),
        .M00_AXI_awvalid(axi_smc_M00_AXI_AWVALID),
        .M00_AXI_bready(axi_smc_M00_AXI_BREADY),
        .M00_AXI_bresp(axi_smc_M00_AXI_BRESP),
        .M00_AXI_bvalid(axi_smc_M00_AXI_BVALID),
        .M00_AXI_rdata(axi_smc_M00_AXI_RDATA),
        .M00_AXI_rready(axi_smc_M00_AXI_RREADY),
        .M00_AXI_rresp(axi_smc_M00_AXI_RRESP),
        .M00_AXI_rvalid(axi_smc_M00_AXI_RVALID),
        .M00_AXI_wdata(axi_smc_M00_AXI_WDATA),
        .M00_AXI_wready(axi_smc_M00_AXI_WREADY),
        .M00_AXI_wstrb(axi_smc_M00_AXI_WSTRB),
        .M00_AXI_wvalid(axi_smc_M00_AXI_WVALID),
        .M01_AXI_araddr(axi_smc_M01_AXI_ARADDR),
        .M01_AXI_arready(axi_smc_M01_AXI_ARREADY),
        .M01_AXI_arvalid(axi_smc_M01_AXI_ARVALID),
        .M01_AXI_awaddr(axi_smc_M01_AXI_AWADDR),
        .M01_AXI_awready(axi_smc_M01_AXI_AWREADY),
        .M01_AXI_awvalid(axi_smc_M01_AXI_AWVALID),
        .M01_AXI_bready(axi_smc_M01_AXI_BREADY),
        .M01_AXI_bresp(axi_smc_M01_AXI_BRESP),
        .M01_AXI_bvalid(axi_smc_M01_AXI_BVALID),
        .M01_AXI_rdata(axi_smc_M01_AXI_RDATA),
        .M01_AXI_rready(axi_smc_M01_AXI_RREADY),
        .M01_AXI_rresp(axi_smc_M01_AXI_RRESP),
        .M01_AXI_rvalid(axi_smc_M01_AXI_RVALID),
        .M01_AXI_wdata(axi_smc_M01_AXI_WDATA),
        .M01_AXI_wready(axi_smc_M01_AXI_WREADY),
        .M01_AXI_wstrb(axi_smc_M01_AXI_WSTRB),
        .M01_AXI_wvalid(axi_smc_M01_AXI_WVALID),
        .M02_AXI_araddr(axi_smc_M02_AXI_ARADDR),
        .M02_AXI_arprot(axi_smc_M02_AXI_ARPROT),
        .M02_AXI_arready(axi_smc_M02_AXI_ARREADY),
        .M02_AXI_arvalid(axi_smc_M02_AXI_ARVALID),
        .M02_AXI_awaddr(axi_smc_M02_AXI_AWADDR),
        .M02_AXI_awprot(axi_smc_M02_AXI_AWPROT),
        .M02_AXI_awready(axi_smc_M02_AXI_AWREADY),
        .M02_AXI_awvalid(axi_smc_M02_AXI_AWVALID),
        .M02_AXI_bready(axi_smc_M02_AXI_BREADY),
        .M02_AXI_bresp(axi_smc_M02_AXI_BRESP),
        .M02_AXI_bvalid(axi_smc_M02_AXI_BVALID),
        .M02_AXI_rdata(axi_smc_M02_AXI_RDATA),
        .M02_AXI_rready(axi_smc_M02_AXI_RREADY),
        .M02_AXI_rresp(axi_smc_M02_AXI_RRESP),
        .M02_AXI_rvalid(axi_smc_M02_AXI_RVALID),
        .M02_AXI_wdata(axi_smc_M02_AXI_WDATA),
        .M02_AXI_wready(axi_smc_M02_AXI_WREADY),
        .M02_AXI_wstrb(axi_smc_M02_AXI_WSTRB),
        .M02_AXI_wvalid(axi_smc_M02_AXI_WVALID),
        .M03_AXI_araddr(axi_smc_M03_AXI_ARADDR),
        .M03_AXI_arprot(axi_smc_M03_AXI_ARPROT),
        .M03_AXI_arready(axi_smc_M03_AXI_ARREADY),
        .M03_AXI_arvalid(axi_smc_M03_AXI_ARVALID),
        .M03_AXI_awaddr(axi_smc_M03_AXI_AWADDR),
        .M03_AXI_awprot(axi_smc_M03_AXI_AWPROT),
        .M03_AXI_awready(axi_smc_M03_AXI_AWREADY),
        .M03_AXI_awvalid(axi_smc_M03_AXI_AWVALID),
        .M03_AXI_bready(axi_smc_M03_AXI_BREADY),
        .M03_AXI_bresp(axi_smc_M03_AXI_BRESP),
        .M03_AXI_bvalid(axi_smc_M03_AXI_BVALID),
        .M03_AXI_rdata(axi_smc_M03_AXI_RDATA),
        .M03_AXI_rready(axi_smc_M03_AXI_RREADY),
        .M03_AXI_rresp(axi_smc_M03_AXI_RRESP),
        .M03_AXI_rvalid(axi_smc_M03_AXI_RVALID),
        .M03_AXI_wdata(axi_smc_M03_AXI_WDATA),
        .M03_AXI_wready(axi_smc_M03_AXI_WREADY),
        .M03_AXI_wstrb(axi_smc_M03_AXI_WSTRB),
        .M03_AXI_wvalid(axi_smc_M03_AXI_WVALID),
        .M04_AXI_araddr(axi_smc_M04_AXI_ARADDR),
        .M04_AXI_arburst(axi_smc_M04_AXI_ARBURST),
        .M04_AXI_arcache(axi_smc_M04_AXI_ARCACHE),
        .M04_AXI_arlen(axi_smc_M04_AXI_ARLEN),
        .M04_AXI_arlock(axi_smc_M04_AXI_ARLOCK),
        .M04_AXI_arprot(axi_smc_M04_AXI_ARPROT),
        .M04_AXI_arqos(axi_smc_M04_AXI_ARQOS),
        .M04_AXI_arready(axi_smc_M04_AXI_ARREADY),
        .M04_AXI_arsize(axi_smc_M04_AXI_ARSIZE),
        .M04_AXI_arvalid(axi_smc_M04_AXI_ARVALID),
        .M04_AXI_awaddr(axi_smc_M04_AXI_AWADDR),
        .M04_AXI_awburst(axi_smc_M04_AXI_AWBURST),
        .M04_AXI_awcache(axi_smc_M04_AXI_AWCACHE),
        .M04_AXI_awlen(axi_smc_M04_AXI_AWLEN),
        .M04_AXI_awlock(axi_smc_M04_AXI_AWLOCK),
        .M04_AXI_awprot(axi_smc_M04_AXI_AWPROT),
        .M04_AXI_awqos(axi_smc_M04_AXI_AWQOS),
        .M04_AXI_awready(axi_smc_M04_AXI_AWREADY),
        .M04_AXI_awsize(axi_smc_M04_AXI_AWSIZE),
        .M04_AXI_awvalid(axi_smc_M04_AXI_AWVALID),
        .M04_AXI_bready(axi_smc_M04_AXI_BREADY),
        .M04_AXI_bresp(axi_smc_M04_AXI_BRESP),
        .M04_AXI_bvalid(axi_smc_M04_AXI_BVALID),
        .M04_AXI_rdata(axi_smc_M04_AXI_RDATA),
        .M04_AXI_rlast(axi_smc_M04_AXI_RLAST),
        .M04_AXI_rready(axi_smc_M04_AXI_RREADY),
        .M04_AXI_rresp(axi_smc_M04_AXI_RRESP),
        .M04_AXI_rvalid(axi_smc_M04_AXI_RVALID),
        .M04_AXI_wdata(axi_smc_M04_AXI_WDATA),
        .M04_AXI_wlast(axi_smc_M04_AXI_WLAST),
        .M04_AXI_wready(axi_smc_M04_AXI_WREADY),
        .M04_AXI_wstrb(axi_smc_M04_AXI_WSTRB),
        .M04_AXI_wvalid(axi_smc_M04_AXI_WVALID),
        .S00_AXI_araddr(microblaze_0_M_AXI_DP_ARADDR),
        .S00_AXI_arprot(microblaze_0_M_AXI_DP_ARPROT),
        .S00_AXI_arready(microblaze_0_M_AXI_DP_ARREADY),
        .S00_AXI_arvalid(microblaze_0_M_AXI_DP_ARVALID),
        .S00_AXI_awaddr(microblaze_0_M_AXI_DP_AWADDR),
        .S00_AXI_awprot(microblaze_0_M_AXI_DP_AWPROT),
        .S00_AXI_awready(microblaze_0_M_AXI_DP_AWREADY),
        .S00_AXI_awvalid(microblaze_0_M_AXI_DP_AWVALID),
        .S00_AXI_bready(microblaze_0_M_AXI_DP_BREADY),
        .S00_AXI_bresp(microblaze_0_M_AXI_DP_BRESP),
        .S00_AXI_bvalid(microblaze_0_M_AXI_DP_BVALID),
        .S00_AXI_rdata(microblaze_0_M_AXI_DP_RDATA),
        .S00_AXI_rready(microblaze_0_M_AXI_DP_RREADY),
        .S00_AXI_rresp(microblaze_0_M_AXI_DP_RRESP),
        .S00_AXI_rvalid(microblaze_0_M_AXI_DP_RVALID),
        .S00_AXI_wdata(microblaze_0_M_AXI_DP_WDATA),
        .S00_AXI_wready(microblaze_0_M_AXI_DP_WREADY),
        .S00_AXI_wstrb(microblaze_0_M_AXI_DP_WSTRB),
        .S00_AXI_wvalid(microblaze_0_M_AXI_DP_WVALID),
        .S01_AXI_araddr(axi_dpe_0_m_axi_ARADDR),
        .S01_AXI_arburst(axi_dpe_0_m_axi_ARBURST),
        .S01_AXI_arcache(axi_dpe_0_m_axi_ARCACHE),
        .S01_AXI_arlen(axi_dpe_0_m_axi_ARLEN),
        .S01_AXI_arlock(1'b0),
        .S01_AXI_arprot(axi_dpe_0_m_axi_ARPROT),
        .S01_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_arready(axi_dpe_0_m_axi_ARREADY),
        .S01_AXI_arsize(axi_dpe_0_m_axi_ARSIZE),
        .S01_AXI_arvalid(axi_dpe_0_m_axi_ARVALID),
        .S01_AXI_awaddr(axi_dpe_0_m_axi_AWADDR),
        .S01_AXI_awburst(axi_dpe_0_m_axi_AWBURST),
        .S01_AXI_awcache(axi_dpe_0_m_axi_AWCACHE),
        .S01_AXI_awlen(axi_dpe_0_m_axi_AWLEN),
        .S01_AXI_awlock(1'b0),
        .S01_AXI_awprot(axi_dpe_0_m_axi_AWPROT),
        .S01_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S01_AXI_awready(axi_dpe_0_m_axi_AWREADY),
        .S01_AXI_awsize(axi_dpe_0_m_axi_AWSIZE),
        .S01_AXI_awvalid(axi_dpe_0_m_axi_AWVALID),
        .S01_AXI_bready(axi_dpe_0_m_axi_BREADY),
        .S01_AXI_bresp(axi_dpe_0_m_axi_BRESP),
        .S01_AXI_bvalid(axi_dpe_0_m_axi_BVALID),
        .S01_AXI_rdata(axi_dpe_0_m_axi_RDATA),
        .S01_AXI_rlast(axi_dpe_0_m_axi_RLAST),
        .S01_AXI_rready(axi_dpe_0_m_axi_RREADY),
        .S01_AXI_rresp(axi_dpe_0_m_axi_RRESP),
        .S01_AXI_rvalid(axi_dpe_0_m_axi_RVALID),
        .S01_AXI_wdata(axi_dpe_0_m_axi_WDATA),
        .S01_AXI_wlast(axi_dpe_0_m_axi_WLAST),
        .S01_AXI_wready(axi_dpe_0_m_axi_WREADY),
        .S01_AXI_wstrb(axi_dpe_0_m_axi_WSTRB),
        .S01_AXI_wvalid(axi_dpe_0_m_axi_WVALID),
        .S02_AXI_awaddr(sd_controller_wrapper_0_axi_AWADDR),
        .S02_AXI_awburst(sd_controller_wrapper_0_axi_AWBURST),
        .S02_AXI_awcache({1'b0,1'b0,1'b1,1'b1}),
        .S02_AXI_awlen(sd_controller_wrapper_0_axi_AWLEN),
        .S02_AXI_awlock(1'b0),
        .S02_AXI_awprot(sd_controller_wrapper_0_axi_AWPROT),
        .S02_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S02_AXI_awready(sd_controller_wrapper_0_axi_AWREADY),
        .S02_AXI_awsize(sd_controller_wrapper_0_axi_AWSIZE),
        .S02_AXI_awvalid(sd_controller_wrapper_0_axi_AWVALID),
        .S02_AXI_bready(sd_controller_wrapper_0_axi_BREADY),
        .S02_AXI_bresp(sd_controller_wrapper_0_axi_BRESP),
        .S02_AXI_bvalid(sd_controller_wrapper_0_axi_BVALID),
        .S02_AXI_wdata(sd_controller_wrapper_0_axi_WDATA),
        .S02_AXI_wlast(sd_controller_wrapper_0_axi_WLAST),
        .S02_AXI_wready(sd_controller_wrapper_0_axi_WREADY),
        .S02_AXI_wstrb(sd_controller_wrapper_0_axi_WSTRB),
        .S02_AXI_wvalid(sd_controller_wrapper_0_axi_WVALID),
        .aclk(microblaze_0_Clk),
        .aclk1(ddr4_0_addn_ui_clkout1),
        .aresetn(rst_ddr4_0_333M_peripheral_aresetn));
  andromeda_axi_timer_0_0 axi_timer_0
       (.capturetrig0(1'b0),
        .capturetrig1(1'b0),
        .freeze(1'b0),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(axi_smc_M00_AXI_ARADDR),
        .s_axi_aresetn(rst_ddr4_0_333M_peripheral_aresetn),
        .s_axi_arready(axi_smc_M00_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M00_AXI_AWADDR),
        .s_axi_awready(axi_smc_M00_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M00_AXI_AWVALID),
        .s_axi_bready(axi_smc_M00_AXI_BREADY),
        .s_axi_bresp(axi_smc_M00_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M00_AXI_BVALID),
        .s_axi_rdata(axi_smc_M00_AXI_RDATA),
        .s_axi_rready(axi_smc_M00_AXI_RREADY),
        .s_axi_rresp(axi_smc_M00_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M00_AXI_RVALID),
        .s_axi_wdata(axi_smc_M00_AXI_WDATA),
        .s_axi_wready(axi_smc_M00_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M00_AXI_WVALID));
  andromeda_axi_uartlite_0_0 axi_uartlite_0
       (.rx(uart_rx),
        .s_axi_aclk(microblaze_0_Clk),
        .s_axi_araddr(axi_smc_M01_AXI_ARADDR),
        .s_axi_aresetn(rst_ddr4_0_333M_peripheral_aresetn),
        .s_axi_arready(axi_smc_M01_AXI_ARREADY),
        .s_axi_arvalid(axi_smc_M01_AXI_ARVALID),
        .s_axi_awaddr(axi_smc_M01_AXI_AWADDR),
        .s_axi_awready(axi_smc_M01_AXI_AWREADY),
        .s_axi_awvalid(axi_smc_M01_AXI_AWVALID),
        .s_axi_bready(axi_smc_M01_AXI_BREADY),
        .s_axi_bresp(axi_smc_M01_AXI_BRESP),
        .s_axi_bvalid(axi_smc_M01_AXI_BVALID),
        .s_axi_rdata(axi_smc_M01_AXI_RDATA),
        .s_axi_rready(axi_smc_M01_AXI_RREADY),
        .s_axi_rresp(axi_smc_M01_AXI_RRESP),
        .s_axi_rvalid(axi_smc_M01_AXI_RVALID),
        .s_axi_wdata(axi_smc_M01_AXI_WDATA),
        .s_axi_wready(axi_smc_M01_AXI_WREADY),
        .s_axi_wstrb(axi_smc_M01_AXI_WSTRB),
        .s_axi_wvalid(axi_smc_M01_AXI_WVALID),
        .tx(uart_tx));
  andromeda_ddr4_0_0 ddr4_0
       (.addn_ui_clkout1(ddr4_0_addn_ui_clkout1),
        .c0_ddr4_act_n(c0_ddr4_act_n),
        .c0_ddr4_adr(c0_ddr4_adr),
        .c0_ddr4_aresetn(rst_ddr4_0_333M_peripheral_aresetn),
        .c0_ddr4_ba(c0_ddr4_ba),
        .c0_ddr4_bg(c0_ddr4_bg),
        .c0_ddr4_ck_c(c0_ddr4_ck_c),
        .c0_ddr4_ck_t(c0_ddr4_ck_t),
        .c0_ddr4_cke(c0_ddr4_cke),
        .c0_ddr4_cs_n(c0_ddr4_cs_n),
        .c0_ddr4_dm_dbi_n(c0_ddr4_dm_n),
        .c0_ddr4_dq(c0_ddr4_dq),
        .c0_ddr4_dqs_c(c0_ddr4_dqs_c),
        .c0_ddr4_dqs_t(c0_ddr4_dqs_t),
        .c0_ddr4_odt(c0_ddr4_odt),
        .c0_ddr4_reset_n(c0_ddr4_reset_n),
        .c0_ddr4_s_axi_araddr(axi_smc_M04_AXI_ARADDR),
        .c0_ddr4_s_axi_arburst(axi_smc_M04_AXI_ARBURST),
        .c0_ddr4_s_axi_arcache(axi_smc_M04_AXI_ARCACHE),
        .c0_ddr4_s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .c0_ddr4_s_axi_arlen(axi_smc_M04_AXI_ARLEN),
        .c0_ddr4_s_axi_arlock(axi_smc_M04_AXI_ARLOCK),
        .c0_ddr4_s_axi_arprot(axi_smc_M04_AXI_ARPROT),
        .c0_ddr4_s_axi_arqos(axi_smc_M04_AXI_ARQOS),
        .c0_ddr4_s_axi_arready(axi_smc_M04_AXI_ARREADY),
        .c0_ddr4_s_axi_arsize(axi_smc_M04_AXI_ARSIZE),
        .c0_ddr4_s_axi_arvalid(axi_smc_M04_AXI_ARVALID),
        .c0_ddr4_s_axi_awaddr(axi_smc_M04_AXI_AWADDR),
        .c0_ddr4_s_axi_awburst(axi_smc_M04_AXI_AWBURST),
        .c0_ddr4_s_axi_awcache(axi_smc_M04_AXI_AWCACHE),
        .c0_ddr4_s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .c0_ddr4_s_axi_awlen(axi_smc_M04_AXI_AWLEN),
        .c0_ddr4_s_axi_awlock(axi_smc_M04_AXI_AWLOCK),
        .c0_ddr4_s_axi_awprot(axi_smc_M04_AXI_AWPROT),
        .c0_ddr4_s_axi_awqos(axi_smc_M04_AXI_AWQOS),
        .c0_ddr4_s_axi_awready(axi_smc_M04_AXI_AWREADY),
        .c0_ddr4_s_axi_awsize(axi_smc_M04_AXI_AWSIZE),
        .c0_ddr4_s_axi_awvalid(axi_smc_M04_AXI_AWVALID),
        .c0_ddr4_s_axi_bready(axi_smc_M04_AXI_BREADY),
        .c0_ddr4_s_axi_bresp(axi_smc_M04_AXI_BRESP),
        .c0_ddr4_s_axi_bvalid(axi_smc_M04_AXI_BVALID),
        .c0_ddr4_s_axi_rdata(axi_smc_M04_AXI_RDATA),
        .c0_ddr4_s_axi_rlast(axi_smc_M04_AXI_RLAST),
        .c0_ddr4_s_axi_rready(axi_smc_M04_AXI_RREADY),
        .c0_ddr4_s_axi_rresp(axi_smc_M04_AXI_RRESP),
        .c0_ddr4_s_axi_rvalid(axi_smc_M04_AXI_RVALID),
        .c0_ddr4_s_axi_wdata(axi_smc_M04_AXI_WDATA),
        .c0_ddr4_s_axi_wlast(axi_smc_M04_AXI_WLAST),
        .c0_ddr4_s_axi_wready(axi_smc_M04_AXI_WREADY),
        .c0_ddr4_s_axi_wstrb(axi_smc_M04_AXI_WSTRB),
        .c0_ddr4_s_axi_wvalid(axi_smc_M04_AXI_WVALID),
        .c0_ddr4_ui_clk(microblaze_0_Clk),
        .c0_ddr4_ui_clk_sync_rst(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .c0_init_calib_complete(ddr4_0_c0_init_calib_complete),
        .c0_sys_clk_n(c0_sys_clk_n),
        .c0_sys_clk_p(c0_sys_clk_p),
        .dbg_bus(ddr4_0_dbg_bus),
        .dbg_clk(ddr4_0_dbg_clk),
        .sys_rst(util_vector_logic_0_Res));
  andromeda_ila_0_0 ila_0
       (.clk(ddr4_0_dbg_clk),
        .probe0(ddr4_0_c0_init_calib_complete),
        .probe1(ddr4_0_dbg_bus),
        .probe2(sd_controller_wrapper_0_card_type),
        .probe3(sd_controller_wrapper_0_card_stat));
  andromeda_mdm_0_0 mdm_0
       (.Dbg_Capture_0(mdm_0_MBDEBUG_0_CAPTURE),
        .Dbg_Clk_0(mdm_0_MBDEBUG_0_CLK),
        .Dbg_Disable_0(mdm_0_MBDEBUG_0_DISABLE),
        .Dbg_Reg_En_0(mdm_0_MBDEBUG_0_REG_EN),
        .Dbg_Rst_0(mdm_0_MBDEBUG_0_RST),
        .Dbg_Shift_0(mdm_0_MBDEBUG_0_SHIFT),
        .Dbg_TDI_0(mdm_0_MBDEBUG_0_TDI),
        .Dbg_TDO_0(mdm_0_MBDEBUG_0_TDO),
        .Dbg_Update_0(mdm_0_MBDEBUG_0_UPDATE),
        .Debug_SYS_Rst(mdm_0_Debug_SYS_Rst));
  (* BMM_INFO_PROCESSOR = "microblaze-le > andromeda microblaze_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  andromeda_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(microblaze_0_Clk),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(mdm_0_MBDEBUG_0_CAPTURE),
        .Dbg_Clk(mdm_0_MBDEBUG_0_CLK),
        .Dbg_Disable(mdm_0_MBDEBUG_0_DISABLE),
        .Dbg_Reg_En(mdm_0_MBDEBUG_0_REG_EN),
        .Dbg_Shift(mdm_0_MBDEBUG_0_SHIFT),
        .Dbg_TDI(mdm_0_MBDEBUG_0_TDI),
        .Dbg_TDO(mdm_0_MBDEBUG_0_TDO),
        .Dbg_Update(mdm_0_MBDEBUG_0_UPDATE),
        .Debug_Rst(mdm_0_MBDEBUG_0_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(microblaze_0_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_0_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_0_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_0_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_0_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_0_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_0_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_0_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_0_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_0_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_0_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_0_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_0_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_0_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_0_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_0_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_0_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_0_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_0_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(rst_ddr4_0_333M_mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  microblaze_0_local_memory_imp_1TBTZIU microblaze_0_local_memory
       (.DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .LMB_Clk(microblaze_0_Clk),
        .SYS_Rst(rst_ddr4_0_333M_bus_struct_reset));
  andromeda_rst_ddr4_0_100M_0 rst_ddr4_0_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(1'b1),
        .ext_reset_in(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .mb_debug_sys_rst(1'b0),
        .peripheral_aresetn(rst_ddr4_0_100M_peripheral_aresetn),
        .slowest_sync_clk(ddr4_0_addn_ui_clkout1));
  andromeda_rst_ddr4_0_333M_0 rst_ddr4_0_333M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_ddr4_0_333M_bus_struct_reset),
        .dcm_locked(1'b1),
        .ext_reset_in(ddr4_0_c0_ddr4_ui_clk_sync_rst),
        .mb_debug_sys_rst(mdm_0_Debug_SYS_Rst),
        .mb_reset(rst_ddr4_0_333M_mb_reset),
        .peripheral_aresetn(rst_ddr4_0_333M_peripheral_aresetn),
        .slowest_sync_clk(microblaze_0_Clk));
  andromeda_sd_controller_wrapper_0_0 sd_controller_wrapper_0
       (.aclk(ddr4_0_addn_ui_clkout1),
        .aresetn(rst_ddr4_0_100M_peripheral_aresetn),
        .axi_awaddr(sd_controller_wrapper_0_axi_AWADDR),
        .axi_awburst(sd_controller_wrapper_0_axi_AWBURST),
        .axi_awlen(sd_controller_wrapper_0_axi_AWLEN),
        .axi_awprot(sd_controller_wrapper_0_axi_AWPROT),
        .axi_awready(sd_controller_wrapper_0_axi_AWREADY),
        .axi_awsize(sd_controller_wrapper_0_axi_AWSIZE),
        .axi_awvalid(sd_controller_wrapper_0_axi_AWVALID),
        .axi_bready(sd_controller_wrapper_0_axi_BREADY),
        .axi_bresp(sd_controller_wrapper_0_axi_BRESP),
        .axi_bvalid(sd_controller_wrapper_0_axi_BVALID),
        .axi_wdata(sd_controller_wrapper_0_axi_WDATA),
        .axi_wlast(sd_controller_wrapper_0_axi_WLAST),
        .axi_wready(sd_controller_wrapper_0_axi_WREADY),
        .axi_wstrb(sd_controller_wrapper_0_axi_WSTRB),
        .axi_wvalid(sd_controller_wrapper_0_axi_WVALID),
        .axilite_araddr(axi_smc_M02_AXI_ARADDR),
        .axilite_arprot(axi_smc_M02_AXI_ARPROT),
        .axilite_arready(axi_smc_M02_AXI_ARREADY),
        .axilite_arvalid(axi_smc_M02_AXI_ARVALID),
        .axilite_awaddr(axi_smc_M02_AXI_AWADDR),
        .axilite_awprot(axi_smc_M02_AXI_AWPROT),
        .axilite_awready(axi_smc_M02_AXI_AWREADY),
        .axilite_awvalid(axi_smc_M02_AXI_AWVALID),
        .axilite_bready(axi_smc_M02_AXI_BREADY),
        .axilite_bresp(axi_smc_M02_AXI_BRESP),
        .axilite_bvalid(axi_smc_M02_AXI_BVALID),
        .axilite_rdata(axi_smc_M02_AXI_RDATA),
        .axilite_rready(axi_smc_M02_AXI_RREADY),
        .axilite_rresp(axi_smc_M02_AXI_RRESP),
        .axilite_rvalid(axi_smc_M02_AXI_RVALID),
        .axilite_wdata(axi_smc_M02_AXI_WDATA),
        .axilite_wready(axi_smc_M02_AXI_WREADY),
        .axilite_wstrb(axi_smc_M02_AXI_WSTRB),
        .axilite_wvalid(axi_smc_M02_AXI_WVALID),
        .card_stat(sd_controller_wrapper_0_card_stat),
        .card_type(sd_controller_wrapper_0_card_type),
        .sdclk(sd_clk),
        .sdcmd(sd_cmd),
        .sddat(sd_data));
  andromeda_system_ila_0_0 system_ila_0
       (.SLOT_0_AXI_araddr(axi_dpe_0_m_axi_ARADDR),
        .SLOT_0_AXI_arburst(axi_dpe_0_m_axi_ARBURST),
        .SLOT_0_AXI_arcache(axi_dpe_0_m_axi_ARCACHE),
        .SLOT_0_AXI_arlen(axi_dpe_0_m_axi_ARLEN),
        .SLOT_0_AXI_arprot(axi_dpe_0_m_axi_ARPROT),
        .SLOT_0_AXI_arready(axi_dpe_0_m_axi_ARREADY),
        .SLOT_0_AXI_arsize(axi_dpe_0_m_axi_ARSIZE),
        .SLOT_0_AXI_arvalid(axi_dpe_0_m_axi_ARVALID),
        .SLOT_0_AXI_awaddr(axi_dpe_0_m_axi_AWADDR),
        .SLOT_0_AXI_awburst(axi_dpe_0_m_axi_AWBURST),
        .SLOT_0_AXI_awcache(axi_dpe_0_m_axi_AWCACHE),
        .SLOT_0_AXI_awlen(axi_dpe_0_m_axi_AWLEN),
        .SLOT_0_AXI_awprot(axi_dpe_0_m_axi_AWPROT),
        .SLOT_0_AXI_awready(axi_dpe_0_m_axi_AWREADY),
        .SLOT_0_AXI_awsize(axi_dpe_0_m_axi_AWSIZE),
        .SLOT_0_AXI_awvalid(axi_dpe_0_m_axi_AWVALID),
        .SLOT_0_AXI_bready(axi_dpe_0_m_axi_BREADY),
        .SLOT_0_AXI_bresp(axi_dpe_0_m_axi_BRESP),
        .SLOT_0_AXI_bvalid(axi_dpe_0_m_axi_BVALID),
        .SLOT_0_AXI_rdata(axi_dpe_0_m_axi_RDATA),
        .SLOT_0_AXI_rlast(axi_dpe_0_m_axi_RLAST),
        .SLOT_0_AXI_rready(axi_dpe_0_m_axi_RREADY),
        .SLOT_0_AXI_rresp(axi_dpe_0_m_axi_RRESP),
        .SLOT_0_AXI_rvalid(axi_dpe_0_m_axi_RVALID),
        .SLOT_0_AXI_wdata(axi_dpe_0_m_axi_WDATA),
        .SLOT_0_AXI_wlast(axi_dpe_0_m_axi_WLAST),
        .SLOT_0_AXI_wready(axi_dpe_0_m_axi_WREADY),
        .SLOT_0_AXI_wstrb(axi_dpe_0_m_axi_WSTRB),
        .SLOT_0_AXI_wvalid(axi_dpe_0_m_axi_WVALID),
        .SLOT_1_AXI_araddr(axi_smc_M03_AXI_ARADDR),
        .SLOT_1_AXI_arprot(axi_smc_M03_AXI_ARPROT),
        .SLOT_1_AXI_arready(axi_smc_M03_AXI_ARREADY),
        .SLOT_1_AXI_arvalid(axi_smc_M03_AXI_ARVALID),
        .SLOT_1_AXI_awaddr(axi_smc_M03_AXI_AWADDR),
        .SLOT_1_AXI_awprot(axi_smc_M03_AXI_AWPROT),
        .SLOT_1_AXI_awready(axi_smc_M03_AXI_AWREADY),
        .SLOT_1_AXI_awvalid(axi_smc_M03_AXI_AWVALID),
        .SLOT_1_AXI_bready(axi_smc_M03_AXI_BREADY),
        .SLOT_1_AXI_bresp(axi_smc_M03_AXI_BRESP),
        .SLOT_1_AXI_bvalid(axi_smc_M03_AXI_BVALID),
        .SLOT_1_AXI_rdata(axi_smc_M03_AXI_RDATA),
        .SLOT_1_AXI_rready(axi_smc_M03_AXI_RREADY),
        .SLOT_1_AXI_rresp(axi_smc_M03_AXI_RRESP),
        .SLOT_1_AXI_rvalid(axi_smc_M03_AXI_RVALID),
        .SLOT_1_AXI_wdata(axi_smc_M03_AXI_WDATA),
        .SLOT_1_AXI_wready(axi_smc_M03_AXI_WREADY),
        .SLOT_1_AXI_wstrb(axi_smc_M03_AXI_WSTRB),
        .SLOT_1_AXI_wvalid(axi_smc_M03_AXI_WVALID),
        .SLOT_2_AXI_araddr(axi_smc_M04_AXI_ARADDR),
        .SLOT_2_AXI_arburst(axi_smc_M04_AXI_ARBURST),
        .SLOT_2_AXI_arcache(axi_smc_M04_AXI_ARCACHE),
        .SLOT_2_AXI_arlen(axi_smc_M04_AXI_ARLEN),
        .SLOT_2_AXI_arlock(axi_smc_M04_AXI_ARLOCK),
        .SLOT_2_AXI_arprot(axi_smc_M04_AXI_ARPROT),
        .SLOT_2_AXI_arqos(axi_smc_M04_AXI_ARQOS),
        .SLOT_2_AXI_arready(axi_smc_M04_AXI_ARREADY),
        .SLOT_2_AXI_arsize(axi_smc_M04_AXI_ARSIZE),
        .SLOT_2_AXI_arvalid(axi_smc_M04_AXI_ARVALID),
        .SLOT_2_AXI_awaddr(axi_smc_M04_AXI_AWADDR),
        .SLOT_2_AXI_awburst(axi_smc_M04_AXI_AWBURST),
        .SLOT_2_AXI_awcache(axi_smc_M04_AXI_AWCACHE),
        .SLOT_2_AXI_awlen(axi_smc_M04_AXI_AWLEN),
        .SLOT_2_AXI_awlock(axi_smc_M04_AXI_AWLOCK),
        .SLOT_2_AXI_awprot(axi_smc_M04_AXI_AWPROT),
        .SLOT_2_AXI_awqos(axi_smc_M04_AXI_AWQOS),
        .SLOT_2_AXI_awready(axi_smc_M04_AXI_AWREADY),
        .SLOT_2_AXI_awsize(axi_smc_M04_AXI_AWSIZE),
        .SLOT_2_AXI_awvalid(axi_smc_M04_AXI_AWVALID),
        .SLOT_2_AXI_bready(axi_smc_M04_AXI_BREADY),
        .SLOT_2_AXI_bresp(axi_smc_M04_AXI_BRESP),
        .SLOT_2_AXI_bvalid(axi_smc_M04_AXI_BVALID),
        .SLOT_2_AXI_rdata(axi_smc_M04_AXI_RDATA),
        .SLOT_2_AXI_rlast(axi_smc_M04_AXI_RLAST),
        .SLOT_2_AXI_rready(axi_smc_M04_AXI_RREADY),
        .SLOT_2_AXI_rresp(axi_smc_M04_AXI_RRESP),
        .SLOT_2_AXI_rvalid(axi_smc_M04_AXI_RVALID),
        .SLOT_2_AXI_wdata(axi_smc_M04_AXI_WDATA),
        .SLOT_2_AXI_wlast(axi_smc_M04_AXI_WLAST),
        .SLOT_2_AXI_wready(axi_smc_M04_AXI_WREADY),
        .SLOT_2_AXI_wstrb(axi_smc_M04_AXI_WSTRB),
        .SLOT_2_AXI_wvalid(axi_smc_M04_AXI_WVALID),
        .clk(microblaze_0_Clk),
        .probe0(ctrl_state_debug),
        .probe1(dma_busy_debug),
        .probe10(read_data_valid_debug),
        .probe11(read_grant_debug),
        .probe12(read_request_debug),
        .probe13(read_state_debug),
        .probe14(rvalid_debug),
        .probe15(rx_data_out_ila),
        .probe16(write_grant_debug),
        .probe17(write_request_debug),
        .probe18(write_state_debug),
        .probe19(wvalid_debug),
        .probe2(dma_start_debug),
        .probe20(dpe_wr_ready_out),
        .probe21(A_valid_debug),
        .probe22(1'b0),
        .probe23(prod_valid_debug),
        .probe24(sum_stage0_debug),
        .probe25(sum_stage1_debug),
        .probe26(sum_stage2_debug),
        .probe27(sum_stage3_debug),
        .probe28(sum_stage4_debug),
        .probe29(sum_stage5_debug),
        .probe3(dma_status_debug),
        .probe30(sum_stage6_debug),
        .probe31(valid_stage0_debug),
        .probe32(valid_stage1_debug),
        .probe33(valid_stage2_debug),
        .probe34(valid_stage3_debug),
        .probe35(valid_stage4_debug),
        .probe36(valid_stage5_debug),
        .probe37(valid_stage6_debug),
        .probe38(dpe_done),
        .probe39(A_debug),
        .probe4(dpe_en_debug),
        .probe40(prod_debug),
        .probe41(write_valid),
        .probe5(dpe_start_debug),
        .probe6(dpe_state_debug),
        .probe7(master_state_debug),
        .probe8(read_data_buffer_debug),
        .probe9(read_data_index_debug),
        .resetn(rst_ddr4_0_333M_peripheral_aresetn));
  andromeda_util_vector_logic_0_0 util_vector_logic_0
       (.Op1(sys_rstn),
        .Res(util_vector_logic_0_Res));
endmodule

module microblaze_0_local_memory_imp_1TBTZIU
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    LMB_Clk,
    SYS_Rst);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input LMB_Clk;
  input SYS_Rst;

  wire [0:31]DLMB_abus;
  wire DLMB_addrstrobe;
  wire [0:3]DLMB_be;
  wire DLMB_ce;
  wire [0:31]DLMB_readdbus;
  wire DLMB_readstrobe;
  wire DLMB_ready;
  wire DLMB_ue;
  wire DLMB_wait;
  wire [0:31]DLMB_writedbus;
  wire DLMB_writestrobe;
  wire [0:31]ILMB_abus;
  wire ILMB_addrstrobe;
  wire ILMB_ce;
  wire [0:31]ILMB_readdbus;
  wire ILMB_readstrobe;
  wire ILMB_ready;
  wire ILMB_ue;
  wire ILMB_wait;
  wire LMB_Clk;
  wire SYS_Rst;
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;

  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > andromeda microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  andromeda_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  andromeda_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(DLMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(DLMB_readdbus),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(DLMB_ready),
        .LMB_UE(DLMB_ue),
        .LMB_Wait(DLMB_wait),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus(DLMB_abus),
        .M_AddrStrobe(DLMB_addrstrobe),
        .M_BE(DLMB_be),
        .M_DBus(DLMB_writedbus),
        .M_ReadStrobe(DLMB_readstrobe),
        .M_WriteStrobe(DLMB_writestrobe),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  andromeda_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  andromeda_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(ILMB_ce),
        .LMB_Clk(LMB_Clk),
        .LMB_ReadDBus(ILMB_readdbus),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(ILMB_ready),
        .LMB_UE(ILMB_ue),
        .LMB_Wait(ILMB_wait),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(ILMB_abus),
        .M_AddrStrobe(ILMB_addrstrobe),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(ILMB_readstrobe),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  andromeda_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[0],microblaze_0_dlmb_cntlr_ADDR[1],microblaze_0_dlmb_cntlr_ADDR[2],microblaze_0_dlmb_cntlr_ADDR[3],microblaze_0_dlmb_cntlr_ADDR[4],microblaze_0_dlmb_cntlr_ADDR[5],microblaze_0_dlmb_cntlr_ADDR[6],microblaze_0_dlmb_cntlr_ADDR[7],microblaze_0_dlmb_cntlr_ADDR[8],microblaze_0_dlmb_cntlr_ADDR[9],microblaze_0_dlmb_cntlr_ADDR[10],microblaze_0_dlmb_cntlr_ADDR[11],microblaze_0_dlmb_cntlr_ADDR[12],microblaze_0_dlmb_cntlr_ADDR[13],microblaze_0_dlmb_cntlr_ADDR[14],microblaze_0_dlmb_cntlr_ADDR[15],microblaze_0_dlmb_cntlr_ADDR[16],microblaze_0_dlmb_cntlr_ADDR[17],microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[0],microblaze_0_ilmb_cntlr_ADDR[1],microblaze_0_ilmb_cntlr_ADDR[2],microblaze_0_ilmb_cntlr_ADDR[3],microblaze_0_ilmb_cntlr_ADDR[4],microblaze_0_ilmb_cntlr_ADDR[5],microblaze_0_ilmb_cntlr_ADDR[6],microblaze_0_ilmb_cntlr_ADDR[7],microblaze_0_ilmb_cntlr_ADDR[8],microblaze_0_ilmb_cntlr_ADDR[9],microblaze_0_ilmb_cntlr_ADDR[10],microblaze_0_ilmb_cntlr_ADDR[11],microblaze_0_ilmb_cntlr_ADDR[12],microblaze_0_ilmb_cntlr_ADDR[13],microblaze_0_ilmb_cntlr_ADDR[14],microblaze_0_ilmb_cntlr_ADDR[15],microblaze_0_ilmb_cntlr_ADDR[16],microblaze_0_ilmb_cntlr_ADDR[17],microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule
