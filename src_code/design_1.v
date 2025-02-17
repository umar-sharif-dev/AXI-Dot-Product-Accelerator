//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Mon Feb 17 10:11:56 2025
//Host        : hp running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=8,numReposBlks=8,numNonXlnxBlks=4,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_bram_cntlr_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (S00_AXI_araddr,
    S00_AXI_arprot,
    S00_AXI_arready,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awprot,
    S00_AXI_awready,
    S00_AXI_awvalid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    clk,
    done,
    error,
    result,
    rstn);
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARADDR" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME S00_AXI, ADDR_WIDTH 16, ARUSER_WIDTH 0, AWUSER_WIDTH 0, BUSER_WIDTH 0, CLK_DOMAIN design_1_clk, DATA_WIDTH 32, FREQ_HZ 100000000, HAS_BRESP 1, HAS_BURST 0, HAS_CACHE 0, HAS_LOCK 0, HAS_PROT 1, HAS_QOS 0, HAS_REGION 0, HAS_RRESP 1, HAS_WSTRB 1, ID_WIDTH 0, MAX_BURST_LENGTH 1, NUM_READ_OUTSTANDING 1, NUM_READ_THREADS 1, NUM_WRITE_OUTSTANDING 1, NUM_WRITE_THREADS 1, PHASE 0.000, PROTOCOL AXI4LITE, READ_WRITE_MODE READ_WRITE, RUSER_BITS_PER_BYTE 0, RUSER_WIDTH 0, SUPPORTS_NARROW_BURST 0, WUSER_BITS_PER_BYTE 0, WUSER_WIDTH 0" *) input [4:0]S00_AXI_araddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARPROT" *) input [2:0]S00_AXI_arprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARREADY" *) output S00_AXI_arready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI ARVALID" *) input S00_AXI_arvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWADDR" *) input [4:0]S00_AXI_awaddr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWPROT" *) input [2:0]S00_AXI_awprot;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWREADY" *) output S00_AXI_awready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI AWVALID" *) input S00_AXI_awvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BREADY" *) input S00_AXI_bready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BRESP" *) output [1:0]S00_AXI_bresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI BVALID" *) output S00_AXI_bvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RDATA" *) output [31:0]S00_AXI_rdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RREADY" *) input S00_AXI_rready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RRESP" *) output [1:0]S00_AXI_rresp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI RVALID" *) output S00_AXI_rvalid;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WDATA" *) input [31:0]S00_AXI_wdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WREADY" *) output S00_AXI_wready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WSTRB" *) input [3:0]S00_AXI_wstrb;
  (* X_INTERFACE_INFO = "xilinx.com:interface:aximm:1.0 S00_AXI WVALID" *) input S00_AXI_wvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_BUSIF S00_AXI, ASSOCIATED_RESET rstn, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  output done;
  output error;
  output [31:0]result;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RSTN, POLARITY ACTIVE_LOW" *) input rstn;

  wire [31:0]Net;
  wire [4:0]S00_AXI_1_ARADDR;
  wire [2:0]S00_AXI_1_ARPROT;
  wire S00_AXI_1_ARREADY;
  wire S00_AXI_1_ARVALID;
  wire [4:0]S00_AXI_1_AWADDR;
  wire [2:0]S00_AXI_1_AWPROT;
  wire S00_AXI_1_AWREADY;
  wire S00_AXI_1_AWVALID;
  wire S00_AXI_1_BREADY;
  wire [1:0]S00_AXI_1_BRESP;
  wire S00_AXI_1_BVALID;
  wire [31:0]S00_AXI_1_RDATA;
  wire S00_AXI_1_RREADY;
  wire [1:0]S00_AXI_1_RRESP;
  wire S00_AXI_1_RVALID;
  wire [31:0]S00_AXI_1_WDATA;
  wire S00_AXI_1_WREADY;
  wire [3:0]S00_AXI_1_WSTRB;
  wire S00_AXI_1_WVALID;
  wire [12:0]axi_bram_ctrl_0_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_0_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_0_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_0_BRAM_PORTA_EN;
  wire axi_bram_ctrl_0_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_0_BRAM_PORTA_WE;
  wire [12:0]axi_bram_ctrl_1_BRAM_PORTA_ADDR;
  wire axi_bram_ctrl_1_BRAM_PORTA_CLK;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DIN;
  wire [31:0]axi_bram_ctrl_1_BRAM_PORTA_DOUT;
  wire axi_bram_ctrl_1_BRAM_PORTA_EN;
  wire axi_bram_ctrl_1_BRAM_PORTA_RST;
  wire [3:0]axi_bram_ctrl_1_BRAM_PORTA_WE;
  wire [31:0]axi_lite_0_vec_a_addr;
  wire [31:0]axi_lite_0_vec_b_addr;
  wire [31:0]axi_master_m_0_M00_AXI_ARADDR;
  wire [1:0]axi_master_m_0_M00_AXI_ARBURST;
  wire [3:0]axi_master_m_0_M00_AXI_ARCACHE;
  wire [0:0]axi_master_m_0_M00_AXI_ARID;
  wire [7:0]axi_master_m_0_M00_AXI_ARLEN;
  wire axi_master_m_0_M00_AXI_ARLOCK;
  wire [2:0]axi_master_m_0_M00_AXI_ARPROT;
  wire axi_master_m_0_M00_AXI_ARREADY;
  wire [2:0]axi_master_m_0_M00_AXI_ARSIZE;
  wire axi_master_m_0_M00_AXI_ARVALID;
  wire [31:0]axi_master_m_0_M00_AXI_AWADDR;
  wire [1:0]axi_master_m_0_M00_AXI_AWBURST;
  wire [3:0]axi_master_m_0_M00_AXI_AWCACHE;
  wire [0:0]axi_master_m_0_M00_AXI_AWID;
  wire [7:0]axi_master_m_0_M00_AXI_AWLEN;
  wire axi_master_m_0_M00_AXI_AWLOCK;
  wire [2:0]axi_master_m_0_M00_AXI_AWPROT;
  wire axi_master_m_0_M00_AXI_AWREADY;
  wire [2:0]axi_master_m_0_M00_AXI_AWSIZE;
  wire axi_master_m_0_M00_AXI_AWVALID;
  wire [0:0]axi_master_m_0_M00_AXI_BID;
  wire axi_master_m_0_M00_AXI_BREADY;
  wire [1:0]axi_master_m_0_M00_AXI_BRESP;
  wire axi_master_m_0_M00_AXI_BVALID;
  wire [31:0]axi_master_m_0_M00_AXI_RDATA;
  wire [0:0]axi_master_m_0_M00_AXI_RID;
  wire axi_master_m_0_M00_AXI_RLAST;
  wire axi_master_m_0_M00_AXI_RREADY;
  wire [1:0]axi_master_m_0_M00_AXI_RRESP;
  wire axi_master_m_0_M00_AXI_RVALID;
  wire [31:0]axi_master_m_0_M00_AXI_WDATA;
  wire axi_master_m_0_M00_AXI_WLAST;
  wire axi_master_m_0_M00_AXI_WREADY;
  wire [3:0]axi_master_m_0_M00_AXI_WSTRB;
  wire axi_master_m_0_M00_AXI_WVALID;
  wire axi_master_m_0_m00_axi_error;
  wire axi_master_m_0_reads_done;
  wire [7:0]axi_master_m_0_vector_out;
  wire axi_master_m_0_vector_valid;
  wire axi_master_m_0_writes_done;
  wire [31:0]axi_master_m_v1_2_0_m00_axi_ARADDR;
  wire [1:0]axi_master_m_v1_2_0_m00_axi_ARBURST;
  wire [3:0]axi_master_m_v1_2_0_m00_axi_ARCACHE;
  wire [0:0]axi_master_m_v1_2_0_m00_axi_ARID;
  wire [7:0]axi_master_m_v1_2_0_m00_axi_ARLEN;
  wire axi_master_m_v1_2_0_m00_axi_ARLOCK;
  wire [2:0]axi_master_m_v1_2_0_m00_axi_ARPROT;
  wire axi_master_m_v1_2_0_m00_axi_ARREADY;
  wire [2:0]axi_master_m_v1_2_0_m00_axi_ARSIZE;
  wire axi_master_m_v1_2_0_m00_axi_ARVALID;
  wire [31:0]axi_master_m_v1_2_0_m00_axi_AWADDR;
  wire [1:0]axi_master_m_v1_2_0_m00_axi_AWBURST;
  wire [3:0]axi_master_m_v1_2_0_m00_axi_AWCACHE;
  wire [0:0]axi_master_m_v1_2_0_m00_axi_AWID;
  wire [7:0]axi_master_m_v1_2_0_m00_axi_AWLEN;
  wire axi_master_m_v1_2_0_m00_axi_AWLOCK;
  wire [2:0]axi_master_m_v1_2_0_m00_axi_AWPROT;
  wire axi_master_m_v1_2_0_m00_axi_AWREADY;
  wire [2:0]axi_master_m_v1_2_0_m00_axi_AWSIZE;
  wire axi_master_m_v1_2_0_m00_axi_AWVALID;
  wire [0:0]axi_master_m_v1_2_0_m00_axi_BID;
  wire axi_master_m_v1_2_0_m00_axi_BREADY;
  wire [1:0]axi_master_m_v1_2_0_m00_axi_BRESP;
  wire axi_master_m_v1_2_0_m00_axi_BVALID;
  wire [31:0]axi_master_m_v1_2_0_m00_axi_RDATA;
  wire [0:0]axi_master_m_v1_2_0_m00_axi_RID;
  wire axi_master_m_v1_2_0_m00_axi_RLAST;
  wire axi_master_m_v1_2_0_m00_axi_RREADY;
  wire [1:0]axi_master_m_v1_2_0_m00_axi_RRESP;
  wire axi_master_m_v1_2_0_m00_axi_RVALID;
  wire [31:0]axi_master_m_v1_2_0_m00_axi_WDATA;
  wire axi_master_m_v1_2_0_m00_axi_WLAST;
  wire axi_master_m_v1_2_0_m00_axi_WREADY;
  wire [3:0]axi_master_m_v1_2_0_m00_axi_WSTRB;
  wire axi_master_m_v1_2_0_m00_axi_WVALID;
  wire [7:0]axi_master_m_v1_2_0_vector_out;
  wire clk_wiz_clk_out1;
  wire dot_prod_0_busy;
  wire dot_prod_0_done;
  wire [31:0]dot_prod_0_result;
  wire rst_clk_wiz_100M_peripheral_aresetn;
  wire start_1;

  assign S00_AXI_1_ARADDR = S00_AXI_araddr[4:0];
  assign S00_AXI_1_ARPROT = S00_AXI_arprot[2:0];
  assign S00_AXI_1_ARVALID = S00_AXI_arvalid;
  assign S00_AXI_1_AWADDR = S00_AXI_awaddr[4:0];
  assign S00_AXI_1_AWPROT = S00_AXI_awprot[2:0];
  assign S00_AXI_1_AWVALID = S00_AXI_awvalid;
  assign S00_AXI_1_BREADY = S00_AXI_bready;
  assign S00_AXI_1_RREADY = S00_AXI_rready;
  assign S00_AXI_1_WDATA = S00_AXI_wdata[31:0];
  assign S00_AXI_1_WSTRB = S00_AXI_wstrb[3:0];
  assign S00_AXI_1_WVALID = S00_AXI_wvalid;
  assign S00_AXI_arready = S00_AXI_1_ARREADY;
  assign S00_AXI_awready = S00_AXI_1_AWREADY;
  assign S00_AXI_bresp[1:0] = S00_AXI_1_BRESP;
  assign S00_AXI_bvalid = S00_AXI_1_BVALID;
  assign S00_AXI_rdata[31:0] = S00_AXI_1_RDATA;
  assign S00_AXI_rresp[1:0] = S00_AXI_1_RRESP;
  assign S00_AXI_rvalid = S00_AXI_1_RVALID;
  assign S00_AXI_wready = S00_AXI_1_WREADY;
  assign clk_wiz_clk_out1 = clk;
  assign done = dot_prod_0_done;
  assign error = axi_master_m_0_m00_axi_error;
  assign result[31:0] = dot_prod_0_result;
  assign rst_clk_wiz_100M_peripheral_aresetn = rstn;
  design_1_axi_bram_ctrl_0_0 axi_bram_ctrl_0
       (.bram_addr_a(axi_bram_ctrl_0_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_0_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(axi_master_m_0_M00_AXI_ARADDR[12:0]),
        .s_axi_arburst(axi_master_m_0_M00_AXI_ARBURST),
        .s_axi_arcache(axi_master_m_0_M00_AXI_ARCACHE),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arid(axi_master_m_0_M00_AXI_ARID),
        .s_axi_arlen(axi_master_m_0_M00_AXI_ARLEN),
        .s_axi_arlock(axi_master_m_0_M00_AXI_ARLOCK),
        .s_axi_arprot(axi_master_m_0_M00_AXI_ARPROT),
        .s_axi_arready(axi_master_m_0_M00_AXI_ARREADY),
        .s_axi_arsize(axi_master_m_0_M00_AXI_ARSIZE),
        .s_axi_arvalid(axi_master_m_0_M00_AXI_ARVALID),
        .s_axi_awaddr(axi_master_m_0_M00_AXI_AWADDR[12:0]),
        .s_axi_awburst(axi_master_m_0_M00_AXI_AWBURST),
        .s_axi_awcache(axi_master_m_0_M00_AXI_AWCACHE),
        .s_axi_awid(axi_master_m_0_M00_AXI_AWID),
        .s_axi_awlen(axi_master_m_0_M00_AXI_AWLEN),
        .s_axi_awlock(axi_master_m_0_M00_AXI_AWLOCK),
        .s_axi_awprot(axi_master_m_0_M00_AXI_AWPROT),
        .s_axi_awready(axi_master_m_0_M00_AXI_AWREADY),
        .s_axi_awsize(axi_master_m_0_M00_AXI_AWSIZE),
        .s_axi_awvalid(axi_master_m_0_M00_AXI_AWVALID),
        .s_axi_bid(axi_master_m_0_M00_AXI_BID),
        .s_axi_bready(axi_master_m_0_M00_AXI_BREADY),
        .s_axi_bresp(axi_master_m_0_M00_AXI_BRESP),
        .s_axi_bvalid(axi_master_m_0_M00_AXI_BVALID),
        .s_axi_rdata(axi_master_m_0_M00_AXI_RDATA),
        .s_axi_rid(axi_master_m_0_M00_AXI_RID),
        .s_axi_rlast(axi_master_m_0_M00_AXI_RLAST),
        .s_axi_rready(axi_master_m_0_M00_AXI_RREADY),
        .s_axi_rresp(axi_master_m_0_M00_AXI_RRESP),
        .s_axi_rvalid(axi_master_m_0_M00_AXI_RVALID),
        .s_axi_wdata(axi_master_m_0_M00_AXI_WDATA),
        .s_axi_wlast(axi_master_m_0_M00_AXI_WLAST),
        .s_axi_wready(axi_master_m_0_M00_AXI_WREADY),
        .s_axi_wstrb(axi_master_m_0_M00_AXI_WSTRB),
        .s_axi_wvalid(axi_master_m_0_M00_AXI_WVALID));
  design_1_axi_bram_ctrl_0_bram_0 axi_bram_ctrl_0_bram
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_0_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_0_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_0_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_0_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_0_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_0_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_0_BRAM_PORTA_WE));
  design_1_axi_bram_ctrl_0_bram_1 axi_bram_ctrl_0_bram1
       (.addra({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,axi_bram_ctrl_1_BRAM_PORTA_ADDR}),
        .clka(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .dina(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .douta(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .ena(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .rsta(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .wea(axi_bram_ctrl_1_BRAM_PORTA_WE));
  design_1_axi_bram_ctrl_0_1 axi_bram_ctrl_1
       (.bram_addr_a(axi_bram_ctrl_1_BRAM_PORTA_ADDR),
        .bram_clk_a(axi_bram_ctrl_1_BRAM_PORTA_CLK),
        .bram_en_a(axi_bram_ctrl_1_BRAM_PORTA_EN),
        .bram_rddata_a(axi_bram_ctrl_1_BRAM_PORTA_DOUT),
        .bram_rst_a(axi_bram_ctrl_1_BRAM_PORTA_RST),
        .bram_we_a(axi_bram_ctrl_1_BRAM_PORTA_WE),
        .bram_wrdata_a(axi_bram_ctrl_1_BRAM_PORTA_DIN),
        .s_axi_aclk(clk_wiz_clk_out1),
        .s_axi_araddr(axi_master_m_v1_2_0_m00_axi_ARADDR[12:0]),
        .s_axi_arburst(axi_master_m_v1_2_0_m00_axi_ARBURST),
        .s_axi_arcache(axi_master_m_v1_2_0_m00_axi_ARCACHE),
        .s_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s_axi_arid(axi_master_m_v1_2_0_m00_axi_ARID),
        .s_axi_arlen(axi_master_m_v1_2_0_m00_axi_ARLEN),
        .s_axi_arlock(axi_master_m_v1_2_0_m00_axi_ARLOCK),
        .s_axi_arprot(axi_master_m_v1_2_0_m00_axi_ARPROT),
        .s_axi_arready(axi_master_m_v1_2_0_m00_axi_ARREADY),
        .s_axi_arsize(axi_master_m_v1_2_0_m00_axi_ARSIZE),
        .s_axi_arvalid(axi_master_m_v1_2_0_m00_axi_ARVALID),
        .s_axi_awaddr(axi_master_m_v1_2_0_m00_axi_AWADDR[12:0]),
        .s_axi_awburst(axi_master_m_v1_2_0_m00_axi_AWBURST),
        .s_axi_awcache(axi_master_m_v1_2_0_m00_axi_AWCACHE),
        .s_axi_awid(axi_master_m_v1_2_0_m00_axi_AWID),
        .s_axi_awlen(axi_master_m_v1_2_0_m00_axi_AWLEN),
        .s_axi_awlock(axi_master_m_v1_2_0_m00_axi_AWLOCK),
        .s_axi_awprot(axi_master_m_v1_2_0_m00_axi_AWPROT),
        .s_axi_awready(axi_master_m_v1_2_0_m00_axi_AWREADY),
        .s_axi_awsize(axi_master_m_v1_2_0_m00_axi_AWSIZE),
        .s_axi_awvalid(axi_master_m_v1_2_0_m00_axi_AWVALID),
        .s_axi_bid(axi_master_m_v1_2_0_m00_axi_BID),
        .s_axi_bready(axi_master_m_v1_2_0_m00_axi_BREADY),
        .s_axi_bresp(axi_master_m_v1_2_0_m00_axi_BRESP),
        .s_axi_bvalid(axi_master_m_v1_2_0_m00_axi_BVALID),
        .s_axi_rdata(axi_master_m_v1_2_0_m00_axi_RDATA),
        .s_axi_rid(axi_master_m_v1_2_0_m00_axi_RID),
        .s_axi_rlast(axi_master_m_v1_2_0_m00_axi_RLAST),
        .s_axi_rready(axi_master_m_v1_2_0_m00_axi_RREADY),
        .s_axi_rresp(axi_master_m_v1_2_0_m00_axi_RRESP),
        .s_axi_rvalid(axi_master_m_v1_2_0_m00_axi_RVALID),
        .s_axi_wdata(axi_master_m_v1_2_0_m00_axi_WDATA),
        .s_axi_wlast(axi_master_m_v1_2_0_m00_axi_WLAST),
        .s_axi_wready(axi_master_m_v1_2_0_m00_axi_WREADY),
        .s_axi_wstrb(axi_master_m_v1_2_0_m00_axi_WSTRB),
        .s_axi_wvalid(axi_master_m_v1_2_0_m00_axi_WVALID));
  design_1_axi_lite_0_0 axi_lite_0
       (.busy(dot_prod_0_busy),
        .done(dot_prod_0_done),
        .result_in(dot_prod_0_result),
        .s00_axi_aclk(clk_wiz_clk_out1),
        .s00_axi_araddr(S00_AXI_1_ARADDR),
        .s00_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .s00_axi_arprot(S00_AXI_1_ARPROT),
        .s00_axi_arready(S00_AXI_1_ARREADY),
        .s00_axi_arvalid(S00_AXI_1_ARVALID),
        .s00_axi_awaddr(S00_AXI_1_AWADDR),
        .s00_axi_awprot(S00_AXI_1_AWPROT),
        .s00_axi_awready(S00_AXI_1_AWREADY),
        .s00_axi_awvalid(S00_AXI_1_AWVALID),
        .s00_axi_bready(S00_AXI_1_BREADY),
        .s00_axi_bresp(S00_AXI_1_BRESP),
        .s00_axi_bvalid(S00_AXI_1_BVALID),
        .s00_axi_rdata(S00_AXI_1_RDATA),
        .s00_axi_rready(S00_AXI_1_RREADY),
        .s00_axi_rresp(S00_AXI_1_RRESP),
        .s00_axi_rvalid(S00_AXI_1_RVALID),
        .s00_axi_wdata(S00_AXI_1_WDATA),
        .s00_axi_wready(S00_AXI_1_WREADY),
        .s00_axi_wstrb(S00_AXI_1_WSTRB),
        .s00_axi_wvalid(S00_AXI_1_WVALID),
        .start(start_1),
        .vec_a_addr(axi_lite_0_vec_a_addr),
        .vec_b_addr(axi_lite_0_vec_b_addr),
        .vector_len(Net));
  design_1_axi_master_m_0_0 axi_master_m_0
       (.m00_axi_aclk(clk_wiz_clk_out1),
        .m00_axi_araddr(axi_master_m_0_M00_AXI_ARADDR),
        .m00_axi_arburst(axi_master_m_0_M00_AXI_ARBURST),
        .m00_axi_arcache(axi_master_m_0_M00_AXI_ARCACHE),
        .m00_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m00_axi_arid(axi_master_m_0_M00_AXI_ARID),
        .m00_axi_arlen(axi_master_m_0_M00_AXI_ARLEN),
        .m00_axi_arlock(axi_master_m_0_M00_AXI_ARLOCK),
        .m00_axi_arprot(axi_master_m_0_M00_AXI_ARPROT),
        .m00_axi_arready(axi_master_m_0_M00_AXI_ARREADY),
        .m00_axi_arsize(axi_master_m_0_M00_AXI_ARSIZE),
        .m00_axi_arvalid(axi_master_m_0_M00_AXI_ARVALID),
        .m00_axi_awaddr(axi_master_m_0_M00_AXI_AWADDR),
        .m00_axi_awburst(axi_master_m_0_M00_AXI_AWBURST),
        .m00_axi_awcache(axi_master_m_0_M00_AXI_AWCACHE),
        .m00_axi_awid(axi_master_m_0_M00_AXI_AWID),
        .m00_axi_awlen(axi_master_m_0_M00_AXI_AWLEN),
        .m00_axi_awlock(axi_master_m_0_M00_AXI_AWLOCK),
        .m00_axi_awprot(axi_master_m_0_M00_AXI_AWPROT),
        .m00_axi_awready(axi_master_m_0_M00_AXI_AWREADY),
        .m00_axi_awsize(axi_master_m_0_M00_AXI_AWSIZE),
        .m00_axi_awvalid(axi_master_m_0_M00_AXI_AWVALID),
        .m00_axi_bid(axi_master_m_0_M00_AXI_BID),
        .m00_axi_bready(axi_master_m_0_M00_AXI_BREADY),
        .m00_axi_bresp(axi_master_m_0_M00_AXI_BRESP),
        .m00_axi_buser(1'b0),
        .m00_axi_bvalid(axi_master_m_0_M00_AXI_BVALID),
        .m00_axi_error(axi_master_m_0_m00_axi_error),
        .m00_axi_rdata(axi_master_m_0_M00_AXI_RDATA),
        .m00_axi_rid(axi_master_m_0_M00_AXI_RID),
        .m00_axi_rlast(axi_master_m_0_M00_AXI_RLAST),
        .m00_axi_rready(axi_master_m_0_M00_AXI_RREADY),
        .m00_axi_rresp(axi_master_m_0_M00_AXI_RRESP),
        .m00_axi_ruser(1'b0),
        .m00_axi_rvalid(axi_master_m_0_M00_AXI_RVALID),
        .m00_axi_wdata(axi_master_m_0_M00_AXI_WDATA),
        .m00_axi_wlast(axi_master_m_0_M00_AXI_WLAST),
        .m00_axi_wready(axi_master_m_0_M00_AXI_WREADY),
        .m00_axi_wstrb(axi_master_m_0_M00_AXI_WSTRB),
        .m00_axi_wvalid(axi_master_m_0_M00_AXI_WVALID),
        .reads_done(axi_master_m_0_reads_done),
        .start(start_1),
        .vector_base_addr(axi_lite_0_vec_a_addr),
        .vector_len(Net),
        .vector_out(axi_master_m_0_vector_out),
        .vector_valid(axi_master_m_0_vector_valid),
        .writes_done(axi_master_m_0_writes_done));
  design_1_axi_master_m_v1_2_0_0 axi_master_m_v1_2_0
       (.m00_axi_aclk(clk_wiz_clk_out1),
        .m00_axi_araddr(axi_master_m_v1_2_0_m00_axi_ARADDR),
        .m00_axi_arburst(axi_master_m_v1_2_0_m00_axi_ARBURST),
        .m00_axi_arcache(axi_master_m_v1_2_0_m00_axi_ARCACHE),
        .m00_axi_aresetn(rst_clk_wiz_100M_peripheral_aresetn),
        .m00_axi_arid(axi_master_m_v1_2_0_m00_axi_ARID),
        .m00_axi_arlen(axi_master_m_v1_2_0_m00_axi_ARLEN),
        .m00_axi_arlock(axi_master_m_v1_2_0_m00_axi_ARLOCK),
        .m00_axi_arprot(axi_master_m_v1_2_0_m00_axi_ARPROT),
        .m00_axi_arready(axi_master_m_v1_2_0_m00_axi_ARREADY),
        .m00_axi_arsize(axi_master_m_v1_2_0_m00_axi_ARSIZE),
        .m00_axi_arvalid(axi_master_m_v1_2_0_m00_axi_ARVALID),
        .m00_axi_awaddr(axi_master_m_v1_2_0_m00_axi_AWADDR),
        .m00_axi_awburst(axi_master_m_v1_2_0_m00_axi_AWBURST),
        .m00_axi_awcache(axi_master_m_v1_2_0_m00_axi_AWCACHE),
        .m00_axi_awid(axi_master_m_v1_2_0_m00_axi_AWID),
        .m00_axi_awlen(axi_master_m_v1_2_0_m00_axi_AWLEN),
        .m00_axi_awlock(axi_master_m_v1_2_0_m00_axi_AWLOCK),
        .m00_axi_awprot(axi_master_m_v1_2_0_m00_axi_AWPROT),
        .m00_axi_awready(axi_master_m_v1_2_0_m00_axi_AWREADY),
        .m00_axi_awsize(axi_master_m_v1_2_0_m00_axi_AWSIZE),
        .m00_axi_awvalid(axi_master_m_v1_2_0_m00_axi_AWVALID),
        .m00_axi_bid(axi_master_m_v1_2_0_m00_axi_BID),
        .m00_axi_bready(axi_master_m_v1_2_0_m00_axi_BREADY),
        .m00_axi_bresp(axi_master_m_v1_2_0_m00_axi_BRESP),
        .m00_axi_buser(1'b0),
        .m00_axi_bvalid(axi_master_m_v1_2_0_m00_axi_BVALID),
        .m00_axi_rdata(axi_master_m_v1_2_0_m00_axi_RDATA),
        .m00_axi_rid(axi_master_m_v1_2_0_m00_axi_RID),
        .m00_axi_rlast(axi_master_m_v1_2_0_m00_axi_RLAST),
        .m00_axi_rready(axi_master_m_v1_2_0_m00_axi_RREADY),
        .m00_axi_rresp(axi_master_m_v1_2_0_m00_axi_RRESP),
        .m00_axi_ruser(1'b0),
        .m00_axi_rvalid(axi_master_m_v1_2_0_m00_axi_RVALID),
        .m00_axi_wdata(axi_master_m_v1_2_0_m00_axi_WDATA),
        .m00_axi_wlast(axi_master_m_v1_2_0_m00_axi_WLAST),
        .m00_axi_wready(axi_master_m_v1_2_0_m00_axi_WREADY),
        .m00_axi_wstrb(axi_master_m_v1_2_0_m00_axi_WSTRB),
        .m00_axi_wvalid(axi_master_m_v1_2_0_m00_axi_WVALID),
        .start(start_1),
        .vector_base_addr(axi_lite_0_vec_b_addr),
        .vector_len(Net),
        .vector_out(axi_master_m_v1_2_0_vector_out));
  design_1_dot_prod_0_0 dot_prod_0
       (.busy(dot_prod_0_busy),
        .clk(clk_wiz_clk_out1),
        .done(dot_prod_0_done),
        .init_loading(start_1),
        .reads_done(axi_master_m_0_reads_done),
        .result(dot_prod_0_result),
        .rstn(rst_clk_wiz_100M_peripheral_aresetn),
        .vector_a_in(axi_master_m_0_vector_out),
        .vector_b_in(axi_master_m_v1_2_0_vector_out),
        .vector_len(Net),
        .vector_valid(axi_master_m_0_vector_valid),
        .writes_done(axi_master_m_0_writes_done));
endmodule
