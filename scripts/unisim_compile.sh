#!/bin/bash

UNISIMDIR=library
GHDL_DIR=/usr/local/lib/ghdl
VIVADO_LIB=vivado/data/vhdl/src/

if [ -d $UNISIMDIR/unisim ]; then
    echo "UNISIM library already compiled..."
else
    $GHDL_DIR/vendors/compile-xilinx-vivado.sh --unisim --vhdl2008 --out $UNISIMDIR --src $VIVADO_LIB
fi
