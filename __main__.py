import elephant
import pyrtl
import json

NETLIST_FILE = "elephant/tests/json/alu.json"


if __name__ == "__main__":
    netlist = elephant.db.NetlistDatabase()
    with open(NETLIST_FILE, "r") as f:
        netlist.build_from_blif(json.load(f), "toplevel")