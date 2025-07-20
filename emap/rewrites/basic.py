from ..db import NetlistDB


def rewrite_comm(db: NetlistDB, targets: list[str]) -> int:
    cur = db.execute(f"SELECT type, a, b, y FROM aby_cells WHERE type IN ({','.join('?' for _ in targets)})", targets)
    newrows = [(type_, b, a, y) for type_, a, b, y in cur]
    cur.executemany("INSERT OR IGNORE INTO aby_cells (type, a, b, y) VALUES (?, ?, ?, ?)", newrows)
    db.commit()
    return cur.rowcount