
proc vivado_synth { vsource vtop elabed mapped stats } {
    # Pynq Z2
    set_part xc7z020clg400-1

    read_verilog ${vsource}

    puts "Elaborating design ${vsource}:${vtop} -> ${elabed}"
    synth_design -top ${vtop} -rtl -rtl_skip_constraints -rtl_skip_mlo
    write_verilog -force ${elabed}

    #puts "Mapping design ${vsource}:${vtop} -> ${mapped}"
    #synth_design -top ${vtop}
    #write_verilog -force ${mapped}

    #puts "Reporting usage"
    #report_utilization > ${stats}
}

if { ${argc} != 5} {
    puts "Usage: vivado -log /tmp/vivado.log -mode batch -source vivado_synth.tcl -tclargs foobar.v foobar foobar.elab.v foobar.mapped.v foobar.dat "
}

if {$::argv0 eq [info script]} {
    set vsource [lindex ${argv} 0]
    set vtop [lindex ${argv} 1]
    set elabed [lindex ${argv} 2]
    set mapped [lindex ${argv} 3]
    set stats [lindex ${argv} 4]
    vivado_synth ${vsource} ${vtop} ${elabed} ${mapped} ${stats}
}

