#!/bin/bash

# Run a single benchmark by passing in verilog filename as argument.
# No arguments will run all benchmarks.

# Options
DFF="dfflegalize -cell \$_DFFE_PP_ 01 ;"

# Input format = <FILENAME>,<TOP-MODULE>,[OPTIONS]\n
declare -a BENCHES=(
"bsg_cache_ways_p_2_data_width_p_32,top,$DFF"
"bsg_fifo_64_256,top,$DFF"
"bsg_fifo_512_512,top,$DFF"
"nerv,nerv,$DFF"
"netlist_h128_w16_1r1w,toplevel,$DFF"
"netlist_h128_w16_1rw,toplevel,$DFF"
"netlist_h128_w16_2rw,toplevel,$DFF"
)

for BENCH in "${BENCHES[@]}" ; do
	name=$(echo "${BENCH}" | cut -d "," -f 1)
	top=$(echo "${BENCH}" | cut -d "," -f 2)
	opt=$(echo "${BENCH}" | cut -d "," -f 3)
	
	# if (argument is null) or (argument is not null and equal to verilog/$name.v)
	if [ -z $1 ] || ([ ! -z $1 ] && [ $1 = "verilog/$name.v" ]) ; then
		yosys -p "read_verilog -sv verilog/$name.v ; hierarchy -check -top $top ; proc ; memory_dff ; memory_map ; simplemap ; $DFF flatten ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; hierarchy -check -top $top ; proc ; memory ; techmap ; $DFF flatten ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; synth -flatten -top $top ; $opt proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; synth -noabc -flatten -top $top ; $opt abc -g AND,OR,MUX ; proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
	fi
done
