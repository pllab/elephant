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

for design in ${DESIGNS}; do
    cat ${COMMON_ROOT}/bsg_defines.sv \
        ${COMMON_ROOT}/*synth*.sv \
        ${COMMON_ROOT}/${design}.sv2v.v \
        | sed "s#\`include#//\`include#g" \
        | sed "s#\`BSG_ABSTRACT_MODULE#//\`BSG_ABSTRACT_MODULE#g" \
            > ${MICROBENCHMARKS_ROOT}/${design}.pickle.v
done

