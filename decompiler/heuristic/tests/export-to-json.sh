#!/bin/bash

NAME=$1
TOP=$2

YS=$(cat <<EOF
read_verilog -sv ${NAME}
hierarchy -check -top ${TOP}
proc
memory
techmap
dfflegalize -cell \$_DFFE_PP_ 01
write_json json/${TOP}.json
stat -width
EOF
)

yosys <<< $YS
