# Get the TARGET argument passed to the script
if { $argc < 1 } {
    puts "Error: TARGET argument not provided."
    puts "Usage: xsct program_hardware.tcl <TARGET>"
    exit 1
}
set TARGET [lindex $argv 0]

# Compose paths dynamically based on TARGET
set BIT_FILE "./boot/${TARGET}/andromeda_wrapper.bit"
set ELF_FILE "./boot/${TARGET}/andromeda_mb.elf"

# Load bitstream and ELF file
connect
fpga -f $BIT_FILE
targets -set -filter {name =~ "MicroBlaze #0*"}
dow $ELF_FILE
con
puts "First 10 memory reads from DDR4 memory"
after 10000
set raw_data [mrd 0x80000000 10]

puts $raw_data


