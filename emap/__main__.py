from emap import NetlistDB
import emap.rewrites as rewrites
import argparse
import json


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--schema", nargs="?", type=str, default="emap/schema.sql", help="Path to the schema file")
    parser.add_argument("--db", nargs="?", type=str, default=":memory:", help="Path to the database file")
    parser.add_argument("--design", type=str, help="Path to the design JSON file")
    parser.add_argument("--top", type=str, help="Name of the top module")
    args = parser.parse_args()
    db = NetlistDB(schema_file=args.schema, db_file=args.db, cnt=1000)

    with open(args.design, "r") as f:
        mod = json.load(f)

    db.build_from_json(mod["modules"][args.top])

    with open("out_rewrite.json", "w") as f:
        json.dump(db.dump_tables(), f, indent=2)

    rewrites.rewrite_comm(db, ["$_AND_", "$_OR_"])  # scheduled once
    rewrites.rewrite_mux_to_muxtree(db) # scheduled once
    while rewrites.reduce_muxtree(db) > 0:  # repeat until no modifications
        pass
    rewrites.rewrite_and_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_to_decoder(db)  # scheduled once
    rewrites.rewrite_and_not_not_to_decoder(db)  # scheduled once
    while rewrites.reduce_decoder(db) > 0:  # repeat until no modifications
        pass

    cur = db.execute("SELECT addr_const, y FROM decoders")
    stat = {}
    for addr_const, y in cur:
        mapping = json.loads(addr_const)
        lhs = ",".join(str(k) for k in sorted(mapping.keys()))
        if lhs not in stat:
            stat[lhs] = 1
        else:
            stat[lhs] += 1

    print("Decoder statistics:")
    for lhs, count in sorted(stat.items(), key=lambda x: x[1], reverse=True):
        print(f"{lhs}: {count}")

    with open("out_rewrite_mux.json", "w") as f:
        json.dump(db.dump_tables(), f, indent=2)