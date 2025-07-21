from ..db import NetlistDB
import json
import collections


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

def find_decoder_by_y(db: NetlistDB, y: int, length: int) -> list[dict[str, int]]:
    cur = db.execute("SELECT addr_const FROM decoders WHERE y = ? AND len(addr_const) = ?", (y, length))
    return [json.loads(row[0]) for row in cur]

def extract_single_bit_mem(db: NetlistDB) -> list:
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
    mems = []
    for raw_data, read_ports in raw_data_groups.items():
        dffes = [find_dffe_by_q(db, q) for q in raw_data]
        addr_width = LOG2[len(raw_data)]
        if dffes[0] is not None and all(dffe and dffes[0][2] == dffe[2] for dffe in dffes):
            # this probably has write ports
            # first, we start from e, which is an tree with OR gate internals & AND gate leaves
            orandtrees = []
            for dffe in dffes:
                assert dffe is not None
                d, e, _, _ = dffe
                orandtrees.append(find_orandtree_by_y(db, e))
            if None in orandtrees or any(len(orandtrees[0]) != len(orandtree) for orandtree in orandtrees): # length mismatch
                continue
            we_candidates = {w for w, cnt in collections.Counter(w for orandtree in orandtrees for ands in orandtree for w in ands).items() if cnt >= len(raw_data)}
            we_to_was: dict[int, list] = {}
            # TODO: check whether decoders cover all cases
            # for now we only check the total number of them so the order of wa is not guaranteed
            for orandtree in orandtrees:
                for a, b in orandtree:
                    if a in we_candidates:
                        if b in we_candidates:
                            raise ValueError(f"Both {a} and {b} are write enable wires, which is not allowed.")
                        a, b = b, a
                    # now b is the write enable wire
                    decoders = find_decoder_by_y(db, a, addr_width)
                    if b not in we_to_was:
                        we_to_was[b] = []
                    we_to_was[b].extend(frozenset(int(k) for k in decoder) for decoder in decoders)

            write_ports = []    # (we, wa)
            for we, was in we_to_was.items():
                for wa, cnt in collections.Counter(was).items():
                    for _ in range(cnt // len(raw_data)):
                        write_ports.append((we, wa))
                if not was:
                    write_ports.append((we, frozenset()))
            # TODO: construct wd for each write port

            mems.append({
                "read_ports": read_ports,
                "read_addrs": frozenset(tuple(addr) for addr, _ in read_ports), # redundant but easier to be compared
                "write_ports": frozenset(write_ports),
                "raw_data": raw_data
            })

    return mems

def extract_mem(db: NetlistDB) -> list:
    """
    Extract memories.
    """
    mems = extract_single_bit_mem(db)

    # group memories by their ras, wes and was
    mem_groups: dict[tuple[frozenset, frozenset], list] = {}
    for mem in mems:
        if (mem["read_addrs"], mem["write_ports"]) not in mem_groups:
            mem_groups[(mem["read_addrs"], mem["write_ports"])] = []
        mem_groups[(mem["read_addrs"], mem["write_ports"])].append(mem)

    # TODO: for simplicity, we only return the number of memories, width, height, number of read ports and number of write ports
    grouped_mems = []
    for (ra, wp), cnt in mem_groups.items():
        # (width, height, number of read ports, number of write ports)
        width = len(next(iter(ra)))
        grouped_mems.append((len(cnt), 2**width, len(ra), len(wp)))
    return grouped_mems