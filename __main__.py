from . import database
import pyrtl


if __name__ == "__main__":
    netlist = database.NetlistDatabase()
    block = netlist.to_pyrtl()
    pyrtl.reset_working_block()
    print(block)