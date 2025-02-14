//Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
//Date        : Fri Feb 14 17:13:21 2025
//Host        : hp running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk,
    done,
    error,
    result,
    rstn,
    start,
    vector_len);
  input clk;
  output done;
  output error;
  output [31:0]result;
  input rstn;
  input start;
  input [31:0]vector_len;

  wire clk;
  wire done;
  wire error;
  wire [31:0]result;
  wire rstn;
  wire start;
  wire [31:0]vector_len;

  design_1 design_1_i
       (.clk(clk),
        .done(done),
        .error(error),
        .result(result),
        .rstn(rstn),
        .start(start),
        .vector_len(vector_len));
endmodule
