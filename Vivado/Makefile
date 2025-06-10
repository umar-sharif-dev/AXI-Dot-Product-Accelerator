###################################
# Andromeda Makefile
###################################
# Apex Compute Inc. Copyright 2025
# @Farhan Ullah Tariq


CP = cp -rf
MKDIR = mkdir -p
RM = rm -rf
ROOT_DIR = $(shell pwd)
VIVADO = $(XILINX_VIVADO)/bin/vivado
BD_NAME = andromeda

# defaults
.DEFAULT_GOAL := xsa
TARGET ?= none
JOBS ?= 8

# Valid targets list
TARGET_LIST := alinx puzhi

# Vivado paths
VIVADO_SCRIPT_BD_ALINX = scripts/build_alinx.tcl
VIVADO_SCRIPT_BD_PUZHI = scripts/build_puzhi.tcl

# Select the correct script if TARGET is valid
ifeq ($(TARGET),alinx)
  VIVADO_SCRIPT_BD := $(VIVADO_SCRIPT_BD_ALINX)
else ifeq ($(TARGET),puzhi)
  VIVADO_SCRIPT_BD := $(VIVADO_SCRIPT_BD_PUZHI)
else ifneq ($(TARGET),none)
  $(error Unsupported TARGET '$(TARGET)'. Use 'alinx' or 'puzhi')
endif
VIVADO_SCRIPT_XSA = scripts/xsa.tcl
VIVADO_DIR = $(TARGET)


# Outptu files
VIVADO_XPR = $(VIVADO_DIR)/$(TARGET).xpr
VIVADO_XSA = $(VIVADO_DIR)/$(BD_NAME)_wrapper.xsa
VIVADO_XPR_LOG = $(TARGET)_xpr.log
VIVADO_XPR_JOU = $(TARGET)_xpr.jou
VIVADO_XSA_LOG = $(TARGET)_xsa.log
VIVADO_XSA_JOU = $(TARGET)_xsa.jou
VIVADO_BIT = $(VIVADO_DIR)/$(TARGET).runs/impl_1/$(BD_NAME)_wrapper.bit
VIVADO_LOCK = $(ROOT_DIR)/.$(TARGET).lock

.PHONY: help
help:
	@echo 'Usage:'
	@echo ''
	@echo '  make xsa TARGET=<val> JOBS=<n>'
	@echo '    Create the Vivado project and block design, then synthesize'
	@echo '    implement and export to XSA.'
	@echo ''
	@echo '  make project TARGET=<val>'
	@echo '    Create the Vivado project and block design.'
	@echo ''
	@echo '  make clean TARGET=<val>'
	@echo '    Clean runs for target project.'
	@echo ''
	@echo 'Parameters:'
	@echo ''
	@echo '  TARGET: Name of the target design, must be one of the following:'
	@$(foreach targ,$(TARGET_LIST),echo "    - $(targ)";)
	@echo ''

.PHONY: xsa
xsa:    print
	@if [ -f $(VIVADO_LOCK) ]; then \
		echo "$(TARGET) is locked. Skipping..."; \
	else \
		touch $(VIVADO_LOCK); \
		$(MAKE) xsa_locked TARGET=$(TARGET) JOBS=$(JOBS); \
		rm -f $(VIVADO_LOCK); \
	fi

xsa_locked: $(VIVADO_XSA) 
$(VIVADO_XSA): $(VIVADO_XPR)
	$(RM) $(VIVADO_XSA_LOG) $(VIVADO_XSA_JOU)
	$(VIVADO) -mode batch -notrace -source $(VIVADO_SCRIPT_XSA) -log $(VIVADO_XSA_LOG) -journal $(VIVADO_XSA_JOU) -tclargs $(TARGET) $(JOBS)
	$(CP) $(VIVADO_XSA_LOG) $(VIVADO_XSA_JOU) $(TARGET)/.
	$(RM) $(VIVADO_XSA_LOG) $(VIVADO_XSA_JOU)

check_warnings:
	@grep "CRITICAL WARNING:" $(TARGET)/$(VIVADO_XSA_LOG) && { \
		echo "Critical warnings found. Exiting."; \
		echo "For details see: $(TARGET)/$(VIVADO_XSA_LOG)"; \
		exit 1; \
	} || true
	
	
.PHONY: project
project: check_target
	@if [ -f $(VIVADO_LOCK) ]; then \
		echo "$(TARGET) is locked. Skipping..."; \
	else \
		touch $(VIVADO_LOCK); \
		$(MAKE) project_locked TARGET=$(TARGET) JOBS=$(JOBS); \
		rm -f $(VIVADO_LOCK); \
	fi

project_locked: $(VIVADO_XPR)
$(VIVADO_XPR):
	@echo 'Create Vivado project $(TARGET)'
	$(RM) $(VIVADO_XPR_LOG) $(VIVADO_XPR_JOU)
	$(VIVADO) -mode batch -notrace -source $(VIVADO_SCRIPT_BD) -log $(VIVADO_XPR_LOG) -journal $(VIVADO_XPR_JOU) -tclargs $(TARGET)
	$(CP) $(VIVADO_XPR_LOG) $(VIVADO_XPR_JOU) $(TARGET)/.
	$(RM) $(VIVADO_XPR_LOG) $(VIVADO_XPR_JOU)	
	

.PHONY: clean
clean: check_target
	@echo 'Cleaning project $(TARGET)'
	$(RM) $(VIVADO_DIR)
	
# Internal target to resolve script based on TARGET
.PHONY: check_target
check_target:
ifeq ($(TARGET),none)
	$(error TARGET not specified. Use 'make <target> TARGET=alinx|puzhi')
endif

print: 
	clear
	@echo "########################################################################"
	@echo "#     _    _   _  ____    ____   ___   __  __  _____  ____       _     #"	
	@echo "#    / \  | \ | || ___ \ |  _ \ / _ \ |  \/  || ____|| ___ \    / \    #"
	@echo "#   / _ \ |  \| || |  | || |_) | | | || |\/| ||  _| || |  | |  / _ \   #"
	@echo "#  / ___ \| |\  || |__| ||  _< | |_| || |  | || |___ | |__| | / ___ \  #"
	@echo "# /_/   \_\_| \_||_____/ |_| \_\\\\___/ |_|  |_||_____||_____/ /_/   \_\ #"
	@echo "#                          © Apex Compute                              #"
	@echo "########################################################################"

