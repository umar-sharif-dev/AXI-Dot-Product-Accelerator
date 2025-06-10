#*****************************************************************************************
# Vivado (TM) v2024.2 (64-bit)
#
#*****************************************************************************************
# Apex Compute Inc. Copyright 2025
# Check the version of Vivado used
set version_required "2024.2"
set ver [lindex [split $::env(XILINX_VIVADO) /] end]
if {![string equal $ver $version_required]} {
  puts "###############################"
  puts "### Failed to build project ###"
  puts "###############################"
  puts "This project was designed for use with Vivado $version_required."
  puts "You are using Vivado $ver. Please install Vivado $version_required,"
  puts "or download the project sources from a commit of the Git repository"
  puts "that was intended for your version of Vivado ($ver)."
  return
}

# Add Xilinx board store to the repo paths
set repo_paths [get_param board.repoPaths]
lappend repo_paths [get_property LOCAL_ROOT_DIR [xhub::get_xstores xilinx_board_store]]
set_param board.repoPaths $repo_paths

# Possible targets
dict set target_dict alinx { alinx.com board_name { X4 } mb }

# Function to display the options and get user input
proc selectTarget {target_dict} {
    # Create a list to hold the keys in order
    set keys_list [dict keys $target_dict]
    set keys_list [lsort $keys_list]

    # Forever loop until we break it when the user confirms their selection
    while {1} {
        # Initialize a counter for the numbering
        set counter 0

        # Display options
        puts "Possible target designs:"
        foreach key $keys_list {
            incr counter
            puts "  $counter: $key"
        }

        # Ask for user input
        set user_choice -1
        while {($user_choice < 1) || ($user_choice > $counter)} {
            puts -nonewline "Choose target design (1-$counter): "
            flush stdout
            gets stdin user_choice

            # Check if the input is a valid number
            if {![string is integer -strict $user_choice]} {
                set user_choice -1
                continue
            }
        }

        # Confirm selection
        set selected_key [lindex $keys_list [expr {$user_choice - 1}]]
        puts -nonewline "Confirm selection '$selected_key' (Y/n): "
        flush stdout
        gets stdin confirmation

        # Check confirmation
        if {[string match -nocase "y*" $confirmation] || [string equal -length 1 "" $confirmation]} {
            # If the user confirmed, return the selected key
            return $selected_key
        }
    }
}

# Target can be specified by creating the target variable before sourcing, or in the command line arguments
if { [info exists target] } {
  if { ![dict exists $target_dict $target] } {
    puts "Invalid target specified: $target"
    exit 1
  }
} elseif { $argc == 0 } {
  set target [selectTarget $target_dict]
} else {
  set target [lindex $argv 0]
  if { ![dict exists $target_dict $target] } {
    puts "Invalid target specified: $target"
    exit 1
  }
}

# At this point of the script, we are guaranteed to have a valid target
puts "Target design: $target"
set design_name ${target}
set block_name andromeda
# Check file required for this script exists
proc checkRequiredFiles { origin_dir} {
  set status true
  set files [list \
 "[file normalize "$origin_dir/../hdl/sd_controller.sv"]"\
 "[file normalize "$origin_dir/../hdl/sd_controller_axi_writer.sv"]"\
 "[file normalize "$origin_dir/../hdl/sd_controller_ping_pong_buffer.sv"]"\
 "[file normalize "$origin_dir/../hdl/sd_controller_regfile.sv"]"\
 "[file normalize "$origin_dir/../hdl/sd_reader.sv"]"\
 "[file normalize "$origin_dir/../hdl/sdcmd_ctrl.sv"]"\
 "[file normalize "$origin_dir/../hdl/sd_controller_wrapper.v"]"\
 "[file normalize "$origin_dir/../hdl/bram_1kx8_sp.v"]"\
 "[file normalize "$origin_dir/../hdl/axi_memset_dma.v"]"\
 "[file normalize "$origin_dir/../ips/andromeda_mig_7series_0_0/mig_b.prj"]"\
 "[file normalize "$origin_dir/../ips/andromeda_mig_7series_0_0/mig_a.prj"]"\
 "[file normalize "$origin_dir/../Vivado/board_xdc/alinx.xdc"]"\
  ]
  foreach ifile $files {
    if { ![file isfile $ifile] } {
      puts " Could not find local file $ifile "
      set status false
    }
  }

  return $status
}
# Set the reference directory for source file relative paths (by default the value is script directory path)
set origin_dir "."


# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/$design_name"]"
# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "andromeda"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "build.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/../"]"

# Check for paths and files needed for project creation
set validate_required 0
if { $validate_required } {
  if { [checkRequiredFiles $origin_dir] } {
    puts "Tcl file $script_file is valid. All files required for project creation is accesable. "
  } else {
    puts "Tcl file $script_file is not valid. Not all files required for project creation is accesable. "
    return
  }
}

# Create project
create_project $design_name $origin_dir/$design_name -part xc7k325tffg900-2

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Reconstruct message rules
# None

