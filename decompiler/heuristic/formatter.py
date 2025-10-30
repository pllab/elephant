BINARY_GATES = {"$_NAND_", "$_ORNOT_", "$_AND_", "$_XNOR_", "$_ANDNOT_", "$_XOR_", "$_OR_", "$_NOR_"}

UNARY_GATES = {"$_NOT_"}

DFF_GATES = {"$_DFFE_PP_", "$_DFFE_PN_"}

ALL_GATES = BINARY_GATES | UNARY_GATES | DFF_GATES


def blif_to_db(blif: dict, target_module: str, ignore_errors: bool = False) -> dict:
    db = {}
    module = blif["modules"][target_module]
    wires: set[int] = set()

    # attributes
    db["attributes"] = module["attributes"]

    # gates
    db["binary_gates"] = []
    db["unary_gates"] = []
    db["dffe_xxs"] = []
    db["muxes"] = []
    for alias, cell in module["cells"].items():
        cell_type = cell["type"]
        if cell_type in DFF_GATES:
            d, c, e, q = cell["connections"]["D"][0], cell["connections"]["C"][0], cell["connections"]["E"][0], cell["connections"]["Q"][0]
            db["dffe_xxs"].append(
                {
                    "d": d, "c": c, "e": e, "q": q,
                    "type": cell_type,
                    "alias": alias if alias else None
                }
            )
            [wires.add(w) for w in [d, c, e, q]]
        elif cell_type == "$_MUX_":
            a, b, s, y = cell["connections"]["A"][0], cell["connections"]["B"][0], cell["connections"]["S"][0], cell["connections"]["Y"][0]
            db["muxes"].append(
                {
                    "a": a, "b": b, "s": s, "y": y,
                    "alias": alias if alias else None
                }
            )
            [wires.add(w) for w in [a, b, s, y]]
        elif cell_type in BINARY_GATES:
            a, b, y = cell["connections"]["A"][0], cell["connections"]["B"][0], cell["connections"]["Y"][0]
            db["binary_gates"].append(
                {
                    "a": a, "b": b, "y": y,
                    "type": cell_type,
                    "alias": alias if alias else None
                }
            )
            [wires.add(w) for w in [a, b, y]]
        elif cell_type in UNARY_GATES:
            a, y = cell["connections"]["A"][0], cell["connections"]["Y"][0]
            db["unary_gates"].append(
                {
                    "a": a, "y": y,
                    "type": cell_type,
                    "alias": alias if alias else None
                }
            )
            [wires.add(w) for w in [a, y]]
        elif not ignore_errors:
            raise ValueError(f"Unknown cell type: {cell_type}")

    # wires
    db["wires"] = [{"id": w, "width": 1} for w in wires]
    db["inputs"] = []
    db["outputs"] = []
    ports = module["ports"]
    for alias, port in ports.items():
        direction, bits = port["direction"], port["bits"]
        if direction == "input":
            db["inputs"].extend(bits)
        elif direction == "output":
            db["outputs"].extend(bits)
        elif not ignore_errors:
            raise ValueError(f"Unknown port direction: {direction}")

        # add alias
        # if len(bits) == 1:
        #     db["wires"][bits[0]]["alias"] = alias
        # else:
        #     for i, b in enumerate(bits):
        #         db["wires"][b]["alias"] = f"{alias}[{i}]"

    return db


if __name__ == "__main__":
    NETLIST_FILE = "pico.json"

    import json
    with open(NETLIST_FILE, "r") as f:
        blif = json.load(f)
    db = blif_to_db(blif, "picorv32")
    new_file = NETLIST_FILE.replace(".json", "_db.json")
    with open(new_file, "w") as f:
        json.dump(db, f, indent=2)