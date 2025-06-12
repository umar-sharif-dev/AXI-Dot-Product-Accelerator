// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Jun 12 15:22:59 2025
// Host        : nuke running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vivado/puzhi/puzhi.gen/sources_1/bd/andromeda/ip/andromeda_axi_dpe_0_0/andromeda_axi_dpe_0_0_stub.v
// Design      : andromeda_axi_dpe_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "andromeda_axi_dpe_0_0,axi_dpe,{}" *) (* CORE_GENERATION_INFO = "andromeda_axi_dpe_0_0,axi_dpe,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=axi_dpe,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,C_S_AXI_ADDR_WIDTH=32,C_S_AXI_DATA_WIDTH=32,C_M_AXI_ADDR_WIDTH=32,C_M_AXI_DATA_WIDTH=256,C_M_AXI_BURST_LEN=128}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "axi_dpe,Vivado 2024.2" *) 
module andromeda_axi_dpe_0_0(aclk, aresetn, s_axi_awvalid, s_axi_awready, 
  s_axi_awaddr, s_axi_awprot, s_axi_wvalid, s_axi_wready, s_axi_wdata, s_axi_wstrb, 
  s_axi_bvalid, s_axi_bready, s_axi_bresp, s_axi_arvalid, s_axi_arready, s_axi_araddr, 
  s_axi_arprot, s_axi_rvalid, s_axi_rready, s_axi_rdata, s_axi_rresp, m_axi_arvalid, 
  m_axi_arready, m_axi_araddr, m_axi_arlen, m_axi_arsize, m_axi_arburst, m_axi_arprot, 
  m_axi_arcache, m_axi_rvalid, m_axi_rready, m_axi_rdata, m_axi_rresp, m_axi_rlast, 
  m_axi_awvalid, m_axi_awready, m_axi_awaddr, m_axi_awlen, m_axi_awsize, m_axi_awburst, 
  m_axi_awprot, m_axi_awcache, m_axi_wvalid, m_axi_wready, m_axi_wdata, m_axi_wstrb, 
  m_axi_wlast, m_axi_bvalid, m_axi_bready, m_axi_bresp, write_request_debug, 
  read_request_debug, write_grant_debug, read_grant_debug, dma_start_debug, dma_busy_debug, 
  dma_status_debug, master_state_debug, bytes_in_current_burst_debug, 
  read_transfer_count_debug, rx_data_out_ila, ctrl_state_debug, read_state_debug, 
  dpe_state_debug, write_state_debug, m_axi_arready_debug, m_axi_arvalid_r_debug, 
  m_axi_rvalid_debug, m_axi_rready_r_debug, read_data_valid_debug, dpe_en_debug, 
  dpe_start_debug, read_data_buffer_debug, read_data_index_debug, rvalid_debug, 
  wvalid_debug, dpe_wr_ready_out, write_valid, dpe_done, A_debug, A_valid_debug, prod_debug, 
  prod_valid_debug, sum_stage0_debug, valid_stage0_debug, sum_stage1_debug, 
  valid_stage1_debug, sum_stage2_debug, valid_stage2_debug, sum_stage3_debug, 
  valid_stage3_debug, sum_stage4_debug, valid_stage4_debug, sum_stage5_debug, 
  valid_stage5_debug, sum_stage6_debug, valid_stage6_debug)
