#
# Copyright (C) 2024, Advanced Micro Devices, Inc. All rights reserved.
# SPDX-License-Identifier: MIT
#
# Modified for MicroBlaze on Kintex-7

import vitis
import os
import shutil
import sys
import subprocess

target_name = sys.argv[1]
with open("./common/src/target_config.h", "w") as f:
    f.write(f"#define {target_name} 1\n")
WORKSPACE_DIR = f"{target_name}_workspace"
workspace = os.path.join(os.getcwd(), f"./{WORKSPACE_DIR}")
workspace = os.path.normpath(workspace)

print("Creating workspace at " + workspace)
if os.path.exists(workspace):
    print("workspace exists. Deleting ...")
    shutil.rmtree(workspace)

boot_dir = f"./boot/{target_name}"
if not os.path.exists(boot_dir):
    print("Creating boot directory")
    os.makedirs(boot_dir)
client = vitis.create_client()
client.set_workspace(workspace)
xsa_path = f"../Vivado/{target_name}/andromeda_wrapper.xsa"  
xsa_path = os.path.normpath(xsa_path)






# Create MicroBlaze platform
platform = client.create_platform_component(
    name=f"{target_name}_mb_platform",
    hw_design=xsa_path,
    os="standalone",
    cpu="microblaze_0",  # Make sure this matches the CPU name in the design
    domain_name="standalone_microblaze_0"
)

platform = client.get_component(name=f"{target_name}_mb_platform")
# Build platform
status = platform.build()
# Path to generated .xpfm file
xpfm = os.path.join(
    workspace,
    f"{target_name}_mb_platform/export/{target_name}_mb_platform/{target_name}_mb_platform.xpfm"
)
xpfm = os.path.normpath(xpfm)

# Create an empty app
comp = client.create_app_component(
    name="andromeda_mb",
    platform=xpfm,
    domain="standalone_microblaze_0",
    template="empty_application"
)

comp = client.get_component(name="andromeda_mb")
comp.import_files(from_loc="./common/src", files=["andromeda.c"], dest_dir_in_cmp = "src")
comp.import_files(from_loc="./common/src", files=["platform.c"], dest_dir_in_cmp = "src")
comp.import_files(from_loc="./common/src", files=["platform.h"], dest_dir_in_cmp = "src")
comp.import_files(from_loc="./common/src", files=["target_config.h"], dest_dir_in_cmp = "src")
comp.build()

# For Microblaze

bitstream_path = f"../Vivado/{target_name}/{target_name}.runs/impl_1/andromeda_wrapper.bit" 
bitstream_path = os.path.normpath(bitstream_path)
mmi_path = f"../Vivado/{target_name}/{target_name}.runs/impl_1/andromeda_wrapper.mmi" 
mmi_path = os.path.normpath(mmi_path)
elf_path = f"./{target_name}_workspace/andromeda_mb/build/andromeda_mb.elf" 
elf_path = os.path.normpath(elf_path)
proc_path = f"../Vivado/{target_name}/{target_name}.gen/sources_1/bd/andromeda/ip/andromeda_microblaze_0_0/" 
proc_path = os.path.normpath(proc_path)
target_bit_path = f"./boot/{target_name}/{target_name}_combined.bit" 
target_bit_path = os.path.normpath(target_bit_path)
# Copy file to boot_dir
print("Copying bitstream and elf files to boot directory")
shutil.copy2(bitstream_path, boot_dir)
shutil.copy2(elf_path, boot_dir)
# Global variables 
mb_combine_bit_elf = True
if mb_combine_bit_elf:
    # Generate the download.bit file with combined .bit and .elf
    try:
        subprocess.run([
            "updatemem",
            "--bit", bitstream_path,
            "--meminfo", mmi_path,
            "--data", elf_path,
            "--proc", "andromeda_i/microblaze_0",
            "-force",
            "--out", target_bit_path
        ], check=True)
    except subprocess.CalledProcessError as e:
        print("Error while running updatemem:", e)
    # Delete log files if they exist
    for log_file in ["updatemem.log", "updatemem.jou"]:
        try:
            os.remove(log_file)
        except FileNotFoundError:
            pass
# Close the client connection and terminate the vitis server
vitis.dispose()
