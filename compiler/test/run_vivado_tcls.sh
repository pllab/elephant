#!/usr/bin/bash

for verilog in $@; do
	vivado -mode tcl -source $verilog
done

