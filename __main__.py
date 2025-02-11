from elephant import db, rewriter
import pyrtl
import json

NETLIST_FILE = "elephant/tests/json/alu.json"


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

    block = netlist.to_pyrtl()