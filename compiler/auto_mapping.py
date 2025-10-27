from typing import Any

import pyrtl
from AbstractMem import AbstractMem

def mem_mapping(
    mem: AbstractMem,
    tech: list[dict[str, Any]]
) -> list[AbstractMem]:
    # NOTE: This method doesn't deal with memory features. It only keeps them in AbstractMem.
    # NOTE: This method doesn't split/merge the memory by data width.

    def update(a: tuple[int | float, Any], b: tuple[int | float, Any]) -> tuple[int | float, Any]:
        # only compare the first element
        if a[0] <= b[0]:
            return a
        return b

    # dynamic programming
    # choose the smallest cost per bit memory
    # maintain both the costs and choices
    nr, nw, nrw = len(mem.read_ports), len(mem.write_ports), len(mem.read_write_ports)
    np = nr + nw + 2 * nrw
    dp: list[list[list[tuple[int | float, Any]]]] = [[[(float("inf"), None) for _ in range(np+ 1)] for _ in range(np + 1)] for _ in range(np + 1)]

    # initialize with tech
    for index, physical_mem in enumerate(tech):
        r, w, rw, c = physical_mem["read_ports"], physical_mem["write_ports"], physical_mem["read_write_ports"], physical_mem["cost_per_bit"]
        for i in range(r + 1):
            for j in range(w + 1):
                for k in range(rw + 1):
                    try:
                        dp[i][j][k] = update(dp[i][j][k], (c, index))
                    except IndexError:  # if i, j, k are out of range
                        pass

    for k in range(np, -1, -1):
        for i in range(np):
            for j in range(np):
                # print(f"i: {i}, j: {j}, k: {k}")
                c = dp[i][j][k][0]
                if k == np:
                    for m in range(1, i):   # split the read ports
                        dp[i][j][k] = update(dp[i][j][k], (dp[m][j][k][0] + dp[i - m][j][k][0], f"split_r {m}"))
                else:
                    for m in range(1, i):   # split the read ports
                        dp[i][j][k] = update(dp[i][j][k], (dp[m][j][k][0] + dp[i - m][j][k][0], f"split_r {m}"))
                    if i > 0:   # cast a read port to a read-write port
                        dp[i][j][k] = update(dp[i][j][k], (dp[i - 1][j][k + 1][0], "cast_r"))
                    if j > 0:   # cast a write port to a read-write port
                        dp[i][j][k] = update(dp[i][j][k], (dp[i][j - 1][k + 1][0], "cast_w"))

    # try casting a read-write port to a read port and a write port
    for k in range(1, nrw + 1):
        dp[nr][nw][nrw] = update(dp[nr][nw][nrw], (dp[nr + k][nw + k][nrw - k][0], f"cast_rw {k}"))

    # for i in range(np + 1):
    #     for j in range(np + 1):
    #         for k in range(np + 1):
    #             print(f"dp[{i}][{j}][{k}] = {dp[i][j][k]}")

    # reconstruct the choices
    physical_mems: list[AbstractMem] = []

    def reconstruct_recursive(
        physical_mems: list[AbstractMem],
        dp: list[list[list[tuple[int | float, Any]]]],
        rps: list[AbstractMem.ReadPort],
        wps: list[AbstractMem.WritePort],
        rwps: list[AbstractMem.ReadWritePort],
        i: int, j: int, k: int
    ):
        c, choice = dp[i][j][k]
        # print(f"dp[{i}][{j}][{k}] = {c}, {choice}")
        if c == float("inf") or choice is None:
            raise ValueError("No valid memory found")
        if isinstance(choice, int): # physical memory
            mem_tech_name = tech[choice]["name"]
            physical_mem = AbstractMem(
                width=mem.width,
                height=mem.height,
                name=f"{mem.name}@{mem_tech_name}",
                read_ports=rps,
                write_ports=wps,
                read_write_ports=rwps,
            )
            physical_mems.append(physical_mem)
        elif not isinstance(choice, str):
            raise ValueError("Invalid choice")
        elif choice.startswith("split_r"):
            m = int(choice.split(" ")[1])
            reconstruct_recursive(physical_mems, dp, rps[:m], wps, rwps, m, j, k)
            reconstruct_recursive(physical_mems, dp, rps[m:], wps, rwps, i - m, j, k)
        elif choice == "cast_r":
            new_rwp = AbstractMem.ReadWritePort(
                addr=rps[-1].addr,
                data_in=None,
                data_out=rps[-1].data,
                en=rps[-1].en,
                mask=None
            )
            reconstruct_recursive(physical_mems, dp, rps[:-1], wps, rwps + [new_rwp], i - 1, j, k + 1)
        elif choice == "cast_w":
            new_rwp = AbstractMem.ReadWritePort(
                addr=wps[-1].addr,
                data_in=wps[-1].data,
                data_out=None,
                en=wps[-1].en,
                mask=wps[-1].mask
            )
            reconstruct_recursive(physical_mems, dp, rps, wps[:-1], rwps + [new_rwp], i, j - 1, k + 1)
        elif choice.startswith("cast_rw"):
            m = int(choice.split(" ")[1])
            # print(f"cast_rw {m}")
            new_rps, new_wps = [], []
            for l in range(m):
                new_rps.append(AbstractMem.ReadPort(
                    addr=rwps[l].addr,
                    data=rwps[l].data_out,
                    en=~rwps[l].en if isinstance(rwps[l].en, pyrtl.WireVector) else None
                ))
                new_wps.append(AbstractMem.WritePort(
                    addr=rwps[l].addr,
                    data=rwps[l].data_in,
                    en=rwps[l].en,
                    mask=rwps[l].mask
                ))
            reconstruct_recursive(physical_mems, dp, rps + new_rps, wps + new_wps, rwps[m:], i + m, j + m, k - m)
        else:
            raise ValueError("Invalid choice")

    reconstruct_recursive(physical_mems, dp, mem.read_ports, mem.write_ports, mem.read_write_ports, nr, nw, nrw)
    return physical_mems