/* synthesis syn_black_box black_box_pad_pin="aresetn,s_axi_awvalid,s_axi_awready,s_axi_awaddr[31:0],s_axi_awprot[2:0],s_axi_wvalid,s_axi_wready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_bvalid,s_axi_bready,s_axi_bresp[1:0],s_axi_arvalid,s_axi_arready,s_axi_araddr[31:0],s_axi_arprot[2:0],s_axi_rvalid,s_axi_rready,s_axi_rdata[31:0],s_axi_rresp[1:0],m_axi_arvalid,m_axi_arready,m_axi_araddr[31:0],m_axi_arlen[7:0],m_axi_arsize[2:0],m_axi_arburst[1:0],m_axi_arprot[2:0],m_axi_arcache[3:0],m_axi_rvalid,m_axi_rready,m_axi_rdata[255:0],m_axi_rresp[1:0],m_axi_rlast,m_axi_awvalid,m_axi_awready,m_axi_awaddr[31:0],m_axi_awlen[7:0],m_axi_awsize[2:0],m_axi_awburst[1:0],m_axi_awprot[2:0],m_axi_awcache[3:0],m_axi_wvalid,m_axi_wready,m_axi_wdata[255:0],m_axi_wstrb[31:0],m_axi_wlast,m_axi_bvalid,m_axi_bready,m_axi_bresp[1:0],write_request_debug,read_request_debug,write_grant_debug,read_grant_debug,dma_start_debug,dma_busy_debug,dma_status_debug[1:0],master_state_debug[3:0],bytes_in_current_burst_debug[31:0],read_transfer_count_debug[31:0],rx_data_out_ila[255:0],ctrl_state_debug[1:0],read_state_debug[2:0],dpe_state_debug[1:0],write_state_debug[2:0],m_axi_arready_debug,m_axi_arvalid_r_debug,m_axi_rvalid_debug,m_axi_rready_r_debug,read_data_valid_debug,dpe_en_debug,dpe_start_debug,read_data_buffer_debug[31:0],read_data_index_debug[7:0],rvalid_debug,wvalid_debug,dpe_wr_ready_out[255:0],write_valid,dpe_done,A_debug[31:0],A_valid_debug,prod_debug[31:0],prod_valid_debug,sum_stage0_debug[31:0],valid_stage0_debug,sum_stage1_debug[31:0],valid_stage1_debug,sum_stage2_debug[31:0],valid_stage2_debug,sum_stage3_debug[31:0],valid_stage3_debug,sum_stage4_debug[31:0],valid_stage4_debug,sum_stage5_debug[31:0],valid_stage5_debug,sum_stage6_debug[31:0],valid_stage6_debug" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF m_axi:s_axi, ASSOCIATED_RESET aresetn, FREQ_HZ 333250000, FREQ_TOLERANCE_HZ 0, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s_axi, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 333250000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input s_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWREADY" *) output s_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWADDR" *) input [31:0]s_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi AWPROT" *) input [2:0]s_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WVALID" *) input s_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WREADY" *) output s_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WDATA" *) input [31:0]s_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi WSTRB" *) input [3:0]s_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BVALID" *) output s_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BREADY" *) input s_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi BRESP" *) output [1:0]s_axi_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARVALID" *) input s_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARREADY" *) output s_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARADDR" *) input [31:0]s_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi ARPROT" *) input [2:0]s_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RVALID" *) output s_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RREADY" *) input s_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RDATA" *) output [31:0]s_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 s_axi RRESP" *) output [1:0]s_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m_axi, DATA_WIDTH 256, PROTOCOL AXI4, FREQ_HZ 333250000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 1, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0.00, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output m_axi_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARREADY" *) input m_axi_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARADDR" *) output [31:0]m_axi_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARLEN" *) output [7:0]m_axi_arlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARSIZE" *) output [2:0]m_axi_arsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARBURST" *) output [1:0]m_axi_arburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARPROT" *) output [2:0]m_axi_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi ARCACHE" *) output [3:0]m_axi_arcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RVALID" *) input m_axi_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RREADY" *) output m_axi_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RDATA" *) input [255:0]m_axi_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RRESP" *) input [1:0]m_axi_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi RLAST" *) input m_axi_rlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWVALID" *) output m_axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWREADY" *) input m_axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWADDR" *) output [31:0]m_axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWLEN" *) output [7:0]m_axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWSIZE" *) output [2:0]m_axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWBURST" *) output [1:0]m_axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWPROT" *) output [2:0]m_axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi AWCACHE" *) output [3:0]m_axi_awcache;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WVALID" *) output m_axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WREADY" *) input m_axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WDATA" *) output [255:0]m_axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WSTRB" *) output [31:0]m_axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi WLAST" *) output m_axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BVALID" *) input m_axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BREADY" *) output m_axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 m_axi BRESP" *) input [1:0]m_axi_bresp;
  output write_request_debug;
  output read_request_debug;
  output write_grant_debug;
  output read_grant_debug;
  output dma_start_debug;
  output dma_busy_debug;
  output [1:0]dma_status_debug;
  output [3:0]master_state_debug;
  output [31:0]bytes_in_current_burst_debug;
  output [31:0]read_transfer_count_debug;
  output [255:0]rx_data_out_ila;
  output [1:0]ctrl_state_debug;
  output [2:0]read_state_debug;
  output [1:0]dpe_state_debug;
  output [2:0]write_state_debug;
  output m_axi_arready_debug;
  output m_axi_arvalid_r_debug;
  output m_axi_rvalid_debug;
  output m_axi_rready_r_debug;
  output read_data_valid_debug;
  output dpe_en_debug;
  output dpe_start_debug;
  output [31:0]read_data_buffer_debug;
  output [7:0]read_data_index_debug;
  output rvalid_debug;
  output wvalid_debug;
  output [255:0]dpe_wr_ready_out;
  output write_valid;
  output dpe_done;
  output [31:0]A_debug;
  output A_valid_debug;
  output [31:0]prod_debug;
  output prod_valid_debug;
  output [31:0]sum_stage0_debug;
  output valid_stage0_debug;
  output [31:0]sum_stage1_debug;
  output valid_stage1_debug;
  output [31:0]sum_stage2_debug;
  output valid_stage2_debug;
  output [31:0]sum_stage3_debug;
  output valid_stage3_debug;
  output [31:0]sum_stage4_debug;
  output valid_stage4_debug;
  output [31:0]sum_stage5_debug;
  output valid_stage5_debug;
  output [31:0]sum_stage6_debug;
  output valid_stage6_debug;
endmodule
