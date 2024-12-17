#!/bin/sh

TOP=$1

python3 memory_decomp.py --blif ~/bp/submods/${TOP}.blif --clock clk_i --top ${TOP} &> results/${TOP}.out
