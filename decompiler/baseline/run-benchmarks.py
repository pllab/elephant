from decompile import test_mem

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"

    benches = \
        [["microbenchmarks/json/bsg_cache_ways_p_2_data_width_p_32","top","--quasi"],
         ["microbenchmarks/json/bsg_fifo_64_256","top",""],
         ["microbenchmarks/json/bsg_fifo_512_512","top",""],
         ["microbenchmarks/json/nerv","nerv",""],
         ["microbenchmarks/json/bp_be_fp_regfile.pickle","bp_be_fp_regfile",""],
         ["opdb/json/pico.pickle","picorv32",""],
         ["opdb/json/sparc_ffu.pickle","sparc_ffu_nospu_wrap",""],
         ["opdb/json/l15.pickle","l15_wrap","--inverted-mux"],
         ["opdb/json/sparc_core.pickle","sparc_core","--inverted-mux"],
         ["opdb/json/l2.pickle","l2",""],
         ["opdb/json/fft.pickle","fftmain",""],
        ]
    for bench in benches:
        name = "database/eval/" + bench[0] + ".json"
        top  = bench[1]
        options = bench[2]
        test_mem(SCHEMA_PATH, DB_PATH, name, top)

