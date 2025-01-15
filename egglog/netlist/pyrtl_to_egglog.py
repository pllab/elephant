import pyrtl

op_map = {
    '~': 'Not',
    '&': 'And',
    '|': 'Or',
    '^': 'Xor',
    'n': 'Nand',
    'x': 'Mux',
    's': 'Select',
    'w': 'Wire',
    'r': 'Reg',
}

def _sanitize(name):
    return name.replace('[', '_').replace(']', '')

def _sanitize_in_make_expr(name):
    name = _sanitize(name)
    if "reg" in name:
        name += "_i"
    return name

def _make_expr(net):
    if net.op in '~&|^n':
        argvars = " ".join((_sanitize_in_make_expr(arg.name) for arg in net.args))
        argn = len(net.args)
        return f"({op_map[net.op]} {argvars})"
    elif net.op == 'x':
        argnames = [_sanitize_in_make_expr(arg.name) for arg in net.args]
        s = argnames[0]
        a = argnames[1]
        b = argnames[2]
        # return f"(Or (And {a} (Not {s})) (And {b} {s}))"
        return f"({op_map[net.op]} {argnames[0]} (Concat {argnames[1]} {argnames[2]}))"
    elif net.op == 'c':
        def _nest_concat(args):
            if len(args) == 2:
                return f"Concat {args[0]} {args[1]}"
            return f"Concat {args[0]} ({_nest_concat(args[1:])})"
        return '('+_nest_concat([arg.name for arg in net.args])+')'
    elif net.op in 'w':
        return _sanitize_in_make_expr(net.args[0].name)
    elif net.op in 'r':
        return _sanitize_in_make_expr(net.args[0].name)
    elif net.op == 's':
        extract_exp = ""
        slices = [a for a in net.op_param]
        monotone = True
        s = slices[0]
        for i in range(1, len(slices)):
            if s > slices[i]:
                monotone = False
                break
            monotone = True
            s = slices[i]
        if monotone:
            if slices[0] == slices[-1]:
                extract_exp = f"{op_map[net.op]} {slices[0]}"
            else:
                raise Exception("Error: Unsupported select type.")
                return
                # low = str(slices[0])
                # high = str(slices[-1])
                # extract_exp = f"{op_map[net.op]} {high} {low}"
        else:
            print("Error: Unsupported select type.")
            return
        dest = _sanitize_in_make_expr(net.args[0].name)
        return f"({extract_exp} {dest})"
    else:
        print("Unsupported op", net.op)
        return None

# Compile a PyRTL block to egglog language.
def to_egglog(NAME='top', synth=True, opt=False):
    
    if synth:
        pyrtl.synthesize(merge_io_vectors=False)
    if opt:
        pyrtl.optimize()

    block = pyrtl.working_block()
    print(block)

    lets = {}
    unions = {}
    ports = {}
    deletes = {}
    extracts = {}
        
    for net in block:
        # print(net)
        for wire in (net.dests + net.args):
            name = _sanitize(wire.name)

            if name in lets:
                continue

            if type(wire) == pyrtl.Register:
                let_i = f"(let {name + '_i'} (Wire \"{name + '_i'}\" {wire.bitwidth}))"
                let_o = f"(let {name + '_o'} (Wire \"{name + '_o'}\" {wire.bitwidth}))"
                let = let_i + '\n' + let_o
            else:
                let = f"(let {name} (Wire \"{name}\" {wire.bitwidth}))"
            lets[name] = let

            if name not in ports and type(wire) == pyrtl.Input:
                ports[name] = f";(IsPort \"\" \"{name}\" (Input) {name})"
            elif name not in ports and type(wire) == pyrtl.Output:
                ports[name] = f";(IsPort \"\" \"{name}\" (Output) {name})"
                deletes[name] = f"(delete (Wire \"{name}\" {wire.bitwidth}))"
                extracts[name] = f"(query-extract {name})"
            elif name not in deletes:
                if type(wire) == pyrtl.Register:
                    # del_i = f"(delete (Wire \"{name + '_i'}\" {wire.bitwidth}))"
                    del_o = f"(delete (Wire \"{name + '_o'}\" {wire.bitwidth}))"
                    # deletes[name] = del_i + '\n' + del_o
                    deletes[name] = del_o
                else:
                    if "_i" in name:
                        continue
                    deletes[name] = f"(delete (Wire \"{name}\" {wire.bitwidth}))"

        dest = net.dests[0]
        name = _sanitize(dest.name)
        if "reg" in name:
            name = name + "_o"
        union = f"(union {name} {_make_expr(net)})"
        unions[name] = union

    ## Output to egglog
    egglog = ["(include \"./netlist.egg\")"]
    for _,let in lets.items():
        #print(let)
        egglog.append(let)
    for _,union in unions.items():
        #print(union)
        egglog.append(union)
    # for _,port in ports.items():
    #     #print(port)
    #     egglog.append(port)
    for _,delete in deletes.items():
        #print(delete)
        egglog.append(delete)

    egglog.append("(run-schedule (repeat 15 (saturate typing) (saturate decomp)))")
    for _,extract in sorted(extracts.items()):
        #print(extract)
        egglog.append(extract)

    eggfile = NAME + '.egg'
    with open(eggfile, 'w') as f:
        f.write('\n'.join(egglog))
