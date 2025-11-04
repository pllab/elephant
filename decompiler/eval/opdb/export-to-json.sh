#!/bin/bash

# Run a single benchmark by passing in verilog filename as argument.
# No arguments will run all benchmarks.

# Input format = <FILENAME>,<TOP-MODULE>\n
declare -a BENCHES=(
"l15.pickle,l15_wrap"
"l2.pickle,l2"
"pico.pickle,picorv32"
"sparc_core.pickle,sparc_core"
"sparc_ffu.pickle,sparc_ffu_nospu_wrap"
)

for BENCH in "${BENCHES[@]}" ; do
	name=$(echo "${BENCH}" | cut -d "," -f 1)
	top=$(echo "${BENCH}" | cut -d "," -f 2)
	
	# if (argument is null) or (argument is not null and equal to verilog/$name.v)
	if [ -z $1 ] || ([ ! -z $1 ] && [ $1 = "verilog/$name.v" ]) ; then
		yosys -p "read_verilog -sv verilog/$name.v ; synth -flatten -top $top ; proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; synth -noabc -flatten -top $top ; abc -g AND,OR,MUX ; proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
	fi
done
