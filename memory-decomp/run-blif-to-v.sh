#!/bin/sh

NAME=$1
TOP=$2
CLK=$3

python3 blif_to_v.py --blif ${NAME} --clock ${CLK} --top ${TOP}

#MODS="
#bp_be_cmd_queue_00
#bp_be_dcache_00
#bp_be_issue_queue_00
#bp_be_pipe_mem_00
#bp_be_regfile_00_66_2_1
#bp_be_regfile_00_66_3_0
#bp_be_scheduler_00
#bp_fe_bht_00
#bp_fe_btb_00
#bp_fe_icache_00
#bp_fe_pc_gen_00
#bp_mmu_00_00000008_00000002_00000001_1
#"
#
#for TOP in $MODS ; do
#	python3 blif_to_v.py --blif ~/bp/submods/${TOP}.blif --clock clk_i --top ${TOP}
#done
