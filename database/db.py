import sqlite3
import formatter


def create_tables(conn: sqlite3.Connection):
    cur = conn.cursor()
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS wire (
            id INTEGER PRIMARY KEY,
            width INTEGER
        );
        """
    )
    # cur.execute(
    #     """
    #     CREATE TABLE IF NOT EXISTS demux (
    #         a INTEGER,
    #         s INTEGER,
    #         y INTEGER,
    #         PRIMARY KEY (a, s, y)
    #     """
    # )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS dffe_xx (
            d INTEGER,
            c INTEGER,
            e INTEGER,
            q INTEGER,
            type VARCHAR(255),
            PRIMARY KEY (d, c, e, type)
        );
        """
    )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS binary_gate (
            a INTEGER,
            b INTEGER,
            y INTEGER,
            type VARCHAR(255),
            PRIMARY KEY (a, b, type)
        );
        """
    )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS selector (
            input INTEGER,
            output INTEGER,
            left INTEGER,
            right INTEGER,
            PRIMARY KEY (input, left, right)
        );
        """
    )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS concat (
            input INTEGER,
            output INTEGER,
            left INTEGER,
            right INTEGER,
            PRIMARY KEY (output, left, right)
        );
        """
    )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS unary_gate (
            a INTEGER,
            y INTEGER,
            type VARCHAR(255),
            PRIMARY KEY (a, type)
        );
        """
    )
    cur.execute(
        """
        CREATE TABLE IF NOT EXISTS mux (
            a INTEGER,
            b INTEGER,
            s INTEGER,
            y INTEGER,
            PRIMARY KEY (a, b, s)
        );
        """
    )
    conn.commit()


def insert_records(conn: sqlite3.Connection, table: str, records: list):
    if not records:
        return
    cur = conn.cursor()
    placeholds = ("?," * len(records[0]))[:-1]
    cur.executemany(
        f"INSERT OR IGNORE INTO {table} VALUES ({placeholds});",
        records
    )
    conn.commit()


class NetlistDatabase(sqlite3.Connection):
    PORTS = {
        "dffe_xx": ["d", "c", "e", "q"],
        "binary_gate": ["a", "b", "y"],
        "unary_gate": ["a", "y"],
        "mux": ["a", "b", "s", "y"],
        "concat": ["input", "output"],
        "selector": ["input", "output"],
    }

    def __init__(self, db_path: str = ":memory:"):
        super().__init__(db_path)
        create_tables(self)


    def build_from_blif(self, blif: dict, target_module: str, ignore_errors: bool = False):
        netlist = formatter.blif_to_db(blif, target_module, ignore_errors)
        wire_data = [(w["id"], w["width"]) for w in netlist["wires"]]
        binary_gate_data = [(g["a"], g["b"], g["y"], g["type"]) for g in netlist["binary_gates"]]
        dffe_xx_data = [(d["d"], d["c"], d["e"], d["q"], d["type"]) for d in netlist["dffe_xxs"]]
        unary_gate_data = [(u["a"], u["y"], u["type"]) for u in netlist["unary_gates"]]
        mux_data = [(m["a"], m["b"], m["s"], m["y"]) for m in netlist["muxes"]]

        insert_records(self, "wire", wire_data)
        insert_records(self, "binary_gate", binary_gate_data)
        insert_records(self, "dffe_xx", dffe_xx_data)
        insert_records(self, "unary_gate", unary_gate_data)
        insert_records(self, "mux", mux_data)

    def to_pyrtl(self) 