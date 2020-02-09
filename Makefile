# Makefile

GHDL=ghdl
GHDLFLAGS=-fno-color-diagnostics --std=08 --work=xil_defaultlib --workdir=$(WORKDIR)
UNISIMFLAGS=-frelaxed-rules --ieee=synopsys -P$(UNISIMDIR)
GHDLRUNFLAGS=

WORKDIR=library/xil_defaultlib
UNISIMDIR=library
VIVADO_BIN=/opt/Xilinx/Vivado/2018.3/bin/vivado
VIVADO_LIB=vivado/data/vhdl/src/
GHDL_DIR=/usr/local/lib/ghdl
WAVES_DIR=waves
WAVES=--vcd=$(WAVES_DIR)
SCRIPTSDIR=scripts



##############################
# All the targets
##############################
all : all_elabs all_sims vivado_syn

all_sims : core_conv_sim axi_lite_master_sim axi_lite_regs_sim core_fsm_sim input_buffer_sim pattern_counter_sim top_sim

all_elabs: core_conv_elab axi_lite_master_elab axi_lite_regs_elab core_fsm_elab input_buffer_elab pattern_counter_elab misc_elab top_elab


##############################
# Top
##############################
top_sim : global_sim top_elab
	$(GHDL) -a $(GHDLFLAGS) src/core_conv/tb/s_axi_model.vhd
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/top/tb/tb_axi_if_converter.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_if_converter $(WAVES)/tb_top.vcd

top_elab : core_conv_src axi_lite_master_src axi_lite_regs_src core_fsm_src input_buffer_src pattern_counter_src misc_src
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/top/rtl/axi_if_converter.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e axi_if_converter


##############################
# AXI Interface Converter
##############################
core_conv_sim:  global_sim core_conv_elab
	$(GHDL) -a $(GHDLFLAGS) src/core_conv/tb/s_axi_model.vhd
	$(GHDL) -a $(GHDLFLAGS) src/core_conv/tb/tb_core_converter.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_core_converter $(WAVES)/tb_axi_if_conf.vcd

core_conv_elab: core_conv_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e core_converter

core_conv_src: global_pkg
	$(GHDL) -a $(GHDLFLAGS) src/core_conv/rtl/core_converter.vhd


##############################
# AXI Lite Master
##############################
axi_lite_master_sim: global_sim axi_lite_master_elab
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/tb_axi_lite_master.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_lite_master $(WAVES)/tb_axi_lite_master.vcd

axi_lite_master_elab: axi_lite_master_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e axi_lite_master

axi_lite_master_src:
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/rtl/axi_lite_master.vhd


##############################
# AXI Lite regs
##############################
axi_lite_regs_sim: global_sim axi_lite_regs_src
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/tb_axi_lite_regs.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_lite_regs $(WAVES)/tb_axi_lite_regs.vcd

axi_lite_regs_elab: axi_lite_regs_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e axi_lite_regs

axi_lite_regs_src:
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/rtl/axi_lite_regs.vhd



##############################
# Core FSM
##############################
core_fsm_sim: global_sim core_fsm_elab
	$(GHDL) -a $(GHDLFLAGS) src/core_fsm/tb/tb_core_fsm.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_core_fsm $(WAVES)/tb_core_fsm.vcd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_core_fsm --wave=waves/tb_core_fsm.ghw

core_fsm_elab: core_fsm_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e core_fsm

core_fsm_src: global_pkg
	$(GHDL) -a $(GHDLFLAGS) src/core_fsm/rtl/core_fsm.vhd



##############################
# Input buffer
##############################
input_buffer_sim: global_sim input_buffer_elab
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/tb/tb_input_buffer.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_input_buffer $(WAVES)/tb_input_buffer.vcd

input_buffer_elab: input_buffer_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e input_buffer

input_buffer_src: global_pkg
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/input_buffer/tb/blk_mem_gen_0_netlist.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer.vhd


##############################
# Pattern counter
##############################
pattern_counter_sim: global_sim pattern_counter_elab
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/tb/tb_pattern_counter.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_pattern_counter $(WAVES)/tb_pattern_counter.vcd

pattern_counter_elab: pattern_counter_src
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e pattern_counter

pattern_counter_src:
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/rtl/pattern_counter.vhd



##############################
# Misc
##############################
misc_elab: misc_src
	$(GHDL) -e $(GHDLFLAGS) $(UNISIMFLAGS) clk_div

misc_src:
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/misc/clk_div.vhd
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/misc/clk_sync.vhd


###########################
# Global packages
###########################
global_sim : global_pkg
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/axil_slave_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/axil_master_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/core_conv/tb/axif_master_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd

global_pkg:
	$(GHDL) -a $(GHDLFLAGS) src/top/rtl/global_pkg.vhd



###########################
## Setup
##########################
setup: check_req unisim
	mkdir -p $(WORKDIR)
	mkdir -p $(WAVES_DIR)

clean:
	rm -rf $(WORKDIR)
	rm -rf $(WAVES_DIR)
	rm -rf .Xil

check_req:
	$(SCRIPTSDIR)/check_requirements.sh


###########################
## Unisim lib
##########################
unisim :
	$(SCRIPTSDIR)/unisim_compile.sh

unisim_clean :
	echo "Removing UNISIM folder..."
	rm -rf $(UNISIMDIR)/unisim

unisim_recompile : unisim_clean unisim
	echo "Recompiling UNISIM library @ $UNISIMDIR..."


###########################
## Vivado
##########################
vivado_syn : vivado_check vivado_proj
	$(VIVADO_BIN) vivado/axi_if_converter/axi_if_converter.xpr -mode tcl -source vivado/synthesize.tcl

vivado_proj : vivado_check
	cd vivado && test -d axi_if_converter || $(VIVADO_BIN) -mode tcl -source axi_if_converter.tcl

vivado_clean :
	rm -rf vivado/axi_if_converter

vivado_check:
	$(SCRIPTSDIR)/check_vivado.sh
