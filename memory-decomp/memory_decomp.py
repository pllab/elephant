import pyrtl
import csv
import sys
import time
from argparse import ArgumentParser

NAME=""

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

def _make_expr(net):
    if net.op in '~&|^nx':
        argvars = " ".join((_sanitize(arg.name) for arg in net.args))
        argn = len(net.args)
        return f"{op_map[net.op]} {argvars}"
    elif net.op == 'c':
        def _nest_concat(args):
            if len(args) == 2:
                return f"Concat {args[0]} {args[1]}"
            return f"Concat {args[0]} ({_nest_concat(args[1:])})"
        return _nest_concat([arg.name for arg in net.args])
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
        dest = _sanitize(net.args[0].name)
        return f"{extract_exp} {dest}"
    else:
        print("Unsupported op", net.op)
        return None

def make_expr(block, start_wire, var, stopping_condition=(lambda x: x.name[-2:] == '_i')):
    if stopping_condition(start_wire):
        return
    connections, uses = block.net_connections()
    for net in uses[block.wirevector_by_name.get(start_wire.name)]:
        for dest in net.dests:
            var[dest.name] = _make_expr(net)
            make_expr(block, dest, var, stopping_condition)


# wrapper classes for organization
class RegisterEn:
    def __init__(self, name, width, ff_list, enable):
        self.name = name
        self.width = width
        self.ff_list = ff_list
        self.enable = enable
    
    def print_reg(self):
        print(self.name, end="[")
        print(self.width, end="]: ")
        for ff in self.ff_list:
            print(ff.name, end=" ")
        print()

class Memory:
    def __init__(self, name, addr_width, val_width, reg_list, write_enable, write_address, write_port, read_ports={}):
        self.name = name
        self.addr_width = addr_width
        self.val_width = val_width
        self.reg_list = reg_list
        self.write_enable = write_enable
        self.write_address = write_address
        self.write_port = write_port
        self.read_ports = read_ports

    def print_mem(self):
        print("++++++++++")
        print(self.name)
        print("addr_width:",end=" ")
        print(self.addr_width)
        print("val_width:",end=" ")
        print(self.val_width)
        print("reg_list:",end=" ")
        for r in self.reg_list:
            print(pyrtl.working_block().wirevector_by_name.get(r.name), end=" ")
        print()
        print("write enable:",end=" ")
        print(self.write_enable)
        print(f"write_address: ({len(self.write_address)}), {[str(a) for a in self.write_address]}")
        print(f"write_port: ({len(self.write_port)}), {[str(a) for a in self.write_port]}")
        print("read_ports:")
        for rps in self.read_ports.values():
            for k,v in rps.items():
                print(f" {k}: {v}")
        print("----------")

# gets the names of the args from a net connection
def parse_net_connection(str):
    return str[str.index(" --") + 4:].split(", ")

# checks if a PyRTL single-bit register is a DFFE (has a mux on top with an enable)
def is_dffe(reg, connections):
    parents = parse_net_connection(str(connections[reg])) 
    if reg not in connections or connections[reg].op != "r":
        return False
    parent = pyrtl.working_block().wirevector_by_name.get(parents[0].split("/")[0])  
    if parent not in connections or connections[parent].op != "x":
        return False
    if connections[parent].args[1].name != reg.name:
        return False
    return True

# finds the enable of an enabled register
def find_enable(reg, connections):
    parents = parse_net_connection(str(connections[reg])) 
    parent = pyrtl.working_block().wirevector_by_name.get(parents[0].split("/")[0])  
    gparents = parse_net_connection(str(connections[parent]))
    return pyrtl.working_block().wirevector_by_name.get(gparents[0].split("/")[0]) 

# upwards DFS from a start node, used to compute dependencies
def traverse_up(node, enable, visited, connections):
    visited[node] = 1

    ret = []
    if (str(node))[-1] == "R" and is_dffe(node, connections) and find_enable(node, connections).name == enable.name:    
        ret.append(node)

    if node in connections:
        parents = connections[node].args
        for parent in parents:
            parent_node = pyrtl.working_block().wirevector_by_name.get(parent.name)
            if visited[parent_node] == 0:
                ret.extend( traverse_up( parent_node, enable, visited, connections ) )
    return ret

def traverse_down(node, enable, visited, connections, uses):
    visited[node] = 1

    ret = []
    if (str(node))[-1] == "R" and is_dffe(node, connections) and find_enable(node, connections).name == enable.name:    
        ret.append(node)

    if node in uses:
        for use in uses[node]:
            child_node = pyrtl.working_block().wirevector_by_name.get(use.dest[0])
            if visited[child_node] == 0:
                ret.extend( traverse_up( child_node, enable, visited, connections ) )
    return ret

