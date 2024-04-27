// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Sat Nov 12 15:54:15 2022
// Host        : jhelum running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/btech/cs1210093/project_5/project_5.srcs/sources_1/ip/dist_mem_gen_2/dist_mem_gen_2_stub.v
// Design      : dist_mem_gen_2
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2016.4" *)
module dist_mem_gen_2(a, d, clk, we, spo)
/* synthesis syn_black_box black_box_pad_pin="a[13:0],d[15:0],clk,we,spo[15:0]" */;
  input [13:0]a;
  input [15:0]d;
  input clk;
  input we;
  output [15:0]spo;
endmodule
