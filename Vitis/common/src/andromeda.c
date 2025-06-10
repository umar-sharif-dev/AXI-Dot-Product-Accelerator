#include <stdint.h>
#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xtmrctr.h"
#include "xparameters.h"
#include "target_config.h"
#include "xil_io.h"

#define AXI_DPE_BASE_ADDR 0x30000
#define DPE_X_NUM_BYTES 128

// Number of 32-bit writes on axi-dpe intended to store in BRAM as vector x
uint32_t num_writes = DPE_X_NUM_BYTES;
int32_t buffer[DPE_X_NUM_BYTES] = {
    0x0,  0x1,  0x2,  0x3,  0x4,  0x5,  0x6,  0x7,
    0x8,  0x9,  0xA,  0xB,  0xC,  0xD,  0xE,  0xF,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17,
    0x18, 0x19, 0x1A, 0x1B, 0x1C, 0x1D, 0x1E, 0x1F,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27,
    0x28, 0x29, 0x2A, 0x2B, 0x2C, 0x2D, 0x2E, 0x2F,
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37,
    0x38, 0x39, 0x3A, 0x3B, 0x3C, 0x3D, 0x3E, 0x3F,
    0x40, 0x41, 0x42, 0x43, 0x44, 0x45, 0x46, 0x47,
    0x48, 0x49, 0x4A, 0x4B, 0x4C, 0x4D, 0x4E, 0x4F,
    0x50, 0x51, 0x52, 0x53, 0x54, 0x55, 0x56, 0x57,
    0x58, 0x59, 0x5A, 0x5B, 0x5C, 0x5D, 0x5E, 0x5F,
    0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
    0x68, 0x69, 0x6A, 0x6B, 0x6C, 0x6D, 0x6E, 0x6F,
    0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77,
    0x78, 0x79, 0x7A, 0x7B, 0x7C, 0x7D, 0x7E, 0x7F
};
 

XTmrCtr TimerCounter;
static inline u32 get_timer_val(void)
{
    // Returns the current 32-bit value from the AXI timer
    return XTmrCtr_GetValue(&TimerCounter, 0);
}

typedef struct sdc_reg
{
	volatile uint32_t ctrl;
	volatile uint32_t stat;
	volatile uint32_t dstaddr;
	volatile uint32_t startsector;
	volatile uint32_t sectornum;
	volatile uint32_t progress;
	volatile uint32_t reset;
}sdc_reg_t;

static volatile sdc_reg_t *sdc = (volatile sdc_reg_t *)XPAR_SD_CONTROLLER_WRAPPER_0_BASEADDR;

typedef struct mem_setter
{
    volatile uint32_t source_addr;  // 0x800
    volatile uint32_t target_addr;  // 0x804
    volatile uint32_t length;       // 0x808
    volatile uint32_t control;      // 0x80C
    volatile uint32_t status;       // 0x810
    volatile uint32_t no_access;
} mem_setter_t;

static volatile mem_setter_t *m_setter = (volatile mem_setter_t *)(XPAR_AXI_DPE_0_BASEADDR + 0x800);

void sdcard_reset()
{
	sdc->reset = 0x01;
}

int sdcard_is_busy()
{
    u32 s = sdc->stat;
    return s & 0x01;
}

void wait_sdcard_ready()
{
	u32 cur_time = get_timer_val();
	uint32_t last_progress = sdc->progress;

	while(sdcard_is_busy())
	{
		if(sdc->progress != last_progress)
		{
			last_progress = sdc->progress;
			cur_time = get_timer_val();
		}
		else if((get_timer_val() - cur_time) > 5e6)
		{
			xil_printf("Retrying\r\n");
			sdcard_reset();
			while(sdcard_is_busy());
			cur_time = get_timer_val();
			last_progress = sdc->progress;
			sdc->ctrl = 1;
		}
	}
}

void sdcard_read(uint32_t dstaddr, uint32_t offset, uint32_t size)
{
    wait_sdcard_ready();
	while(sdcard_is_busy());
    sdc->dstaddr = dstaddr;
    sdc->startsector = offset;
    sdc->sectornum = size;
    sdc->ctrl = 1;
}

