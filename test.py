from emap import NetlistDB
import emap.rewrites as rewrites
import emap.extracts as extracts
import json
import time


def test_mem(schema_path: str, db_path: str, design_path: str, top_module: str = "top"):
    print(f"Testing design `{design_path}` with top module `{top_module}`...")
    db = NetlistDB(schema_file=schema_path, db_file=db_path, cnt=10000)
    with open(design_path, "r") as f:
        design = json.load(f)
    phase_time = total_time = time.time()
    db.build_from_json(design["modules"][top_module])
    print(f"Database built in {time.time() - phase_time:.2f} seconds.")
    phase_time = time.time()
    rewrites.rewrite_comm(db, ["$_AND_", "$_OR_"])  # scheduled once
    print(f"Netlist saturated in {time.time() - phase_time:.2f} seconds.")
    phase_time = time.time()
    rewrites.rewrite_mux_to_muxtree(db) # scheduled once
    while rewrites.reduce_muxtree(db) > 0:  # repeat until no modifications
        pass
    print(f"Muxtrees reduced in {time.time() - phase_time:.2f} seconds.")
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
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r1w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r2w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r3w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r1w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r2w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h256_1r3w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r1w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r2w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h16_1r3w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r1w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r2w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w4h256_1r3w.json")
    # test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w32h32_2r1w.json")

    # test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/nerv.json", "nerv")
    test_mem(SCHEMA_PATH, DB_PATH, "practical_designs/bsg_fifo_w64h256.json", "top")