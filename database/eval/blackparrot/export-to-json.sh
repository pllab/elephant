#!/bin/sh

NAME=$1
TOP=$2

yosys -p "read_blif $NAME ; synth -noabc -flatten -top $TOP ; dfflegalize -cell \$_DFFE_PP_ 01 ; abc -g AND,OR,MUX ; proc ; write_json json/$TOP.json; tee -a stats/$TOP.dat stat -width"

