import sqlite3
from typing import Iterable
import json


class NetlistDB(sqlite3.Connection):
    cnt: int

    # auxiliary functions
    @staticmethod
    def to_str(v: Iterable) -> str:
        return ",".join(str(x) for x in v)

    @staticmethod
    def width_of(s: str) -> int:
        return s.count(",") + 1 if s else 0

    @staticmethod
    def to_bits(s: str) -> list[int | str]:
        return [x if x in {"0", "1", "x"} else int(x) for x in s.split(",")]

    @staticmethod
    def to_int(x: str | int) -> int:
        return x if isinstance(x, int) else int(x, base=2)

    @staticmethod
    def len(s: str) -> int:
        try:
            return len(json.loads(s))
        except json.JSONDecodeError:
            return 0

    def tables_startswith(self, prefix: str) -> list[str]:
        cur = self.execute("SELECT name FROM sqlite_master WHERE type='table' AND name LIKE ?;", (prefix + "%",))
        return [row[0] for row in cur.fetchall()]

    def next_wire(self) -> str:
        self.cnt += 1
        return str(self.cnt)

    def __init__(self, schema_file: str, db_file: str, cnt: int = 0):
        """
        Arguments:
        - `schema_file`: Path to the SQL schema file.
        - `db_file`: Path to the SQLite database file. Use ":memory:" for an in-memory database.
        - `cnt`: Initial count for wire generation. Defaults to 0.
        """
        super().__init__(db_file)
        with open(schema_file, "r") as f:
            self.executescript(f.read())
        self.create_function("len", 1, self.len)
        self.cnt = cnt

    def build_from_json(self, mod: dict):
        ports: dict = mod["ports"]
        cells: dict = mod["cells"]

        # build ports
        db_ports = []
        for name, port in ports.items():
            db_ports.extend((name, wire, port["direction"]) for wire in port["bits"])
        self.executemany("INSERT OR IGNORE INTO ports (name, wire, direction) VALUES (?, ?, ?)", db_ports)

        # build cells
        for cell in cells.values():
            cell_type, conns = cell["type"], cell["connections"]
            if cell_type in {"$_AND_", "$_OR_"}:            # aby_cells
                self.execute("INSERT INTO aby_cells (type, a, b, y) VALUES (?, ?, ?, ?)", (cell_type, int(conns["A"][0]), int(conns["B"][0]), int(conns["Y"][0])))
            elif cell_type == "$_NOT_":                     # ay_cells
                self.execute("INSERT INTO ay_cells (type, a, y) VALUES (?, ?, ?)", (cell_type, int(conns["A"][0]), int(conns["Y"][0])))
            elif cell_type == "$_MUX_":                     # absy_cells
                self.execute("INSERT INTO absy_cells (type, a, b, s, y) VALUES (?, ?, ?, ?, ?)", (cell_type, int(conns["A"][0]), int(conns["B"][0]), int(conns["S"][0]), int(conns["Y"][0])))
            elif cell_type in {"$_DFFE_PP_", "$_DFF_P_"}:   # dffes
                e = int(conns["E"][0]) if "E" in conns else 1
                self.execute("INSERT INTO dffes (d, e, clk, q) VALUES (?, ?, ?, ?)", (int(conns["D"][0]), e, int(conns["C"][0]), int(conns["Q"][0])))
            else:
                raise ValueError(f"Unsupported cell type: {cell_type}")

        self.commit()

    def dump_tables(self) -> dict:
        # get all tables
        cur = self.execute("SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")
        db = {}
        for (table,) in cur.fetchall():
            cur.execute(f"SELECT * FROM {table}")
            rows = cur.fetchall()
            db[table] = [dict(zip([col[0] for col in cur.description], row)) for row in rows]

        return db