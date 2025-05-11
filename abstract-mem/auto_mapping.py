from typing import Any

from .AbstractMem import AbstractMem

def mem_mapping(
    mem: AbstractMem,
    tech: list[dict[str, Any]]
) -> list[AbstractMem]:
    # NOTE: This method doesn't deal with memory features. It only keeps them in AbstractMem.
    # NOTE: This method doesn't split the memory by data width.

    # dynamic programming
    # choose the smallest cost per bit memory
    # maintain both the costs and choices
    nr, nw, nrw = len(mem.read_ports), len(mem.write_ports), len(mem.read_write_ports)
    np = nr + nw + nrw
    dp: list[list[list[tuple[int | float, Any]]]] = [[[(float("inf"), None) for _ in range(np)] for _ in range(np)] for _ in range(np)]

    # initialize with tech
    for index, physical_mem in enumerate(tech):
        r, w, rw, c = physical_mem["read_ports"], physical_mem["write_ports"], physical_mem["read_write_ports"], physical_mem["cost_per_bit"]
        for i in range(r + 1):
            for j in range(w + 1):
                for k in range(rw + 1):
                    try:
                        dp[i][j][k] = min(dp[i][j][k], (c, index))
                    except IndexError:  # if i, j, k are out of range
                        pass

    for k in range(np, -1, -1):
        for i in range(np):
            for j in range(np):
                c = dp[i][j][k][0]
                if k == np:
                    for m in range(1, i):   # split the read ports
                        dp[i][j][k] = min(dp[i][j][k], (dp[m][j][k][0] + dp[i - m][j][k][0], f"split@({m})"))
                else:
                    for m in range(1, i):   # split the read ports
                        dp[i][j][k] = min(dp[i][j][k], (dp[m][j][k][0] + dp[i - m][j][k][0], f"split@({m})"))
                    if i > 0:   # cast a read port to a read-write port
                        dp[i][j][k] = min(dp[i][j][k], (dp[i - 1][j][k + 1][0], f"cast_read"))
                    if j > 0:   # cast a write port to a read-write port
                        dp[i][j][k] = min(dp[i][j][k], (dp[i][j - 1][k + 1][0], f"cast_write"))

    target = dp[nr][nw][nrw]
    print(f"target: {target}")


    return []


if __name__ == "__main__":
    