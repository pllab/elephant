BINARY_GATES = {"$_NAND_", "$_ORNOT_", "$_AND_", "$_XNOR_", "$_ANDNOT_", "$_XOR_", "$_OR_", "$_NOR_"}
UNARY_GATES = {"$_NOT_"}
DFFE_GATES = {"$_DFFE_PP_", "$_DFFE_PN_", "$_DFFE_NP_", "$_DFFE_NN_"}


def json_to_db(netlist: dict, target_module: str, ignore_errors: bool = False) -> dict[str, dict]:
    # When set ignore_errors to True, the function will not raise an error when it encounters an unknown cell type.
    db = {}
    module: dict[str, dict] = netlist["modules"][target_module]
    wires: set[int] = set()

    # attributes
    db["attributes"] = module["attributes"]

    # gates
    db["binary_gate"] = []
    db["unary_gate"] = []
    db["dffe_xx"] = []
    db["mux"] = []
    db["blackbox"] = []
    for cell in module["cells"].values():
        cell_type = cell["type"]
        if cell_type in DFFE_GATES:
            d, c, e, q = tuple(map(int, (cell["connections"]["D"][0], cell["connections"]["C"][0], cell["connections"]["E"][0], cell["connections"]["Q"][0])))
            db["dffe_xx"].append({
                "d": d, "c": c, "e": e, "q": q,
                "type": cell_type
            })
            [wires.add(w) for w in [d, c, e, q]]
        elif cell_type == "$_MUX_":
            a, b, s, y = tuple(map(int, (cell["connections"]["A"][0], cell["connections"]["B"][0], cell["connections"]["S"][0], cell["connections"]["Y"][0])))
            db["mux"].append({
                "a": a, "b": b, "s": s, "y": y
            })
            [wires.add(w) for w in [a, b, s, y]]
        elif cell_type in BINARY_GATES:
            a, b, y = tuple(map(int, (cell["connections"]["A"][0], cell["connections"]["B"][0], cell["connections"]["Y"][0])))
            db["binary_gate"].append({
                "a": a, "b": b, "y": y,
                "type": cell_type
            })
            [wires.add(w) for w in [a, b, y]]
        elif cell_type in UNARY_GATES:
            a, y = int(cell["connections"]["A"][0]), int(cell["connections"]["Y"][0])
            db["unary_gate"].append({
                "a": a, "y": y,
                "type": cell_type
            })
            [wires.add(w) for w in [a, y]]
        elif ignore_errors:
            # put it in the blackbox
            output = None
            if "Y" in cell["connections"]:
                output = int(cell["connections"]["Y"][0])
            elif "Q" in cell["connections"]:
                output = int(cell["connections"]["Q"][0])
            if output is None:
                continue
            inputs = []
            for k, v in cell["connections"].items():
                if k not in ("Y", "Q"):
                    inputs.extend(map(int, v))
            db["blackbox"].append({
                "inputs": inputs,
                "output": output,
                "type": cell_type
            })
            [wires.add(w) for w in inputs]
        else:
            raise ValueError(f"Unknown cell type: {cell_type}")

    # wires
    db["wire"] = [{"id": w, "width": 1} for w in wires]
    db["input"] = []
    db["output"] = []
    ports = module["ports"]
    for port in ports.values():
        direction, bits = port["direction"], port["bits"]
        if direction == "input":
            db["input"].extend(bits)
        elif direction == "output":
            db["output"].extend(bits)
        elif not ignore_errors:
            raise ValueError(f"Unknown port direction: {direction}")

    return db