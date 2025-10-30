from decompile import test_mem

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h16_1r1w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h16_1r2w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h16_1r3w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h256_1r1w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h256_1r2w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w1h256_1r3w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h16_1r1w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h16_1r2w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h16_1r3w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r1w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r2w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r3w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w32h32_2r1w.json")

    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/nerv.json", "nerv")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/bsg_fifo_64_256.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/sparc_ffu.json", "sparc_ffu_nospu_wrap")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/bp_be_fp_regfile.json", "bp_be_fp_regfile")

