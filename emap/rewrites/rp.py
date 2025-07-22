from ..db import NetlistDB
import json


def rewrite_mux_to_muxtree(db: NetlistDB, subsume: bool = False) -> int:
    """
    Rewrite a mux that has two DFFs as inputs into a muxtree.
    """
    cur = db.execute("""
        SELECT mux.a, mux.b, mux.s, mux.y
        FROM absy_cells as mux JOIN dffes as dff1 JOIN dffes as dff2
            ON mux.a = dff1.q AND mux.b = dff2.q AND dff1.clk = dff2.clk
    """)
    rows = cur.fetchall()
    newrows = [(str([a, b]), str([s]), y) for a, b, s, y in rows]
    print(f"Found {len(rows)} muxes with DFFs as inputs.")
    cur.executemany("INSERT INTO muxtrees (raw_data, addr, read_data) VALUES (?, ?, ?)", newrows)
    if subsume:
        cur = db.executemany("DELETE FROM absy_cells WHERE type = '$_MUX_' AND a = ? AND b = ? AND s = ?", ((a, b, s) for a, b, s, _ in rows))
    db.commit()
    return cur.rowcount

def reduce_muxtree(db: NetlistDB, subsume: bool = False) -> int:
    """
    Reduce 2 muxtrees and 1 mux into a single muxtree.
    """
    # NOTE: sqlite3 may make bad plans for this query, so we use EXPLAIN QUERY PLAN to debug it.
    # the best order of joins is: m1 JOIN mux JOIN m2
    # cur = db.execute("""
    #     EXPLAIN QUERY PLAN
    #     SELECT m1.raw_data, m2.raw_data, m1.addr, mux.s, mux.y, mux.a, mux.b
    #     FROM muxtrees as m1 JOIN muxtrees as m2 JOIN absy_cells as mux
    #         ON m1.addr = m2.addr AND m1.read_data = mux.a AND m2.read_data = mux.b
    # """)
    # print("Reduce muxtree plan:", cur.fetchall())
    cur = db.execute("""
        SELECT m1.raw_data, m2.raw_data, m1.addr, mux.s, mux.y, mux.a, mux.b
        FROM muxtrees as m1 JOIN absy_cells as mux JOIN muxtrees as m2
            ON m1.addr = m2.addr AND m1.read_data = mux.a AND m2.read_data = mux.b
    """)
    rows = cur.fetchall()
    newrows = [(str(json.loads(md1) + json.loads(md2)), str(json.loads(ma) + [s]), y) for md1, md2, ma, s, y, _, _ in rows]
    cur.executemany("INSERT OR IGNORE INTO muxtrees (raw_data, addr, read_data) VALUES (?, ?, ?)", newrows)
    cnt = cur.rowcount
    if subsume:
        cur.executemany("DELETE FROM absy_cells WHERE type = '$_MUX_' AND a = ? AND b = ? AND s = ?", ((a, b, s) for _, _, _, s, _, a, b in rows))
        cur.executemany("DELETE FROM muxtrees WHERE raw_data = ? AND addr = ?", ((md1, ma) for md1, _, ma, _, _, _, _ in rows))
        cur.executemany("DELETE FROM muxtrees WHERE raw_data = ? AND addr = ?", ((md2, ma) for _, md2, ma, _, _, _, _ in rows))
    db.commit()
    return cnt