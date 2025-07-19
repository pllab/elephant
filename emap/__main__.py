from emap import NetlistDB
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
