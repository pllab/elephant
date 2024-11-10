from AbstractMem import AbstractMem
import pyrtl

def test_vivado_bram(height_log2, width, num_read_ports=1, num_write_ports=0):
    pyrtl.reset_working_block()
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")
    print("test 1r1w OpenRAM SRAM")

    # OpenRAM scn4m requires minimum height of 16 rows
    addr_width = height_log2
    val_width = width
    
    raddrs = []
    rdatas = []
    for i in range(num_read_ports):
        raddrs.append(pyrtl.Input(addr_width, 'raddr{i}'))
        rdatas.append(pyrtl.WireVector(val_width, 'rdata{i}'))

    waddrs = []
    w_ens = []
    for i in range(num_write_ports):
        waddrs.append(pyrtl.Input(addr_width, 'waddr{i}'))
        w_ens.append(pyrtl.Input(1, 'w_en{i}'))
        
    inc = pyrtl.WireVector(val_width, 'inc')
    inc <<= rdatas[0] + 1

    write_port = None
    if num_write_ports > 0:
        write_port=AbstractMem.WritePort(waddrs[0], inc, w_ens[0]),

    mem = AbstractMem(
            width=val_width,
            height=(addr_width ** 2),
            name='mem',
            read_ports=[AbstractMem.ReadPort(raddrs[i], rdatas[i], pyrtl.Const(1,bitwidth=1)) for i in range(num_read_ports)],
            write_port=write_port
            )
    mem.to_pyrtl(pyrtl.working_block())

    ## Expected PyRTL:
    # mem = pyrtl.MemBlock(
    #      bitwidth=val_width,
    #      addrwidth=addr_width,
    #      name='mem',
    #      max_read_ports=1,
    #      max_write_ports=1)
    # data <<= mem[raddr] + 1
    # mem[waddr] <<= pyrtl.MemBlock.EnabledWrite(data, enable=en)
    
    data_o = pyrtl.Output(val_width, 'data_o')
    data_o <<= inc

    pyrtl.working_block().sanity_check()
    print(mem.to_vivado_bram_tcl())

if __name__ == '__main__':
    for height_log2 in range(4,8):
        for width in range(16,17):
            num_read_ports=1
            num_write_ports=1
            with open('vivadotcl_h{0}_w{1}_{2}r{3}w'.format(height_log2**2, width, num_read_ports, num_write_ports), 'w') as f:
                test_vivado_bram(height_log2, width, num_read_ports=1, num_write_ports=1)