from elephant import db, rewriter
import pyrtl
import json
import time

NETLIST_PATH = "elephant/tests/json/"

NETLIST_FILES = [
    ("alu", "toplevel"),
    ("nerv", "nerv"),
    ("pico", "picorv32"),
    ("sparc_ffu", "sparc_ffu"),
    ("sram_1rw_128x78", "sram_1rw_128x78"),
    ("bsg_fifo_1r1w_64_256", "top")
]

# pyrtl.set_debug_mode(True)


def test_to_pyrtl():
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

    # cur = netlist.cursor()
    # with open("binary_gate.json", "w") as f:
    #     cur.execute("SELECT * FROM binary_gate;")
    #     json.dump(cur.fetchall(), f)
    # with open("concat.json", "w") as f:
    #     cur.execute("SELECT * FROM concat;")
    #     json.dump(cur.fetchall(), f)
    # with open("mux.json", "w") as f:
    #     cur.execute("SELECT * FROM mux;")
    #     json.dump(cur.fetchall(), f)
    # with open("dffe_xx.json", "w") as f:
    #     cur.execute("SELECT * FROM dffe_xx;")
    #     json.dump(cur.fetchall(), f)
    # with open("selector.json", "w") as f:
    #     cur.execute("SELECT * FROM selector;")
    #     json.dump(cur.fetchall(), f)
    # with open("unary_gate.json", "w") as f:
    #     cur.execute("SELECT * FROM unary_gate;")
    #     json.dump(cur.fetchall(), f)
    block: pyrtl.Block = netlist.to_pyrtl()
    with open("pyrtl.text", "w") as f:
        f.write(str(block))


def test_extract_mems(name: str, top: str):
    netlist = db.NetlistDatabase()
    with open(NETLIST_PATH + name + ".json", "r") as f:
        netlist.build_from_blif(json.load(f), top, True)
    netlist.extract_mems()


def test_find_readport(netlist: db.NetlistDatabase, verbose: bool = False):
    start = time.time()
    rewriter.rewrite_dffe_pn_to_pp(netlist)
    cnt = rewriter.rewrite_mux_to_qmux(netlist)
    print(f"Rewrote {cnt} muxes to qmuxes")
    while rewriter.reduce_qmux_once(netlist) > 0:
        pass
    print("Reduced all qmuxes")
    rps = rewriter.find_readport(netlist)
    time_elapsed = time.time() - start
    print(f"Found {len(rps)} read port(s):")
    for i, ((qss, ra), rd) in enumerate(rps.items()):
        print(f"\tRead port {i}: width = {len(qss)}, height = 2^{len(ra)}")
        if verbose:
            print(f"\t\tRead address: {ra}")
            print(f"\t\tRead data: {rd}")
            print(f"\t\tRegisters: {qss}")
        else:
            print(f"\t\tRead address: {ra[:5]}" + ("..." if len(ra) > 5 else ""))
            print(f"\t\tRead data: {rd[:5]}" + ("..." if len(rd) > 5 else ""))
            truncated_qss = [qs[:5] for qs in qss[:5]]
            print(f"\t\tRegisters: {truncated_qss}" + ("..." if len(qss) > 5 else ""))
    print(f"Time elapsed: {time_elapsed:.2f}s")


if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument(
        "--input", type=str, dest="name", help="name of input JSON netlist"
    )
    parser.add_argument(
        "--top", type=str, dest="top", help="name of top module"
    )
    args = parser.parse_args()

    if args.name is None and args.top is None:
        name, top = NETLIST_FILES[3]
        name = NETLIST_PATH + name + ".json"
    elif args.name is None:
        print("Provide JSON filename with --input")
        exit(1)
    elif args.top:
        name = args.name
        top = args.top
    else:
        name = args.name
        top = "top"

    netlist = db.NetlistDatabase()
    with open(name, "r") as f:
        netlist.build_from_blif(json.load(f), top, True)
    test_find_readport(netlist)
