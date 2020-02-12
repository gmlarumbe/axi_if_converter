# README #

## Overview ##

The IP implements an AXI Interface Converter with 2 independent processing channels, left and right. It is written in VHDL-2008.

 * It can convert from AXI-Stream to AXI-MM and viceversa.
 * Implements an AXI-Lite register interface for control and status monitoring.
 * Includes an AXI-Lite master read/write interface.
 * Instantiates pattern counters that check validity of input stream data.


## Requirements ##

The project makes use of Makefiles to build targets for setup, elaboration, simulation and synthesis.

### GHDL ###

GHDL simulations are provided as some versions of Vivado do not support some VHDL-08 constructs for simulation.

Some submodules implement Xilinx IP and primitives. The *unisim* Xilinx simulation library can be compiled executing the following target:

    $ make unisim

To create the folders for waves and work library:

    $ make setup


### Vivado ###

Synthesis has been tested with Xilinx Vivado 2018.3.

Some scripts expect its installation folder to be at */opt/Xilinx/* if project creation for synthesis targets are being run.


## Elaboration, simulation and synthesis ##

To elaborate/simulate all the submodules and hierarchy top module:

    $ make all_elabs
    $ make all_sims

To elaborate/simulate an standalone submodule:

    $ make axi_lite_regs_elab
    $ make axi_lite_regs_sim

Waves will be created at the *waves* folder.

To synthesize the IP first a Vivado project needs to be created. To recreate it a TCL is provided. To run its target:

    $ make vivado_proj

To synthesize the IP:

    $ make vivado_syn


### Known Issues ###

#### VHDL FIFO simulation model ####

Since behavioral model of this IP is only provided in Verilog by Xilinx,
GHDL requires that a VHDL netlist is compiled and exported.

In Vivado, set *blk_mem_gen* as the top module, synthesize, open synthesized design and use the *write_vhdl* tcl command:

    $ write_vhdl ./blk_mem_gen_0_netlist.vhd

This netlist requires the *unisim* simulation library to be compiled.


#### GHDL compilation switches ####

There are some issues with the *unisim* library that require some GHDL compilation switches to be enabled for elaboration and simulation:

  * --ieee==synopsys: use non ieee standard libraries present in unisim components.
  * -frelaxed-rules: avoid strict checks of the VHDL-2008 LRM.


#### Resources ####

Makefile switches discussions:

  * https://github.com/ghdl/ghdl/issues/594
  * https://github.com/ghdl/ghdl/issues/559

*unisim* compilation discussion:

 * https://github.com/ghdl/ghdl/issues/716
