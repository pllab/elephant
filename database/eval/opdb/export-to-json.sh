#!/bin/bash

# Run a single benchmark by passing in verilog filename as argument.
# No arguments will run all benchmarks.

# Input format = <FILENAME>,<TOP-MODULE>\n
declare -a BENCHES=(
#"chip_bridge.pickle,chip_bridge"
#"dynamic_node_2dmesh.pickle,dynamic_node_top_wrap"
#"fpga_bridge_rcv_32.pickle,fpga_bridge_rcv_32"
#"fpu.pickle,fpu"
#"ifu_esl.pickle,sparc_ifu_esl"
"l15.pickle,l15_wrap"
"l2.pickle,l2"
"pico.pickle,picorv32"
"sparc_core.pickle,sparc_core"
#"sparc_exu.pickle,sparc_exu_wrap"
"sparc_ffu.pickle,sparc_ffu_nospu_wrap"
#"sparc_ifu.pickle,sparc_ifu"
#"sparc_lsu.pickle,lsu"
#"sparc_mul.pickle,sparc_mul_top_nospu_wrap"
#"sparc_tlu.pickle,tlu_nospu_wrap"
#"gng.pickle,gng"
)

for BENCH in "${BENCHES[@]}" ; do
	name=$(echo "${BENCH}" | cut -d "," -f 1)
	top=$(echo "${BENCH}" | cut -d "," -f 2)
	
	# if (argument is null) or (argument is not null and equal to verilog/$name.v)
	if [ -z $1 ] || ([ ! -z $1 ] && [ $1 = "verilog/$name.v" ]) ; then
		yosys -p "read_verilog -sv verilog/$name.v ; synth -top $top -flatten -noabc ; write_json json/$name.json ; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; synth -flatten -top $top ; proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
		#yosys -p "read_verilog -sv verilog/$name.v ; synth -noabc -flatten -top $top ; abc -g AND,OR,MUX ; proc ; write_json json/$name.json; tee -a stats/$name.dat stat -width"
	fi
done
