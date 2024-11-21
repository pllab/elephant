#!/bin/sh

NAME=$1
TOP=$2

STATS=${NAME%.*}.dat
BLIF=${NAME%.*}.blif

yosys -p "read_verilog $NAME ; hierarchy -check -top $TOP ; proc; opt; memory; opt; fsm; opt; techmap; opt; dffunmap ; flatten; opt; splitnets -ports; opt; clean -purge; write_blif $NAME.blif; write_rtlil $STATS ; tee -a $STATS stat -width"

# while read bench; do
# 	NAME=$(echo "$bench" | cut -d , -f 1)
# 	TOP=$(echo "$bench" | cut -d , -f 2)
# 	yosys -p "read_verilog $NAME.v ; hierarchy -check -top $TOP ; proc; opt; memory; opt; fsm; opt; techmap; opt; flatten; opt; splitnets -ports; opt; clean -purge; write_blif $NAME.blif"
# done <metadata.txt