# modification of traverse_up() for more general purposes
def up(node, visited, connections):
    visited[node] = 1
    # print(node.name)
    # if node in connections:
    #     print(connections[node])

    if node in connections:
        parents = parse_net_connection(str(connections[node]))
        for parent in parents:
            parent_node = pyrtl.working_block().wirevector_by_name.get(parent.split("/")[0])
            if visited[parent_node] == 0:
                up( parent_node ) 

# topological sorts a dependency graph
def topo_sort(node, path, visited, dependencies):
    visited[node] = 1

    for x in dependencies[node]:
        if visited[x] == 0:
            topo_sort(x, path, visited, dependencies)
    
    path.append(node)

# driver method to aggregate all the registers
def get_final_regs(regs, nodes, visited, block):
    connections, uses = block.net_connections()
    
    start_time = time.time()
    regs_by_en = {}
    for reg in regs:
        if not is_dffe(reg, connections):
            continue
        if find_enable(reg, connections) not in regs_by_en:
            regs_by_en[find_enable(reg, connections)] = []
        regs_by_en[find_enable(reg, connections)].append(reg)
    times.append(time.time() - start_time)

    start_time = time.time()
    visited = {}
    for node in nodes:
        visited[node] = 0

    # reverse_dependencies = {}
    # for enable in regs_by_en:
    #     for reg in regs_by_en[enable]:
    #         for node in nodes:
    #             visited[node] = 0
    #         reverse_dependencies[reg] = traverse_up(reg, enable, visited, connections)
    
    # print("got reverse dependencies")

    # dependencies = {}
    # for key in reverse_dependencies:
    #     for val in reverse_dependencies[key]:
    #         if val not in dependencies:
    #             dependencies[val] = [key]
    #         else:
    #             dependencies[val].append(key)

    # print("got dependencies")

    dependencies = {}
    for enable in regs_by_en:
        for reg in regs_by_en[enable]:
            for node in nodes:
                visited[node] = 0
            dependencies[reg] = traverse_up(reg, enable, visited, connections)
            # print(reg)
            # for node in dependencies[reg]:
            #     print(node, end=" ")
            # print()
    times.append(time.time() - start_time)

    start_time = time.time()
    visited = {}
    for reg in regs:
        visited[reg] = 0

    final_regs = []
    for enable in regs_by_en:
        order = []
        for reg in regs_by_en[enable]:
            if visited[reg] == 0:
                topo_sort(reg, order, visited, dependencies)
        final_regs.append(RegisterEn("reg_" + enable.name, len(order), order, enable))
    times.append(time.time() - start_time)

    return final_regs

# performs block rewrites to physically aggregate the registers
# block1 must be current working_block, block2 is empy, function rewrites to block2 and sets working_block to block2
def reg_block_rewrites(final_regs, block1, block2, file_path=""):
    in_reg = {}
    for node in nodes:
        in_reg[node] = 0
    for reg in final_regs:
        for ff in reg.ff_list:
            in_reg[ff] = 1
    
    pyrtl.set_working_block(block2)

    for wv in block1.wirevector_set:
        if in_reg[wv] == 0:
            if isinstance(wv, pyrtl.wire.Input):
                block2.add_wirevector( pyrtl.wire.Input(bitwidth=wv.bitwidth, name=wv.name) )
            elif isinstance(wv, pyrtl.wire.Output):
                block2.add_wirevector( pyrtl.wire.Output(bitwidth=wv.bitwidth, name=wv.name) )
            elif isinstance(wv, pyrtl.wire.Const):
                block2.add_wirevector( pyrtl.wire.Const(val=wv.val, bitwidth=wv.bitwidth, name=wv.name) )
            elif isinstance(wv, pyrtl.wire.Register):
                block2.add_wirevector( pyrtl.wire.Register(bitwidth=wv.bitwidth, name=wv.name) )
            else:
                block2.add_wirevector( pyrtl.wire.WireVector(bitwidth=wv.bitwidth, name=wv.name) )

    for final_reg in final_regs:
        reg = pyrtl.wire.Register(bitwidth=final_reg.width, name=final_reg.name)
        inps = []
        for ind in range(0, final_reg.width):
            ff = final_reg.ff_list[ind]

            inp_name = ff.name + "_i"
            inp = pyrtl.wire.WireVector(bitwidth=1, name=inp_name)
            inps.append(inp)

            outp_name = ff.name + "_o"
            outp = pyrtl.wire.WireVector(bitwidth=1, name=outp_name)
            block2.add_net( pyrtl.core.LogicNet("s", ((ind,)), (reg,), (outp,)) )
        reg.next <<= pyrtl.corecircuits.concat_list(inps)

    for old_net in block1.logic:
        new_ops = [0]*len(old_net[3])
        operand = old_net.op
        for x in range(0, len(old_net[3])):
            outp = old_net[3][x]
            if in_reg[outp]:
                new_ops[x] = block2.wirevector_by_name.get(outp.name + "_i")
                if (operand == "r"):
                    operand = "w"
            else:
                new_ops[x] = block2.wirevector_by_name.get(outp.name)
        new_ips = [0]*len(old_net[2])
        for x in range(0, len(old_net[2])):
            inp = old_net[2][x]
            if in_reg[inp]:
                new_ips[x] = block2.wirevector_by_name.get(inp.name + "_o")
            else:
                new_ips[x] = block2.wirevector_by_name.get(inp.name)
        block2.add_net( pyrtl.core.LogicNet( operand, old_net.op_param, tuple(new_ips), tuple(new_ops) ) )

    if file_path == "":
        return

    with open (file_path, 'w') as svg:
        pyrtl.visualization.output_to_svg(svg)

def get_write_addr(reg_enables, block, mem):
    defs, _ = block.net_connections(include_virtual_nodes=False)
    n = mem.addr_width

    addr_logic = {}
    input_logic = set()
    # for each reg_enable wire
    # follow its gate inputs (ignoring mem_enable)
    # for N AND gates (where N is addr_width)
    # (folding NOT gates)
    for reg_enable in reg_enables:
        nets = [defs[reg_enable]]
        next_round = []
        # print('reg_enable', reg_enable)
        while n >= 0:
            # print('n', n)
            while nets:
                net = nets.pop()
                # print(' net', net)
                if net.op in '~&':
                    addr_logic[net.dests[0].name] = net
                    if n == 0:
                        input_logic.add(net)
                    if net.op == '~':
                        nets.append(defs[net.args[0]])
                    for arg in net.args:
                        if arg.name == mem.write_enable.name:
                            continue
                        if arg in defs:
                            next_round.append(defs[arg])
            nets = list(next_round)
            next_round = []
            n -= 1
        n = mem.addr_width

    # print(' ~~> possible address inputs!!')
    popular = {}
    for i in input_logic:
        # if i.op not in "~&":
        #     continue
        # if i.op == '&' and mem.enable.name in [a.name for a in i.args]:
        #     print(' ~~>',i)
        # else:
        # print(' ~~>',i)
        # This is annoyingly heuristic.
        # The answer is sort of like:
        # Check if there is a N-element subset that all share at least one input
        for arg in i.args:
            if arg.name in popular:
                popular[arg.name] += 1
            else:
                popular[arg.name] = 1
    # AND THEN! Find the count that is equal to N.
    # If the popular-est input is part of an &,
    # then the address wire is probably the _other_ input.
    # Otherwise, it's just the output wire of the gate?
    # for k,v in popular.items():
    #     print(k, v)


#def get_exp_addr(node, block, enable):
#    connections = block.net_connections()[0]
#
#    ret = ""
#    ct = 0
#    addr = []
#    # print(node)
#    if node in connections:
#        net = connections[node]
#        if net.op == "&":
#            args = net.args
#            if args[0].name == enable.name:
#                addr = [args[1]]
#                ret = args[1].name
#                ct += 1
#            elif args[1].name == enable.name:
#                addr = [args[0]]
#                ret = args[0].name
#                ct += 1
#            else:
#                addr0, ret0, ct0 = get_exp_addr(args[0], block, enable)
#                addr1, ret1, ct1 = get_exp_addr(args[1], block, enable)
#                addr = addr0 + addr1
#                ret = ret0 + f" {net.op} " + ret1
#                ct += ct0 + ct1
#        elif net.op == "~":
#            addr, ret0, ct0 = get_exp_addr(net.args[0], block, enable)
#            ret = "(~" + ret0 + ")"
#            ct += ct0
#        else:
#            ret = node.name
#            addr = [block.wirevector_by_name.get(ret)]
#            ct += 1
#    return addr, ret, ct

