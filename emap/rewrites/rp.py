from ..db import NetlistDB
import json


def rewrite_mux_to_muxtree(db: NetlistDB) -> int:
    """
    Rewrite a mux that has two DFFs as inputs into a muxtree.
    """
    cur = db.execute("""
        SELECT mux.a, mux.b, mux.s, mux.y
        FROM absy_cells as mux JOIN dffes as dff1 JOIN dffes as dff2
            ON mux.a = dff1.q AND mux.b = dff2.q
        WHERE mux.type = '$_MUX_'
    """)
    newrows = [(str([a, b]), str([s]), y) for a, b, s, y in cur]
    cur.executemany("INSERT OR IGNORE INTO muxtrees (raw_data, addr, read_data) VALUES (?, ?, ?)", newrows)
    db.commit()
    return cur.rowcount

def reduce_muxtree(db: NetlistDB) -> int:
    """
    Reduce 2 muxtrees and 1 mux into a single muxtree.
    """
    cur = db.execute("""
        SELECT m1.raw_data, m2.raw_data, m1.addr, mux.s, mux.y
        FROM muxtrees as m1 JOIN muxtrees as m2 JOIN absy_cells as mux
            ON m1.addr = m2.addr AND m1.read_data = mux.a AND m2.read_data = mux.b
        WHERE mux.type = '$_MUX_'
    """)
    newrows = [(str(json.loads(md1) + json.loads(md2)), str(json.loads(ma) + [s]), y) for md1, md2, ma, s, y in cur]
    cur.executemany("INSERT OR IGNORE INTO muxtrees (raw_data, addr, read_data) VALUES (?, ?, ?)", newrows)
    db.commit()
    return cur.rowcount