def test_1r1w(tech: list[dict[str, Any]], verbose: bool = False):
    print("---- test_1r1w ----")
    print(f"tech available: {[mem['name'] for mem in tech]}")

    r = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r"),
        data=pyrtl.WireVector(32, name="data_r"),
        en=1
    )
    w = AbstractMem.WritePort(
        addr=pyrtl.WireVector(10, name="addr_w"),
        data=pyrtl.WireVector(32, name="data_w"),
        en=1,
    )
    mem = AbstractMem(
        width=32,
        height=1024,
        name="test_1r1w",
        read_ports=[r],
        write_ports=[w],
    )
    try:
        physical_mems = mem_mapping(mem, tech)
        for physical_mem in physical_mems:
            if verbose:
                print(physical_mem)
            else:
                print(f"{physical_mem.name}")
    except ValueError as e:
        print(e)


def test_1rw(tech: list[dict[str, Any]], verbose: bool = False):
    print("---- test_1rw ----")
    print(f"tech available: {[mem['name'] for mem in tech]}")

    rw = AbstractMem.ReadWritePort(
        addr=pyrtl.WireVector(10, name="addr_rw"),
        data_in=pyrtl.WireVector(32, name="data_in_rw"),
        data_out=pyrtl.WireVector(32, name="data_out_rw"),
        en=pyrtl.WireVector(1, name="en_rw"),
    )
    mem = AbstractMem(
        width=32,
        height=1024,
        name="test_1rw",
        read_write_ports=[rw],
    )
    try:
        physical_mems = mem_mapping(mem, tech)
        for physical_mem in physical_mems:
            if verbose:
                print(physical_mem)
            else:
                print(f"{physical_mem.name}")
    except ValueError as e:
        print(e)


