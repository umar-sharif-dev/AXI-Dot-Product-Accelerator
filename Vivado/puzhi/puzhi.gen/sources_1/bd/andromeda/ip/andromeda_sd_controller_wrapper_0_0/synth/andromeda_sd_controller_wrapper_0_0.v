// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2025 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:sd_controller_wrapper:1.0
// IP Revision: 1

(* X_CORE_INFO = "sd_controller_wrapper,Vivado 2024.2" *)
(* CHECK_LICENSE_TYPE = "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{}" *)
(* CORE_GENERATION_INFO = "andromeda_sd_controller_wrapper_0_0,sd_controller_wrapper,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=sd_controller_wrapper,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=MIXED,SIMULATION=0}" *)
(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module andromeda_sd_controller_wrapper_0_0 (
  aclk,
  aresetn,
  axilite_awvalid,
  axilite_awready,
  axilite_awaddr,
  axilite_awprot,
  axilite_wvalid,
  axilite_wready,
  axilite_wdata,
  axilite_wstrb,
  axilite_bvalid,
  axilite_bready,
  axilite_bresp,
  axilite_arvalid,
  axilite_arready,
  axilite_araddr,
  axilite_arprot,
  axilite_rvalid,
  axilite_rready,
  axilite_rdata,
  axilite_rresp,
  axi_awvalid,
  axi_awready,
  axi_awaddr,
  axi_awprot,
  axi_awburst,
  axi_awlen,
  axi_awsize,
  axi_wvalid,
  axi_wready,
  axi_wdata,
  axi_wstrb,
  axi_wlast,
  axi_bvalid,
  axi_bready,
  axi_bresp,
  sdclk,
  sdcmd,
  sddat,
  card_type,
  card_stat,
  interrupt
);

(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 aclk CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aclk, ASSOCIATED_BUSIF axi:axilite, ASSOCIATED_RESET aresetn, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, INSERT_VIP 0" *)
input wire aclk;
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 aresetn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME aresetn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire aresetn;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWVALID" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axilite, DATA_WIDTH 32, PROTOCOL AXI4LITE, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 7, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE READ_WRITE, HAS_BURST 0, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 1, SUPPORTS_NARROW_BURST 0, NUM_READ_OUTSTANDING 1, NUM_WRITE_OUTSTANDING 1, MAX_BURST_LENGTH 1, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WR\
ITE_THREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
input wire axilite_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWREADY" *)
output wire axilite_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWADDR" *)
input wire [6 : 0] axilite_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite AWPROT" *)
input wire [2 : 0] axilite_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WVALID" *)
input wire axilite_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WREADY" *)
output wire axilite_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WDATA" *)
input wire [31 : 0] axilite_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite WSTRB" *)
input wire [3 : 0] axilite_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BVALID" *)
output wire axilite_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BREADY" *)
input wire axilite_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite BRESP" *)
output wire [1 : 0] axilite_bresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARVALID" *)
input wire axilite_arvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARREADY" *)
output wire axilite_arready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARADDR" *)
input wire [6 : 0] axilite_araddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite ARPROT" *)
input wire [2 : 0] axilite_arprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RVALID" *)
output wire axilite_rvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RREADY" *)
input wire axilite_rready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RDATA" *)
output wire [31 : 0] axilite_rdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axilite RRESP" *)
output wire [1 : 0] axilite_rresp;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWVALID" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME axi, DATA_WIDTH 32, PROTOCOL AXI4, FREQ_HZ 100000000, ID_WIDTH 0, ADDR_WIDTH 32, AWUSER_WIDTH 0, ARUSER_WIDTH 0, WUSER_WIDTH 0, RUSER_WIDTH 0, BUSER_WIDTH 0, READ_WRITE_MODE WRITE_ONLY, HAS_BURST 1, HAS_LOCK 0, HAS_PROT 1, HAS_CACHE 0, HAS_QOS 0, HAS_REGION 0, HAS_WSTRB 1, HAS_BRESP 1, HAS_RRESP 0, SUPPORTS_NARROW_BURST 1, NUM_READ_OUTSTANDING 2, NUM_WRITE_OUTSTANDING 2, MAX_BURST_LENGTH 256, PHASE 0, CLK_DOMAIN andromeda_ddr4_0_0_c0_ddr4_ui_clk, NUM_READ_THREADS 1, NUM_WRITE_T\
HREADS 1, RUSER_BITS_PER_BYTE 0, WUSER_BITS_PER_BYTE 0, INSERT_VIP 0" *)
output wire axi_awvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWREADY" *)
input wire axi_awready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWADDR" *)
output wire [31 : 0] axi_awaddr;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWPROT" *)
output wire [2 : 0] axi_awprot;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWBURST" *)
output wire [1 : 0] axi_awburst;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWLEN" *)
output wire [7 : 0] axi_awlen;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi AWSIZE" *)
output wire [2 : 0] axi_awsize;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WVALID" *)
output wire axi_wvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WREADY" *)
input wire axi_wready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WDATA" *)
output wire [31 : 0] axi_wdata;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WSTRB" *)
output wire [3 : 0] axi_wstrb;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi WLAST" *)
output wire axi_wlast;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BVALID" *)
input wire axi_bvalid;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BREADY" *)
output wire axi_bready;
(* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 axi BRESP" *)
input wire [1 : 0] axi_bresp;
output wire sdclk;
inout wire sdcmd;
input wire [3 : 0] sddat;
output wire [1 : 0] card_type;
output wire [3 : 0] card_stat;
(* X_INTERFACE_INFO = "xilinx.com:signal:interrupt:1.0 interrupt INTERRUPT" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME interrupt, SENSITIVITY LEVEL_HIGH, PortWidth 1" *)
output wire interrupt;

  sd_controller_wrapper #(
    .SIMULATION(0)
  ) inst (
    .aclk(aclk),
    .aresetn(aresetn),
    .axilite_awvalid(axilite_awvalid),
    .axilite_awready(axilite_awready),
    .axilite_awaddr(axilite_awaddr),
    .axilite_awprot(axilite_awprot),
    .axilite_wvalid(axilite_wvalid),
    .axilite_wready(axilite_wready),
    .axilite_wdata(axilite_wdata),
    .axilite_wstrb(axilite_wstrb),
    .axilite_bvalid(axilite_bvalid),
    .axilite_bready(axilite_bready),
    .axilite_bresp(axilite_bresp),
    .axilite_arvalid(axilite_arvalid),
    .axilite_arready(axilite_arready),
    .axilite_araddr(axilite_araddr),
    .axilite_arprot(axilite_arprot),
    .axilite_rvalid(axilite_rvalid),
    .axilite_rready(axilite_rready),
    .axilite_rdata(axilite_rdata),
    .axilite_rresp(axilite_rresp),
    .axi_awvalid(axi_awvalid),
    .axi_awready(axi_awready),
    .axi_awaddr(axi_awaddr),
    .axi_awprot(axi_awprot),
    .axi_awburst(axi_awburst),
    .axi_awlen(axi_awlen),
    .axi_awsize(axi_awsize),
    .axi_wvalid(axi_wvalid),
    .axi_wready(axi_wready),
    .axi_wdata(axi_wdata),
    .axi_wstrb(axi_wstrb),
    .axi_wlast(axi_wlast),
    .axi_bvalid(axi_bvalid),
    .axi_bready(axi_bready),
    .axi_bresp(axi_bresp),
    .sdclk(sdclk),
    .sdcmd(sdcmd),
    .sddat(sddat),
    .card_type(card_type),
    .card_stat(card_stat),
    .interrupt(interrupt)
  );
endmodule
