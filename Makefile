# Makefile

GHDL=ghdl
GHDLFLAGS=-fno-color-diagnostics --std=08 --work=xil_defaultlib --workdir=$(WORKDIR)
UNISIMFLAGS=-frelaxed-rules --ieee=synopsys -P$(UNISIMDIR)
GHDLRUNFLAGS=

WORKDIR=library/xil_defaultlib
UNISIMDIR=library
VIVADO_LIB=vivado/data/vhdl/src/
GHDL_DIR=/usr/local/lib/ghdl
WAVES_DIR=waves
SCRIPTSDIR=scripts



##############################
# Top
##############################
top_full : axi_if_conv_elab axi_lite_master_elab axi_lite_regs_elab core_fsm_elab input_buffer_elab pattern_counter_elab misc_elab 
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/top/rtl/top.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e top


top_elab : axi_if_conv_init axi_lite_master_init axi_lite_regs_init core_fsm_init input_buffer_init pattern_counter_init misc_init 
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/top/rtl/top.vhd
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e top


##############################
# AXI Interface Converter
##############################
axi_if_conv: axi_if_conv_sim  

axi_if_conv_sim: axi_if_conv_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_interface_converter --vcd=$(WAVES_DIR)/tb_axi_if_conf.vcd


axi_if_conv_elab: axi_if_conv_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_axi_interface_converter

axi_if_conv_init: global_pkg global_sim
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/rtl/axi_interface_converter.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/tb/s_axi_model.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/tb/tb_axi_interface_converter.vhd



##############################
# AXI Lite Master
##############################
axi_lite_master: axi_lite_master_sim  

axi_lite_master_sim: axi_lite_master_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_lite_master --vcd=$(WAVES_DIR)/tb_axi_lite_master.vcd


axi_lite_master_elab: axi_lite_master_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_axi_lite_master

axi_lite_master_init: global_sim
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/rtl/axi_lite_master.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/axil_master_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/tb_axi_lite_master.vhd



##############################
# AXI Lite regs
##############################
axi_lite_regs: axi_lite_regs_sim  

axi_lite_regs_sim: axi_lite_regs_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_axi_lite_regs --vcd=$(WAVES_DIR)/tb_axi_lite_regs.vcd

axi_lite_regs_elab: axi_lite_regs_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_axi_lite_regs

axi_lite_regs_init: global_sim
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/rtl/axi_lite_regs.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/axil_slave_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/tb_axi_lite_regs.vhd



##############################
# Core FSM
##############################
core_fsm: core_fsm_sim  

core_fsm_sim: core_fsm_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_core_fsm --vcd=$(WAVES_DIR)/tb_core_fsm.vcd

core_fsm_elab: core_fsm_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_core_fsm

core_fsm_init: global_pkg global_sim
	$(GHDL) -a $(GHDLFLAGS) src/core_fsm/rtl/core_fsm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/core_fsm/tb/tb_core_fsm.vhd



##############################
# Input buffer
##############################
input_buffer: input_buffer_sim

input_buffer_sim: input_buffer_elab
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_input_buffer --vcd=$(WAVES_DIR)/tb_input_buffer.vcd

input_buffer_elab: input_buffer_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_input_buffer

input_buffer_init: global_pkg global_sim
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/input_buffer/tb/blk_mem_gen_0_netlist.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/tb/tb_input_buffer.vhd


##############################
# Pattern counter
##############################
pattern_counter: pattern_counter_sim  

pattern_counter_sim: pattern_counter_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -r tb_pattern_counter --vcd=$(WAVES_DIR)/tb_pattern_counter.vcd


pattern_counter_elab: pattern_counter_init
	$(GHDL) -c $(GHDLFLAGS) $(UNISIMFLAGS) -e tb_pattern_counter

pattern_counter_init: global_sim
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/rtl/pattern_counter.vhd
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/tb/tb_pattern_counter.vhd



##############################
# Misc
##############################
misc: misc_elab 

misc_run : misc_elab
	$(GHDL) -r $(GHDLFLAGS) $(UNISIMFLAGS) clk_div

misc_elab: misc_init
	$(GHDL) -e $(GHDLFLAGS) $(UNISIMFLAGS) clk_div

misc_init: force 
	$(GHDL) -a $(GHDLFLAGS) $(UNISIMFLAGS) src/misc/clk_div.vhd


###########################
# Global packages
###########################
global_pkg: 
	$(GHDL) -a $(GHDLFLAGS) src/top/rtl/global_pkg.vhd

global_sim:
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd


###########################
## Setup
##########################
setup: unisim
	mkdir -p $(WORKDIR)
	mkdir -p $(WAVES_DIR)

clean: force
	rm -rf $(WORKDIR)
	rm -rf $(WAVES_DIR)
	rm -rf .Xil


###########################
## Unisim lib
##########################
unisim : force
	$(SCRIPTSDIR)/unisim_compile.sh

unisim_clean : force
	echo "Removing UNISIM folder..."
	rm -rf $(UNISIMDIR)/unisim

unisim_recompile : unisim_clean unisim
	echo "Recompiling UNISIM library @ $UNISIMDIR..."


#############
##  OTHERS ##
#############

force:
