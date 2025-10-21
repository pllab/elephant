import pyrtl
from argparse import ArgumentParser

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

parser = ArgumentParser()
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

remove_concat_select()
pyrtl.passes._remove_wire_nets(pyrtl.working_block(), skip_sanity_check=True)
pyrtl.passes._remove_slice_nets(pyrtl.working_block(), skip_sanity_check=True)
pyrtl.passes.constant_propagation(pyrtl.working_block(), True)
pyrtl.passes._remove_unlistened_nets(pyrtl.working_block())
pyrtl.passes.common_subexp_elimination(block=pyrtl.working_block())

with open (NAME + ".v", 'w') as v:
    pyrtl.importexport.output_to_verilog(v, add_reset=False)