uint32_t sdcard_get_progress()
{
    return sdc->progress;
}

#if defined(alinx)
    #define BASE_ADDR XPAR_MIG_0_BASEADDRESS
#elif defined(puzhi)
   // #define BASE_ADDR XPAR_LMB_BRAM_0_BASEADDRESS
   #define BASE_ADDR XPAR_DDR4_0_BASEADDRESS
    
#endif

static volatile uint16_t *block_ram = (volatile uint16_t *)(BASE_ADDR);
    static volatile uint32_t *block_ram_32bit = (volatile uint32_t *)(BASE_ADDR);
    static volatile uint8_t *block_ram_8bit = (volatile uint8_t *)(BASE_ADDR);
int main()
{
    init_platform();

    // 1) Initialize the AXI Timer
    XTmrCtr_Initialize(&TimerCounter, XPAR_XTMRCTR_0_BASEADDR);

    // Optionally set auto-reload, but for simple timing we don't necessarily need it
    XTmrCtr_SetOptions(&TimerCounter, 0, XTC_AUTO_RELOAD_OPTION);

    // Reset
    XTmrCtr_Reset(&TimerCounter, 0);

    // Start
    XTmrCtr_Start(&TimerCounter, 0);

    // Sd card reset
	sdcard_reset();

    while((sdc->stat & 0x18) != 0x18);

    xil_printf("Start DMA\r\n");

    sdcard_read(block_ram, 0, 1024*500*2); // 500MB test

    while(sdcard_is_busy());
 
    xil_printf("Transferred %ld bytes\r\n", sdcard_get_progress());

    // uint16_t v = 0x0;
    // for (int i=0; i < 1024*1*512; i++)
    //      if  (v++ != block_ram[i])
    //          xil_printf("err block_ram[%d]: %x\r\n", i, block_ram[i]);

    for (int i = 0; i < 16; i++)
         xil_printf("block_ram[%d]: %x\r\n", i, block_ram_8bit[i]);

    xil_printf("First 16!\r\n");

    for (int i = 0; i < 16; i++)
         xil_printf("block_ram[%d]: %x\r\n", i, block_ram_8bit[512 + i]);

    xil_printf("Fitst 16 after 512!\r\n");
 
    m_setter->source_addr = block_ram;
    m_setter->target_addr = block_ram + 8192;
    m_setter->length = 1024;
    m_setter->control = 0x0;
    
    for (int i = 0; i < DPE_X_NUM_BYTES;  i++){
    	Xil_Out32(AXI_DPE_BASE_ADDR + (i * 4), (u32)buffer[i]);
    	u32 val = Xil_In32(AXI_DPE_BASE_ADDR + (i * 4));
    	xil_printf("Addr 0x%08X = 0x%08X\r\n", AXI_DPE_BASE_ADDR + (i * 4), val);
    }

    while(!(m_setter->status & 0x2))
    {
        xil_printf("status in while loop %x!\r\n", m_setter->status);
    }
    xil_printf("source_addr %x!\r\n", m_setter->source_addr);
    xil_printf("target_addr %x!\r\n", m_setter->target_addr);
    xil_printf("length %x!\r\n", m_setter->length);
    xil_printf("control %x!\r\n", m_setter->control);
    xil_printf("status %x!\r\n", m_setter->status);
    xil_printf("no access %x!\r\n", m_setter->no_access);
    // xil_printf("start %x!\r\n", m_setter->start);
    // xil_printf("value %x!\r\n", m_setter->value);
    // xil_printf("len %x!\r\n", m_setter->len);
    // xil_printf("addr %x!\r\n", m_setter->start_addr);
    // xil_printf("no access %x!\r\n", m_setter->no_access);
    
    // xil_printf("Done memset!\r\n");

    for (int i = 0; i < 1024; i++)
         xil_printf("block_ram[%d]: %x\r\n", i, block_ram[8192 + i]);


    cleanup_platform();
    return 0;
}
