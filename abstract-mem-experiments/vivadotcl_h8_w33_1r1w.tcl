# Create the IP directory and set the current directory
set proj_dir $::env(PWD)
set ip_dir ${proj_dir}/vivado_bram_h8_w33_1r1w
file mkdir ${ip_dir}
cd ${ip_dir}
create_project bram_test . -part xc7a35ticsg324-1L

# Create the Block Memory Generator
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name vivado_bram_h8_w33_1r1w

# Configure the core
set_property -dict [list \
    CONFIG.Component_Name {vivado_bram_h8_w33_1r1w} \
    CONFIG.Memory_Type {Simple_Dual_Port_RAM} \
    CONFIG.Enable_32bit_Address {false} \
    CONFIG.Algorithm {Minimum_Area} \
    CONFIG.Primitive {8kx2} \
    CONFIG.Assume_Synchronous_Clk {true} \
    CONFIG.Write_Width_A {33} \
    CONFIG.Write_Depth_A {8} \
    CONFIG.Enable_A {Use_ENA_Pin} \
    CONFIG.Register_PortA_Output_of_Memory_Primitives {true} \
    CONFIG.Use_Byte_Write_Enable {false} \
    CONFIG.Read_Width_B {33} \
    CONFIG.Enable_B {Use_ENB_Pin} \
    CONFIG.Register_PortB_Output_of_Memory_Primitives {true} \
] [get_ips vivado_bram_h8_w33_1r1w]

# Generate the IP
generate_target all [get_ips vivado_bram_h8_w33_1r1w]

# Run synthesis
synth_design -top vivado_bram_h8_w33_1r1w
exit