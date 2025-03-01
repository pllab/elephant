#!/bin/sh

EXPORT=../../yosys_driver.py
SRC=verilog
JSON=json

# Input format = <FILENAME>;<TOP-MODULE>\n
BENCHES="bsg_cache_ways_p_2_data_width_p_32;top
bsg_fifo_64_256;top
bsg_fifo_512_512;top
nerv;nerv
netlist_h128_w16_1r1w;toplevel
netlist_h128_w16_1rw;toplevel
netlist_h128_w16_2rw;toplevel
pico.pickle;picorv32
sparc_ffu.pickle;sparc_ffu_nospu_wrap
sparc_tlu.pickle;tlu_nospu_wrap"

for BENCH in $BENCHES; do
	name=$(echo "${BENCH}" | cut -d ";" -f 1)
	top=$(echo "${BENCH}" | cut -d ";" -f 2)
	python3 $EXPORT --input $SRC/$name.v --output $JSON/$name.json --top $top --nodfflegalize
done
