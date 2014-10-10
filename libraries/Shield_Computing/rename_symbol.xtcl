
#Generate the new symbol file
set timestamp [clock format [clock seconds] -format {%Y%m%d%H%M%S}]

set filename "Wishbone_Symbol_Example.sym"
set temp     $filename.new.$timestamp
set backup   $filename.bak.$timestamp

set in  [open $filename r]
set out [open $temp     w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
    #transform $line somehow
    regsub -- {Wishbone_Symbol_Example} $line [lindex $argv 0] line

    # then write the transformed line
    puts $out $line
}

close $in
close $out

# move the new data to the proper filename
#file link -hard $backup $filename
#file rename -force $temp $filename 
file rename -force $filename $backup
file rename -force $temp [lindex $argv 0].sym

#Generate the new VHDL file
set timestamp [clock format [clock seconds] -format {%Y%m%d%H%M%S}]

set filename "Wishbone_Symbol_Example.vhd"
set temp     $filename.new.$timestamp
set backup   $filename.bak.$timestamp

set in  [open $filename r]
set out [open $temp     w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
    #transform $line somehow
    regsub -- {Wishbone_Symbol_Example} $line [lindex $argv 0] line

    # then write the transformed line
    puts $out $line
}

close $in
close $out

# move the new data to the proper filename
#file link -hard $backup $filename
#file rename -force $temp $filename 
file rename -force $filename $backup
file rename -force $temp [lindex $argv 0].vhd

#Update the sch file
set timestamp [clock format [clock seconds] -format {%Y%m%d%H%M%S}]

set filename "Edit_Your_CCL_Design.sch"
set temp     $filename.new.$timestamp
set backup   $filename.bak.$timestamp

set in  [open $filename r]
set out [open $temp     w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
    #transform $line somehow
    regsub -- {Wishbone_Symbol_Example} $line [lindex $argv 0] line

    # then write the transformed line
    puts $out $line
}

close $in
close $out

# move the new data to the proper filename
file link -hard $backup $filename
file rename -force $temp $filename 
#file rename -force $temp [lindex $argv 0].vhd

#Update the simulation file
set timestamp [clock format [clock seconds] -format {%Y%m%d%H%M%S}]

set filename "Simulate_Your_CCL_Design.vhd"
set temp     $filename.new.$timestamp
set backup   $filename.bak.$timestamp

set in  [open $filename r]
set out [open $temp     w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
    #transform $line somehow
    regsub -- {Wishbone_Symbol_Example} $line [lindex $argv 0] line

    # then write the transformed line
    puts $out $line
}

close $in
close $out

# move the new data to the proper filename
file link -hard $backup $filename
file rename -force $temp $filename 
#file rename -force $temp [lindex $argv 0].vhd

#Update the XISE project file
set timestamp [clock format [clock seconds] -format {%Y%m%d%H%M%S}]

set filename "CCL_Designer.xise"
set temp     $filename.new.$timestamp
set backup   $filename.bak.$timestamp

set in  [open $filename r]
set out [open $temp     w]

# line-by-line, read the original file
while {[gets $in line] != -1} {
    #transform $line somehow
    regsub -- {Wishbone_Symbol_Example} $line [lindex $argv 0] line

    # then write the transformed line
    puts $out $line
}

close $in
close $out

# move the new data to the proper filename
file link -hard $backup $filename
file rename -force $temp $filename 
#file rename -force $temp [lindex $argv 0].vhd