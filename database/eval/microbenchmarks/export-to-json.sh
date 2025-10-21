#!/bin/bash

# Run a single benchmark by passing in verilog filename as argument.
# No arguments will run all benchmarks.

# Input format = <FILENAME>,<TOP-MODULE>\n
declare -a BENCHES=(
"bsg_cache_ways_p_2_data_width_p_32,top"
"bsg_fifo_64_256,top"
"bsg_fifo_512_512,top"
"nerv,nerv"
"bp_be_fp_regfile.pickle,bp_be_fp_regfile"
)

for BENCH in "${BENCHES[@]}" ; do
	name=$(echo "${BENCH}" | cut -d "," -f 1)
	top=$(echo "${BENCH}" | cut -d "," -f 2)
	
	# if (argument is null) or (argument is not null and equal to verilog/$name.v)
	if [ -z $1 ] || ([ ! -z $1 ] && [ $1 = "verilog/$name.v" ]) ; then
		yosys -p "read_verilog -sv verilog/$name.v ; synth -top $top -flatten -noabc ; dfflegalize -cell \$_DFFE_PP_ 01 ; write_json json/$name.json ; tee -a stats/$name.dat stat -width"
		# yosys -p "read_verilog -sv verilog/$name.v ; synth -top $top -noabc -flatten ; write_json json/$name.json ; tee -a stats/$name.dat stat -width"
		# yosys -p "read_verilog -sv verilog/$name.v ; hierarchy -check -top $top ; proc ; memory_dff ; memory_map ; simplemap ; $DFF flatten ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
	fi
done
