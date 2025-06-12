# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "/home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vitis/puzhi_workspace/puzhi_mb_platform/microblaze_0/standalone_microblaze_0/bsp/include/sleep.h"
  "/home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vitis/puzhi_workspace/puzhi_mb_platform/microblaze_0/standalone_microblaze_0/bsp/include/xiltimer.h"
  "/home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vitis/puzhi_workspace/puzhi_mb_platform/microblaze_0/standalone_microblaze_0/bsp/include/xtimer_config.h"
  "/home/ujaved/work_dir/axi_dpe_ila_v3.0/AXI-Dot-Product-Accelerator/Vitis/puzhi_workspace/puzhi_mb_platform/microblaze_0/standalone_microblaze_0/bsp/lib/libxiltimer.a"
  )
endif()
