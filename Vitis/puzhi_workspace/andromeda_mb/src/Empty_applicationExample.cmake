set(DDR lmb_bram_0)
set(ddr4_0 "0x80000000;0x80000000")
set(lmb_bram_0 "0x50;0x1ffb0")
set(TOTAL_MEM_CONTROLLERS "lmb_bram_0;ddr4_0")
set(MEMORY_SECTION "MEMORY
{
	ddr4_0 : ORIGIN = 0x80000000, LENGTH = 0x80000000
	lmb_bram_0 : ORIGIN = 0x50, LENGTH = 0x1ffb0
}")
set(STACK_SIZE 0x400)
set(HEAP_SIZE 0x800)
