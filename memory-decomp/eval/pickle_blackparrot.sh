#!/bin/bash

set -e

MICROBENCHMARKS_ROOT=$PWD/microbenchmarks
INPUTS_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/inputs
WORK_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/work
OUTPUTS_ROOT=$MICROBENCHMARKS_ROOT/blackparrot/outputs

DESIGNS=(
    e_bp_unicore_cfg
)
#    e_bp_unicore_megaparrot_cfg
#    e_bp_unicore_miniparrot_cfg
#    e_bp_unicore_tinyparrot_cfg

SUBDESIGNS=(
    bp_fe_icache
)
#    bp_be_dcache
#    bp_be_fp_regfile
#    bp_be_int_regfile


for design in "${DESIGNS[@]}"; do
for sub in "${SUBDESIGNS[@]}"; do
    testcase=${design}-${sub}

    echo "[BSG-INFO] Running testcase ${testcase}..."

    PICKLE_SV=${INPUTS_ROOT}/inputs/${design}.pickled.sv
    STRIPPED_SV=${WORK_ROOT}/${testcase}.stripped.sv
    JSON_FILE=${WORK_ROOT}/${testcase}.json
    BLIF_FILE=${WORK_ROOT}/${testcase}.blif
    DAT_FILE=${WORK_ROOT}/${testcase}.dat

    DO_STRIP=
    #DO_STRIP=1
    if [ -n "${DO_STRIP}" ]; then
        echo "[BSG-INFO] Stripping pickle"
        python strip_pickle.py ${sub} ${PICKLE_SV} ${STRIPPED_SV}
        sed -i "/\`BSG_ABSTRACT_MODULE/d" ${STRIPPED_SV}
        sed -i "s#\"inv\"#16#" ${STRIPPED_SV}
    fi

    DO_JSON=
    #DO_JSON=1
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
    
    #DO_ZIP=
    DO_ZIP=1
    if [ -n "${DO_ZIP}" ]; then
        echo "Zipping up results for..."
        echo "\t*${design}"
        gzip ${JSON_FILE}
        gzip ${BLIF_FILE}
        gzip ${DAT_FILE}
    else
        echo "[BSG-WARNING] Skipping zip..."
    fi
done
done

