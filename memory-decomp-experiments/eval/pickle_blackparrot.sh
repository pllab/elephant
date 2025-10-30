#!/bin/bash

set -e

export PARALLEL_JOBS=8
#export DO_STRIP=
export DO_STRIP=1
#export DO_JSON=
export DO_JSON=1
#export DO_ZIP=
export DO_ZIP=1

run_testcase() {
    MICROBENCHMARKS_ROOT=$PWD/microbenchmarks
    INPUTS_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/inputs
    WORK_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/work
    OUTPUTS_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/outputs

    design="$1"
    sub="$2"
    testcase="${design}-${sub}"

    echo "[BSG-INFO] Running testcase ${testcase}..."

    PICKLE_SV=${INPUTS_ROOT}/${design}.pickled.sv
    STRIPPED_SV=${WORK_ROOT}/${testcase}.stripped.sv
    JSON_FILE=${WORK_ROOT}/${testcase}.json
    BLIF_FILE=${WORK_ROOT}/${testcase}.blif
    DAT_FILE=${WORK_ROOT}/${testcase}.dat

    if [ -n "${DO_STRIP}" ]; then
        echo "[BSG-INFO] Stripping pickle"
        python strip_pickle.py ${sub} ${PICKLE_SV} ${STRIPPED_SV}
        sed -i "/\`BSG_ABSTRACT_MODULE/d" ${STRIPPED_SV}
        sed -i "s#\"inv\"#16#" ${STRIPPED_SV}
    fi

    if [ -n "${DO_JSON}" ]; then
        echo "[BSG-INFO] Getting JSON/BLIF..."
            yosys -g -p "read_verilog -sv ${STRIPPED_SV}; \
                synth -flatten -top ${sub}; \
                tee -a ${WORK_ROOT}/${testcase}.check hierarchy -check -top ${sub}; \
                dfflegalize -cell \$_DFFE_PP_ 01; \
                proc; \
                write_json ${JSON_FILE}; \
                write_blif ${BLIF_FILE}; \
                tee -a ${DAT_FILE} stat -width; \
            "
    else
        echo "[BSG-WARNING] Skipping json..."
    fi
    
    if [ -n "${DO_ZIP}" ]; then
        echo "Zipping up results for..."
        echo "\t*${design}"
        gzip -f ${JSON_FILE} ${BLIF_FILE} ${DAT_FILE}
        mv ${WORK_ROOT}/*.gz ${OUTPUTS_ROOT}/
    else
        echo "[BSG-WARNING] Skipping zip..."
    fi
}
export -f run_testcase

DESIGNS=(
    e_bp_unicore_tinyparrot_cfg
    e_bp_unicore_cfg
    e_bp_unicore_megaparrot_cfg
    e_bp_unicore_miniparrot_cfg
    e_bp_unicore_tinyparrot_cfg
)

SUBDESIGNS=(
    bp_fe_icache
    bp_fe_pc_gen
    bp_be_dcache
    bp_be_scheduler
    bp_fe_top
    bp_be_top
    bp_core_minimal
    bp_me_cache_slice
    bp_unicore
)

parallel --progress --joblog job.log --results results --jobs ${PARALLEL_JOBS} run_testcase ::: "${DESIGNS[@]}" ::: "${SUBDESIGNS[@]}"

