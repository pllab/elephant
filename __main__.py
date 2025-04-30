from elephant import db, rewriter
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
    ("1r1w_w4h16", "simple_dual_port_mem"),
    ("1r1w_w4h64", "simple_dual_port_mem"),
    ("1rw_w4h64", "simple_rw_port_mem"),
    ("sparc_ffu_no_async", "sparc_ffu")
]


def test_extract_memory(netlist: db.NetlistDatabase, verbose: bool = False):
    # step 1: rewrite and eqsat (optional)
    # step 2: reduce qmux
    # step 3: find read port
    # step 4: find memory
    # step 5: find write port
    start = time.time()
    rewriter.rewrite_dffe_xx_to_pp(netlist)
    cnt = rewriter.rewrite_mux_to_qmux(netlist)
    print(f"Rewrote {cnt} muxes to qmuxes")
    while rewriter.reduce_qmux_once(netlist) > 0:
        pass
    print("Reduced all qmuxes")
    rps = rewriter.find_readport(netlist)
    mems = rewriter.find_memory(rps)
    print(f"Found {len(mems)} memory(ies):")
    for qs, rps in mems.items():
        print(f"\tMemory: width = {len(qs)}, height = {len(qs[0])}")
        if verbose:
            print(f"\t\tRegisters: {qs[0]}")
        else:
            print(f"\t\tRegisters: {qs[0][:5]}" + ("..." if len(qs) > 5 else ""))
        for i, (_, rd, ra) in enumerate(rps):
            print(f"\t\tRead port {i}:")
            if verbose:
                print(f"\t\t\tRead address: {ra}")
                print(f"\t\t\tRead data: {rd}")
            else:
                print(f"\t\t\tRead address: {ra[:5]}" + ("..." if len(ra) > 5 else ""))
                print(f"\t\t\tRead data: {rd[:5]}" + ("..." if len(rd) > 5 else ""))
        try:
            we, wa, wd = rewriter.find_writeport(netlist, qs)
            print(f"\t\tWrite port:")
            print(f"\t\t\tWrite enable: {we}")
            if verbose:
                print(f"\t\t\tWrite address: {wa}")
                print(f"\t\t\tWrite data: {wd}")
            else:
                print(f"\t\t\tWrite address: {wa[:5]}" + ("..." if len(wa) > 5 else ""))
                print(f"\t\t\tWrite data: {wd[:5]}" + ("..." if len(wd) > 5 else ""))

            # try read write port
            rwa = rewriter.find_readwriteport(netlist, ra, wa)
            if rwa:
                if verbose:
                    print(f"\t\t\tPossible read-write address: {rwa}")
                else:
                    print(f"\t\t\tPossible read-write address: {rwa[:5]}" + ("..." if len(rwa) > 5 else ""))
            else:
                print("\t\t\tPossible read-write address: None")
        except:
            print("\t\tWrite port: None")
    time_elapsed = time.time() - start
    print(f"Time elapsed: {time_elapsed:.2f}s")

def test_extract_quasi_memory(netlist: db.NetlistDatabase, verbose: bool = False):
    # start = time.time()
    # rewriter.rewrite_dffe_pn_to_pp(netlist)
    # cnt = rewriter.rewrite_mux_to_quasi_qmux(netlist)
    # print(f"Rewrote {cnt} muxes to quasi qmuxes")
    # while rewriter.reduce_quasi_qmux_once(netlist) > 0:
    #     pass
    # print("Reduced all quasi qmuxes")
    # mems = rewriter.find_quasi_memory(netlist)
    # time_elapsed = time.time() - start
    # print(f"Found {len(mems)} quasi memory(ies):")
    # for qss, ra, rd in mems:
    #     print(f"\tMemory: width = {len(qss)}, height = {len(qss[0]) - 1}")  # exclude the last const 0 dff
    #     ra = [e for e in ra if e is not None]
    #     if verbose:
    #         print(f"\t\tRead address: {ra}")
    #         print(f"\t\tRead data: {rd}")
    #     else:
    #         print(f"\t\tRead address: {ra[:5]}" + ("..." if len(ra) > 5 else ""))
    #         print(f"\t\tRead data: {rd[:5]}" + ("..." if len(rd) > 5 else ""))
    # print(f"Time elapsed: {time_elapsed:.2f}s")
    raise NotImplementedError()

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

    netlist = db.NetlistDatabase()
    with open(name, "r") as f:
        netlist.build_from_json(json.load(f), top, ignore_errors=True)

    if args.quasi:
        test_extract_quasi_memory(netlist, args.verbose)
    else:
        test_extract_memory(netlist, args.verbose)
