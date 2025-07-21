from ..db import NetlistDB
import json


def rewrite_and_to_decoder(db: NetlistDB):
    """
    Rewrite AND gates to decoders.
    """
    cur = db.execute("SELECT a, b, y FROM aby_cells WHERE type = '$_AND_'")
    newrows = [(json.dumps({a: 1, b: 1}, sort_keys=True), y) for a, b, y in cur]
    cur.executemany("INSERT OR IGNORE INTO decoders (addr_const, y) VALUES (?, ?)", newrows)
    db.commit()
    return cur.rowcount

def rewrite_and_not_to_decoder(db: NetlistDB):
    cur = db.execute("""
        SELECT not1.a, and1.b, and1.y
        FROM aby_cells as and1 JOIN ay_cells as not1
            ON and1.a = not1.y
        WHERE and1.type = '$_AND_' AND not1.type = '$_NOT_'
    """)
    newrows = [(json.dumps({a: 0, b: 1}, sort_keys=True), y) for a, b, y in cur]
    cur.executemany("INSERT OR IGNORE INTO decoders (addr_const, y) VALUES (?, ?)", newrows)
    db.commit()
    return cur.rowcount

def rewrite_and_not_not_to_decoder(db: NetlistDB):
    cur = db.execute("""
        SELECT not1.a, not2.a, and1.y
        FROM aby_cells as and1 JOIN ay_cells as not1 JOIN ay_cells as not2
            ON and1.a = not1.y AND and1.b = not2.y
        WHERE and1.type = '$_AND_' AND not1.type = '$_NOT_' AND not2.type = '$_NOT_'
    """)
    newrows = [(json.dumps({a: 0, b: 0}, sort_keys=True), y) for a, b, y in cur]
    cur.executemany("INSERT OR IGNORE INTO decoders (addr_const, y) VALUES (?, ?)", newrows)
    db.commit()
    return cur.rowcount

def reduce_decoder(db: NetlistDB) -> int:
    """
    Reduce 2 decoders and 1 AND gate into a single decoder.
    """
    cur = db.execute("""
        SELECT d1.addr_const, d2.addr_const, and1.y
        FROM decoders as d1 JOIN decoders as d2 JOIN aby_cells as and1
            ON d1.y = and1.a AND d2.y = and1.b
        WHERE and1.type = '$_AND_'
    """)
    newrows = [(json.dumps(json.loads(addr1) | json.loads(addr2), sort_keys=True), y) for addr1, addr2, y in cur]
    cur.executemany("INSERT OR IGNORE INTO decoders (addr_const, y) VALUES (?, ?)", newrows)
    db.commit()
    return cur.rowcount