# gets the address logic for each register in a memblock
def get_exp_addr(node, block, enable):

    connections = block.net_connections()[0]

    ret = ""
    ct = 0
    addr = []
    # print(node)
    if node in connections:
        edge = str(connections[node])
        # print(edge)
        oper = edge[ edge.index("<-- ") + 4 ]
        parents = parse_net_connection(edge)
        if oper == "&":
            if parents[0].split("/")[0] == enable.name:
                ret = parents[1].split("/")[0]
                addr = [block.wirevector_by_name.get(ret)]
                ct += 1
            elif parents[1].split("/")[0] == enable.name:
                ret = parents[0].split("/")[0]
                addr = [block.wirevector_by_name.get(ret)]
                ct += 1
            else:
                aa, a, ac = get_exp_addr(pyrtl.working_block().wirevector_by_name.get(parents[0].split("/")[0]), block, enable)
                ba, b, bc = get_exp_addr(pyrtl.working_block().wirevector_by_name.get(parents[1].split("/")[0]), block, enable)
                ret = " " + a + " & " + b + " "
                addr = aa + ba
                ct += ac + bc
        elif oper == "~":
            addr, a, ac = get_exp_addr(pyrtl.working_block().wirevector_by_name.get(parents[0].split("/")[0]), block, enable)
            ret = "(~" + a + ")"
            ct += ac
        else:
            ret = node.name
            addr = [block.wirevector_by_name.get(ret)]
            ct += 1
    return addr, ret, ct

