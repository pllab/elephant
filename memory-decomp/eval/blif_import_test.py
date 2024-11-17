import pyrtl
import sys

bench=''
clock='clk'
top='top'

if len(sys.argv) - 1 < 1:
    print("need more args: blif [clock] [top]")
    exit(1)
elif len(sys.argv) - 1 == 2:
    clock = sys.argv[2]
elif len(sys.argv) - 1 == 3:
    clock = sys.argv[2]
    top = sys.argv[3]
bench = sys.argv[1]

with open(bench) as f:
    blif = f.read()

pyrtl.input_from_blif(blif,
                      merge_io_vectors=False,
                      clock_name=clock,
                      top_model=top)

# print(pyrtl.working_block())

#for reg in pyrtl.working_block().wirevector_subset(pyrtl.Register):
#    print(reg)

print("regs: {}, wires: {}, gates: {}".format(
    len(pyrtl.working_block().wirevector_subset(pyrtl.Register)),
    len(pyrtl.working_block().wirevector_set),
    len(pyrtl.working_block().logic)))

