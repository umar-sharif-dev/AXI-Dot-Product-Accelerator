# IntelliFPGA Inc. 2025
# @Farhan Ullah Tariq


# Use this Makefile to build Vitis workspace

CP = cp -rf
MKDIR = mkdir -p
RM = rm -rf
ROOT_DIR = $(shell pwd)
VITIS = $(XILINX_VITIS)/bin/vitis
XSCT = $(XILINX_VITIS)/bin/xsct
BD_NAME = andromeda

# defaults
.DEFAULT_GOAL := workspace
TARGET ?= none
JOBS ?= 8


# Valid targets list
alinx_target := microblaze  # TODO replace with target name
puzhi_target := microblaze


TARGET_LIST := $(sort $(patsubst %_target,%,$(filter %_target,$(.VARIABLES))))

# Vitis Paths
VITIS_SCRIPT_WS = scripts/create_andromeda_app.py
VITIS_PROG_TCL  = scripts/program_hardware.tcl
VITIS_TARGET_WS = $(ROOT_DIR)/$(TARGET)_workspace
VITIS_LOCK = $(ROOT_DIR)/.$(TARGET).lock
VITIS_BOOT = $(ROOT_DIR)/boot
VITIS_BOOT_TARG = $(VITIS_BOOT)/$(TARGET)

# Vivado paths
VIVADO_DIR = $(ROOT_DIR)/../Vivado
VIVADO_PRJ_DIR = $(VIVADO_DIR)/$(TARGET)
VIVADO_XSA = $(VIVADO_PRJ_DIR)/$(BD_NAME)_wrapper.xsa


VITIS_BOOT_FILE = $(VITIS_BOOT_TARG)/$(TARGET).bit

.PHONY: help
help:
	@echo 'Usage:'
	@echo ''
	@echo '  make workspace TARGET=<target> JOBS=<val>'
	@echo '    Create the Vitis workspace and add applications for specified target.'
	@echo ''
	@echo '  make clean TARGET=<target>'
	@echo '    Delete the Vitis workspace and all applications for specified target.'
	@echo ''
	@echo '  make flash_n_debug'
	@echo '    To program hardware with bit and elf files'
	@echo ''
	@echo 'Parameters:'
	@echo ''
	@echo '  TARGET: Name of the target design'
	@echo ''
	@echo '  JOBS: Optional param to set number of synthesis jobs (default 8)'
	@echo ''
	@echo 'Example usage:'
	@echo '  make workspace TARGET=alinx '
	@echo ''
	
	
.PHONY: workspace
workspace: check_target
	@if [ -f $(VITIS_LOCK) ]; then \
		echo "$(TARGET) is locked. Skipping..."; \
	else \
		touch $(VITIS_LOCK); \
		$(MAKE) workspace_locked TARGET=$(TARGET) JOBS=$(JOBS); \
		rm -f $(VITIS_LOCK); \
	fi

workspace_locked: $(VITIS_TARGET_WS) $(VITIS_BOOT_FILE)

$(VITIS_TARGET_WS) $(VITIS_BOOT_FILE): $(VIVADO_XSA)
	@if [ -d $@ ]; then echo "Workspace for $(TARGET) already exists but is outdated. Use 'make clean TARGET=$(TARGET)' to remove it."; exit 1; fi
	$(VITIS) -s  $(VITIS_SCRIPT_WS) $(TARGET)
	

$(VIVADO_XSA):
	$(MAKE) -C $(VIVADO_DIR) xsa TARGET=$(TARGET) JOBS=$(JOBS)

.PHONY: flash_n_debug
flash_n_debug: 
	$(XSCT) -interactive $(VITIS_PROG_TCL) $(TARGET)


.PHONY: clean
clean: check_target
	$(RM) $(TARGET)_workspace

check_target:
ifndef $(TARGET)_target
	$(error "Please specify a TARGET. Use 'make help' to see valid targets.")
endif
