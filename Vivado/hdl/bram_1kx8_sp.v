/// Start of Selection
////////////////////////////////////////////////////////////////////////////////
// Single-port block RAM, 1KB depth (1024 × 8 bits) using Xilinx XPM
////////////////////////////////////////////////////////////////////////////////

module bram_1kx8_sp (
    input  wire        clk,      // clock for read/write
    input  wire        en,       // enable
    input  wire        we,       // write enable (1 = write, 0 = read)
    input  wire [9:0]  addr,     // 10-bit address (up to 1023)
    input  wire [7:0]  din,      // data in (for write)
    output wire [7:0]  dout      // data out (for read)
);

  // XPM single-port RAM instantiation
  // For UltraScale and 7-Series devices
  xpm_memory_spram #(
    .MEMORY_SIZE        (1024*8),   // 1024 (depth) x 8 (width)
    .MEMORY_PRIMITIVE   ("block"),  // Force block RAM
    .WRITE_DATA_WIDTH_A (8),
    .READ_DATA_WIDTH_A  (8),
    .BYTE_WRITE_WIDTH_A (8),
    .ADDR_WIDTH_A       (10),
    .READ_LATENCY_A     (1),
    .WRITE_MODE_A       ("write_first")
  ) xpm_sp_ram_inst (
    .clka   (clk),
    .ena    (en),
    .wea    (we),
    .addra  (addr),
    .dina   (din),
    .douta  (dout)
  );

endmodule