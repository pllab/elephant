from ..db import NetlistDB
import json


LOG2 = {2**i: i for i in range(32)}  # log2 lookup table for powers of 2

def is_sublist(s, t):
    # TODO: apply rolling hash for better performance
    for i in range(len(t) - len(s) + 1):
        if t[i:i + len(s)] == s:
            return True
    return False

def find_dffe_by_q(db: NetlistDB, q: int) -> tuple[int, int, int, int] | None:
    """
    Return a tuple (d, e, clk, q).
    """
    cur = db.execute("SELECT * FROM dffes WHERE q = ?", (q,))
    return cur.fetchone()

def find_orandtree_by_y(db: NetlistDB, y: int) -> list[tuple[int, int]] | None:
    cur = db.execute("SELECT a, b FROM aby_cells WHERE y = ? AND type = '$_OR_' LIMIT 1", (y,))
    row = cur.fetchone()
    if row is None:
        # check whether it is an and gate
        cur = db.execute("SELECT a, b FROM aby_cells WHERE y = ? AND type = '$_AND_' LIMIT 1", (y,))
        row = cur.fetchone()
        return None if row is None else [row]
    # if it is an or gate, we need to find all its children
    a, b = row
    child_a = find_orandtree_by_y(db, a)
    if child_a is None:
        return None
    child_b = find_orandtree_by_y(db, b)
    return None if child_b is None else child_a + child_b

def extract_mem(db: NetlistDB):
    pass

def extract_single_bit_mem(db: NetlistDB):
    """
    Extract `reg mem[0:N-1];`, where N is a power of 2.
    """

    # filter all muxtrees that are subsumed by other muxtrees
    cur = db.execute("SELECT raw_data, addr, read_data FROM muxtrees")
    muxtrees = [(json.loads(raw_data), json.loads(addr), read_data) for raw_data, addr, read_data in cur]
    large_muxtrees = []
    for i in range(len(muxtrees)):
        raw_data, addr, read_data = muxtrees[i]
        for j in range(len(muxtrees)):
            if i != j:
                other_raw_data, other_addr, _ = muxtrees[j]
                if is_sublist(raw_data, other_raw_data) and is_sublist(addr, other_addr):
                    break
        else:
            large_muxtrees.append((tuple(raw_data), addr, read_data))

    # group muxtrees by their raw_data
    raw_data_groups: dict[tuple, list] = {}
    for raw_data, addr, read_data in large_muxtrees:
        if raw_data not in raw_data_groups:
            raw_data_groups[raw_data] = []
        raw_data_groups[raw_data].append((addr, read_data))
    # print(raw_data_groups)

    # for each group, check their write ports
    for raw_data, read_ports in raw_data_groups.items():
        dffes = [find_dffe_by_q(db, q) for q in raw_data]
        addr_width = LOG2[len(raw_data)]
        if dffes[0] is not None and all(dffe and dffes[0][2] == dffe[2] for dffe in dffes):
            # this probably has write ports
            # first, we start from e, which is an ortree with and gate leaves
            for dffe in dffes:
                assert dffe is not None
                d, e, _, _ = dffe
                print(find_orandtree_by_y(db, e))