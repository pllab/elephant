from elephant import db, rewriter
import pyrtl
import json

NETLIST_FILE = "elephant/tests/json/alu.json"

pyrtl.set_debug_mode(True)


if __name__ == "__main__":
    netlist = db.NetlistDatabase()
    with open(NETLIST_FILE, "r") as f:
        netlist.build_from_blif(json.load(f), "toplevel", True)

    # saturate
    rewriter.rewrite_dffe_pn_to_pp(netlist)
    rewriter.group_dffe_pp(netlist)
    # updated = True
    # while updated:
    #     updated = False
    #     updated = True if rewriter.saturate_comm(netlist, "$_AND_") > 0 else updated
    #     updated = True if rewriter.saturate_comm(netlist, "$_OR_") > 0 else updated
    #     updated = True if rewriter.saturate_demorgan(netlist, "$_AND_", "$_OR_") else updated
    #     updated = True if rewriter.saturate_demorgan(netlist, "$_OR_", "$_AND_") else updated
    #     updated = True if rewriter.saturate_idemp(netlist, "$_NOT_") else updated

    # reduce muxes
    rewriter.rewrite_2_1_mux_to_binary_gate(netlist)
    while rewriter.reduce_mux_once(netlist):
        pass

    cur = netlist.cursor()
    with open("binary_gate.json", "w") as f:
        cur.execute("SELECT * FROM binary_gate;")
        json.dump(cur.fetchall(), f)
    with open("concat.json", "w") as f:
        cur.execute("SELECT * FROM concat;")
        json.dump(cur.fetchall(), f)
    with open("mux.json", "w") as f:
        cur.execute("SELECT * FROM mux;")
        json.dump(cur.fetchall(), f)
    with open("dffe_xx.json", "w") as f:
        cur.execute("SELECT * FROM dffe_xx;")
        json.dump(cur.fetchall(), f)
    with open("selector.json", "w") as f:
        cur.execute("SELECT * FROM selector;")
        json.dump(cur.fetchall(), f)
    with open("unary_gate.json", "w") as f:
        cur.execute("SELECT * FROM unary_gate;")
        json.dump(cur.fetchall(), f)
    block: pyrtl.Block = netlist.to_pyrtl()
    with open("pyrtl.text", "w") as f:
        f.write(str(block))