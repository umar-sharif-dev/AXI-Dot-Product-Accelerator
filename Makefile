# Main Makefile (placed at the root of the GitHub repo)

TARGET ?= none

.PHONY: prep_git_push check_target

# Validate TARGET is specified and supported
check_target:
ifeq ($(TARGET),none)
	$(error TARGET not specified. Use 'make prep_git_push TARGET=alinx|puzhi')
endif
ifneq ($(filter $(TARGET),alinx puzhi),$(TARGET))
	$(error Unsupported TARGET '$(TARGET)'. Use 'alinx' or 'puzhi')
endif

# Clean both Vivado and Vitis subdirectories
prep_git_push: check_target
	@echo "Cleaning Vivado and Vitis projects for TARGET=$(TARGET)..."
	@$(MAKE) -C Vivado clean TARGET=$(TARGET)
	@$(MAKE) -C Vitis clean TARGET=$(TARGET)
	@echo "Cleanup complete for TARGET=$(TARGET)."

