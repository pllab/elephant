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
    print(f"Database built in {time.time() - phase_time:.2f} seconds")
    phase_time = time.time()
    rewrites.rewrite_comm(db, ["$_AND_", "$_OR_"])  # scheduled once
    print(f"Netlist saturated in {time.time() - phase_time:.2f} seconds")
    phase_time = time.time()
    rewrites.rewrite_mux_to_muxtree(db) # scheduled once
    while rewrites.reduce_muxtree(db) > 0:  # repeat until no modifications
        pass
    print(f"Muxtrees reduced in {time.time() - phase_time:.2f} seconds")
    phase_time = time.time()
    rewrites.rewrite_and_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_not_to_decoder(db)  # scheduled once
    while rewrites.reduce_decoder(db) > 0:  # repeat until no modifications
        pass
    print(f"Decoders reduced in {time.time() - phase_time:.2f} seconds")
    phase_time = time.time()
    extracts.extract_single_bit_mem(db)
    print(f"Memories extracted in {time.time() - phase_time:.2f} seconds")
    print(f"Total time: {time.time() - total_time:.2f} seconds")

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"
    test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r1w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r2w.json")
    test_mem(SCHEMA_PATH, DB_PATH, "simple_mems/mem_w1h16_1r3w.json")