# Set project properties
set obj [current_project]
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_resource_estimation" -value "0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "disable" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "part" -value "xc7k325tffg900-2" -objects $obj
set_property -name "platform.num_compute_units" -value "16" -objects $obj
set_property -name "revised_directory_structure" -value "1" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "sim_compile_state" -value "1" -objects $obj
set_property -name "use_inline_hdl_ip" -value "1" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "6" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "6" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "43" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "43" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "43" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "43" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "43" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_FIFO XPM_MEMORY" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set 'sources_1' fileset properties
set obj [get_filesets sources_1]
set_property -name "top" -value "${block_name}_wrapper" -objects $obj

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Add/Import constrs file and set constrs file properties
set file "[file normalize "$origin_dir/board_xdc/${target}.xdc"]"
set file_added [add_files -norecurse -fileset $obj $file]
set file "$origin_dir/../Vivado/board_xdc/${target}.xdc"
set file [file normalize $file]
set file_obj [get_files -of_objects [get_filesets constrs_1] [list "*$file"]]
set_property "file_type" "XDC" $file_obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "top" -value "${block_name}_wrapper" -objects $obj

# Import local files from the original project
set files [list \
 [file normalize "${origin_dir}/hdl/sd_controller.sv"]\
 [file normalize "${origin_dir}/hdl/sd_controller_axi_writer.sv"]\
 [file normalize "${origin_dir}/hdl/sd_controller_ping_pong_buffer.sv"]\
 [file normalize "${origin_dir}/hdl/sd_controller_regfile.sv"]\
 [file normalize "${origin_dir}/hdl/sd_reader.sv"]\
 [file normalize "${origin_dir}/hdl/sdcmd_ctrl.sv"]\
 [file normalize "${origin_dir}/hdl/sd_controller_wrapper.v"]\
 [file normalize "${origin_dir}/hdl/bram_1kx8_sp.v" ]\
 [file normalize "${origin_dir}/hdl/axi_memset_dma.v" ]\
 [file normalize "${origin_dir}/ips/andromeda_mig_7series_0_0/mig_b.prj" ]\
 [file normalize "${origin_dir}/ips/andromeda_mig_7series_0_0/mig_a.prj" ]\
]
set imported_files ""
foreach f $files {
  lappend imported_files [import_files -fileset sources_1 $f]
}

# Set 'sources_1' fileset file properties for remote files
# None

# Set 'sources_1' fileset file properties for local files
set file "hdl/sd_controller.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "hdl/sd_controller_axi_writer.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "hdl/sd_controller_ping_pong_buffer.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "hdl/sd_controller_regfile.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "hdl/sd_reader.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "hdl/sdcmd_ctrl.sv"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "file_type" -value "SystemVerilog" -objects $file_obj

set file "andromeda_mig_7series_0_0/mig_b.prj"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "scoped_to_cells" -value "andromeda_mig_7series_0_0" -objects $file_obj

set file "andromeda_mig_7series_0_0/mig_a.prj"
set file_obj [get_files -of_objects [get_filesets sources_1] [list "*$file"]]
set_property -name "scoped_to_cells" -value "andromeda_mig_7series_0_0" -objects $file_obj




