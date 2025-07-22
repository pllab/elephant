from . import db, rewriter
# import pyrtl
import json
import time

NETLIST_PATH = "elephant/tests/json/"

NETLIST_FILES = [
    ("alu", "toplevel"),
    ("nerv", "nerv"),
    ("pico", "picorv32"),
    ("sparc_ffu", "sparc_ffu"),
    ("sram_1rw_128x78", "sram_1rw_128x78"),
    ("bsg_fifo_1r1w_64_256", "top"),
    ("netlist_h128_w16_1r1w", "toplevel"),
    ("bsg_cache", "top"),
    ("bsg_mem_1rw_sync_synth_width_p8_els_p256_latch_last_read_p1",
     "bsg_mem_1rw_sync_synth_width_p8_els_p256_latch_last_read_p1"),
    ("bsg_cache_ways_p_2_data_width_p_32", "top"),
    ("bp_fe_pc_gen", "bp_fe_pc_gen"),
    ("../../practical_designs/sparc_ffu.pickle", "sparc_ffu_nospu_wrap")
]

# pyrtl.set_debug_mode(True)


# def test_to_pyrtl():
#     netlist = db.NetlistDatabase()
#     with open(NETLIST_FILE, "r") as f:
#         netlist.build_from_blif(json.load(f), "toplevel", True)

#     # saturate
#     rewriter.rewrite_dffe_pn_to_pp(netlist)
#     rewriter.group_dffe_pp(netlist)
#     # updated = True
#     # while updated:
#     #     updated = False
#     #     updated = True if rewriter.saturate_comm(netlist, "$_AND_") > 0 else updated
#     #     updated = True if rewriter.saturate_comm(netlist, "$_OR_") > 0 else updated
#     #     updated = True if rewriter.saturate_demorgan(netlist, "$_AND_", "$_OR_") else updated
#     #     updated = True if rewriter.saturate_demorgan(netlist, "$_OR_", "$_AND_") else updated
#     #     updated = True if rewriter.saturate_idemp(netlist, "$_NOT_") else updated

#     # reduce muxes
#     rewriter.rewrite_2_1_mux_to_binary_gate(netlist)
#     while rewriter.reduce_mux_once(netlist):
#         pass

#     cur = netlist.cursor()
#     with open("binary_gate.json", "w") as f:
#         cur.execute("SELECT * FROM binary_gate;")
#         json.dump(cur.fetchall(), f)
#     with open("concat.json", "w") as f:
#         cur.execute("SELECT * FROM concat;")
#         json.dump(cur.fetchall(), f)
#     with open("mux.json", "w") as f:
#         cur.execute("SELECT * FROM mux;")
#         json.dump(cur.fetchall(), f)
#     with open("dffe_xx.json", "w") as f:
#         cur.execute("SELECT * FROM dffe_xx;")
#         json.dump(cur.fetchall(), f)
#     with open("selector.json", "w") as f:
#         cur.execute("SELECT * FROM selector;")
#         json.dump(cur.fetchall(), f)
#     with open("unary_gate.json", "w") as f:
#         cur.execute("SELECT * FROM unary_gate;")
#         json.dump(cur.fetchall(), f)
#     block: pyrtl.Block = netlist.to_pyrtl()
#     with open("pyrtl.text", "w") as f:
#         f.write(str(block))


def test_extract_mems(name: str, top: str):
    netlist = db.NetlistDatabase()
    with open(NETLIST_PATH + name + ".json", "r") as f:
        netlist.build_from_blif(json.load(f), top, True)
    netlist.extract_mems()


