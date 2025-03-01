#!/bin/sh

EXPORT=../../yosys_driver.py
SRC=verilog
JSON=json

# Input format = <FILENAME>;<TOP-MODULE>\n
BENCHES="bp;top"

for BENCH in $BENCHES; do
	name=$(echo "${BENCH}" | cut -d ";" -f 1)
	top=$(echo "${BENCH}" | cut -d ";" -f 2)
	python3 $EXPORT --input $SRC/$name.v --output $JSON/$name.json --top $top
done
