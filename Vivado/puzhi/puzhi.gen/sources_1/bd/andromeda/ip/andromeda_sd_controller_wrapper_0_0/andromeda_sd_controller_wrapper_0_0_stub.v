// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (lin64) Build 5239630 Fri Nov 08 22:34:34 MST 2024
// Date        : Thu Jun 12 05:38:31 2025
// Host        : dust2 running 64-bit Ubuntu 24.04.2 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/malik/andromeda_ila/AXI-DPE-simulation/AXI-Dot-Product-Accelerator/Vivado/puzhi/puzhi.gen/sources_1/bd/andromeda/ip/andromeda_sd_controller_wrapper_0_0/andromeda_sd_controller_wrapper_0_0_stub.v
// Design      : andromeda_sd_controller_wrapper_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcku5p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{}" *) (* CORE_GENERATION_INFO = "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=sd_controller_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SIMULATION=0}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "sd_controller_wrapper,Vivado 2024.2" *) 
module andromeda_sd_controller_wrapper_0_0(aclk, aresetn, axilite_awvalid, 
  axilite_awready, axilite_awaddr, axilite_awprot, axilite_wvalid, axilite_wready, 
  axilite_wdata, axilite_wstrb, axilite_bvalid, axilite_bready, axilite_bresp, 
  axilite_arvalid, axilite_arready, axilite_araddr, axilite_arprot, axilite_rvalid, 
  axilite_rready, axilite_rdata, axilite_rresp, axi_awvalid, axi_awready, axi_awaddr, 
  axi_awprot, axi_awburst, axi_awlen, axi_awsize, axi_wvalid, axi_wready, axi_wdata, axi_wstrb, 
  axi_wlast, axi_bvalid, axi_bready, axi_bresp, sdclk, sdcmd, sddat, card_type, card_stat, interrupt)
/* synthesis syn_black_box black_box_pad_pin="aresetn,axilite_awvalid,axilite_awready,axilite_awaddr[6:0],axilite_awprot[2:0],axilite_wvalid,axilite_wready,axilite_wdata[31:0],axilite_wstrb[3:0],axilite_bvalid,axilite_bready,axilite_bresp[1:0],axilite_arvalid,axilite_arready,axilite_araddr[6:0],axilite_arprot[2:0],axilite_rvalid,axilite_rready,axilite_rdata[31:0],axilite_rresp[1:0],axi_awvalid,axi_awready,axi_awaddr[31:0],axi_awprot[2:0],axi_awburst[1:0],axi_awlen[7:0],axi_awsize[2:0],axi_wvalid,axi_wready,axi_wdata[31:0],axi_wstrb[3:0],axi_wlast,axi_bvalid,axi_bready,axi_bresp[1:0],sdclk,sdcmd,sddat[3:0],card_type[1:0],card_stat[3:0],interrupt" */
/* synthesis syn_force_seq_prim="aclk" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF axi:axilite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *) input aclk /* synthesis syn_isclock = 1 */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWVALID" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axilite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) input axilite_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWREADY" *) output axilite_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWADDR" *) input [6:0]axilite_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWPROT" *) input [2:0]axilite_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WVALID" *) input axilite_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WREADY" *) output axilite_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WDATA" *) input [31:0]axilite_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WSTRB" *) input [3:0]axilite_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BVALID" *) output axilite_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BREADY" *) input axilite_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BRESP" *) output [1:0]axilite_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARVALID" *) input axilite_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARREADY" *) output axilite_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARADDR" *) input [6:0]axilite_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARPROT" *) input [2:0]axilite_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RVALID" *) output axilite_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RREADY" *) input axilite_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RDATA" *) output [31:0]axilite_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RRESP" *) output [1:0]axilite_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWVALID" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *) output axi_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWREADY" *) input axi_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWADDR" *) output [31:0]axi_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWPROT" *) output [2:0]axi_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWBURST" *) output [1:0]axi_awburst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWLEN" *) output [7:0]axi_awlen;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWSIZE" *) output [2:0]axi_awsize;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WVALID" *) output axi_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WREADY" *) input axi_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WDATA" *) output [31:0]axi_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WSTRB" *) output [3:0]axi_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WLAST" *) output axi_wlast;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BVALID" *) input axi_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BREADY" *) output axi_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BRESP" *) input [1:0]axi_bresp;
  output sdclk;
  inout sdcmd;
  input [3:0]sddat;
  output [1:0]card_type;
  output [3:0]card_stat;
  (* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *) output interrupt;
endmodule