# log 2 with integer ceiling for inferring address width from the number of registers in a memblock
def log_2_int(x):
    if x == 1: 
        return 0
    return 1 + log_2_int( (x+1) // 2)

# creates Memory objects with enable and address information by grouping from the set of all multi-bit registers
# registers grouped into a Memory object are removed from the register set
def create_mems_from_en_addr(final_regs, block):
    connections = block.net_connections()[0]
    
    start_time = time.time()
    regs_by_en = {}
    for final_reg in final_regs:
        regs_by_en[final_reg.enable] = final_reg

    en_parents = {}
    for final_reg in final_regs:
        en = final_reg.enable
        real_en = block.wirevector_by_name.get(en.name)
        if real_en not in connections:
            continue
        edge = str( connections[ real_en ] )
        if edge[ edge.index("<-- ") + 4] == "&":
            parents = parse_net_connection(edge)
            for par in range(0, len(parents)):
                key = block.wirevector_by_name.get(parents[par].split("/")[0])
                if key not in en_parents:
                    en_parents[key] = [ [en, par]]
                else:
                    en_parents[key].append([en, par])
    
    good_parent_grps = {}
    mems = []
    for key in en_parents:
        if len(en_parents[key]) > 1:
            # print(key,end=": ")
            good_parents = {}
            val_width = -1
            reg_list = []
            bad = False
            for val in en_parents[key]:
                if (val_width == -1):
                    val_width = regs_by_en[ val[0] ].width
                elif regs_by_en[ val[0] ].width != val_width:
                    print("Error: allocated registers are not the same width")
                    bad = True
                    break
                good_parents[ block.wirevector_by_name.get(val[0].name) ] = block.wirevector_by_name.get(parse_net_connection( str(connections[ block.wirevector_by_name.get(val[0].name) ]) )[1-val[1]].split("/")[0])
                reg_list.append( regs_by_en[ val[0] ] )
                # print(regs_by_en[ val[0] ],end=" ")
            if not bad:
                for reg in reg_list:
                    if reg in final_regs:
                        final_regs.remove(reg)
                good_parent_grps[key] = good_parents
                mems.append( Memory( "mem_" + key.name, log_2_int( len(en_parents[key]) ), val_width, reg_list, key, None, None) )
            # print()
    times.append(time.time() - start_time)

    start_time = time.time()
    bad_mems = []
    for mem in mems:
        bad = False
        # get_write_addr([w for w in good_parent_grps[mem.enable]], block, mem)
        for r in good_parent_grps[mem.write_enable]:
            # mem.write_address, expr, ct = get_write_addr(good_parent_grps[mem.write_enable][r], block, mem.enable)
            mem.write_address, expr, ct = get_exp_addr(good_parent_grps[mem.write_enable][r], block, mem.write_enable)
            # print(f'{r} ct {ct} expr addr {expr}')
            # print(f"mem.write_address {len(mem.write_address)} {[a.name for a in mem.write_address]}")
            if ct != mem.addr_width:
                print("Error: addr_width from address logic not the same as from register count")
                bad = True
                continue
        if bad:
            for reg in mem.reg_list:
                final_regs.append(reg)
            bad_mems.append(mem)
    
    for mem in bad_mems:
        mems.remove(mem)
    times.append(time.time() - start_time)

    # print("-->mems at this point!")
    # for mem in mems:
    #     print(mem)
                
    return mems

# sorting criterion for is_permutation()
def criterion(wv):
    return wv.name

# determines if two multi-bit memory addresses are permutations of the same bits
def is_permutation(a, b):
    if len(a) != len(b):
        return False
    c = sorted(a, key=criterion)
    d = sorted(a, key=criterion)
    for i in range(0, len(c)):
        if c[i].name != d[i].name:
            return False  
    return True

# bundles the write port of a memblock
def get_write_port(mem, block):
    connections, uses = block.net_connections()
    
    # TODO: can continue until reach register's "_i" wire
    reg_write_ports = []
    # var = dict()
    for r in mem.reg_list:
        wp = []
        # print("...")
        # print("reg enable:", r.enable)
        for net in uses[ block.wirevector_by_name.get(r.enable.name)]:
            # print(net)
            if net.op != "x":
                continue
            # var[net.dests[0].name] = _make_expr(net)
            # print(net.args[2])
            if net.args[2] not in connections:
                print("Error: register inputs not suitable for write_port")
                return []
            d = connections[net.args[2]]
            # print(d)
            # var[d.dests[0].name] = _make_expr(d)
            if d.op == "&" and d.args[0].name == mem.write_enable.name:
                wp.append( d.args[1] )
            elif d.op == "&" and d.args[1].name == mem.write_enable.name:
                wp.append( d.args[0] )
            else:
                wp.append( net.args[2] )

            # make_expr(block, d.dests[0], var)

        # print("write port:",end=" ")
        # for w in wp:
        #     print(w, end=" ")
        # print()

        # print("send expressions to solver:")
        # for w,e in var.items():
        #     print(f"\t{w} := {e}")
        reg_write_ports.append(wp)

    for i in range(1, len(reg_write_ports)):
        if not is_permutation(reg_write_ports[0], reg_write_ports[i]):
            print("Error: aggregated registers have different write ports")
            return []

    return reg_write_ports[0]

# Initialize by marking all of the grouped registers.
# Then mark any gate that satisfies the following:
# 1. At least one of the gates inputs is marked
# 2. The gate has only one fanout, `pyrtl.analysis.fanout(w)`
def get_read_ports(mem, grouped_regs, block):
    #print('...\nget read ports:')
    connections, uses = block.net_connections(include_virtual_nodes=True)

    marked = set()
    wire_stack = set()

    # check if definition of arg is (~) and if it uses a marked input
    # if so, return the (~) gate, or None otherwise
    def _check_marked_not(arg):
        parent_gate = connections[arg]
        if type(parent_gate) == pyrtl.LogicNet and parent_gate.op == '~':
            grandparent_gate = connections[parent_gate.args[0]]
            if grandparent_gate in marked \
                    or type(parent_gate.args[0]) == pyrtl.Input \
                    or type(parent_gate.args[0]) == pyrtl.Register \
                    or parent_gate.args[0].name[-2:] == "_o":
                return parent_gate
        return None

    # Initialize marked set
    for r in mem.reg_list:
        # print(r.name)
        for net in uses[block.wirevector_by_name.get(r.name)]:
            # Since registers are grouped, first net must be select.
            if net.op != 's':
                raise Exception("Whoopsie: Expected a select here.")
                # return
            marked.add(net)
            for subnet in uses[block.wirevector_by_name.get(net.dests[0].name)]:
                if subnet.op == 'x':
                    if subnet.args[0].name == r.enable.name:
                        # print('  Net is mux for DFFE, skipping.', subnet)
                        pass
                elif subnet.op in '&^|n~w':
                    # print("  init:", subnet)
                    marked.add(subnet)
                    wire_stack |= set(subnet.dests)
                    # fold (~) gates into marked set
                    for arg in subnet.args:
                        parent_gate = _check_marked_not(arg)
                        if parent_gate is not None:
                            marked.add(parent_gate)
                else:
                    # print("  Uh-oh: Unsupported op", subnet.op)
                    pass

    while len(wire_stack) > 0:
        w = wire_stack.pop()
        # print('-->', connections[w])
        gates = uses[w]
        if len(gates) > 1:
            # print('  fanout > 1, skipping.')
            continue
        gate = gates[0]
        if gate.op not in '~&|n':
            # print("  Uh-oh: Unsupported op", gate.op)
            continue
        if marked.isdisjoint(set([connections[a] for a in gate.args])):
            # print('  none of the gate inputs are marked')
            # print('  ', gate)
            continue
        for arg in gate.args:
            # fold (~) gates into marked set
            parent_gate = _check_marked_not(arg)
            if parent_gate is not None:
                marked.add(parent_gate)
        marked.add(gate)
        wire_stack |= set(gate.dests)

    # print('done!')

    # make new block for visualization and churchroad export
    readblock = pyrtl.Block()
    for net in marked:
        def _make_new_wire(w):
            existing_wire = readblock.get_wirevector_by_name(w.name)
            if type(existing_wire) in (pyrtl.WireVector,
                                       pyrtl.Input,
                                       pyrtl.Output):
                return existing_wire

            net_uses = [connections[u.dests[0]] for u in uses[w]]
            net_def = [connections[w] if type(connections[w]) == pyrtl.Input
                       else connections[connections[w].dests[0]]]
            newwire = None
            if marked.isdisjoint(set(net_uses)):
                newwire = pyrtl.Output(bitwidth=w.bitwidth, name=w.name, block=readblock)
            elif marked.isdisjoint(set(net_def)):
                newwire = pyrtl.Input(bitwidth=w.bitwidth, name=w.name, block=readblock)
            else:
                newwire = pyrtl.WireVector(bitwidth=w.bitwidth, name=w.name, block=readblock)
            readblock.add_wirevector(newwire)
            return newwire

        newdests = []
        for w in net.dests:
            newdests.append(_make_new_wire(w))
        newargs = []
        for w in net.args:
            newargs.append(_make_new_wire(w))

        newnet = pyrtl.LogicNet(net.op, net.op_param, dests=tuple(newdests), args=tuple(newargs))
        readblock.add_net(newnet)

    # print(readblock)
    lets = {}
    unions = {}
    ports = {}
    deletes = {}
    extracts = {}

    readports = dict()

    # Compute paths from all non-reg inputs to outputs in readblock.
    # Use this to "bundle" output wires by port.
    # "Bundling" is adding selects (from inputs) and concats (to outputs).
    paths = pyrtl.analysis.paths(
            src=[input for input in readblock.wirevector_subset(pyrtl.Input) \
                    if input.name not in [r.name for r in mem.reg_list]],
            block=readblock)
    # print('paths:')
    # paths.print()
    bundles = {}
    for i in paths.keys():
        for j in paths.keys():
            if i.name == j.name:
                continue
            # print(f"i {i.name}")
            # print(f"j {j.name}")
            i_keys = tuple([w.name for w in paths[i].keys() if paths[i][w]])
            j_keys = tuple([w.name for w in paths[j].keys() if paths[j][w]])
            # print(f"i.keys {i_keys}")
            # print(f"j.keys {j_keys}")
            if i_keys == j_keys:
                if i_keys in bundles:
                    bundles[i_keys].append(i.name)
                    bundles[i_keys].append(j.name)
                    bundles[i_keys] = list(set(bundles[i_keys]))
                else:
                    bundles[i_keys] = [i.name, j.name]
    portnum = 0
    read_defs, read_uses = readblock.net_connections()
    # if the address is a register and it has an enable then that is the read enable
    for outs,ins in bundles.items():
        # print(f"{set(ins)} --> {outs}")
        # bundle the inputs
        newinput = pyrtl.Input(bitwidth=len(ins), name=f"read_addr_{portnum}", block=readblock)
        readports[portnum] = {'addr': (str(newinput), ins)}
        ren = set()
        for i in ins:
            if i[-2:] != '_o':
                break
            for grouped_reg in grouped_regs:
                for ff in grouped_reg.ff_list:
                    if i[:-2] == ff.name:
                        ren.add(grouped_reg.enable.name)
        if len(ren) == 1:
            readports[portnum]['enable'] = ren.pop()
        readblock.add_wirevector(newinput)
        for i in range(len(ins)):
            i_dest = readblock.get_wirevector_by_name(ins[i])
            if type(i_dest) == pyrtl.Input:
                new_i = pyrtl.WireVector(bitwidth=i_dest.bitwidth, name=i_dest.name, block=readblock)
                # substitute for all uses of i_dest
                i_dest_uses = read_uses[i_dest]
                for use_net in i_dest_uses:
                    args = list(use_net.args)
                    for arg_idx in range(len(args)):
                        if args[arg_idx].name == i_dest.name:
                            args[arg_idx] = new_i
                    new_net = pyrtl.LogicNet(use_net.op, use_net.op_param,
                                             tuple(args), use_net.dests)
                    readblock.add_net(new_net)
                    readblock.logic.remove(use_net)
                readblock.remove_wirevector(i_dest)
                readblock.add_wirevector(new_i)
                i_dest = new_i
            sel = pyrtl.LogicNet(op='s', op_param=((i,)), dests=(i_dest,), args=(newinput,))
            readblock.add_net(sel)
        # bundle the outs
        newoutput = pyrtl.Output(bitwidth=len(outs), name=f"read_data_{portnum}", block=readblock)
        readports[portnum]['data'] = (str(newoutput), outs)
        readblock.add_wirevector(newoutput)
        concat_args = []
        for out in outs:
            o_wire = readblock.get_wirevector_by_name(out)
            o_net = read_defs[o_wire]
            if type(o_wire) != pyrtl.Output:
                continue
            new_o = pyrtl.WireVector(bitwidth=o_wire.bitwidth,
                                     name=o_wire.name,
                                     block=readblock)
            new_net = pyrtl.LogicNet(op=o_net.op,
                                     op_param=o_net.op_param,
                                     args=o_net.args,
                                     dests=(new_o,))
            readblock.add_net(new_net)
            readblock.logic.remove(o_net)
            readblock.remove_wirevector(o_wire)
            readblock.add_wirevector(new_o)
            concat_args.append(new_o)
        concat = pyrtl.LogicNet(op='c', op_param=None, args=tuple(concat_args), dests=(newoutput,))
        readblock.add_net(concat)

        portnum += 1
        
    for net in readblock:
        # print(net)
        for wire in (net.dests + net.args):
            name = _sanitize(wire.name)

            if name in lets:
                continue

            let = f"(let {name} (Wire \"{name}\" {wire.bitwidth}))"
            lets[name] = let

            if name not in ports and type(wire) == pyrtl.Input:
                ports[name] = f";(IsPort \"\" \"{name}\" (Input) {name})"
            elif name not in ports and type(wire) == pyrtl.Output:
                ports[name] = f";(IsPort \"\" \"{name}\" (Output) {name})"
                deletes[name] = f"(delete (Wire \"{name}\" {wire.bitwidth}))"
                extracts[name] = f"(query-extract {name})"
            elif name not in deletes:
                deletes[name] = f"(delete (Wire \"{name}\" {wire.bitwidth}))"

        dest = net.dests[0]
        name = _sanitize(dest.name)
        union = f"(union {name} ({_make_expr(net)}))"
        unions[name] = union

    ## Output to Churchroad
    churchroad = ["(include \"./elephant.egg\")"]
    for _,let in lets.items():
        #print(let)
        churchroad.append(let)
    for _,union in unions.items():
        #print(union)
        churchroad.append(union)
    for _,port in ports.items():
        #print(port)
        churchroad.append(port)
    for _,delete in deletes.items():
        #print(delete)
        churchroad.append(delete)
    read_rule = "\n(rule\n"
    read_rule += " ((= d (Concat\n"
    for i in range(mem.val_width):
        read_rule += f"   (Mux a (MapSelect {i} x))\n"
    read_rule += "   ))\n"
    read_rule += "  (HasType a (Bitvector n))\n"
    read_rule += "  (= (log2 (vec-length x)) n))\n"
    read_rule += " ((union d (Read a x)))\n"
    read_rule += ":ruleset decomp)\n"
    churchroad.append(read_rule)
    churchroad.append("(run-schedule (repeat 15 (saturate typing) (saturate decomp)))")
    for _,extract in sorted(extracts.items()):
        #print(extract)
        churchroad.append(extract)

    # with open(NAME.split('.')[0]+'_'+mem.name+'.egg', 'w') as f:
    #     f.write('\n'.join(churchroad))

    with open('readports.svg', 'w') as f:
        pyrtl.output_to_svg(f, block=readblock)

    return readports

# driver method to aggregate memblocks
def get_memories(final_regs, block):
    connections = block.net_connections()[0]
    
    mems = create_mems_from_en_addr(final_regs, block)

    bad_mems = []
    for mem in mems:
        if mem.addr_width < MIN_MEM_ADDR_WIDTH:
            print("Error: memory address too short, addr_width = 1")
            for reg in mem.reg_list:
                final_regs.append(reg)
            bad_mems.append(mem)
    
    for mem in bad_mems:
        mems.remove(mem)

    start_time = time.time()
    bad_mems = []
    for mem in mems:
        mem.write_port = get_write_port(mem, block)
        if len(mem.write_port) == 0:
            print("Error: memory correct write_port not located")
            for reg in mem.reg_list:
                final_regs.append(reg)
            bad_mems.append(mem)
        mem.read_ports = get_read_ports(mem, final_regs, block)
    
    for mem in bad_mems:
        mems.remove(mem)
    times.append(time.time() - start_time)

    return mems

# removing pairs of concat and select gates that cancel each other out in the netlist (these are formed from blif reading)
def remove_concat_select():
    uses = pyrtl.working_block().net_connections()[1]
    
    nets_to_add = []
    
    for edge in pyrtl.working_block().logic_subset(op="c"):
        if len(edge.args) == 2:
            # print("====")
            # print(edge)
            # print(uses[edge.dests[0]][0])
            # print(uses[edge.dests[0]][1])
            if uses[edge.dests[0]][0].op == "s" and uses[edge.dests[0]][1].op == "s":
                nets_to_add.append( pyrtl.core.LogicNet("w", None, (edge.args[ 1 - uses[edge.dests[0]][0].op_param[0] ],), (uses[edge.dests[0]][0].dests[0],)) )
                nets_to_add.append( pyrtl.core.LogicNet("w", None, (edge.args[ 1 - uses[edge.dests[0]][1].op_param[0] ],), (uses[edge.dests[0]][1].dests[0],)) )
                pyrtl.working_block().logic.difference_update(edge, [uses[edge.dests[0]][0], uses[edge.dests[0]][1]])

    for net in nets_to_add:
        pyrtl.working_block().add_net(net)

# outputting aggregated register and memory quantity and size data to a csv
def write_to_csv(regs, mems, file_path):
    regs_by_size = {}
    for reg in regs:
        if reg.width not in regs_by_size:
            regs_by_size[reg.width] = 1
        else:
            regs_by_size[reg.width] += 1
    
    output = []
    for size in regs_by_size:
        output.append(["$dffe,", str(size) + ",", regs_by_size[size]])
        # print("$dffe", end=" ")
        # print(regs_by_size[size], end=" ")
        # print(size)
    
    for mem in mems:
        output.append(["mem,", str(mem.val_width) + ",", len(mem.reg_list)])
        # print("mem", end=" ")
        # print(mem.val_width, end=" ")
        # print(len(mem.reg_list))
    
    with open(file_path, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile,delimiter=" ")
        writer.writerows(output)

sys.setrecursionlimit(100000)


# NAME = "eval/pyrtl/alu"
# clock = "clk"
# top = "toplevel"

# NAME = "eval/pyrtl/fifo"
# clock = "clk"
# top = "toplevel"

# NAME = "eval/verilog/bsg_assembler"
# clock = "clk"
# top = "top"

# NAME = "eval/verilog/bsg_cache"
# clock = "clk_i"
# top = "top"

# NAME = "eval/verilog/opdb_pico"
# clock = "clk"
# top = "picorv32"

parser = ArgumentParser("Run the memory decompiler!")
parser.add_argument(
    "--top", type=str, dest="top", help="name of top module"
)
parser.add_argument(
    "--clock", type=str, dest="clock", help="name of the clock"
)
parser.add_argument(
    "--blif", type=str, dest="blif", help="name of the blif file"
)
args = parser.parse_args()

NAME = args.blif
top = args.top
clock = args.clock

with open(NAME, "r") as f:
    s = f.read()

pyrtl.importexport.input_from_blif(s, merge_io_vectors=False, clock_name=clock, top_model=top)

times = [NAME]

start_time = time.time()
remove_concat_select()
times.append(time.time() - start_time)
# print("finished remove_concat_select")
start_time = time.time()
pyrtl.passes.optimize(update_working_block=True, block=pyrtl.working_block())
times.append(time.time() - start_time)

regs = pyrtl.working_block().wirevector_subset(pyrtl.Register)
nodes = pyrtl.working_block().wirevector_subset()
connections = pyrtl.working_block().net_connections()[0]
# print(len(regs))

# with open ("pyrtl_blif_svgs/pyrtl_blif_eval_" + NAME + ".svg", 'w') as svg:
#    pyrtl.visualization.output_to_svg(svg)
# print("finished output to svg")

visited = {}
final_regs = get_final_regs(regs, nodes, visited, pyrtl.working_block())

for final_reg in final_regs:
    final_reg.print_reg()

start_time = time.time()
old_block = pyrtl.working_block()
reg_rewrite_block = pyrtl.core.Block()
reg_block_rewrites(final_regs, old_block, reg_rewrite_block)#, "reg_agg_svgs/reg_agg_eval_" + NAME + ".svg")
times.append(time.time() - start_time)
#print("finished rewrites")

MIN_MEM_ADDR_WIDTH = 1
final_mems = get_memories(final_regs, pyrtl.working_block())
#print("got memblocks")

for final_mem in final_mems:
    final_mem.print_mem()

# pyrtl.optimize()
# print(pyrtl.working_block())

print(f"decomp time: {sum(times[1:])} s")

