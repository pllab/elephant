from AbstractMem import AbstractMem
import pyrtl

def test_vivado_bram(height_log2, width, portedness):
    pyrtl.reset_working_block()

    print(f"test {portedness} Vivado BRAM h{2**height_log2}_w{width}")
    print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~")

    mem = AbstractMem.create_mem(width, height_log2, name='openram_h{0}_w{1}_{2}'.format(2 ** height_log2, width, portedness), config=portedness)

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

if __name__ == '__main__':
    for portedness in ['1rw','2rw','1r1w','2r1w','1r2w','2r2w']:
        for height_log2 in range(4,8):
            for width in range(16,17):
                num_read_ports=1
                num_write_ports=1
                with open('vivadotcl_h{0}_w{1}_{2}.tcl'.format(2**height_log2, width, portedness), 'w') as f:
                    f.write(test_vivado_bram(height_log2, width, portedness))
                with open('openram_h{0}_w{1}_{2}.py'.format(2 ** height_log2, width, portedness), 'w') as f:
                    f.write(test_openram_sram(height_log2, width, portedness))
