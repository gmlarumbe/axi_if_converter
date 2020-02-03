# README #

## Overview ##

AXI Interface Converter with 2 independent channels (left/right).

Can convert from AXI-Stream to AXI-MM and viceversa.

Implements an AXI-Lite register interface for control and status monitoring.
It also includes an AXI-Lite master interface managed by mentioned registers.

There are also some pattern counters to check validity of input data.



## Requirements ##

### GHDL ###

Some submodules implement Xilinx IP/primitives and therefore UNISIMS library needs to be compiled.
Libraries source and a script are provided and it is only necessary to build corresponding target to compile them:

	$ make unisim

To create the necessary folders for waves and worklib:

	$ make setup
	
And finally execute desired target:

	$ make top_elab
	$ ...
	$ make axi_if_conv_sim
	$ ...

Waves will be created at the *waves* folder.


## Notes ##

Code is written in VHDL-2008 IEEE standard.

The IP has been tested with GHDL and Vivado 2018.3.

For build with GHDL there is a Makefile to build/simulate top hierarchy as well as each submodule independently.

For build with Vivado a TCL is provided to regenerate the project.



### Known Issues ###

#### VHDL FIFO Behavioral model ####

Since behavioral model of this IP is only provided in Verilog, GHDL requires
a netlist to be compiled and exported in VHDL.

In Vivado, set blk_mem_gen as the top module, synthesize, open synthesized design and use
the *write_vhdl* tcl command:

	$ write_vhdl ./blk_mem_gen_0_netlist.vhd
	
This netlist will also require the UNISIM library to be compiled to simulate properly.

Resources for unisims compilation explanation:
 * https://github.com/ghdl/ghdl/issues/716


#### GHDL switches ####

There are two issues with the UNISIM library that require the switches
*-frelaxed-whatever* and *--ieee=synopsys* to be enabled for elaboration/simulation.

  * --ieee==synopsys: necessary to use non ieee standard libraries present in unisim components.
  * -frelaxed-rules: necessary to avoid strict checks of the VHDL-2008 LRM.
  
Resources for required makefile switches explanation:
  * https://github.com/ghdl/ghdl/issues/594
  * https://github.com/ghdl/ghdl/issues/559
