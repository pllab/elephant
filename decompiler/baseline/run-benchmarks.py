from decompile import test_mem

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"

    benches = \
        [["microbenchmarks/json-abc-share/bsg_cache_ways_p_2_data_width_p_32","top","--quasi"],
         ["microbenchmarks/json-abc-share/bsg_fifo_64_256","top",""],
         ["microbenchmarks/json-abc-share/bsg_fifo_512_512","top",""],
         ["microbenchmarks/json-abc-share/nerv","nerv",""],
         ["microbenchmarks/json-abc-share/bp_be_fp_regfile.pickle","bp_be_fp_regfile",""],
         ["opdb/json-abc-share/pico.pickle","picorv32",""],
         ["opdb/json-abc-share/sparc_ffu.pickle","sparc_ffu_nospu_wrap",""],
         ["opdb/json-abc-noshare/l15.pickle","l15_wrap","--inverted-mux"],
         ["opdb/json-abc-noshare/sparc_core.pickle","sparc_core","--inverted-mux"],
         ["opdb/json-abc-noshare/l2.pickle","l2",""],
        ]
    for bench in benches:
        name = "database/eval/" + bench[0] + ".json"
        top  = bench[1]
        options = bench[2]
        test_mem(SCHEMA_PATH, DB_PATH, name, top)

