#!/bin/bash

while read bench ; do
	NAME=$(echo "$bench" | cut -d, -f 1)
	TOP=$(echo "$bench" | cut -d, -f 2)
	CLK=$(echo "$bench" | cut -d, -f 3)
	echo "$NAME"
	python3 memory_decomp.py --blif eval/microbenchmarks/$NAME.blif --top $TOP --clock $CLK &> results/$NAME.out
done <eval/microbenchmarks/metadata.txt
