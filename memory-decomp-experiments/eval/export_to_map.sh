#!/bin/sh

NAME=$1
TOP=$2
MODE=tcl

ELABED=${NAME%.*}.elabed.v
MAPPED=${NAME%.*}.mapped.v
STATS=${NAME%.*}.util

vivado -mode ${MODE} -log /tmp/vivado.log -journal /tmp/vivado.jou -source vivado_synth.tcl -tclargs ${NAME} ${TOP} ${ELABED} ${MAPPED} ${STATS}

