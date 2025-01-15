## Netlist Language

* `netlist.egg` defines a basic netlist language using Egglog.
* `pyrtl_to_egglog.py` implements a module that compiles PyRTL circuits to the netlist language.
* `xor_reducer.py` demonstrates a small example of compiling a PyRTL design to this netlist language.
* `mux-example.egg` demonstrates using the rewrites rules defined in `netlist.egg` to decompile two small circuits with multiplexers.

## Egglog resources

* [Egglog](https://github.com/egraphs-good/egglog) is the language we use for defining the language and its rewrite rules.
* The [egglog web demo](https://egraphs-good.github.io/egglog/) is a handy resource for checking how to use different features of the egglog language.
