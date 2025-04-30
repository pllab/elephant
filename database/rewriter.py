from __future__ import annotations
import collections
import json

from typing import TYPE_CHECKING
if TYPE_CHECKING:
    from .db import NetlistDatabase

# auxiliary functions
def subset(a: tuple, b: tuple) -> bool:
    # if b is a subset of a
    return all(x in a for x in b)

def transpose(m) -> list:
    return [[row[i] for row in m] for i in range(len(m[0]))]

LOG2 = {1: 0, 2: 1, 4: 2, 8: 3, 16: 4, 32: 5, 64: 6, 128: 7, 256: 8, 512: 9, 1024: 10, 2048: 11, 4096: 12}  # for exact log2

def log2_ceil(x: int) -> int:
    # return the smallest power of 2 that is greater than or equal to x
    for i in range(1, 13):
        if x <= 2 ** i:
            return i
    return 13   # 13 is big enough for our needs

# module \$_DFFE_PN_ (D, C, E, Q);
#     input D, C, E;
#     output reg Q;
#     always @(posedge C) begin
#         if (!E) Q <= D;
#     end
# endmodule

# module \$_DFFE_NP_ (D, C, E, Q);
#     input D, C, E;
#     output reg Q;
#     always @(negedge C) begin
#         if (E) Q <= D;
#     end
# endmodule
def rewrite_dffe_xx_to_pp(netlist: NetlistDatabase):
    cur = netlist.cursor()
    cur.execute("""
        SELECT d, c, e, q
        FROM dffe_xx
        WHERE type = "$_DFFE_PN_";
    """)
    res = cur.fetchall()
    i = netlist.get_next_id()
    for d, c, e, q in res:
        # check whether !e exists
        cur.execute("SELECT y FROM unary_gate WHERE a = ? AND type = \"$_NOT_\";", (e,))
        yt = cur.fetchone()
        if yt:
            ne = yt[0]
        else:
            ne = i
            i += 1
            cur.execute("INSERT INTO unary_gate VALUES (?, ?, ?);", (e, ne, "$_NOT_"))
            cur.execute("INSERT INTO wire VALUES (?, 1);", (ne,))
        # update the dffe_xx to dffe_pp
        cur.execute("""
            UPDATE dffe_xx
            SET type = "$_DFFE_PP_", e = ?
            WHERE type = "$_DFFE_PN_" AND d = ? AND c = ? AND e = ? AND q = ?;
            """, (ne, d, c, e, q)
        )
    cur.execute("""
        SELECT d, c, e, q
        FROM dffe_xx
        WHERE type = "$_DFFE_NP_";
    """)
    res = cur.fetchall()
    for d, c, e, q in res:
        # check whether !c exists
        cur.execute("SELECT y FROM unary_gate WHERE a = ? AND type = \"$_NOT_\";", (c,))
        yt = cur.fetchone()
        if yt:
            nc = yt[0]
        else:
            nc = i
            i += 1
            cur.execute("INSERT INTO unary_gate VALUES (?, ?, ?);", (c, nc, "$_NOT_"))
            cur.execute("INSERT INTO wire VALUES (?, 1);", (nc,))
        # update the dffe_xx to dffe_pp
        cur.execute("""
            UPDATE dffe_xx
            SET type = "$_DFFE_PP_", c = ?
            WHERE type = "$_DFFE_NP_" AND d = ? AND c = ? AND e = ? AND q = ?;
            """, (nc, d, c, e, q)
        )
    netlist.commit()

def saturate_comm(netlist: NetlistDatabase, target_type: str) -> int:
    # It finds all commutative binary gates and saturates them.
    cur = netlist.cursor()
    cur.execute("""
        SELECT b, a, y, type
        FROM binary_gate
        WHERE type = ?;
        """, (target_type,)
    )
    res = cur.fetchall()
    cur.executemany("INSERT OR IGNORE INTO binary_gate VALUES (?, ?, ?, ?);", res)
    netlist.commit()
    return cur.rowcount

