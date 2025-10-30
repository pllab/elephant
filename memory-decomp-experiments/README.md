# Tiniest memory

`python3 memory_decomp.py --blif test/netlist_h2_w2_1r1w.blif --top toplevel --clock clk`

For testing splitting the registers into inputs/outputs.

Then:

`cd ../egglog`

Then:

`egglog netlist_h2_w2_1r1w_mem_openram_h2_w2_1r1w_wen.egg`


# Latch last read test case

`python3 memory_decomp.py --blif test/netlist_h4_w4_1r1w_llr.blif --top toplevel --clock clk`

There should be an extra grouped register in there for the latch-last read logic.
