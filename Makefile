# Makefile

GHDL=ghdl
GHDLFLAGS=--std=08 --work=xil_defaultlib
GHDLRUNFLAGS=


##############################
# Top
##############################
top : axi_if_conv_elab axi_lite_master_elab axi_lite_regs_elab core_fsm_elab input_buffer_elab pattern_counter_elab



##############################
# AXI Interface Converter
##############################
axi_if_conv: axi_if_conv_sim  

axi_if_conv_sim: axi_if_conv_init
	$(GHDL) -c $(GHDLFLAGS) -r tb_axi_interface_converter --vcd=waves.vcd


axi_if_conv_elab: axi_if_conv_init
	$(GHDL) -c $(GHDLFLAGS) -e tb_axi_interface_converter

axi_if_conv_init: force
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/rtl/axi_interface_converter_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/rtl/axi_interface_converter.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/tb/s_axi_model.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_if_conv/tb/tb_axi_interface_converter.vhd



##############################
# AXI Lite Master
##############################
axi_lite_master: axi_lite_master_sim  

axi_lite_master_sim: axi_lite_master_init
	$(GHDL) -c $(GHDLFLAGS) -r tb_axi_lite_master --vcd=waves.vcd


axi_lite_master_elab: axi_lite_master_init
	$(GHDL) -c $(GHDLFLAGS) -e tb_axi_lite_master

axi_lite_master_init: force
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/rtl/axi_lite_master.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/axil_master_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_master/tb/tb_axi_lite_master.vhd



##############################
# AXI Lite regs
##############################
axi_lite_regs: axi_lite_regs_sim  

axi_lite_regs_sim: axi_lite_regs_init
	$(GHDL) -c $(GHDLFLAGS) -r tb_axi_lite_regs --vcd=waves.vcd


axi_lite_regs_elab: axi_lite_regs_init
	$(GHDL) -c $(GHDLFLAGS) -e tb_axi_lite_regs

axi_lite_regs_init: force
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/rtl/axi_lite_regs.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/axil_slave_bfm.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	$(GHDL) -a $(GHDLFLAGS) src/axi_lite_regs/tb/tb_axi_lite_regs.vhd



##############################
# Core FSM
##############################
core_fsm: core_fsm_sim  

core_fsm_sim: core_fsm_init
	# $(GHDL) -c $(GHDLFLAGS) -r tb_core_fsm --vcd=waves.vcd


core_fsm_elab: core_fsm_init
	# $(GHDL) -c $(GHDLFLAGS) -e tb_core_fsm

core_fsm_init: force
	# $(GHDL) -a $(GHDLFLAGS) src/core_fsm/rtl/core_fsm_pkg.vhd
	# $(GHDL) -a $(GHDLFLAGS) src/core_fsm/rtl/core_fsm.vhd
	# $(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	# $(GHDL) -a $(GHDLFLAGS) src/core_fsm/tb/tb_core_fsm.vhd



##############################
# Input buffer
##############################
input_buffer: input_buffer_elab

# input_buffer_sim: input_buffer_init
# 	$(GHDL) -c $(GHDLFLAGS) -r tb_input_buffer --vcd=waves.vcd


input_buffer_elab: input_buffer_init
	$(GHDL) -c $(GHDLFLAGS) -e tb_input_buffer

input_buffer_init: force
	# $(GHDL) -a $(GHDLFLAGS) src/input_buffer/tb/blk_mem_gen_0.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/rtl/global_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/rtl/input_buffer.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	$(GHDL) -a $(GHDLFLAGS) src/input_buffer/tb/tb_input_buffer.vhd





##############################
# Pattern counter
##############################
pattern_counter: pattern_counter_sim  

pattern_counter_sim: pattern_counter_init
	$(GHDL) -c $(GHDLFLAGS) -r tb_pattern_counter --vcd=waves.vcd


pattern_counter_elab: pattern_counter_init
	$(GHDL) -c $(GHDLFLAGS) -e tb_pattern_counter

pattern_counter_init: force
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/rtl/pattern_counter.vhd
	$(GHDL) -a $(GHDLFLAGS) src/top/tb/global_sim.vhd
	$(GHDL) -a $(GHDLFLAGS) src/pattern_counter/tb/tb_pattern_counter.vhd





#############
##  OTHERS ##
#############

force:
