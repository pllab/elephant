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
    np = nr + nw + nrw
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
    for k in range(nrw):
        dp[nr][nw][nrw] = update(dp[nr][nw][nrw], (dp[nr + k][nw + k][k][0], f"cast_rw {k}"))

    # reconstruct the choices
    target = dp[nr][nw][nrw]
    if target[0] == float("inf"):
        raise ValueError("No valid memory found")
    physical_mems: list[AbstractMem] = []

    def reconstruct_recursive(physical_mems: list[AbstractMem], i: int, j: int, k: int):
        

    # TODO: reconstruct the choices and figure out representation
    return physical_mems


def test_1r1w(tech: list[dict[str, Any]]):
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
    mem_mapping(mem, tech)


if __name__ == "__main__":
    import json
    with open("mem_tech.json", "r") as f:
        tech = json.load(f)

    test_1r1w(tech["xilinx"])
    test_1r1w(tech["pyrtl"])