// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module andromeda (
  c0_ddr4_act_n,
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
  sys_rstn,
  sd_clk,
  sd_cmd,
  sd_data,
  uart_rx,
  uart_tx
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ACT_N" *)
  (* X_INTERFACE_MODE = "master c0_ddr4" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c0_ddr4, CAN_DEBUG false, TIMEPERIOD_PS 750, MEMORY_TYPE Components, MEMORY_PART MT40A512M16LY-075, DATA_WIDTH 32, CS_ENABLED true, DATA_MASK_ENABLED DM_NO_DBI, SLOT Single, CUSTOM_PARTS no_file_loaded, MEM_ADDR_MAP ROW_COLUMN_BANK, BURST_LENGTH 8, AXI_ARBITRATION_SCHEME RD_PRI_REG, CAS_LATENCY 19, CAS_WRITE_LATENCY 14" *)
  output c0_ddr4_act_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ADR" *)
  output [16:0]c0_ddr4_adr;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 BA" *)
  output [1:0]c0_ddr4_ba;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 BG" *)
  output [0:0]c0_ddr4_bg;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CK_C" *)
  output [0:0]c0_ddr4_ck_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CK_T" *)
  output [0:0]c0_ddr4_ck_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CKE" *)
  output [0:0]c0_ddr4_cke;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 CS_N" *)
  output [0:0]c0_ddr4_cs_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DM_N" *)
  inout [3:0]c0_ddr4_dm_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQ" *)
  inout [31:0]c0_ddr4_dq;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQS_C" *)
  inout [3:0]c0_ddr4_dqs_c;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 DQS_T" *)
  inout [3:0]c0_ddr4_dqs_t;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 ODT" *)
  output [0:0]c0_ddr4_odt;
  (* X_INTERFACE_INFO = "xilinx.com:interface:ddr4:1.0 c0_ddr4 RESET_N" *)
  output c0_ddr4_reset_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 c0_sys CLK_N" *)
  (* X_INTERFACE_MODE = "slave c0_sys" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME c0_sys, CAN_DEBUG false, FREQ_HZ 200000000" *)
  input c0_sys_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 c0_sys CLK_P" *)
  input c0_sys_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.SYS_RSTN RST" *)
  (* X_INTERFACE_MODE = "slave RST.SYS_RSTN" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.SYS_RSTN, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
  input sys_rstn;
  (* X_INTERFACE_IGNORE = "true" *)
  output sd_clk;
  (* X_INTERFACE_IGNORE = "true" *)
  inout sd_cmd;
  (* X_INTERFACE_IGNORE = "true" *)
  input [3:0]sd_data;
  (* X_INTERFACE_IGNORE = "true" *)
  input uart_rx;
  (* X_INTERFACE_IGNORE = "true" *)
  output uart_tx;

  // stub module has no contents

endmodule
