from ..db import NetlistDB


def rewrite_comm(db: NetlistDB, targets: list[str]) -> int:
    cur = db.execute(f"SELECT type, a, b, y FROM aby_cells WHERE type IN ({','.join('?' for _ in targets)})", targets)
    newrows = [(type_, b, a, y) for type_, a, b, y in cur]
    cur.executemany("INSERT OR IGNORE INTO aby_cells (type, a, b, y) VALUES (?, ?, ?, ?)", newrows)
    db.commit()
    return cur.rowcount

def rewrite_2_1_mux(db: NetlistDB) -> int:
    cur = db.execute("""
        SELECT and1.b, and2.b, and2.a, or1.y
        FROM aby_cells AS and1 JOIN aby_cells AS and2 JOIN aby_cells AS or1 JOIN ay_cells AS not1
        ON and1.a = not1.y AND and2.a = not1.a AND or1.a = and1.y AND or1.b = and2.y
        WHERE and1.type = "$_AND_" AND and2.type = "$_AND_" AND or1.type = "$_OR_" AND not1.type = "$_NOT_"
    """)
    absy_rows = [(a,b,s,y) for a,b,s,y in cur]
    print("s'a + sb found:")
    if not absy_rows:
        return 0
    cur.executemany(
        "INSERT OR IGNORE INTO absy_cells (type, a, b, s, y) VALUES ('$_MUX_', ?, ?, ?, ?)",
        absy_rows
    )
    db.commit()
    return cur.rowcount

def rewrite_xnot_to_x_not(db: NetlistDB, target: str) -> int:
    targetnot = target[:-1] + "NOT" + target[-1]
    cur = db.execute(f"SELECT a, b, y FROM aby_cells WHERE type = \"{targetnot}\"")
    abys = [(a,b,y) for a,b,y in cur]
    if not abys:
        return 0
    for a, b, y in abys:
        # check whether !b already exists
        cur.execute("SELECT y FROM ay_cells WHERE a = ? AND type = \"$_NOT_\" LIMIT 1;", (b,))
        res = cur.fetchone()
        if res:
            nb = res[0]
        else:
            nb = db.next_wire()
            cur.execute("INSERT INTO ay_cells (a, y, type) VALUES (?, ?, ?);", (b, nb, "$_NOT_"))
        cur.execute("INSERT INTO aby_cells (a, b, y, type) VALUES (?, ?, ?, ?);", (a, nb, y, target))
    cur.execute(f"DELETE FROM aby_cells WHERE type = \"{targetnot}\"")
    db.commit()
    return cur.rowcount

def rewrite_nand_nor(db: NetlistDB, target: str) -> int:
    if target == "$_AND_":
        ntarget = "$_NAND_"
    elif target == "$_OR_":
        ntarget = "$_NOR_"
    cur = db.execute(f"SELECT a, b, y FROM aby_cells WHERE type = \"{ntarget}\"")
    abys = [(a,b,y) for a,b,y in cur]
    if not abys:
        return 0
    for a, b, y in abys:
        ny = db.next_wire()
        cur.execute("INSERT INTO ay_cells (a, y, type) VALUES (?, ?, ?);", (y, ny, "$_NOT_"))
        cur.execute("INSERT INTO aby_cells (a, b, y, type) VALUES (?, ?, ?, ?);", (a, b, y, target))
    cur.execute(f"DELETE FROM aby_cells WHERE type = \"{ntarget}\"")
    db.commit()
    return cur.rowcount

