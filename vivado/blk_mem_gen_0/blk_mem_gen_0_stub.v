// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (lin64) Build 2405991 Thu Dec  6 23:36:41 MST 2018
// Date        : Sun Feb 16 16:21:33 2020
// Host        : debianvm running 64-bit Debian GNU/Linux 9.2 (stretch)
// Command     : write_verilog -force -mode synth_stub
//               /home/martigon/Repos/legacy/axi_if_converter/vivado/blk_mem_gen_0/blk_mem_gen_0_stub.v
// Design      : blk_mem_gen_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z010clg225-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module blk_mem_gen_0(clka, ena, wea, addra, dina, clkb, rstb, enb, addrb, doutb)
/* synthesis syn_black_box black_box_pad_pin="clka,ena,wea[0:0],addra[10:0],dina[63:0],clkb,rstb,enb,addrb[10:0],doutb[63:0]" */;
  input clka;
  input ena;
  input [0:0]wea;
  input [10:0]addra;
  input [63:0]dina;
  input clkb;
  input rstb;
  input enb;
  input [10:0]addrb;
  output [63:0]doutb;
endmodule
