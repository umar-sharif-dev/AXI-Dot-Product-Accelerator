# 2025-06-12T11:04:05.072078
import vitis

client = vitis.create_client()
client.set_workspace(path="puzhi_workspace")

platform = client.create_platform_component(name = "puzhi_mb_platform",hw_design = "$COMPONENT_LOCATION/../../../Vivado/puzhi/andromeda_wrapper.xsa",os = "standalone",cpu = "microblaze_0",domain_name = "standalone_microblaze_0",generate_dtb = True)

platform = client.get_component(name="puzhi_mb_platform")
status = platform.build()

comp = client.create_app_component(name="andromeda_mb",platform = "$COMPONENT_LOCATION/../puzhi_mb_platform/export/puzhi_mb_platform/puzhi_mb_platform.xpfm",domain = "standalone_microblaze_0",template = "empty_application")

comp = client.get_component(name="andromeda_mb")
status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../common/src", files=["andromeda.c"], dest_dir_in_cmp = "src")

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../common/src", files=["platform.c"], dest_dir_in_cmp = "src")

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../common/src", files=["platform.h"], dest_dir_in_cmp = "src")

status = comp.import_files(from_loc="$COMPONENT_LOCATION/../../common/src", files=["target_config.h"], dest_dir_in_cmp = "src")

comp.build()

vitis.dispose()