def test_2r1w(tech: list[dict[str, Any]], verbose: bool = False):
    print("---- test_2r1w ----")
    print(f"tech available: {[mem['name'] for mem in tech]}")

    r1 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r1"),
        data=pyrtl.WireVector(32, name="data_r1"),
        en=1
    )
    r2 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r2"),
        data=pyrtl.WireVector(32, name="data_r2"),
        en=1
    )
    w = AbstractMem.WritePort(
        addr=pyrtl.WireVector(10, name="addr_w"),
        data=pyrtl.WireVector(32, name="data_w"),
        en=1,
    )
    mem = AbstractMem(
        width=32,
        height=1024,
        name="test_2r1w",
        read_ports=[r1, r2],
        write_ports=[w],
    )
    try:
        physical_mems = mem_mapping(mem, tech)
        for physical_mem in physical_mems:
            if verbose:
                print(physical_mem)
            else:
                print(f"{physical_mem.name}")
    except ValueError as e:
        print(e)


def test_4r1w(tech: list[dict[str, Any]], verbose: bool = False):
    print("---- test_4r1w ----")
    print(f"tech available: {[mem['name'] for mem in tech]}")

    r1 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r1"),
        data=pyrtl.WireVector(32, name="data_r1"),
        en=1
    )
    r2 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r2"),
        data=pyrtl.WireVector(32, name="data_r2"),
        en=1
    )
    r3 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r3"),
        data=pyrtl.WireVector(32, name="data_r3"),
        en=1
    )
    r4 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r4"),
        data=pyrtl.WireVector(32, name="data_r4"),
        en=1
    )
    w = AbstractMem.WritePort(
        addr=pyrtl.WireVector(10, name="addr_w"),
        data=pyrtl.WireVector(32, name="data_w"),
        en=1,
    )
    mem = AbstractMem(
        width=32,
        height=1024,
        name="test_4r1w",
        read_ports=[r1, r2, r3, r4],
        write_ports=[w],
    )
    try:
        physical_mems = mem_mapping(mem, tech)
        for physical_mem in physical_mems:
            if verbose:
                print(physical_mem)
            else:
                print(f"{physical_mem.name}")
    except ValueError as e:
        print(e)


def test_4r2w(tech: list[dict[str, Any]], verbose: bool = False):
    print("---- test_4r2w ----")
    print(f"tech available: {[mem['name'] for mem in tech]}")

    r1 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r1"),
        data=pyrtl.WireVector(32, name="data_r1"),
        en=1
    )
    r2 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r2"),
        data=pyrtl.WireVector(32, name="data_r2"),
        en=1
    )
    r3 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r3"),
        data=pyrtl.WireVector(32, name="data_r3"),
        en=1
    )
    r4 = AbstractMem.ReadPort(
        addr=pyrtl.WireVector(10, name="addr_r4"),
        data=pyrtl.WireVector(32, name="data_r4"),
        en=1
    )
    w1 = AbstractMem.WritePort(
        addr=pyrtl.WireVector(10, name="addr_w1"),
        data=pyrtl.WireVector(32, name="data_w1"),
        en=1,
    )
    w2 = AbstractMem.WritePort(
        addr=pyrtl.WireVector(10, name="addr_w2"),
        data=pyrtl.WireVector(32, name="data_w2"),
        en=1,
    )
    mem = AbstractMem(
        width=32,
        height=1024,
        name="test_4r2w",
        read_ports=[r1, r2, r3, r4],
        write_ports=[w1, w2],
    )
    try:
        physical_mems = mem_mapping(mem, tech)
        for physical_mem in physical_mems:
            if verbose:
                print(physical_mem)
            else:
                print(f"{physical_mem.name}")
    except ValueError as e:
        print(e)


if __name__ == "__main__":
    import json
    with open("test/mem_tech.json", "r") as f:
        tech = json.load(f)

    # success expected
    test_1r1w(tech["xilinx"])
    test_1r1w(tech["pyrtl"])

    test_1rw(tech["xilinx"])
    test_1rw(tech["pyrtl"])

    test_2r1w(tech["xilinx"])
    test_2r1w(tech["pyrtl"])

    test_4r1w(tech["xilinx"])
    test_4r1w(tech["pyrtl"])

    # failure expected
    test_4r2w(tech["xilinx"])
    test_4r2w(tech["pyrtl"])
