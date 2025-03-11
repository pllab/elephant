#!/bin/bash

MICROBENCHMARKS_ROOT=$PWD/microbenchmarks
COMMON_ROOT=$PWD/microbenchmarks/common

DESIGNS=" \
    bp_be_cmd_queue \
    bp_be_dcache \
    bp_be_fp_regfile \
    bp_be_int_regfile \
    bp_be_cmd_queue \
    bp_be_issue_queue \
    bp_be_top \
    bp_core_minimal \
    bp_fe_icache \
    bp_fe_pc_gen \
    bp_fe_top \
    bp_unicore \
    bp_me_cache_slice
"

#DO_PICKLE=0
DO_PICKLE=1
if [ -n "${DO_PICKLE}" ]; then
    echo "[BSG-INFO] Pickling..."
    for design in ${DESIGNS}; do
        echo "\t*${design}"
        cat ${COMMON_ROOT}/bsg_defines.sv \
            ${COMMON_ROOT}/bsg_mem*.sv \
            ${COMMON_ROOT}/${design}.sv2v.v \
            | sed "s#\`include#//\`include#g" \
            | sed "s#\`BSG_ABSTRACT_MODULE#//\`BSG_ABSTRACT_MODULE#g" \
            > ${MICROBENCHMARKS_ROOT}/${design}.pickle.v
    done
else
    echo "[BSG-WARNING] Skipping pickling..."
fi

#DO_JSON=
DO_JSON=1
if [ -n "${DO_JSON}" ]; then
    echo "[BSG-INFO] Getting JSON/BLIF..."
    for design in ${DESIGNS}; do
        echo "\t*${design}"
        yosys -g -p "read_verilog -sv ${MICROBENCHMARKS_ROOT}/${design}.pickle.v;
            synth -flatten -top ${design}; \
            dfflegalize -cell \$_DFFE_PP_ 01; \
            proc; \
            write_json ${MICROBENCHMARKS_ROOT}/${design}.json; \
            write_blif ${MICROBENCHMARKS_ROOT}/${design}.blif; \
            tee -a ${MICROBENCHMARKS_ROOT}/${design}.dat stat -width; \
        "
    done
else
    echo "[BSG-WARNING] Skipping json..."
fi

#DO_ZIP=
DO_ZIP=1
echo "Zipping up results for..."
for design in ${DESIGNS}; do
    echo "\t*${design}"
    gzip -f ${MICROBENCHMARKS_ROOT}/${design}.pickle.v
    gzip -f ${MICROBENCHMARKS_ROOT}/${design}.json
    gzip -f ${MICROBENCHMARKS_ROOT}/${design}.blif
    gzip -f ${MICROBENCHMARKS_ROOT}/${design}.dat
done

