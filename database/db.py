import sqlite3
import pyrtl
from .AbstractMem import AbstractMem
from . import formatter
from . import rewriter
from math import log2


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
    target_blif: dict

    def __init__(self, db_path: str = ":memory:"):
        super().__init__(db_path)
        create_tables(self)


    def build_from_blif(self, blif: dict, target_module: str, ignore_errors: bool = False):
        self.target_blif = blif["modules"][target_module]
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


    @staticmethod
    def _get_wire(wire_id_to_pyrtl: dict[int, pyrtl.WireVector], id: int, width = 1) -> pyrtl.WireVector:
        if id not in wire_id_to_pyrtl:
            wire_id_to_pyrtl[id] = pyrtl.WireVector(bitwidth=width)
        return wire_id_to_pyrtl[id]


    @staticmethod
    def _build_binary_gate(a: pyrtl.WireVector, b: pyrtl.WireVector, y: pyrtl.WireVector, type: str):
        if type == "$_AND_":
            y <<= a & b
        elif type == "$_OR_":
            y <<= a | b
        elif type == "$_XOR_":
            y <<= a ^ b
        elif type == "$_NAND_":
            y <<= ~(a & b)
        elif type == "$_NOR_":
            y <<= ~(a | b)
        elif type == "$_XNOR_":
            y <<= ~(a ^ b)
        elif type == "$_ANDNOT_":
            y <<= a & ~b
        elif type == "$_ORNOT_":
            y <<= a | ~b
        else:
            raise ValueError(f"Unsupported binary gate type: {type}")


    @staticmethod
    def _build_dffe_xx(d: pyrtl.WireVector, e: pyrtl.WireVector, q: pyrtl.WireVector, type: str):
        # clk is not used
        if type == "$_DFFE_PP_":
            reg = pyrtl.Register(bitwidth=1)
            with pyrtl.conditional_assignment:
                with e:
                    reg.next |= d
            q <<= reg
        else:
            raise ValueError(f"Unsupported DFFE type: {type}")


    @staticmethod
    def _build_unary_gate(a: pyrtl.WireVector, y: pyrtl.WireVector, type: str):
        if type == "$_NOT_":
            y <<= ~a
        else:
            raise ValueError(f"Unsupported unary gate type: {type}")


    def _find_concat_inputs(self, output: int) -> list[int] | None:
        # return None if it's not a concat or the inputs are not 1-bit
        cur = self.cursor()
        cur.execute(f"SELECT input, left, right FROM concat WHERE output = ? ORDER BY left;", (output,))
        rows = cur.fetchall()
        if not rows:    # not a concat
            return None
        for i, (_, left, right) in enumerate(rows):
            if left != i:
                return None
            if right != i + 1:
                return None
        return [row[0] for row in rows]


    def _build_from_sink(
        self,
        wire_id_to_pyrtl: dict[int, pyrtl.WireVector],
        sources: set[int],  # source wires, e.g. inputs, memory outputs
        sink: int
    ):
        # assume sink is already in wire_id_to_pyrtl (created)
        if sink in sources:
            return
        cur = self.cursor()
        # if it's an output of a binary gate
        cur.execute(f"SELECT a, b, type FROM binary_gate WHERE y = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        y = wire_id_to_pyrtl[sink]
        if row:
            a, b, type = row
            if a not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[a] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, a)
            if b not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[b] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, b)
            self._build_binary_gate(wire_id_to_pyrtl[a], wire_id_to_pyrtl[b], y, type)
            return
        # if it's an output of a unary gate
        cur.execute(f"SELECT a, type FROM unary_gate WHERE y = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            a, type = row
            if a not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[a] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, a)
            self._build_unary_gate(wire_id_to_pyrtl[a], y, type)
            return
        # if it's an output of a mux
        cur.execute(f"SELECT a, b, s FROM mux WHERE y = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            a, b, s = row
            if a not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[a] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, a)
            if b not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[b] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, b)
            if s not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[s] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, s)
            y <<= pyrtl.mux(wire_id_to_pyrtl[s], wire_id_to_pyrtl[a], wire_id_to_pyrtl[b])
            return
        cur.execute(f"SELECT d, e, type FROM dffe_xx WHERE q = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            d, e, type = row
            if d not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[d] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, d)
            if e not in wire_id_to_pyrtl:
                wire_id_to_pyrtl[e] = pyrtl.WireVector(bitwidth=1)
                self.build_from_sink(wire_id_to_pyrtl, sources, e)
            self._build_dffe_xx(wire_id_to_pyrtl[d], wire_id_to_pyrtl[e], y, type)
            return
        raise ValueError(f"Sink {sink} is not connected to any source")


    def to_pyrtl(self) -> pyrtl.Block:
        pyrtl.reset_working_block()
        wire_id_to_pyrtl: dict[int, pyrtl.WireVector] = {}
        input_ids, output_ids = set(), set()

        # define inputs & outputs
        ports = self.target_blif["ports"]
        for alias, port in ports.items():
            bits = port["bits"]
            if port["direction"] == "input":
                input = pyrtl.Input(bitwidth=len(bits), name=alias)
                bits_in_input = pyrtl.chop(input, *(1 for _ in range(len(bits))))
                for i, bit in enumerate(bits):
                    wire_id_to_pyrtl[bit] = bits_in_input[i]
                    input_ids.add(bit)
            elif port["direction"] == "output":
                bits_in_output = [pyrtl.WireVector(bitwidth=1) for _ in range(len(bits))]
                for i, bit in enumerate(bits):
                    wire_id_to_pyrtl[bit] = bits_in_output[i]
                    output_ids.add(bit)
                bits = pyrtl.concat(*bits_in_output)
                output = pyrtl.Output(bitwidth=len(bits), name=alias)
                output <<= bits
            else:
                raise ValueError(f"Invalid port direction: {port['direction']}")

        # extract memories
        mems = rewriter.find_memory(self)
        mem_input_ids, mem_output_ids = set(), set()

        for _, (readports, writeports) in mems.items():
            if len(readports) == 0: # not a memory
                continue
            if len(writeports) > 1:
                raise NotImplementedError("Multiple write ports not supported")
            width = readports[0][0]
            cur = self.cursor()
            cur.execute(
                f"SELECT width FROM wire WHERE id = ?;",
                (readports[0][2],)
            )
            height = cur.fetchone()[0]

            # create a write port
            wdata, wens = writeports[0]
            wen, waddr = rewriter.create_write_port_from_wes(self, wens)
            mem_input_ids.add(wen)
            # create a write data bundle
            wdata_bundle_bits = [pyrtl.WireVector(bitwidth=1) for _ in range(width)]
            wdata_bundle = pyrtl.concat(*wdata_bundle_bits)
            for i, bit in enumerate(wdata):
                wire_id_to_pyrtl[bit] = wdata_bundle_bits[i]
                mem_input_ids.add(bit)
            # create a write address bundle
            waddr_bits = self._find_concat_inputs(waddr)
            if waddr_bits is None:
                raise ValueError("Write address is not a concat")
            waddr_bundle_bits = [pyrtl.WireVector(bitwidth=1) for _ in range(len(waddr_bits))]
            waddr_bundle = pyrtl.concat(*waddr_bundle_bits)
            for i, bit in enumerate(waddr_bits):
                wire_id_to_pyrtl[bit] = waddr_bundle_bits[i]
                mem_input_ids.add(bit)
            wp = AbstractMem.WritePort(
                addr=waddr_bundle,
                data=wdata_bundle,
                enable=self._get_wire(wire_id_to_pyrtl, wen)
            )

            # create read ports
            rps = []
            for _, rdata, raddr in readports:
                # create a read data bundle
                rdata_bundle = pyrtl.WireVector(bitwidth=width)
                rdata_bundle_bits = pyrtl.chop(rdata_bundle, *(1 for _ in range(width)))
                for i, bit in enumerate(rdata):
                    wire_id_to_pyrtl[bit] = rdata_bundle_bits[i]
                    mem_output_ids.add(bit)
                # create a read address bundle
                raddr_bits = self._find_concat_inputs(raddr)
                if raddr_bits is None:
                    raise ValueError("Read address is not a concat")
                raddr_bundle_bits = [pyrtl.WireVector(bitwidth=1) for _ in range(len(raddr_bits))]
                raddr_bundle = pyrtl.concat(*raddr_bundle_bits)
                for i, bit in enumerate(raddr_bits):
                    wire_id_to_pyrtl[bit] = raddr_bundle_bits[i]
                    mem_input_ids.add(bit)
                rp = AbstractMem.ReadPort(
                    addr=raddr_bundle,
                    data=rdata_bundle,
                    en=pyrtl.Const(1)
                )
                rps.append(rp)

            # create an abstract memory
            amem = AbstractMem(
                width=width,    # data width
                height=height,  # number of entries
                read_ports=rps,
                write_ports=[wp]
            )
            amem.to_pyrtl(pyrtl.working_block())

        # define internal wires
        # dfs from outputs
        sources = input_ids | mem_output_ids
        for output_id in output_ids:
            self._build_from_sink(wire_id_to_pyrtl, sources, output_id)
        # dfs from memory inputs
        for mem_input_id in mem_input_ids:
            self._build_from_sink(wire_id_to_pyrtl, sources, mem_input_id)

        return pyrtl.working_block()