import sqlite3
import json
from . import formatter


# A netlist database can only hold one module/netlist.
class NetlistDatabase(sqlite3.Connection):
    def _create_tables(self):
        cur = self.cursor()
        # NOTE: Wire's id starts from 2.
        # 0 and 1 are reserved for constant 0 and 1.
        cur.execute("""
            CREATE TABLE IF NOT EXISTS wire (
                id INTEGER PRIMARY KEY,
                width INTEGER
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS dffe_xx (
                d INTEGER,
                c INTEGER,
                e INTEGER,
                q INTEGER,
                type VARCHAR(255),
                PRIMARY KEY (d, c, e, type)
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS qmux (
                c INTEGER,
                qs JSON,
                ss JSON,
                y INTEGER,
                dffe_type VARCHAR(255),
                PRIMARY KEY (qs, ss, dffe_type)
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS binary_gate (
                a INTEGER,
                b INTEGER,
                y INTEGER,
                type VARCHAR(255),
                PRIMARY KEY (a, b, type)
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS unary_gate (
                a INTEGER,
                y INTEGER,
                type VARCHAR(255),
                PRIMARY KEY (a, type)
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS mux (
                a INTEGER,
                b INTEGER,
                s INTEGER,
                y INTEGER,
                PRIMARY KEY (a, b, s)
            );
        """)
        cur.execute("""
            CREATE TABLE IF NOT EXISTS blackbox (
                inputs JSON,
                output INTEGER,
                type VARCHAR(255)
            );
        """)
        self.commit()

    def __init__(self, db_path: str = ":memory:"):
        super().__init__(db_path)
        self._create_tables()

    def build_from_json(self, netlist: dict, target_module: str, ignore_errors: bool = False):
        module_data = formatter.json_to_db(netlist, target_module, ignore_errors=ignore_errors)
        wire_data = [(w["id"], w["width"]) for w in module_data["wire"]]
        binary_gate_data = [(g["a"], g["b"], g["y"], g["type"]) for g in module_data["binary_gate"]]
        dffe_xx_data = [(d["d"], d["c"], d["e"], d["q"], d["type"]) for d in module_data["dffe_xx"]]
        unary_gate_data = [(u["a"], u["y"], u["type"]) for u in module_data["unary_gate"]]
        mux_data = [(m["a"], m["b"], m["s"], m["y"]) for m in module_data["mux"]]
        blackbox_data = [(json.dumps(b["inputs"]), b["output"], b["type"]) for b in module_data["blackbox"]]

        cur = self.cursor()
        cur.executemany("INSERT INTO wire (id, width) VALUES (?, ?)", wire_data)
        cur.executemany("INSERT OR IGNORE INTO binary_gate (a, b, y, type) VALUES (?, ?, ?, ?)", binary_gate_data)
        cur.executemany("INSERT INTO dffe_xx (d, c, e, q, type) VALUES (?, ?, ?, ?, ?)", dffe_xx_data)
        cur.executemany("INSERT OR IGNORE INTO unary_gate (a, y, type) VALUES (?, ?, ?)", unary_gate_data)  # ignore duplicates
        cur.executemany("INSERT OR IGNORE INTO mux (a, b, s, y) VALUES (?, ?, ?, ?)", mux_data)
        cur.executemany("INSERT INTO blackbox (inputs, output, type) VALUES (?, ?, ?)", blackbox_data)
        self.commit()

    def get_next_id(self) -> int:
        cur = self.cursor()
        cur.execute("SELECT MAX(id) FROM wire")
        max_id = cur.fetchone()[0]
        return 2 if max_id is None else max_id + 1
