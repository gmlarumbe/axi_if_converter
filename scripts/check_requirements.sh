#!/bin/sh

# Check requirements
command -v ghdl > /dev/null 2>&1 || { echo >&2 "Error: GHDL not installed. Aborting."; exit 1; }
command -v gtkwave > /dev/null 2>&1 || { echo >&2 "Error: gtkwave not installed. Aborting."; exit 1; }

echo "GHDL and GtkWave are available!"