# Adding sources referenced in BDs, if not already added
if { [get_files [list sd_controller.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_controller.sv"]
}
if { [get_files [list sd_controller_axi_writer.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_controller_axi_writer.sv"]
}
if { [get_files [list sd_controller_ping_pong_buffer.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_controller_ping_pong_buffer.sv"]
}
if { [get_files [list sd_controller_regfile.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_controller_regfile.sv"]
}
if { [get_files [list sd_reader.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_reader.sv"]
}
if { [get_files [list sdcmd_ctrl.sv]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sdcmd_ctrl.sv"]
}
if { [get_files [list sd_controller_wrapper.v]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/sd_controller_wrapper.v"]
}
if { [get_files [list bram_1kx8_sp.v]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/bram_1kx8_sp.v"]
}
if { [get_files [list axi_memset_dma.v]] == "" } {
  import_files -quiet -fileset sources_1 [file normalize "$origin_dir/hdl/axi_memset_dma.v"]
}


# Proc to create BD andromeda
proc cr_bd_andromeda { parentCell } {
# The design that will be created by this Tcl proc contains the following 
# module references:
# sd_controller_wrapper, axi_memset_dma



  # CHANGE DESIGN NAME HERE
  set design_name andromeda

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:ip:mig_7series:4.2\
  xilinx.com:ip:axi_uartlite:2.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:axi_timer:2.0\
  xilinx.com:ip:microblaze:11.0\
  xilinx.com:ip:mdm:3.2\
  xilinx.com:ip:ila:6.2\
  xilinx.com:ip:lmb_v10:3.0\
  xilinx.com:ip:lmb_bram_if_cntlr:4.0\
  xilinx.com:ip:blk_mem_gen:8.4\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  ##################################################################
  # CHECK Modules
  ##################################################################
  set bCheckModules 1
  if { $bCheckModules == 1 } {
     set list_check_mods "\ 
  sd_controller_wrapper\
  axi_memset_dma\
  "

   set list_mods_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2020 -severity "INFO" "Checking if the following modules exist in the project's sources: $list_check_mods ."

   foreach mod_vlnv $list_check_mods {
      if { [can_resolve_reference $mod_vlnv] == 0 } {
         lappend list_mods_missing $mod_vlnv
      }
   }

   if { $list_mods_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2021 -severity "ERROR" "The following module(s) are not found in the project: $list_mods_missing" }
      common::send_gid_msg -ssname BD::TCL -id 2022 -severity "INFO" "Please add source files for the missing module(s) above."
      set bCheckIPsPassed 0
   }
}

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }


##################################################################
# MIG PRJ FILE TCL PROCs
##################################################################

proc write_mig_file_andromeda_mig_7series_0_0 { str_mig_prj_filepath } {

   file mkdir [ file dirname "$str_mig_prj_filepath" ]
   set mig_prj_file [open $str_mig_prj_filepath  w+]

   puts $mig_prj_file {﻿<?xml version="1.0" encoding="UTF-8" standalone="no" ?>}
   puts $mig_prj_file {<Project NoOfControllers="1">}
   puts $mig_prj_file {  }
   puts $mig_prj_file {<!-- IMPORTANT: This is an internal file that has been generated by the MIG software. Any direct editing or changes made to this file may result in unpredictable behavior or data corruption. It is strongly advised that users do not edit the contents of this file. Re-run the MIG GUI with the required settings if any of the options provided below need to be altered. -->}
   puts $mig_prj_file {  <ModuleName>andromeda_mig_7series_0_0</ModuleName>}
   puts $mig_prj_file {  <dci_inouts_inputs>1</dci_inouts_inputs>}
   puts $mig_prj_file {  <dci_inputs>1</dci_inputs>}
   puts $mig_prj_file {  <Debug_En>OFF</Debug_En>}
   puts $mig_prj_file {  <DataDepth_En>1024</DataDepth_En>}
   puts $mig_prj_file {  <LowPower_En>ON</LowPower_En>}
   puts $mig_prj_file {  <XADC_En>Enabled</XADC_En>}
   puts $mig_prj_file {  <TargetFPGA>xc7k325t-ffg900/-2</TargetFPGA>}
   puts $mig_prj_file {  <Version>4.2</Version>}
   puts $mig_prj_file {  <SystemClock>Differential</SystemClock>}
   puts $mig_prj_file {  <ReferenceClock>Use System Clock</ReferenceClock>}
   puts $mig_prj_file {  <SysResetPolarity>ACTIVE LOW</SysResetPolarity>}
   puts $mig_prj_file {  <BankSelectionFlag>FALSE</BankSelectionFlag>}
   puts $mig_prj_file {  <InternalVref>0</InternalVref>}
   puts $mig_prj_file {  <dci_hr_inouts_inputs>50 Ohms</dci_hr_inouts_inputs>}
   puts $mig_prj_file {  <dci_cascade>1</dci_cascade>}
   puts $mig_prj_file {  <FPGADevice>}
   puts $mig_prj_file {    <selected>7k/xc7k325ti-ffg900</selected>}
   puts $mig_prj_file {  </FPGADevice>}
   puts $mig_prj_file {  <Controller number="0">}
   puts $mig_prj_file {    <MemoryDevice>DDR3_SDRAM/Components/MT41J256m16XX-125</MemoryDevice>}
   puts $mig_prj_file {    <TimePeriod>1250</TimePeriod>}
   puts $mig_prj_file {    <VccAuxIO>2.0V</VccAuxIO>}
   puts $mig_prj_file {    <PHYRatio>4:1</PHYRatio>}
   puts $mig_prj_file {    <InputClkFreq>200</InputClkFreq>}
   puts $mig_prj_file {    <UIExtraClocks>1</UIExtraClocks>}
   puts $mig_prj_file {    <MMCM_VCO>800</MMCM_VCO>}
   puts $mig_prj_file {    <MMCMClkOut0> 8.000</MMCMClkOut0>}
   puts $mig_prj_file {    <MMCMClkOut1>1</MMCMClkOut1>}
   puts $mig_prj_file {    <MMCMClkOut2>1</MMCMClkOut2>}
   puts $mig_prj_file {    <MMCMClkOut3>1</MMCMClkOut3>}
   puts $mig_prj_file {    <MMCMClkOut4>1</MMCMClkOut4>}
   puts $mig_prj_file {    <DataWidth>64</DataWidth>}
   puts $mig_prj_file {    <DeepMemory>1</DeepMemory>}
   puts $mig_prj_file {    <DataMask>1</DataMask>}
   puts $mig_prj_file {    <ECC>Disabled</ECC>}
   puts $mig_prj_file {    <Ordering>Normal</Ordering>}
   puts $mig_prj_file {    <BankMachineCnt>4</BankMachineCnt>}
   puts $mig_prj_file {    <CustomPart>FALSE</CustomPart>}
   puts $mig_prj_file {    <NewPartName/>}
   puts $mig_prj_file {    <RowAddress>15</RowAddress>}
   puts $mig_prj_file {    <ColAddress>10</ColAddress>}
   puts $mig_prj_file {    <BankAddress>3</BankAddress>}
   puts $mig_prj_file {    <MemoryVoltage>1.5V</MemoryVoltage>}
   puts $mig_prj_file {    <C0_MEM_SIZE>2147483648</C0_MEM_SIZE>}
   puts $mig_prj_file {    <UserMemoryAddressMap>BANK_ROW_COLUMN</UserMemoryAddressMap>}
   puts $mig_prj_file {    <PinSelection>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA12" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA13" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AD8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AB10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AC10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[13]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AJ9" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[14]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AB12" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AB8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AB9" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AC9" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AB13" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="Y10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_addr[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AE8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ba[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AC12" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ba[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AC11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ba[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AE11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_cas_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15" PADName="AH10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ck_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15" PADName="AG10" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ck_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AD12" SLEW="" VCCAUX_IO="HIGH" name="ddr3_cke[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AF11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_cs_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AA18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AF17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AE16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="Y15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AF7" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AF3" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AJ3" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AD4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dm[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[10]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[11]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[12]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[13]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[14]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AG18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[15]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[16]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[17]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[18]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[19]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AB18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AG14" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[20]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[21]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AG15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[22]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[23]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[24]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="Y16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[25]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC14" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[26]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AA15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[27]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AA17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[28]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD14" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[29]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AA16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[30]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AB15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[31]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[32]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[33]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[34]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[35]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[36]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK8" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[37]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK5" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[38]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AG7" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[39]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AB19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[40]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[41]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE5" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[42]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[43]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[44]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE3" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[45]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF5" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[46]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AF2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[47]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[48]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[49]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH5" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[50]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[51]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[52]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[53]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AH6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[54]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AJ1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[55]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[56]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC5" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[57]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD3" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[58]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC7" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[59]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[60]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AD6" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[61]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[62]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AC4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[63]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AE18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AB17" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AG19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[8]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15_T_DCI" PADName="AK19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dq[9]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AK18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AC15" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ7" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG3" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD1" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_n[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="Y19" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AJ18" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[1]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[2]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AC16" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[3]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AH7" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[4]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG4" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[5]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AG2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[6]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="DIFF_SSTL15_T_DCI" PADName="AD2" SLEW="" VCCAUX_IO="HIGH" name="ddr3_dqs_p[7]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AD11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_odt[0]"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AE9" SLEW="" VCCAUX_IO="HIGH" name="ddr3_ras_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="LVCMOS15" PADName="Y11" SLEW="" VCCAUX_IO="HIGH" name="ddr3_reset_n"/>}
   puts $mig_prj_file {      <Pin IN_TERM="" IOSTANDARD="SSTL15" PADName="AD9" SLEW="" VCCAUX_IO="HIGH" name="ddr3_we_n"/>}
   puts $mig_prj_file {    </PinSelection>}
   puts $mig_prj_file {    <System_Clock>}
   puts $mig_prj_file {      <Pin Bank="33" PADName="AE10/AF10(CC_P/N)" name="sys_clk_p/n"/>}
   puts $mig_prj_file {    </System_Clock>}
   puts $mig_prj_file {    <System_Control>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="sys_rst"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="init_calib_complete"/>}
   puts $mig_prj_file {      <Pin Bank="Select Bank" PADName="No connect" name="tg_compare_error"/>}
   puts $mig_prj_file {    </System_Control>}
   puts $mig_prj_file {    <TimingParameters>}
   puts $mig_prj_file {      <Parameters tcke="5" tfaw="40" tras="35" trcd="13.75" trefi="7.8" trfc="260" trp="13.75" trrd="7.5" trtp="7.5" twtr="7.5"/>}
   puts $mig_prj_file {    </TimingParameters>}
   puts $mig_prj_file {    <mrBurstLength name="Burst Length">8 - Fixed</mrBurstLength>}
   puts $mig_prj_file {    <mrBurstType name="Read Burst Type and Length">Sequential</mrBurstType>}
   puts $mig_prj_file {    <mrCasLatency name="CAS Latency">11</mrCasLatency>}
   puts $mig_prj_file {    <mrMode name="Mode">Normal</mrMode>}
   puts $mig_prj_file {    <mrDllReset name="DLL Reset">No</mrDllReset>}
   puts $mig_prj_file {    <mrPdMode name="DLL control for precharge PD">Slow Exit</mrPdMode>}
   puts $mig_prj_file {    <emrDllEnable name="DLL Enable">Enable</emrDllEnable>}
   puts $mig_prj_file {    <emrOutputDriveStrength name="Output Driver Impedance Control">RZQ/7</emrOutputDriveStrength>}
   puts $mig_prj_file {    <emrMirrorSelection name="Address Mirroring">Disable</emrMirrorSelection>}
   puts $mig_prj_file {    <emrCSSelection name="Controller Chip Select Pin">Enable</emrCSSelection>}
   puts $mig_prj_file {    <emrRTT name="RTT (nominal) - On Die Termination (ODT)">RZQ/6</emrRTT>}
   puts $mig_prj_file {    <emrPosted name="Additive Latency (AL)">0</emrPosted>}
   puts $mig_prj_file {    <emrOCD name="Write Leveling Enable">Disabled</emrOCD>}
   puts $mig_prj_file {    <emrDQS name="TDQS enable">Enabled</emrDQS>}
   puts $mig_prj_file {    <emrRDQS name="Qoff">Output Buffer Enabled</emrRDQS>}
   puts $mig_prj_file {    <mr2PartialArraySelfRefresh name="Partial-Array Self Refresh">Full Array</mr2PartialArraySelfRefresh>}
   puts $mig_prj_file {    <mr2CasWriteLatency name="CAS write latency">8</mr2CasWriteLatency>}
   puts $mig_prj_file {    <mr2AutoSelfRefresh name="Auto Self Refresh">Enabled</mr2AutoSelfRefresh>}
   puts $mig_prj_file {    <mr2SelfRefreshTempRange name="High Temparature Self Refresh Rate">Normal</mr2SelfRefreshTempRange>}
   puts $mig_prj_file {    <mr2RTTWR name="RTT_WR - Dynamic On Die Termination (ODT)">Dynamic ODT off</mr2RTTWR>}
   puts $mig_prj_file {    <PortInterface>AXI</PortInterface>}
   puts $mig_prj_file {    <AXIParameters>}
   puts $mig_prj_file {      <C0_C_RD_WR_ARB_ALGORITHM>RD_PRI_REG</C0_C_RD_WR_ARB_ALGORITHM>}
   puts $mig_prj_file {      <C0_S_AXI_ADDR_WIDTH>31</C0_S_AXI_ADDR_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_DATA_WIDTH>512</C0_S_AXI_DATA_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_ID_WIDTH>4</C0_S_AXI_ID_WIDTH>}
   puts $mig_prj_file {      <C0_S_AXI_SUPPORTS_NARROW_BURST>0</C0_S_AXI_SUPPORTS_NARROW_BURST>}
   puts $mig_prj_file {    </AXIParameters>}
   puts $mig_prj_file {  </Controller>}
   puts $mig_prj_file {</Project>}

   close $mig_prj_file
}
# End of write_mig_file_andromeda_mig_7series_0_0()



  
# Hierarchical cell: microblaze_0_local_memory
proc create_hier_cell_microblaze_0_local_memory { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_microblaze_0_local_memory() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins
  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 DLMB

  create_bd_intf_pin -mode MirroredMaster -vlnv xilinx.com:interface:lmb_rtl:1.0 ILMB


  # Create pins
  create_bd_pin -dir I -type clk LMB_Clk
  create_bd_pin -dir I -type rst SYS_Rst

  # Create instance: dlmb_v10, and set properties
  set dlmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 dlmb_v10 ]

  # Create instance: ilmb_v10, and set properties
  set ilmb_v10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_v10:3.0 ilmb_v10 ]

  # Create instance: dlmb_bram_if_cntlr, and set properties
  set dlmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 dlmb_bram_if_cntlr ]
  set_property CONFIG.C_ECC {0} $dlmb_bram_if_cntlr


  # Create instance: ilmb_bram_if_cntlr, and set properties
  set ilmb_bram_if_cntlr [ create_bd_cell -type ip -vlnv xilinx.com:ip:lmb_bram_if_cntlr:4.0 ilmb_bram_if_cntlr ]
  set_property CONFIG.C_ECC {0} $ilmb_bram_if_cntlr


  # Create instance: lmb_bram, and set properties
  set lmb_bram [ create_bd_cell -type ip -vlnv xilinx.com:ip:blk_mem_gen:8.4 lmb_bram ]
  set_property -dict [list \
    CONFIG.Memory_Type {True_Dual_Port_RAM} \
    CONFIG.use_bram_block {BRAM_Controller} \
  ] $lmb_bram


  # Create interface connections
  connect_bd_intf_net -intf_net microblaze_0_dlmb [get_bd_intf_pins dlmb_v10/LMB_M] [get_bd_intf_pins DLMB]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_bus [get_bd_intf_pins dlmb_v10/LMB_Sl_0] [get_bd_intf_pins dlmb_bram_if_cntlr/SLMB]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_cntlr [get_bd_intf_pins dlmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTA]
  connect_bd_intf_net -intf_net microblaze_0_ilmb [get_bd_intf_pins ilmb_v10/LMB_M] [get_bd_intf_pins ILMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_bus [get_bd_intf_pins ilmb_v10/LMB_Sl_0] [get_bd_intf_pins ilmb_bram_if_cntlr/SLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_cntlr [get_bd_intf_pins ilmb_bram_if_cntlr/BRAM_PORT] [get_bd_intf_pins lmb_bram/BRAM_PORTB]

  # Create port connections
  connect_bd_net -net SYS_Rst_1  [get_bd_pins SYS_Rst] \
  [get_bd_pins dlmb_v10/SYS_Rst] \
  [get_bd_pins dlmb_bram_if_cntlr/LMB_Rst] \
  [get_bd_pins ilmb_v10/SYS_Rst] \
  [get_bd_pins ilmb_bram_if_cntlr/LMB_Rst]
  connect_bd_net -net microblaze_0_Clk  [get_bd_pins LMB_Clk] \
  [get_bd_pins dlmb_v10/LMB_Clk] \
  [get_bd_pins dlmb_bram_if_cntlr/LMB_Clk] \
  [get_bd_pins ilmb_v10/LMB_Clk] \
  [get_bd_pins ilmb_bram_if_cntlr/LMB_Clk]

  # Restore current instance
  current_bd_instance $oldCurInst
}
  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR3 [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR3 ]


  # Create ports
  set sys_clk_p [ create_bd_port -dir I sys_clk_p ]
  set sys_clk_n [ create_bd_port -dir I sys_clk_n ]
  set rst_n [ create_bd_port -dir I rst_n ]
  set sd_data [ create_bd_port -dir I -from 3 -to 0 sd_data ]
  set sd_clk [ create_bd_port -dir O -type clk sd_clk ]
  set sd_cmd [ create_bd_port -dir IO -type data sd_cmd ]
  set uart_rx [ create_bd_port -dir I uart_rx ]
  set uart_tx [ create_bd_port -dir O uart_tx ]

  # Create instance: mig_7series_0, and set properties
  set mig_7series_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mig_7series:4.2 mig_7series_0 ]

  # Generate the PRJ File for MIG
  set str_mig_folder [get_property IP_DIR [ get_ips [ get_property CONFIG.Component_Name $mig_7series_0 ] ] ]
  set str_mig_file_name mig_a.prj
  set str_mig_file_path ${str_mig_folder}/${str_mig_file_name}
  write_mig_file_andromeda_mig_7series_0_0 $str_mig_file_path

  set_property -dict [list \
    CONFIG.BOARD_MIG_PARAM {Custom} \
    CONFIG.MIG_DONT_TOUCH_PARAM {Custom} \
    CONFIG.RESET_BOARD_INTERFACE {Custom} \
    CONFIG.XML_INPUT_FILE {mig_a.prj} \
  ] $mig_7series_0


  # Create instance: axi_uartlite_0, and set properties
  set axi_uartlite_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_uartlite:2.0 axi_uartlite_0 ]
  set_property CONFIG.C_BAUDRATE {115200} $axi_uartlite_0


  # Create instance: rst_mig_7series_0_200M, and set properties
  set rst_mig_7series_0_200M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_200M ]

  # Create instance: axi_smc, and set properties
  set axi_smc [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_MI {5} \
    CONFIG.NUM_SI {1} \
  ] $axi_smc


  # Create instance: axi_smc_1, and set properties
  set axi_smc_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 axi_smc_1 ]
  set_property -dict [list \
    CONFIG.NUM_CLKS {2} \
    CONFIG.NUM_SI {3} \
  ] $axi_smc_1


  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]

  # Create instance: rst_mig_7series_0_100M, and set properties
  set rst_mig_7series_0_100M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_mig_7series_0_100M ]

  # Create instance: sd_controller_wrapper_0, and set properties
  set block_name sd_controller_wrapper
  set block_cell_name sd_controller_wrapper_0
  if { [catch {set sd_controller_wrapper_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $sd_controller_wrapper_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: microblaze_0, and set properties
  set microblaze_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:microblaze:11.0 microblaze_0 ]
  set_property -dict [list \
    CONFIG.C_DEBUG_ENABLED {1} \
    CONFIG.C_D_AXI {1} \
    CONFIG.C_D_LMB {1} \
    CONFIG.C_ENABLE_CONVERSION {0} \
    CONFIG.C_I_LMB {1} \
  ] $microblaze_0


  # Create instance: microblaze_0_local_memory
  create_hier_cell_microblaze_0_local_memory [current_bd_instance .] microblaze_0_local_memory

  # Create instance: mdm_1, and set properties
  set mdm_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:mdm:3.2 mdm_1 ]

  # Create instance: axi_memset_dma_0, and set properties
  set block_name axi_memset_dma
  set block_cell_name axi_memset_dma_0
  if { [catch {set axi_memset_dma_0 [create_bd_cell -type module -reference $block_name $block_cell_name] } errmsg] } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2095 -severity "ERROR" "Unable to add referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   } elseif { $axi_memset_dma_0 eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2096 -severity "ERROR" "Unable to referenced block <$block_name>. Please add the files for ${block_name}'s definition into the project."}
     return 1
   }
  
  # Create instance: ila_0, and set properties
  set ila_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_0 ]
  set_property -dict [list \
    CONFIG.C_MONITOR_TYPE {Native} \
    CONFIG.C_NUM_OF_PROBES {6} \
    CONFIG.C_PROBE2_WIDTH {2} \
    CONFIG.C_PROBE3_WIDTH {4} \
    CONFIG.C_PROBE4_WIDTH {32} \
    CONFIG.C_PROBE5_WIDTH {8} \
  ] $ila_0


  # Create interface connections
  connect_bd_intf_net -intf_net axi_memset_dma_0_m_axi [get_bd_intf_pins axi_smc_1/S02_AXI] [get_bd_intf_pins axi_memset_dma_0/m_axi]
  connect_bd_intf_net -intf_net axi_smc_1_M00_AXI [get_bd_intf_pins axi_smc_1/M00_AXI] [get_bd_intf_pins mig_7series_0/S_AXI]
  connect_bd_intf_net -intf_net axi_smc_M00_AXI [get_bd_intf_pins axi_smc/M00_AXI] [get_bd_intf_pins axi_timer_0/S_AXI]
  connect_bd_intf_net -intf_net axi_smc_M01_AXI [get_bd_intf_pins axi_smc/M01_AXI] [get_bd_intf_pins sd_controller_wrapper_0/axilite]
  connect_bd_intf_net -intf_net axi_smc_M02_AXI [get_bd_intf_pins axi_smc/M02_AXI] [get_bd_intf_pins axi_uartlite_0/S_AXI]
  connect_bd_intf_net -intf_net axi_smc_M03_AXI [get_bd_intf_pins axi_smc/M03_AXI] [get_bd_intf_pins axi_smc_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_smc_M04_AXI [get_bd_intf_pins axi_smc/M04_AXI] [get_bd_intf_pins axi_memset_dma_0/s_axi]
  connect_bd_intf_net -intf_net microblaze_0_M_AXI_DP [get_bd_intf_pins microblaze_0/M_AXI_DP] [get_bd_intf_pins axi_smc/S00_AXI]
  connect_bd_intf_net -intf_net microblaze_0_debug [get_bd_intf_pins mdm_1/MBDEBUG_0] [get_bd_intf_pins microblaze_0/DEBUG]
  connect_bd_intf_net -intf_net microblaze_0_dlmb_1 [get_bd_intf_pins microblaze_0/DLMB] [get_bd_intf_pins microblaze_0_local_memory/DLMB]
  connect_bd_intf_net -intf_net microblaze_0_ilmb_1 [get_bd_intf_pins microblaze_0/ILMB] [get_bd_intf_pins microblaze_0_local_memory/ILMB]
  connect_bd_intf_net -intf_net mig_7series_0_DDR3 [get_bd_intf_ports DDR3] [get_bd_intf_pins mig_7series_0/DDR3]
  connect_bd_intf_net -intf_net sd_controller_wrapper_0_axi [get_bd_intf_pins sd_controller_wrapper_0/axi] [get_bd_intf_pins axi_smc_1/S00_AXI]

  # Create port connections
  connect_bd_net -net Net  [get_bd_ports sd_cmd] \
  [get_bd_pins sd_controller_wrapper_0/sdcmd]
  connect_bd_net -net axi_memset_dma_0_bytes_in_current_burst_debug  [get_bd_pins axi_memset_dma_0/bytes_in_current_burst_debug] \
  [get_bd_pins ila_0/probe4]
  connect_bd_net -net axi_memset_dma_0_dma_busy_debug  [get_bd_pins axi_memset_dma_0/dma_busy_debug] \
  [get_bd_pins ila_0/probe1]
  connect_bd_net -net axi_memset_dma_0_dma_start_debug  [get_bd_pins axi_memset_dma_0/dma_start_debug] \
  [get_bd_pins ila_0/probe0]
  connect_bd_net -net axi_memset_dma_0_dma_status_debug  [get_bd_pins axi_memset_dma_0/dma_status_debug] \
  [get_bd_pins ila_0/probe2]
  connect_bd_net -net axi_memset_dma_0_dout_debug  [get_bd_pins axi_memset_dma_0/dout_debug] \
  [get_bd_pins ila_0/probe5]
  connect_bd_net -net axi_memset_dma_0_master_state_debug  [get_bd_pins axi_memset_dma_0/master_state_debug] \
  [get_bd_pins ila_0/probe3]
  connect_bd_net -net axi_uartlite_0_tx  [get_bd_pins axi_uartlite_0/tx] \
  [get_bd_ports uart_tx]
  connect_bd_net -net mdm_1_debug_sys_rst  [get_bd_pins mdm_1/Debug_SYS_Rst] \
  [get_bd_pins rst_mig_7series_0_200M/mb_debug_sys_rst]
  connect_bd_net -net microblaze_0_Clk  [get_bd_pins mig_7series_0/ui_clk] \
  [get_bd_pins axi_timer_0/s_axi_aclk] \
  [get_bd_pins axi_smc/aclk] \
  [get_bd_pins rst_mig_7series_0_200M/slowest_sync_clk] \
  [get_bd_pins axi_uartlite_0/s_axi_aclk] \
  [get_bd_pins axi_smc_1/aclk] \
  [get_bd_pins microblaze_0/Clk] \
  [get_bd_pins microblaze_0_local_memory/LMB_Clk] \
  [get_bd_pins ila_0/clk] \
  [get_bd_pins axi_memset_dma_0/aclk]
  connect_bd_net -net mig_7series_0_mmcm_locked  [get_bd_pins mig_7series_0/mmcm_locked] \
  [get_bd_pins rst_mig_7series_0_200M/dcm_locked] \
  [get_bd_pins rst_mig_7series_0_100M/dcm_locked]
  connect_bd_net -net mig_7series_0_ui_addn_clk_0  [get_bd_pins mig_7series_0/ui_addn_clk_0] \
  [get_bd_pins axi_smc_1/aclk1] \
  [get_bd_pins axi_smc/aclk1] \
  [get_bd_pins rst_mig_7series_0_100M/slowest_sync_clk] \
  [get_bd_pins sd_controller_wrapper_0/aclk]
  connect_bd_net -net mig_7series_0_ui_clk_sync_rst  [get_bd_pins mig_7series_0/ui_clk_sync_rst] \
  [get_bd_pins rst_mig_7series_0_200M/ext_reset_in] \
  [get_bd_pins rst_mig_7series_0_100M/ext_reset_in]
  connect_bd_net -net rst_mig_7series_0_100M_peripheral_aresetn  [get_bd_pins rst_mig_7series_0_100M/peripheral_aresetn] \
  [get_bd_pins axi_smc_1/aresetn] \
  [get_bd_pins axi_smc/aresetn] \
  [get_bd_pins sd_controller_wrapper_0/aresetn]
  connect_bd_net -net rst_mig_7series_0_200M_bus_struct_reset  [get_bd_pins rst_mig_7series_0_200M/bus_struct_reset] \
  [get_bd_pins microblaze_0_local_memory/SYS_Rst]
  connect_bd_net -net rst_mig_7series_0_200M_mb_reset  [get_bd_pins rst_mig_7series_0_200M/mb_reset] \
  [get_bd_pins microblaze_0/Reset]
  connect_bd_net -net rst_mig_7series_0_200M_peripheral_aresetn  [get_bd_pins rst_mig_7series_0_200M/peripheral_aresetn] \
  [get_bd_pins axi_uartlite_0/s_axi_aresetn] \
  [get_bd_pins axi_timer_0/s_axi_aresetn] \
  [get_bd_pins mig_7series_0/aresetn] \
  [get_bd_pins axi_memset_dma_0/aresetn]
  connect_bd_net -net rst_n_1  [get_bd_ports rst_n] \
  [get_bd_pins mig_7series_0/sys_rst]
  connect_bd_net -net sd_controller_wrapper_0_sdclk  [get_bd_pins sd_controller_wrapper_0/sdclk] \
  [get_bd_ports sd_clk]
  connect_bd_net -net sd_data_1  [get_bd_ports sd_data] \
  [get_bd_pins sd_controller_wrapper_0/sddat]
  connect_bd_net -net sys_clk_n_1  [get_bd_ports sys_clk_n] \
  [get_bd_pins mig_7series_0/sys_clk_n]
  connect_bd_net -net sys_clk_p_1  [get_bd_ports sys_clk_p] \
  [get_bd_pins mig_7series_0/sys_clk_p]
  connect_bd_net -net uart_rx_1  [get_bd_ports uart_rx] \
  [get_bd_pins axi_uartlite_0/rx]

  # Create address segments
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces sd_controller_wrapper_0/axi] [get_bd_addr_segs mig_7series_0/memmap/memaddr] -force
  assign_bd_address -offset 0x00020000 -range 0x00001000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_memset_dma_0/s_axi/reg0] -force
  assign_bd_address -offset 0x41C00000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x40600000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs axi_uartlite_0/S_AXI/Reg] -force
  assign_bd_address -offset 0x00000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs microblaze_0_local_memory/dlmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs mig_7series_0/memmap/memaddr] -force
  assign_bd_address -offset 0x00010000 -range 0x00001000 -target_address_space [get_bd_addr_spaces microblaze_0/Data] [get_bd_addr_segs sd_controller_wrapper_0/axilite/reg0] -force
  assign_bd_address -offset 0x00000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces microblaze_0/Instruction] [get_bd_addr_segs microblaze_0_local_memory/ilmb_bram_if_cntlr/SLMB/Mem] -force
  assign_bd_address -offset 0x80000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_memset_dma_0/m_axi] [get_bd_addr_segs mig_7series_0/memmap/memaddr] -force


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_andromeda()

cr_bd_andromeda ""
set_property REGISTERED_WITH_MANAGER "1" [get_files andromeda.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files andromeda.bd ] 

#call make_wrapper to create wrapper files
if { [get_property IS_LOCKED [ get_files -norecurse [list andromeda.bd]] ] == 1  } {
  import_files -fileset sources_1 [file normalize "${origin_dir}/hdl/andromeda_wrapper.v" ]
} else {
  set wrapper_path [make_wrapper -fileset sources_1 -files [ get_files -norecurse [list andromeda.bd]] -top]
  add_files -norecurse -fileset sources_1 $wrapper_path
}


set idrFlowPropertiesConstraints ""
catch {
 set idrFlowPropertiesConstraints [get_param runs.disableIDRFlowPropertyConstraints]
 set_param runs.disableIDRFlowPropertyConstraints 1
}

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xc7k325tffg900-2 -flow {Vivado Synthesis 2024} -strategy "Vivado Synthesis Defaults" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Vivado Synthesis Defaults" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2024" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property -name "needs_refresh" -value "1" -objects $obj
set_property -name "part" -value "xc7k325tffg900-2" -objects $obj
#set_property -name "incremental_checkpoint" -value "$proj_dir/${_xil_proj_name_}.srcs/synth/sd_card_test.dcp" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "1" -objects $obj
set_property -name "strategy" -value "Vivado Synthesis Defaults" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xc7k325tffg900-2 -flow {Vivado Implementation 2015} -strategy "Vivado Implementation Defaults" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Vivado Implementation Defaults" [get_runs impl_1]
  set_property flow "Vivado Implementation 2015" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property -name "needs_refresh" -value "1" -objects $obj
set_property -name "part" -value "xc7k325tffg900-2" -objects $obj
set_property -name "strategy" -value "Vivado Implementation Defaults" -objects $obj
set_property -name "steps.write_bitstream.args.bin_file" -value "1" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]
catch {
 if { $idrFlowPropertiesConstraints != {} } {
   set_param runs.disableIDRFlowPropertyConstraints $idrFlowPropertiesConstraints
 }
}

# Generate the wrapper
make_wrapper -files [get_files *${block_name}.bd] -top
add_files -norecurse ${design_name}/${design_name}.gen/sources_1/bd/${block_name}/hdl/${block_name}_wrapper.v

# Update the compile order
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

# Ensure parameter propagation has been performed
open_bd_design [get_files ${block_name}.bd]
validate_bd_design -force
save_bd_design

puts "INFO: Project created:${_xil_proj_name_} for target board ${target}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -nahttps://meet.google.com/iuc-eqwd-snwme {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]

# Delete the gadget 'utilization_1' 
if {[string equal [get_dashboard_gadgets [ list "utilization_1" ] ] "utilization_1"]} {
delete_dashboard_gadgets -gadgets utilization_1
}
move_dashboard_gadget -name {timing_1} -row 0 -col 0
move_dashboard_gadget -name {utilization_2} -row 1 -col 0
move_dashboard_gadget -name {methodology_1} -row 2 -col 0
move_dashboard_gadget -name {power_1} -row 0 -col 1
move_dashboard_gadget -name {drc_1} -row 1 -col 1
