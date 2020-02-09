#!/bin/sh

# Check if Vivado 2018.3 is installed
command -v /opt/Xilinx/Vivado/2018.3/bin/vivado > /dev/null 2>&1 || { echo >&2 "Error: Vivado 2018.3 not installed. Aborting."; exit 1; }

echo "Vivado 2018.3 Installed"