def saturate_demorgan(netlist: NetlistDatabase, target_type: str, to_type: str) -> bool:
    # It finds the pattern: !(a & b) -> !a | !b. One at a time.
    cur = netlist.cursor()
    cur.execute("""
        SELECT bg.a, bg.b, bg.y
        FROM binary_gate AS bg JOIN unary_gate AS ug
        ON bg.y = ug.a
        WHERE bg.type = ? AND ug.type = ?
        LIMIT 1;
        """, (target_type, "$_NOT_")
    )
    res = cur.fetchone()
    if not res:
        return False
    i = netlist.get_next_id()
    a, b, y = res
    # check whether !a already exists
    cur.execute("SELECT y FROM unary_gate WHERE a = ? AND type = ?;", (a, "$_NOT_"))
    yt = cur.fetchone()
    if yt:
        na = yt[0]
    else:
        na = i
        i += 1
        cur.execute("INSERT INTO unary_gate VALUES (?, ?, ?);", (a, na, "$_NOT_"))
        cur.execute("INSERT INTO wire VALUES (?, 1);", (na,))
    # check whether !b already exists
    cur.execute("SELECT y FROM unary_gate WHERE a = ? AND type = ?;", (b, "$_NOT_"))
    yt = cur.fetchone()
    if yt:
        nb = yt[0]
    else:
        nb = i
        cur.execute("INSERT INTO unary_gate VALUES (?, ?, ?);", (b, nb, "$_NOT_"))
        cur.execute("INSERT INTO wire VALUES (?, 1);", (nb,))
    # check whether the output already exists
    cur.execute("SELECT y FROM binary_gate WHERE a = ? AND b = ? AND type = ?;", (na, nb, to_type))
    yt = cur.fetchone()
    if yt:
        return False
    else:
        # construct a new or
        cur.execute("INSERT INTO binary_gate VALUES (?, ?, ?, ?);", (na, nb, y, to_type))
    netlist.commit()
    return True

def saturate_2_1_mux(netlist: NetlistDatabase) -> int:
    # It finds the pattern: s'a + sb.
    cur = netlist.cursor()
    cur.execute("""
        SELECT and1.b, and2.b, and2.a, or1.y
        FROM binary_gate AS and1 JOIN binary_gate AS and2 JOIN binary_gate AS or1 JOIN unary_gate AS not1
        ON and1.a = not1.y AND and2.a = not1.a AND or1.a = and1.y AND or1.b = and2.y
        WHERE and1.type = "$_AND_" AND and2.type = "$_AND_" AND or1.type = "$_OR_" AND not1.type = "$_NOT_"
    """)
    res = cur.fetchall()
    cur.executemany("INSERT OR IGNORE INTO mux VALUES (?, ?, ?, ?);", res)
    netlist.commit()
    return cur.rowcount

# We can only consider muxes that are connected (directly or indirectly) to dffes.
# NOTE: Write port is now extracted heuristically instead of repairing.
def rewrite_mux_to_qmux(netlist: NetlistDatabase) -> int:
    # Qmux is a mux with inputs connected (directly) to dffes.
    # We can safely remove the original mux.
    cur = netlist.cursor()
    cur.execute("""
        SELECT mux.a, mux.b, mux.s, mux.y, d1.c, d1.type
        FROM mux JOIN dffe_xx AS d1 JOIN dffe_xx AS d2
        ON a = d1.q AND b = d2.q AND d1.c = d2.c AND d1.type = d2.type;
    """)
    res = cur.fetchall()
    if not res:
        return 0
    qmuxes = [
        (c, json.dumps([a, b]), json.dumps([s]), y, dffe_type)
        for a, b, s, y, c, dffe_type in res
    ]
    cur.executemany("INSERT INTO qmux VALUES (?, ?, ?, ?, ?);", qmuxes)
    # cur.executemany(
    #     "DELETE FROM mux WHERE a = ? AND b = ? AND s = ?;",
    #     [(a, b, s) for a, b, s, _, _, _ in res]
    # )
    netlist.commit()
    return cur.rowcount

