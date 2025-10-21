from emap import NetlistDB
import emap.rewrites as rewrites
import emap.extracts as extracts
import json
import time


def test_mem(schema_path: str, db_path: str, design_path: str, top_module: str = "top"):
    print(f"Testing design `{design_path}` with top module `{top_module}`...")
    db = NetlistDB(schema_file=schema_path, db_file=db_path, cnt=1000000)
    with open(design_path, "r") as f:
        design = json.load(f)
    phase_time = total_time = time.time()
    db.build_from_json(design["modules"][top_module])
    print(f"Database built in {time.time() - phase_time:.2f} seconds.")
    phase_time = time.time()
    # Saturation
    rewrites.rewrite_comm(db, ["$_AND_", "$_OR_"])  # scheduled once
    # XXX: Can try adding other gates, or scheduling this later.

    nncount = rewrites.rewrite_xnot_to_x_not(db, "$_AND_")
    print(f"Rewrite {nncount} ANDNOTs")

    #nncount = rewrites.rewrite_xnot_to_x_not(db, "$_OR_")
    #print(f"Rewrite {nncount} ORNOTs")

    #nncount = rewrites.rewrite_nand_nor(db, "$_AND_")
    #print(f"Rewrite {nncount} NANDs")
    #nncount = rewrites.rewrite_nand_nor(db, "$_OR_")
    #print(f"Rewrite {nncount} NORs")

    #newmux = rewrites.rewrite_2_1_mux(db)
    #print(f"Inserted {newmux} MUXs")
    print(f"Netlist saturated in {time.time() - phase_time:.2f} seconds.")
    phase_time = time.time()
    rewrites.rewrite_mux_to_muxtree(db, subsume=True) # scheduled once
    total_cnt = 0
    while cnt := rewrites.reduce_muxtree(db, subsume=True):  # repeat until no modifications
        total_cnt += cnt
    print(f"{total_cnt} muxtree(s) reduced in {time.time() - phase_time:.2f} seconds.")
    phase_time = time.time()
    rewrites.rewrite_and_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_not_to_decoder(db)  # scheduled once
    rewrites.reduce_decoder(db)
    print(f"Decoders reduced in {time.time() - phase_time:.2f} seconds.")
    # with open("out.json", "w") as f:
    #     json.dump(db.dump_tables(), f, indent=2)
    phase_time = time.time()
    mems = extracts.extract_mem(db)
    print(f"{len(mems)} memor{'y' if len(mems) == 1 else 'ies'} extracted in {time.time() - phase_time:.2f} seconds.")
    for i, (w, h, nr, nw) in enumerate(mems):
        print(f"\tMemory {i}: width={w}, height={h}, #read-ports={nr}, #write-ports={nw}")
    print(f"Total time: {time.time() - total_time:.2f} seconds.\n")

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r1w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r2w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r3w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r1w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r2w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r3w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r1w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r2w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r3w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r1w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r2w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r3w.json")
    #test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w32h32_2r1w.json")

    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/nerv.json", "nerv")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/bsg_fifo_64_256.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/bsg_fifo_512_512.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/bsg_cache_ways_p_2_data_width_p_32.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/sparc_ffu.json", "sparc_ffu_nospu_wrap")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/bp_be_fp_regfile.json", "bp_be_fp_regfile")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/noabc/l2.json", "l2")

    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/nerv.json", "nerv")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/bsg_fifo_64_256.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/bsg_fifo_512_512.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/bsg_cache_ways_p_2_data_width_p_32.json", "top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/sparc_ffu.json", "sparc_ffu_nospu_wrap")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/bp_be_fp_regfile.json", "bp_be_fp_regfile")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/abc/l2.json", "l2")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/bp/bp_be_top.noabc.nodfflegalize.json", "bp_be_top")
    #test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/bp/bp_be_top.noabc.dfflegalize.json", "bp_be_top")
    test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/e_bp_unicore_megaparrot_cfg-bp_unicore.json", "bp_unicore")

    benches = \
        [["microbenchmarks/json-abc-share/bsg_cache_ways_p_2_data_width_p_32","top","--quasi"],
         ["microbenchmarks/json-abc-share/bsg_fifo_64_256","top",""],
         ["microbenchmarks/json-abc-share/bsg_fifo_512_512","top",""],
         ["microbenchmarks/json-abc-share/nerv","nerv",""],
         ["microbenchmarks/json-abc-share/bp_be_fp_regfile.pickle","bp_be_fp_regfile",""],
         #["microbenchmarks/json-noabc-noshare/bsg_fifo_64_256","top",""],
         #["microbenchmarks/json-noabc-noshare/bsg_fifo_512_512","top",""],
         #["microbenchmarks/json-noabc-noshare/nerv","nerv",""],
         #["microbenchmarks/json-noabc-noshare/bp_be_fp_regfile.pickle","bp_be_fp_regfile",""],
         #["microbenchmarks/json-noabc-share/bsg_fifo_64_256","top",""],
         #["microbenchmarks/json-noabc-share/bsg_fifo_512_512","top",""],
         #["microbenchmarks/json-noabc-share/nerv","nerv",""],
         #["microbenchmarks/json-noabc-share/bp_be_fp_regfile.pickle","bp_be_fp_regfile",""],
         ["opdb/json-abc-share/pico.pickle","picorv32",""],
         ["opdb/json-abc-share/sparc_ffu.pickle","sparc_ffu_nospu_wrap",""],
         #["opdb/json-abc-noshare/l15.pickle","l15_wrap","--inverted-mux"],
         #["opdb/json-abc-noshare/sparc_core.pickle","sparc_core","--inverted-mux"],
         #["opdb/json-abc-noshare/l2.pickle","l2",""],
         #["opdb/json-noabc-share/pico.pickle","picorv32",""],
         #["opdb/json-noabc-share/sparc_ffu.pickle","sparc_ffu_nospu_wrap",""],
         #["opdb/json-noabc-share/l15.pickle","l15_wrap","--inverted-mux"],
         #["opdb/json-noabc-share/sparc_core.pickle","sparc_core","--inverted-mux"],
         #["opdb/json-noabc-share/l2.pickle","l2",""],
         #["blackparrot/json-noabc-share/bp_be_cmd_queue","bp_be_cmd_queue","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_be_issue_queue","bp_be_issue_queue","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_be_int_regfile","bp_be_int_regfile","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_be_fp_regfile","bp_be_fp_regfile","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_fe_pc_gen","bp_fe_pc_gen","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_be_dcache","bp_be_dcache","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_fe_icache","bp_fe_icache","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_fe_top","bp_fe_top","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_be_top","bp_be_top","--inverted-mux"],
         #["blackparrot/json-noabc-share/bp_core_minimal","bp_core_minimal","--inverted-mux"],
         #["blackparrot-alt/json/bp_core_minimal","bp_core_minimal","--inverted-mux"],
        ]
    #for bench in benches:
    #    name = "database/eval/" + bench[0] + ".json"
    #    top  = bench[1]
    #    options = bench[2]
    #    test_mem(SCHEMA_PATH, DB_PATH, name, top)

