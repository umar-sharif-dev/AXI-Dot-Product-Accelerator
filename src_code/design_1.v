//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Fri Feb 14 17:13:20 2025
//Host        : hp running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=7,numReposBlks=7,numNonXlnxBlks=3,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=1,da_bram_cntlr_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk,
    done,
    error,
    result,
    rstn,
    start,
    vector_len);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK, ASSOCIATED_RESET rstn, CLK_DOMAIN design_1_clk, FREQ_HZ 100000000, PHASE 0.000" *) input clk;
  output done;
  output error;
  output [31:0]result;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RSTN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RSTN, POLARITY ACTIVE_LOW" *) input rstn;
  input start;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 DATA.VECTOR_LEN DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME DATA.VECTOR_LEN, LAYERED_METADATA undef" *) input [31:0]vector_len;

  wire [31:0]Net;
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
  wire dot_prod_0_done;
  wire [31:0]dot_prod_0_result;
  wire rst_clk_wiz_100M_peripheral_aresetn;
  wire start_1;

  assign Net = vector_len[31:0];
  assign clk_wiz_clk_out1 = clk;
  assign done = dot_prod_0_done;
  assign error = axi_master_m_0_m00_axi_error;
  assign result[31:0] = dot_prod_0_result;
  assign rst_clk_wiz_100M_peripheral_aresetn = rstn;
  assign start_1 = start;
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
        .vector_base_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .vector_base_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .vector_len(Net),
        .vector_out(axi_master_m_v1_2_0_vector_out));
  design_1_dot_prod_0_0 dot_prod_0
       (.clk(clk_wiz_clk_out1),
        .done(dot_prod_0_done),
        .reads_done(axi_master_m_0_reads_done),
        .result(dot_prod_0_result),
        .rstn(rst_clk_wiz_100M_peripheral_aresetn),
        .vector_a_in(axi_master_m_0_vector_out),
        .vector_b_in(axi_master_m_v1_2_0_vector_out),
        .vector_len(Net),
        .vector_valid(axi_master_m_0_vector_valid),
        .writes_done(axi_master_m_0_writes_done));
endmodule
