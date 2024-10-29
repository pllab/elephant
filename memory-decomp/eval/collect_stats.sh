#!/bin/sh

for verilog in $@; do
	echo "$verilog"

	NAME=$(echo "$verilog" | cut -d . -f 1)
	STATS=$NAME.dat
	yosys -p "read_verilog $verilog ; hierarchy -auto-top ; proc; opt; clean -purge; write_rtlil $STATS ; tee -a $STATS stat -width"
done