def reduce_qmux_once(netlist: NetlistDatabase) -> int:
    # NOTE: This function keeps the original qmuxes.
    cur = netlist.cursor()
    cur.execute("""
        SELECT qm1.qs, qm2.qs, qm1.ss, mux.s, mux.y, qm1.c, qm1.dffe_type
        FROM qmux AS qm1 JOIN qmux AS qm2 JOIN mux
        ON qm1.c = qm2.c AND qm1.ss = qm2.ss AND qm1.y = mux.a AND qm2.y = mux.b AND qm1.dffe_type = qm2.dffe_type;
    """)
    res = cur.fetchall()
    if not res:
        return 0
    qmuxes = []
    for qs1, qs2, ss, s, y, c, dffe_type in res:
        qs1, qs2, ss = json.loads(qs1), json.loads(qs2), json.loads(ss)
        qmuxes.append((c, json.dumps(qs1 + qs2), json.dumps(ss + [s]), y, dffe_type))
    cur.executemany("INSERT OR IGNORE INTO qmux VALUES (?, ?, ?, ?, ?);", qmuxes)
    netlist.commit()
    return cur.rowcount

def find_readport(netlist: NetlistDatabase) -> dict[tuple[tuple[tuple[int]], tuple[int]], tuple[int]]:
    # (((q)), (ra)) -> (rd)
    # ((1, 2), (3, 4)) means q1, q2 -> rd1 & q3, q4 -> rd2
    readports = {}
    cur = netlist.cursor()
    # width >= 4
    # order by log(height) approximately
    cur.execute("SELECT c, ss, dffe_type FROM qmux GROUP BY c, ss, dffe_type HAVING COUNT(*) >= 4 ORDER BY LENGTH(ss) DESC;")
    groups = cur.fetchall()
    for c, ss, dffe_type in groups:
        # check whether ss is a subset of existing readports
        ss_tuple = tuple(json.loads(ss))
        if any(subset(ra, ss_tuple) for _, ra in readports.keys()):
            continue
        cur.execute("SELECT qs, y FROM qmux WHERE c = ? AND ss = ? AND dffe_type = ?;", (c, ss, dffe_type))
        patterns = cur.fetchall()
        qss = tuple(tuple(json.loads(qs)) for qs, _ in patterns)
        rd = tuple(y for _, y in patterns)
        readports[(qss, ss_tuple)] = rd
    return readports

def find_memory(readports: dict[tuple[tuple[tuple[int]], tuple[int]], tuple[int]]) -> dict[tuple[tuple[int]], list[tuple[tuple[tuple[int]], tuple[int], tuple[int]]]]:
    memories = {}
    for (qs, ra), rd in readports.items():
        found = False
        for mqs in memories.keys():
            if subset(mqs, qs):
                memories[mqs].append((qs, rd, ra))
                found = True
                break
        if not found:
            memories[qs] = [(qs, rd, ra)]
    return memories

def find_sources_by_gates(netlist: NetlistDatabase, sinks: set[int]) -> set[int]:
    # It finds all sources of a set of sinks.
    sources = set()
    cur = netlist.cursor()
    for sink in sinks:
        cur.execute("SELECT a, b FROM binary_gate WHERE y = ? LIMIT 1;", (sink,))
        res = cur.fetchone()
        if not res:
            cur.execute("SELECT a FROM unary_gate WHERE y = ? LIMIT 1;", (sink,))
            res = cur.fetchone()
            if res:
                sources.add(res[0])
        else:
            sources.add(res[0])
            sources.add(res[1])
    return sources.union(sinks)

def find_sources_by_all(netlist: NetlistDatabase, sinks: set[int]) -> set[int]:
    # It finds all sources of a set of sinks.
    sources = set()
    cur = netlist.cursor()
    for sink in sinks:
        cur.execute("SELECT a, b FROM binary_gate WHERE y = ?;", (sink,))
        res = cur.fetchall()
        for a, b in res:
            sources.add(a)
            sources.add(b)
        cur.execute("SELECT a FROM unary_gate WHERE y = ?;", (sink,))
        res = cur.fetchall()
        for (a,) in res:
            sources.add(a)
        cur.execute("SELECT a, b, s FROM mux WHERE y = ?;", (sink,))
        res = cur.fetchall()
        for a, b, s in res:
            sources.add(a)
            sources.add(b)
            sources.add(s)
        cur.execute("SELECT d, e FROM dffe_xx WHERE q = ?;", (sink,))
        res = cur.fetchall()
        for d, e in res:
            sources.add(d)
            sources.add(e)
        cur.execute("SELECT inputs FROM blackbox WHERE output = ?;", (sink,))
        res = cur.fetchall()
        for (inputs,) in res:
            inputs = json.loads(inputs)
            sources.update(inputs)
    return sources.union(sinks)

