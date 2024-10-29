#!/bin/sh

for verilog in $@; do
	echo "$verilog"

	NAME=$(echo "$verilog" | cut -d . -f 1)
	yosys -p "read_verilog $verilog ; proc; opt; memory; opt; fsm; opt; techmap; opt; flatten; opt; splitnets -ports; opt; clean -purge; write_blif $NAME.blif"
done