def test_extract_memory(netlist: db.NetlistDatabase, inverted_mux: bool = False, verbose: bool = False, timeit: bool = False):
    all_start = time.time()
    start = time.time() if timeit else 0
    rewriter.rewrite_dffe_xx_to_pp(netlist)
    rewriter.saturate_comm(netlist, "$_AND_")
    rewriter.saturate_comm(netlist, "$_OR_")
    rewriter.saturate_2_1_mux(netlist)
    if timeit:
        print(f"Rewrote dffs and logic gates in {time.time() - start:.3f}s")
        start = time.time()
    cnt = rewriter.rewrite_mux_to_qmux(netlist)
    print(f"Rewrote {cnt} muxes to qmuxes" + (f" in {time.time() - start:.3f}s" if timeit else ""))
    if timeit:
        start = time.time()
    if inverted_mux:
        cnt = rewriter.rewrite_inverted_mux_to_qmux(netlist)
        print(f"Rewrote {cnt} inverted muxes to qmuxes" + (f" in {time.time() - start:.3f}s" if timeit else ""))
        if timeit:
            start = time.time()
    while rewriter.reduce_qmux_once(netlist) > 0:
        pass
    if timeit:
        print(f"Reduced all qmuxes in {time.time() - start:.3f}s")
        start = time.time()
    rps = rewriter.find_readport(netlist)
    if timeit:
        print(f"Found {len(rps)} read port(s) in {time.time() - start:.3f}s")
        start = time.time()
    mems = rewriter.find_memory(rps)
    if timeit:
        print(f"Found {len(mems)} memory(ies) in {time.time() - start:.3f}s")
        start = time.time()
    wps = rewriter.create_writeport(netlist, mems)
    if timeit:
        print(f"Created {len(wps)} write port(s) in {time.time() - start:.3f}s")
        start = time.time()
    mux_cnt, demux_cnt = 0, 0
    print(f"Found {len(mems)} memory(ies):")
    for i, (qss, rps) in enumerate(mems.items()):
        demux_cnt += len(qss) * (len(qss[0]) - 1)
        print(f"\tMemory {i}: width = {len(qss)}, height = {len(qss[0])}")
        if verbose:
            for j, (qs, ra, rd) in enumerate(rps):
                print(f"\t\tRead port {j}:")
                print(f"\t\t\tRead address: {ra}")
                print(f"\t\t\tRead data: {rd}")
                print(f"\t\t\tRegisters: {qs}")
            print(f"\t\tWrite port:")
            wen, wa, wd = wps[qss]
            print(f"\t\t\tWrite enable: {wen}")
            print(f"\t\t\tWrite address: {wa}")
            print(f"\t\t\tWrite data: {wd}")
        else:
            for j, (qs, ra, rd) in enumerate(rps):
                mux_cnt += len(qss) * (len(qss[0]) - 1)
                print(f"\t\tRead port {j}:")
                print(f"\t\t\tRead address: {ra[:5]}" + ("..." if len(ra) > 5 else ""))
                print(f"\t\t\tRead data: {rd[:5]}" + ("..." if len(rd) > 5 else ""))
                truncated_qs = [qs[:5] for qs in qs[:5]]
                print(f"\t\t\tRegisters: {truncated_qs}" + ("..." if len(qs) > 5 else ""))
            wen, wa, wd = wps[qss]
            print(f"\t\tWrite port:")
            print(f"\t\t\tWrite enable: {wen}")
            print(f"\t\t\tWrite address: {wa[:5]}" + ("..." if len(wa) > 5 else ""))
            print(f"\t\t\tWrite data: {wd[:5]}" + ("..." if len(wd) > 5 else ""))
    print(f"Total muxes replaced by read ports: {mux_cnt}")
    print(f"Total estimated demuxes replaced by write ports: {demux_cnt}")
    print(f"Time elapsed: {time.time() - all_start:.3f}s")


def test_extract_quasi_memory(netlist: db.NetlistDatabase, verbose: bool = False, timeit: bool = False):
    all_start = time.time()
    start = time.time() if timeit else 0
    rewriter.rewrite_dffe_xx_to_pp(netlist)
    if timeit:
        print(f"Rewrote dffs in {time.time() - start:.3f}s")
        start = time.time()
    cnt = rewriter.rewrite_mux_to_quasi_qmux(netlist)
    if timeit:
        print(f"Rewrote {cnt} muxes to quasi qmuxes in {time.time() - start:.3f}s")
        start = time.time()
    else:
        print(f"Rewrote {cnt} muxes to quasi qmuxes")
    while rewriter.reduce_quasi_qmux_once(netlist) > 0:
        pass
    if timeit:
        print(f"Reduced all quasi qmuxes in {time.time() - start:.3f}s")
        start = time.time()
    else:
        print("Reduced all quasi qmuxes")
    mems = rewriter.find_quasi_memory(netlist)
    if timeit:
        print(f"Found {len(mems)} quasi memory(ies) in {time.time() - start:.3f}s")
    print(f"Found {len(mems)} quasi memory(ies):")
    mux_cnt = 0
    for qss, ra, rd in mems:
        mux_cnt += len(qss) * (len(qss[0]) - 1)
        print(f"\tMemory: width = {len(qss)}, height = {len(qss[0]) - 1}")  # exclude the last const 0 dff
        ra = [e for e in ra if e is not None]
        if verbose:
            print(f"\t\tRead address: {ra}")
            print(f"\t\tRead data: {rd}")
        else:
            print(f"\t\tRead address: {ra[:5]}" + ("..." if len(ra) > 5 else ""))
            print(f"\t\tRead data: {rd[:5]}" + ("..." if len(rd) > 5 else ""))
    print(f"Total muxes replaced by read ports: {mux_cnt}")
    print(f"Time elapsed: {time.time() - all_start:.3f}s")


if __name__ == "__main__":
    from argparse import ArgumentParser
    parser = ArgumentParser()
    parser.add_argument(
        "--input", type=str, dest="name", help="name of input JSON netlist"
    )
    parser.add_argument(
        "--top", type=str, dest="top", help="name of top module"
    )
    parser.add_argument(
        "--verbose", action="store_true", help="print detailed information of memory ports"
    )
    parser.add_argument(
        "--quasi", action="store_true", help="extract quasi memories"
    )
    parser.add_argument(
        "--inverted-mux", dest="inverted_mux", action="store_true", help="rewrite inverted muxes"
    )
    parser.add_argument(
        "--timeit", action="store_true", help="time the extraction process"
    )
    args = parser.parse_args()

    if args.name is None and args.top is None:
        name, top = NETLIST_FILES[-1]
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

    start_time = 0
    if args.timeit:
        start_time = time.time()
    netlist = db.NetlistDatabase()
    with open(name, "r") as f:
        netlist.build_from_blif(json.load(f), top, True)
    if args.timeit:
        print(f"Built netlist in {time.time() - start_time:.3f}s")

    if args.quasi:
        test_extract_quasi_memory(netlist, args.verbose, args.timeit)
    else:
        test_extract_memory(netlist, args.inverted_mux, args.verbose, args.timeit)
