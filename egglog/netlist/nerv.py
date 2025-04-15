import pyrtl
import pyrtl_to_egglog

with open('nerv.blif', "r") as f:
    s = f.read()

pyrtl.importexport.input_from_blif(s, merge_io_vectors=False, clock_name='clock', top_model='nerv')

pyrtl_to_egglog.to_egglog(NAME='nerv', synth=True, opt=True)
