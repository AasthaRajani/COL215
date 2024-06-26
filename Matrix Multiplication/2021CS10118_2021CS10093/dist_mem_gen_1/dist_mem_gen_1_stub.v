// Copyright 1986-2016 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2016.4 (lin64) Build 1756540 Mon Jan 23 19:11:19 MST 2017
// Date        : Thu Nov 10 16:22:50 2022
// Host        : mahanadi running 64-bit Ubuntu 16.04.7 LTS
// Command     : write_verilog -force -mode synth_stub -rename_top dist_mem_gen_1 -prefix
//               dist_mem_gen_1_ dist_mem_gen_1_stub.v
// Design      : dist_mem_gen_1
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "dist_mem_gen_v8_0_11,Vivado 2016.4" *)
module dist_mem_gen_1(a, spo)
/* synthesis syn_black_box black_box_pad_pin="a[13:0],spo[7:0]" */;
  input [13:0]a;
  output [7:0]spo;
endmodule
