#python3 blif_import_test.py microbenchmarks/bsg_fifo_1r1w_narrowed_width_out_p_128_els_p_512_width_p_512_harden_p_1.blif clk_i top >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/bsg_fifo_1r1w_narrowed_width_out_p_64_els_p_256_width_p_64_harden_p_1.blif clk_i top >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/nerv.blif clock nerv >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/netlist_h128_w16_1r1w.blif clk toplevel >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/netlist_h128_w16_1rw.blif clk toplevel >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/netlist_h128_w16_2rw.blif clk toplevel >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/pico.pickle.blif clk picorv32 >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/sparc_ffu.pickle.blif rclk sparc_ffu_nospu_wrap >> blif-stats.out
#python3 blif_import_test.py microbenchmarks/bsg_fifo_1r1w_narrowed_width_out_p_512_els_p_512_width_p_128.blif clk_i top >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_fe_pc_gen_00.blif clk_i bp_fe_pc_gen_00 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_mmu_00_00000008_00000002_00000001_1.blif clk_i bp_mmu_00_00000008_00000002_00000001_1 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_fe_icache_00.blif clk_i bp_fe_icache_00 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_be_regfile_00_66_2_1.blif clk_i bp_be_regfile_00_66_2_1 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_be_regfile_00_66_3_0.blif clk_i bp_be_regfile_00_66_3_0 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_be_cmd_queue_00.blif clk_i bp_be_cmd_queue_00 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_be_issue_queue_00.blif clk_i bp_be_issue_queue_00 >> blif-stats.out
python3 blif_import_test.py ~/bp/submods/bp_be_dcache_00.blif clk_i bp_be_dcache_00 >> blif-stats.out

