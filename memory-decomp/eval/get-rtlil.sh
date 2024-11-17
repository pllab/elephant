#!/bin/sh

NAME=$1
TOP=$2

yosys -p "read_verilog $NAME.v ; hierarchy -check -top $TOP ; write_rtlil $NAME.rtlil ; tee -a $NAME.rtlil stat -width"

# yosys -p "read_verilog pico/pico.pickle.v ; hierarchy -check -top picorv32 ; flatten ; write_rtlil pico.rtlil ; tee -a pico.rtlil stat -width"
# yosys -p "read_verilog sparc_ffu/sparc_ffu.pickle.v ; hierarchy -check -top sparc_ffu_nospu_wrap ; flatten ; write_rtlil sparc_ffu.rtlil ; tee -a sparc_ffu.rtlil stat -width"
# yosys -p "read_verilog sparc_ifu/L1I_8192_4/sparc_ifu.pickle.v ; hierarchy -check -top sparc_ifu ; write_rtlil sparc_ifu.rtlil ; tee -a sparc_ifu.rtlil stat -width"
# yosys -p "read_verilog sparc_lsu/L1D_4096_2/sparc_lsu.pickle.v ; hierarchy -check -top lsu ; write_rtlil sparc_lsu.rtlil ; tee -a sparc_lsu.rtlil stat -width"

# yosys -p "read_verilog l15/NETWORK_2dmesh__L1D_4096_2__L15_8192_4/l15.pickle.v ; hierarchy -check -top l15_wrap ; write_rtlil l15_2dmesh.rtlil"
# yosys -p "read_verilog l15/NETWORK_xbar__L1D_4096_2__L15_8192_4/l15.pickle.v ; hierarchy -check -top l15_wrap ; write_rtlil l15_xbar.rtlil"

# yosys -p "read_verilog fft/fft.pickle.v ; hierarchy -check -top fftmain ; write_rtlil fft.rtlil"
# yosys -p "read_verilog gng/gng.pickle.v ; hierarchy -check -top gng ; write_rtlil gng.rtlil"
# yosys -p "read_verilog sparc_mul/sparc_mul.pickle.v ; hierarchy -check -top sparc_mul_top ; write_rtlil sparc_mul.rtlil"
# yosys -p "read_verilog fpu/fpu.pickle.v ; hierarchy -check -top fpu ; write_rtlil fpu.rtlil"
# yosys -p "read_verilog ifu_esl/ifu_esl.pickle.v ; hierarchy -check -top sparc_ifu_esl ; write_rtlil ifu_esl.rtlil"
# yosys -p "read_verilog sparc_exu/sparc_exu.pickle.v ; hierarchy -check -top sparc_exu_wrap ; write_rtlil sparc_exu.rtlil"
# yosys -p "read_verilog sparc_tlu/sparc_tlu.pickle.v ; hierarchy -check -top tlu_nospu_wrap ; write_rtlil sparc_tlu.rtlil"
