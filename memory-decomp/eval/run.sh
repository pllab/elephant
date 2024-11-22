#!/bin/sh

# Yosys 0.44 (git sha1 80ba43d26, g++ 11.2.1 -fPIC -O3)
# Vivado 2022.2#

BENCHMARKS=(
  "bsg_cache_ways_p_2_addr_width_p_28_data_width_p_32_block_size_in_words_p_4_sets_p_64_word_tracking_p_1.v top"
  "bsg_fifo_1r1w_narrowed_width_out_p_64_els_p_256_width_p_64_harden_p_1.v top"
  "bsg_fifo_1r1w_narrowed_width_out_p_128_els_p_512_width_p_512_harden_p_1.v top"
  "nerv.v nerv"
  "netlist_h128_w16_1r1w.v toplevel"
  "netlist_h128_w16_1rw.v toplevel"
  "netlist_h128_w16_2rw.v toplevel"
  "pico.pickle.v picorv32"
  "sparc_ffu.pickle.v sparc_ffu_nospu_wrap"
)

execute_blif() {
    BLIF_SCRIPT=./export_to_blif.sh
    BENCHMARK_ROOT=microbenchmarks

    netlist="$1"
    toplevel="$2"
    echo "Processing: $netlist : $toplevel"
    ${BLIF_SCRIPT} ${BENCHMARK_ROOT}/${netlist} ${toplevel}
}
export -f execute_blif

execute_map() {
    MAP_SCRIPT=./export_to_map.sh
    BENCHMARK_ROOT=microbenchmarks

    netlist="$1"
    toplevel="$2"
    echo "Processing: $netlist : $toplevel"
    ${MAP_SCRIPT} ${BENCHMARK_ROOT}/${netlist} ${toplevel}
}
export -f execute_map

JOBS=32

#parallel --results /tmp/eval-blif --progress --jobs ${JOBS} --colsep ' ' execute_blif ::: "${BENCHMARKS[@]}"
parallel --results /tmp/eval-map --progress --jobs ${JOBS} --colsep ' ' execute_map ::: "${BENCHMARKS[@]}"
