import pyrtl
import math

def CacheDirectMappedNBlock(datawidth, addrwidth, nblocks, ref, mem, prefix=""):
    # On a cache miss, it reads in the memory and outputs validOut=0 on the first cycle,
    # and then next time the reference is attempted, it will output validOut=1 along with the
    # expected data.

    tag_size = addrwidth - int(math.log2(nblocks))
    index_size = addrwidth - tag_size
    block_size = 1 + tag_size + datawidth

    #blocks = [pyrtl.Register(block_size, f"{prefix}block_{bin(i)}") for i in range(nblocks)]
    blocks = [pyrtl.Register(block_size) for i in range(nblocks)]

    assigned_block_num = ref[0:index_size]
    block = pyrtl.mux(assigned_block_num, *blocks)
    valid = block[-1]
    cached_tag = block[datawidth:datawidth+tag_size]
    data = block[0:datawidth]

    desired_tag = ref[-tag_size:]
    new_data = mem[ref]
    #desired_tag_t = pyrtl.probe(ref[-tag_size:], 'desired_tag')
    #new_data = pyrtl.probe(mem[ref], 'new_data')

    vout = valid & (desired_tag == cached_tag)

    # Need to create logic to conditionally update each register,
    # with specific logic to only update the particularly specified register on this cycle.
    # This helps overcome the issue with indexing into a python array with a wirevector
    # (which can't be done).
    for i in range(nblocks):
        with pyrtl.conditional_assignment:
            with ~vout & (pyrtl.Const(i) == assigned_block_num):
                blocks[i].next |= pyrtl.concat(pyrtl.Const(1), desired_tag, new_data)

    return data, vout

ADDRWIDTH = 5
DATAWIDTH = 16
CACHESIZE = 8

mem = pyrtl.MemBlock(bitwidth=DATAWIDTH, addrwidth=ADDRWIDTH, name='mem')
memvals = {mem: {addr: addr for addr in range(2 ** ADDRWIDTH)}}

ref_in = pyrtl.Input(ADDRWIDTH, 'ref')
data_out = pyrtl.Output(DATAWIDTH, 'data')
valid_out = pyrtl.Output(1, 'valid_out')

d_o, v_o = CacheDirectMappedNBlock(DATAWIDTH, ADDRWIDTH, CACHESIZE, ref_in, mem)
data_out <<= d_o
valid_out <<= v_o

with open('cache.v', 'w') as f:
    pyrtl.output_to_verilog(f, add_reset=False)
