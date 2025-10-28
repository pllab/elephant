import pyrtl

import sys
sys.path.append('.')
from AbstractMem import AbstractMem

def test_vivado_bram(height_log2, width, portedness):
    pyrtl.reset_working_block()

    print(f"test {portedness} Vivado BRAM h{2**height_log2}_w{width}")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

    mem = AbstractMem.create_mem(width, height_log2, name='vivado_bram_h{0}_w{1}_{2}'.format(2 ** height_log2, width, portedness), config=portedness)

    mem.to_pyrtl(pyrtl.working_block())
    pyrtl.working_block().sanity_check()

    return mem.to_vivado_bram_tcl()

def test_openram_sram(height_log2, width, portedness):
    pyrtl.reset_working_block()

    print(f"test {portedness} OpenRAM SRAM h{2 ** height_log2}_w{width}")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

    mem = AbstractMem.create_mem(width, height_log2, name='openram_h{0}_w{1}_{2}'.format(2 ** height_log2, width, portedness), config=portedness)

    mem.to_pyrtl(pyrtl.working_block())
    pyrtl.working_block().sanity_check()

    return mem.to_openram_sram()

def test_pyrtl_netlist(height_log2, width, portedness):
    pyrtl.reset_working_block()

    print(f"test {portedness} PyRTL netlist h{2 ** height_log2}_w{width}")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

    mem = AbstractMem.create_mem(width, height_log2, name='openram_h{0}_w{1}_{2}'.format(2 ** height_log2, width, portedness), config=portedness)

    mem.to_pyrtl(pyrtl.working_block())
    pyrtl.working_block().sanity_check()

    with open('netlist_h{0}_w{1}_{2}.v'.format(2**height_log2, width, portedness), 'w') as f:
        pyrtl.output_to_verilog(f, add_reset=False)

if __name__ == '__main__':
    height_log2 = 4
    width = 43
    portedness = '1r1w'
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))

    height_log2 = 9
    width = 8
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 6
    width = 50
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 3
    width = 33
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 1
    width = 27
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 1
    width = 24
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 2
    width = 114
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    
    height_log2 = 3
    width = 174
    with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
        f.write(test_vivado_bram(height_log2, width, portedness))
    #for portedness in ['1rw','2rw','1r1w']:
    #    for height_log2 in range(4,8):
    #        for width in range(16,17):
    #            num_read_ports=1
    #            num_write_ports=1
    #            with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
    #                f.write(test_vivado_bram(height_log2, width, portedness))
    #            with open('openram_h{0}_w{1}_{2}.py'.format(2 ** height_log2, width, portedness), 'w') as f:
    #                f.write(test_openram_sram(height_log2, width, portedness))
    #            test_pyrtl_netlist(height_log2, width, portedness)
