import pyrtl
import pyrtl_to_egglog

a = pyrtl.Input(8, 'a')
b = pyrtl.Output(1, 'b')

b <<= pyrtl.corecircuits.xor_all_bits(a)

pyrtl_to_egglog.to_egglog(NAME='xor1', synth=True, opt=True)

pyrtl.reset_working_block()
#===============================

a = pyrtl.Input(8, 'a')
b = pyrtl.Output(1, 'b')

c = a[0]
for i in range(1,8):
    c = c ^ a[i]

b <<= c

pyrtl_to_egglog.to_egglog(NAME='xor2', synth=True, opt=True)