def find_writeport(netlist: NetlistDatabase, qs: tuple[tuple[int]]) -> tuple[int, tuple[int], tuple[int]]:
    # It finds the write port of a memory if it exists.
    # (we, wa, wd)
    dffes = []
    cur = netlist.cursor()

    # step 0: gather all dffes
    for qq in qs:
        tmp = []
        for q in qq:
            cur.execute("SELECT d, c, e FROM dffe_xx WHERE q = ?;", (q,))
            d, c, e = cur.fetchone()
            tmp.append((d, c, e, q))
        dffes.append(tmp)
    # for dffedffe in dffes:
    #     print(dffedffe)

    # step 1: check whether all dffes have the same c
    c = dffes[0][0][1]
    if not all(c == dffe[1] for dffedffe in dffes for dffe in dffedffe):
        raise Exception("dffes have different c values")

    # step 2: check whether all rows of dffes have the same d
    ds = []
    for dffedffe in dffes:
        d = dffedffe[0][0]
        if not all(d == dffe[0] for dffe in dffedffe):
            raise Exception("dffes have different d values")
        ds.append(d)

    # step 3: check whether all columns of dffes have the same e
    es = []
    for dffedffe in transpose(dffes):
        e = dffedffe[0][2]
        if not all(e == dffe[2] for dffe in dffedffe):
            raise Exception("dffes have different e values")
        es.append(e)

    # step 4: check whether all es come from binary gates with the same we
    e_srcs = []
    for e in es:
        cur.execute("SELECT a, b FROM binary_gate WHERE y = ?;", (e,))
        res = cur.fetchone()
        if not res:
            raise Exception("e is not a binary gate output")
        a, b = res
        e_srcs.append((a, b))
    we, found = e_srcs[0][0], True
    for e_src in e_srcs:
        if we not in e_src:
            found = False
            break
    if not found:
        we = e_srcs[0][1]
        for e_src in e_srcs:
            if we not in e_src:
                raise Exception("dffes have different we values")
    e_srcs_not_we = [a if a != we else b for (a, b) in e_srcs]
    # print(e_srcs_not_we)

    # step 5: check whether all e_srcs_not_we come from binary gates with the same wa
    e_srcs_rec = []
    for e_src in e_srcs_not_we:
        tmp = {e_src}
        for _ in range(log2_ceil(LOG2[len(e_srcs)])):
            tmp = find_sources_by_gates(netlist, tmp)
        e_srcs_rec.append(tmp)
    # print(e_srcs_rec)
    src_appears = collections.Counter(w for e_src in e_srcs_rec for w in e_src)
    # print(src_appears)
    # pick LOG2[len(e_srcs)] most common sources
    src_appears = src_appears.most_common(LOG2[len(e_srcs)])
    if len(src_appears) < log2_ceil(LOG2[len(e_srcs)]):
        raise Exception("not enough sources")

    return we, tuple(src[0] for src in src_appears), tuple(ds)

def find_readwriteport(netlist: NetlistDatabase, ra: tuple[int], wa: tuple[int]) -> tuple | None:
    # It finds the read-write port of a memory if it exists.
    ra_srcs, wa_srcs = set(ra), set(wa)
    for _ in range(1):
        ra_srcs = find_sources_by_all(netlist, ra_srcs)
        wa_srcs = find_sources_by_all(netlist, wa_srcs)
    # print(ra_srcs, wa_srcs)
    # check the intersection of ra_srcs and wa_srcs
    rwa = ra_srcs.intersection(wa_srcs)
    return tuple(rwa) #if len(rwa) >= len(ra) else None