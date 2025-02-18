import sqlite3
import pyrtl
import time
from .AbstractMem import AbstractMem
from . import formatter
from . import rewriter


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
            reg.next <<= pyrtl.mux(e, d, reg)
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
        # return None if it's not a concat
        # return a list of 1-bit input wires if it's a concat
        cur = self.cursor()
        cur.execute(f"SELECT input, left, right FROM concat WHERE output = ? ORDER BY left;", (output,))
        rows = cur.fetchall()
        if not rows:    # not a concat
            return None
        inputs = []
        for input, left, right in rows:
            if left == right:
                inputs.append(input)
            else:
                subinputs = self._find_concat_inputs(input)
                if subinputs is None:
                    return None
                inputs.extend(subinputs)
        return inputs


    def _build_from_sink(
        self,
        wire_id_to_pyrtl: dict[int, pyrtl.WireVector],
        sink: int,
        y: pyrtl.WireVector
    ):
        print(f"Building {sink}")
        if sink in wire_id_to_pyrtl:
            print(f"Built {sink}")
            return
        wire_id_to_pyrtl[sink] = y
        cur = self.cursor()
        # if it's an output of a binary gate
        cur.execute(f"SELECT a, b, type FROM binary_gate WHERE y = ? AND type != '$_MUX_' LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            a, b, type = row
            if a not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, a, pyrtl.WireVector(bitwidth=1))
            if b not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, b, pyrtl.WireVector(bitwidth=1))
            self._build_binary_gate(wire_id_to_pyrtl[a], wire_id_to_pyrtl[b], y, type)
            print(f"Built {sink}")
            return
        # if it's an output of a unary gate
        cur.execute(f"SELECT a, type FROM unary_gate WHERE y = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            a, type = row
            if a not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, a, pyrtl.WireVector(bitwidth=1))
            self._build_unary_gate(wire_id_to_pyrtl[a], y, type)
            print(f"Built {sink}")
            return
        # if it's an output of a mux
        cur.execute(f"SELECT a, b, s FROM mux WHERE y = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            a, b, s = row
            if a not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, a, pyrtl.WireVector(bitwidth=1))
            if b not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, b, pyrtl.WireVector(bitwidth=1))
            if s not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, s, pyrtl.WireVector(bitwidth=1))
            y <<= pyrtl.mux(wire_id_to_pyrtl[s], wire_id_to_pyrtl[a], wire_id_to_pyrtl[b])
            print(f"Built {sink}")
            return
        cur.execute(f"SELECT d, e, type FROM dffe_xx WHERE q = ? LIMIT 1;", (sink,))
        row = cur.fetchone()
        if row:
            d, e, type = row
            if d not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, d, pyrtl.WireVector(bitwidth=1))
            if e not in wire_id_to_pyrtl:
                self._build_from_sink(wire_id_to_pyrtl, e, pyrtl.WireVector(bitwidth=1))
            self._build_dffe_xx(wire_id_to_pyrtl[d], wire_id_to_pyrtl[e], y, type)
            print(f"Built {sink}")
            return
        raise ValueError(f"Sink {sink} is not connected to any source")


    def extract_mems(self):
        times = []
        # saturate
        time_start = time.time()

        # group registers
        rewriter.rewrite_dffe_pn_to_pp(self)
        rewriter.group_dffe_pp(self)

        # basic boolean rules
        # updated = True
        # while updated:
        #     updated = False
        #     updated = True if rewriter.saturate_comm(self, "$_AND_") > 0 else updated
        #     updated = True if rewriter.saturate_comm(self, "$_OR_") > 0 else updated
        #     updated = True if rewriter.saturate_demorgan(self, "$_AND_", "$_OR_") else updated
        #     updated = True if rewriter.saturate_demorgan(self, "$_OR_", "$_AND_") else updated
        #     updated = True if rewriter.saturate_idemp(self, "$_NOT_") else updated

        # reduce muxes
        rewriter.rewrite_2_1_mux_to_binary_gate(self)
        print("q_mux")
        while rewriter.reduce_q_mux_once(self):
            pass
        print("DONE")
        while rewriter.reduce_mux_once(self):
            pass

        cur = self.cursor()
        cur.execute("SELECT wire.width, COUNT(*) FROM binary_gate JOIN wire ON binary_gate.b = wire.id WHERE type = '$_MUX_' GROUP BY wire.width")
        res = cur.fetchall()
        for width, count in res:
            print(f"Number of {width}-1 Muxes: {count}")

        cur.execute("SELECT wire.width, binary_gate.y FROM binary_gate JOIN wire ON binary_gate.b = wire.id WHERE type = '$_MUX_' AND wire.width > 4;")
        print("Muxes with width > 4:")
        for width, y in cur.fetchall():
            print(f"Output: {y}, Width: {width}")

        times.append(time.time() - time_start) # saturation time
        time_start = time.time()

        # extract memories
        mems = rewriter.find_memory(self)
        print("-" * 20)
        for i, (regs, (readports, writeports)) in enumerate(mems.items()):
            print(f"Memory {i}:")
            print(f"- Registers: {regs}")
            print(f"- Data Width: {len(readports[0][1])}")
            print(f"- Number of Entries: {len(regs)}")
            print(f"- Read Ports:")
            for j, (_, y, a) in enumerate(readports):
                print(f"-- Read port {j}:")
                print(f"--- Read Data Wires: {y}")
                print(f"--- Read Address wire: {a}")
            print(f"- Write Ports:")
            for i, (wds, wes) in enumerate(writeports):
                print(f"-- Write port {i}:")
                print(f"--- Write Data Wires: {wds}")
                print(f"--- Write Raw Enable Wires: {wes}")
                wen, waddr = rewriter.create_write_port_from_wes(self, wes)
                print(f"--- Write Enable Wire: {wen}")
                print(f"--- Write Address Wire: {waddr}")
            print("-" * 20)

        times.append(time.time() - time_start) # memory extraction time
        print(f"Saturation time: {times[0]}")
        print(f"Memory extraction time: {times[1]}")
        print(f"Total time: {sum(times)}")


    def to_pyrtl(self) -> pyrtl.Block:
        pyrtl.reset_working_block()

        # these are ports ready to be connected
        input_to_pyrtl: dict[int, pyrtl.WireVector] = {}
        output_to_pyrtl: dict[int, pyrtl.WireVector] = {}

        # define inputs & outputs
        ports = self.target_blif["ports"]
        for alias, port in ports.items():
            bits = port["bits"]
            if port["direction"] == "input":
                # rule out clk and clock
                if alias.lower() in ["clk", "clock"]:
                    continue
                input = pyrtl.Input(bitwidth=len(bits), name=alias)
                bits_in_input = pyrtl.chop(input, *(1 for _ in range(len(bits))))
                for i, bit in enumerate(bits):
                    input_to_pyrtl[bit] = bits_in_input[i]
            elif port["direction"] == "output":
                output_bits: list[pyrtl.WireVector] = []
                for bit in bits:
                    if bit in input_to_pyrtl: # output is connected to input
                        output_bits.append(input_to_pyrtl[bit])
                    else:
                        output_bit = pyrtl.WireVector(bitwidth=1)
                        output_bits.append(output_bit)
                        output_to_pyrtl[bit] = output_bit
                output = pyrtl.Output(bitwidth=len(bits), name=alias)
                output_tmp = pyrtl.concat(*output_bits)
                output <<= output_tmp
            else:
                raise ValueError(f"Invalid port direction: {port['direction']}")

        # extract memories
        mems = rewriter.find_memory(self)
        mem_input_to_pyrtl: dict[int, pyrtl.WireVector] = {}
        mem_output_to_pyrtl: dict[int, pyrtl.WireVector] = {}

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
            height = 2 ** cur.fetchone()[0]

            # create a write port
            wdata, wens = writeports[0]
            wen, waddr = rewriter.create_write_port_from_wes(self, wens)
            mem_input_to_pyrtl[wen] = pyrtl.WireVector(bitwidth=1)
            # create a write data bundle
            wdata_bundle_bits = [pyrtl.WireVector(bitwidth=1) for _ in range(width)]
            wdata_bundle = pyrtl.concat(*wdata_bundle_bits)
            for i, bit in enumerate(wdata):
                mem_input_to_pyrtl[bit] = wdata_bundle_bits[i]
            # create a write address bundle
            waddr_bits = self._find_concat_inputs(waddr)
            if waddr_bits is None:
                raise ValueError("Write address is not a concat")
            waddr_bundle_bits = [pyrtl.WireVector(bitwidth=1) for _ in range(len(waddr_bits))]
            waddr_bundle = pyrtl.concat(*waddr_bundle_bits)
            for i, bit in enumerate(waddr_bits):
                mem_input_to_pyrtl[bit] = waddr_bundle_bits[i]
            wp = AbstractMem.WritePort(
                addr=waddr_bundle,
                data=wdata_bundle,
                en=mem_input_to_pyrtl[wen]
            )

            # create read ports
            rps = []
            for _, rdata, raddr in readports:
                # create a read data bundle
                rdata_bundle = pyrtl.WireVector(bitwidth=width)
                rdata_bundle_bits = pyrtl.chop(rdata_bundle, *(1 for _ in range(width)))
                for i, bit in enumerate(rdata):
                    mem_output_to_pyrtl[bit] = rdata_bundle_bits[i]
                # create a read address bundle
                raddr_bits = self._find_concat_inputs(raddr)
                if raddr_bits is None:
                    raise ValueError("Read address is not a concat")
                raddr_bundle_bits = []
                for bit in raddr_bits:
                    if bit in input_to_pyrtl:   # read address is connected to an input
                        raddr_bundle_bits.append(input_to_pyrtl[bit])
                    else:
                        bit_tmp = pyrtl.WireVector(bitwidth=1)
                        raddr_bundle_bits.append(bit_tmp)
                        mem_input_to_pyrtl[bit] = bit_tmp
                raddr_bundle = pyrtl.concat(*raddr_bundle_bits)
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
        # these are wires already created
        wire_id_to_pyrtl: dict[int, pyrtl.WireVector] = {}
        # sources
        wire_id_to_pyrtl.update(input_to_pyrtl)
        wire_id_to_pyrtl.update(mem_output_to_pyrtl)

        # build from outputs of the module
        for output, y in output_to_pyrtl.items():
            self._build_from_sink(wire_id_to_pyrtl, output, y)

        # build from inputs of the memories
        for input, y in mem_input_to_pyrtl.items():
            if input in output_to_pyrtl: # it's driven by an output
                y <<= output_to_pyrtl[input]
            else:
                self._build_from_sink(wire_id_to_pyrtl, input, y)

        with open("id_to_pyrtl.txt", "w") as f:
            for id, wire in wire_id_to_pyrtl.items():
                f.write(f"{id}: {wire}\n")

        return pyrtl.working_block()