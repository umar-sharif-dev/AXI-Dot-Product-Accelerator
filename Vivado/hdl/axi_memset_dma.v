module axi_memset_dma #(
    parameter C_S_AXI_ADDR_WIDTH = 5,
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter C_M_AXI_ADDR_WIDTH = 32,
    parameter C_M_AXI_DATA_WIDTH = 512,
    parameter C_M_AXI_BURST_LEN  = 16
)(
    // Global signals
    input  wire                               aclk,
    input  wire                               aresetn,
    
    //----------------------------------------------------------------------------
    // AXI-Lite Slave Interface
    //----------------------------------------------------------------------------
    // Write Address Channel
    input  wire                               s_axi_awvalid,
    output wire                               s_axi_awready,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]      s_axi_awaddr,
    
    input  wire [2:0]                         s_axi_awprot,
    
    // Write Data Channel
    input  wire                               s_axi_wvalid,
    output wire                               s_axi_wready,
    input  wire [C_S_AXI_DATA_WIDTH-1:0]      s_axi_wdata,
    input  wire [(C_S_AXI_DATA_WIDTH/8)-1:0]  s_axi_wstrb,
    
    // Write Response Channel
    output wire                               s_axi_bvalid,
    input  wire                               s_axi_bready,
    output wire [1:0]                         s_axi_bresp,
    
    // Read Address Channel
    input  wire                               s_axi_arvalid,
    output wire                               s_axi_arready,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0]      s_axi_araddr,
    input  wire [2:0]                         s_axi_arprot,
    
    // Read Data Channel
    output wire                               s_axi_rvalid,
    input  wire                               s_axi_rready,
    output wire [C_S_AXI_DATA_WIDTH-1:0]      s_axi_rdata,
    output wire [1:0]                         s_axi_rresp,
    
    //----------------------------------------------------------------------------
    // AXI Master Interface
    //----------------------------------------------------------------------------
    // READ Address Channel
    output wire                               m_axi_arvalid,
    input  wire                               m_axi_arready,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      m_axi_araddr,
    output wire [7:0]                         m_axi_arlen,
    output wire [2:0]                         m_axi_arsize,
    output wire [1:0]                         m_axi_arburst,
    output wire [2:0]                         m_axi_arprot,
    output wire [3:0]                         m_axi_arcache,
    
    // READ Data Channel
    input  wire                               m_axi_rvalid,
    output wire                               m_axi_rready,
    input  wire [C_M_AXI_DATA_WIDTH-1:0]      m_axi_rdata,
    input  wire [1:0]                         m_axi_rresp,
    input  wire                               m_axi_rlast,

    // WRITE Address Channel
    output wire                               m_axi_awvalid,
    input  wire                               m_axi_awready,
    output wire [C_M_AXI_ADDR_WIDTH-1:0]      m_axi_awaddr,
    output wire [7:0]                         m_axi_awlen,
    output wire [2:0]                         m_axi_awsize,
    output wire [1:0]                         m_axi_awburst,
    output wire [2:0]                         m_axi_awprot,
    output wire [3:0]                         m_axi_awcache,
    
    // Write Data Channel
    output wire                               m_axi_wvalid,
    input  wire                               m_axi_wready,
    output wire [C_M_AXI_DATA_WIDTH-1:0]      m_axi_wdata,
    output wire [(C_M_AXI_DATA_WIDTH/8)-1:0]  m_axi_wstrb,
    output wire                               m_axi_wlast,
    
    // Write Response Channel
    input  wire                               m_axi_bvalid,
    output wire                               m_axi_bready,
    input  wire [1:0]                         m_axi_bresp,

    // Debug signals
    output wire        dma_start_debug,
    output wire        dma_busy_debug,
    output wire [1:0]  dma_status_debug,
    output wire [3:0]  master_state_debug,
    output wire [31:0] bytes_in_current_burst_debug,
    output wire [7:0]  dout_debug
);

    //----------------------------------------------------------------------------
    // Internal registers for AXI-Lite
    //----------------------------------------------------------------------------
    reg [C_M_AXI_ADDR_WIDTH-1:0]  dma_source_addr;
    reg [C_M_AXI_ADDR_WIDTH-1:0]  dma_target_addr;
    reg [31:0]                    dma_length;      
    reg                           dma_start;
    reg                           dma_busy;
    reg [1:0]                     dma_status;     // e.g. 00=idle, 01=busy, 10=complete
    
    // AXI-Lite write FSM states
    localparam [1:0] WRITE_IDLE = 2'b00,
                     WRITE_DATA = 2'b01,
                     WRITE_RESP = 2'b10;
    reg [1:0] write_state;
    reg [C_S_AXI_ADDR_WIDTH-1:0] write_addr;
    
    // AXI-Lite read FSM states
    localparam [1:0] READ_IDLE = 2'b00,
                     READ_DATA = 2'b01;
    reg [1:0] read_state;
    reg [C_S_AXI_ADDR_WIDTH-1:0] read_addr;
    
    // Register map (offsets in the AXI-Lite address space)
    localparam REG_SOURCE_ADDR = 5'h00;
    localparam REG_TARGET_ADDR = 5'h04;
    localparam REG_LENGTH      = 5'h08;
    localparam REG_CONTROL     = 5'h0C;
    localparam REG_STATUS      = 5'h10;

    //----------------------------------------------------------------------------
    // AXI Master FSM
    //----------------------------------------------------------------------------
    localparam [3:0] 
        MASTER_IDLE       = 4'h0,
        MASTER_START      = 4'h1,
        MASTER_AR         = 4'h2,
        MASTER_RDATA      = 4'h3,
        MASTER_STORE      = 4'h4,
        MASTER_INC_READ   = 4'h5,
        MASTER_INC_WAIT   = 4'h6,
        MASTER_INC_DONE   = 4'h7,
        MASTER_AW         = 4'h8,
        MASTER_READOUT    = 4'h9,
        MASTER_READOUT1   = 4'hA,
        MASTER_READOUT2   = 4'hB,
        MASTER_READOUT3   = 4'hC;

    reg [3:0] master_state;

    // Debug signals
    assign dma_start_debug      = dma_start;
    assign dma_busy_debug       = dma_busy;
    assign dma_status_debug     = dma_status;
    assign master_state_debug   = master_state;
    assign bytes_in_current_burst_debug = bytes_in_current_burst;
    assign dout_debug           = bram_dout;
    
    // Counters and control
    reg [31:0] transfer_count;     // count of total BYTES processed
    reg [7:0]  burst_beat_count;   // count beats within current burst
    reg        is_last_beat;       // flag for last beat in burst

    //----------------------------------------------------------------------------
    // Output registers (AXI-Lite)
    //----------------------------------------------------------------------------
    reg        s_axi_awready_r;
    reg        s_axi_wready_r;
    reg        s_axi_bvalid_r;
    reg [1:0]  s_axi_bresp_r;
    reg        s_axi_arready_r;
    reg        s_axi_rvalid_r;
    reg [31:0] s_axi_rdata_r;
    reg [1:0]  s_axi_rresp_r;

    //----------------------------------------------------------------------------
    // AXI Master read path
    //----------------------------------------------------------------------------
    reg                               m_axi_arvalid_r;
    reg [C_M_AXI_ADDR_WIDTH-1:0]      m_axi_araddr_r;
    reg [7:0]                         m_axi_arlen_r;
    reg [2:0]                         m_axi_arsize_r;
    reg [1:0]                         m_axi_arburst_r;
    reg [2:0]                         m_axi_arprot_r;
    reg [3:0]                         m_axi_arcache_r;
    reg                               m_axi_rready_r;

    //----------------------------------------------------------------------------
    // AXI Master write path
    //----------------------------------------------------------------------------
    reg                               m_axi_awvalid_r;
    reg [C_M_AXI_ADDR_WIDTH-1:0]      m_axi_awaddr_r;
    reg [7:0]                         m_axi_awlen_r;
    reg [2:0]                         m_axi_awsize_r;
    reg [1:0]                         m_axi_awburst_r;
    reg [2:0]                         m_axi_awprot_r;
    reg [3:0]                         m_axi_awcache_r;
    reg                               m_axi_wvalid_r;
    reg [C_M_AXI_DATA_WIDTH-1:0]      m_axi_wdata_r;
    reg [(C_M_AXI_DATA_WIDTH/8)-1:0]  m_axi_wstrb_r;
    reg                               m_axi_wlast_r;
    reg                               m_axi_bready_r;

    //----------------------------------------------------------------------------
    // Single-port block RAM instance (8 bits wide, 1024 deep)
    //----------------------------------------------------------------------------
    reg        bram_we;
    reg [9:0]  bram_addr;
    reg [7:0]  bram_din;
    wire [7:0] bram_dout;

    bram_1kx8_sp u_bram (
        .clk  (aclk),
        .en   (1'b1),       // always enabled
        .we   (bram_we),
        .addr (bram_addr),
        .din  (bram_din),
        .dout (bram_dout)
    );

    // Buffer to hold an incoming 512-bit AXI read beat
    reg [C_M_AXI_DATA_WIDTH-1:0] rx_data_reg;
    // Track which of the 64 bytes we're storing
    reg [6:0]  store_count;  // 0..63
    // Track sub-states for readout
    reg [6:0]  readout_count; // 0..63

    // For partial bursts
    integer i;
    reg [31:0] beats_reg;
    reg [31:0] bytes_in_current_burst;
    
    // Track if this is the last beat in the final burst
    reg is_final_burst;
    reg [6:0] final_byte_count;

    //============================================================================
    // AXI-Lite Write Logic
    //============================================================================
    always @(posedge aclk) begin
        if (!aresetn) begin
            write_state       <= WRITE_IDLE;
            s_axi_awready_r   <= 1'b0;
            s_axi_wready_r    <= 1'b0;
            s_axi_bvalid_r    <= 1'b0;
            s_axi_bresp_r     <= 2'b00;
            write_addr        <= {C_S_AXI_ADDR_WIDTH{1'b0}};
            dma_start         <= 1'b0;
        end 
        else begin
            // Clear the 'dma_start' once we actually move to MASTER_START
            if (master_state == MASTER_START) begin
                dma_start <= 1'b0;
            end

            case (write_state)
                WRITE_IDLE: begin
                    s_axi_bvalid_r  <= 1'b0;
                    
                    // Accept write address if valid
                    if (!s_axi_awready_r && s_axi_awvalid) begin
                        write_addr      <= s_axi_awaddr;
                        s_axi_awready_r <= 1'b1;
                    end
                    
                    // Accept write data if valid
                    if (!s_axi_wready_r && s_axi_wvalid) begin
                        s_axi_wready_r  <= 1'b1;
                    end
                    
                    // Move to WRITE_DATA when both address and data phases are captured
                    if (s_axi_awready_r && s_axi_awvalid && s_axi_wready_r && s_axi_wvalid) begin
                        s_axi_awready_r <= 1'b0;
                        s_axi_wready_r  <= 1'b0;
                        write_state     <= WRITE_DATA;
                    end
                end

                WRITE_DATA: begin
                    // Process the write based on address
                    case (write_addr[4:0])
                        REG_SOURCE_ADDR: dma_source_addr <= s_axi_wdata;
                        REG_TARGET_ADDR: dma_target_addr <= s_axi_wdata;
                        REG_LENGTH:      dma_length      <= s_axi_wdata;  
                        REG_CONTROL:     dma_start       <= s_axi_wdata[0];
                        default: /* no-op */ ;
                    endcase

                    // Write response
                    s_axi_bvalid_r <= 1'b1;
                    s_axi_bresp_r  <= 2'b00;
                    write_state    <= WRITE_RESP;
                end

                WRITE_RESP: begin
                    if (s_axi_bready) begin
                        s_axi_bvalid_r <= 1'b0;
                        write_state    <= WRITE_IDLE;
                    end
                end
            endcase
        end
    end

    //============================================================================
    // AXI-Lite Read Logic
    //============================================================================
    always @(posedge aclk) begin
        if (!aresetn) begin
            read_state       <= READ_IDLE;
            s_axi_arready_r  <= 1'b0;
            s_axi_rvalid_r   <= 1'b0;
            s_axi_rdata_r    <= 32'h0;
            s_axi_rresp_r    <= 2'b00;
            read_addr        <= {C_S_AXI_ADDR_WIDTH{1'b0}};
        end 
        else begin
            case (read_state)
                READ_IDLE: begin
                    s_axi_rvalid_r <= 1'b0;
                    if (s_axi_arvalid && !s_axi_arready_r) begin
                        read_addr       <= s_axi_araddr;
                        s_axi_arready_r <= 1'b1;
                        read_state      <= READ_DATA;
                    end
                end

                READ_DATA: begin
                    s_axi_arready_r <= 1'b0;
                    
                    if (!s_axi_rvalid_r) begin
                        case (read_addr[4:0])
                            REG_SOURCE_ADDR: s_axi_rdata_r <= dma_source_addr;
                            REG_TARGET_ADDR: s_axi_rdata_r <= dma_target_addr;
                            REG_LENGTH:      s_axi_rdata_r <= dma_length;
                            REG_CONTROL:     s_axi_rdata_r <= {31'h0, dma_start};
                            REG_STATUS:      s_axi_rdata_r <= {30'h0, dma_status};
                            default:         s_axi_rdata_r <= 32'hDEADBEEF;
                        endcase
                        s_axi_rvalid_r <= 1'b1;
                        s_axi_rresp_r  <= 2'b00;
                    end
                    else if (s_axi_rready) begin
                        s_axi_rvalid_r <= 1'b0;
                        read_state     <= READ_IDLE;
                    end
                end
            endcase
        end
    end

    //----------------------------------------------------------------------------
    // Wire up AXI-Lite outputs
    //----------------------------------------------------------------------------
    assign s_axi_awready = s_axi_awready_r;
    assign s_axi_wready  = s_axi_wready_r;
    assign s_axi_bvalid  = s_axi_bvalid_r;
    assign s_axi_bresp   = s_axi_bresp_r;
    assign s_axi_arready = s_axi_arready_r;
    assign s_axi_rvalid  = s_axi_rvalid_r;
    assign s_axi_rdata   = s_axi_rdata_r;
    assign s_axi_rresp   = s_axi_rresp_r;

    //----------------------------------------------------------------------------
    // Wire up AXI Master outputs (read)
    //----------------------------------------------------------------------------
    assign m_axi_arvalid = m_axi_arvalid_r;
    assign m_axi_araddr  = m_axi_araddr_r;
    assign m_axi_arlen   = m_axi_arlen_r;
    assign m_axi_arsize  = m_axi_arsize_r;
    assign m_axi_arburst = m_axi_arburst_r;
    assign m_axi_arprot  = m_axi_arprot_r;
    assign m_axi_arcache = m_axi_arcache_r;
    assign m_axi_rready  = m_axi_rready_r;

    //----------------------------------------------------------------------------
    // Wire up AXI Master outputs (write)
    //----------------------------------------------------------------------------
    assign m_axi_awvalid = m_axi_awvalid_r;
    assign m_axi_awaddr  = m_axi_awaddr_r;
    assign m_axi_awlen   = m_axi_awlen_r;
    assign m_axi_awsize  = m_axi_awsize_r;
    assign m_axi_awburst = m_axi_awburst_r;
    assign m_axi_awprot  = m_axi_awprot_r;
    assign m_axi_awcache = m_axi_awcache_r;

    assign m_axi_wvalid  = m_axi_wvalid_r;
    assign m_axi_wdata   = m_axi_wdata_r;
    assign m_axi_wstrb   = m_axi_wstrb_r;
    assign m_axi_wlast   = m_axi_wlast_r;
    assign m_axi_bready  = m_axi_bready_r;

    //============================================================================
    // AXI Master Control FSM
    //============================================================================
    always @(posedge aclk) begin
        if (!aresetn) begin
            master_state         <= MASTER_IDLE;
            dma_busy             <= 1'b0;
            dma_status           <= 2'b00;  // idle
            transfer_count       <= 32'h0;
            is_final_burst       <= 1'b0;
            final_byte_count     <= 7'd0;
            burst_beat_count     <= 8'd0;
            is_last_beat         <= 1'b0;
            
            // Read channel
            m_axi_arvalid_r      <= 1'b0;
            m_axi_araddr_r       <= {C_M_AXI_ADDR_WIDTH{1'b0}};
            m_axi_arlen_r        <= 8'h0;
            m_axi_arsize_r       <= 3'b000; // default, will update below
            m_axi_arburst_r      <= 2'b01;  // INCR
            m_axi_arprot_r       <= 3'b000;
            m_axi_arcache_r      <= 4'b0011;
            m_axi_rready_r       <= 1'b0;

            // Write channel
            m_axi_awvalid_r      <= 1'b0;
            m_axi_awaddr_r       <= {C_M_AXI_ADDR_WIDTH{1'b0}};
            m_axi_awlen_r        <= 8'h0;
            m_axi_awsize_r       <= 3'b000; 
            m_axi_awburst_r      <= 2'b01;  // INCR
            m_axi_awprot_r       <= 3'b000;
            m_axi_awcache_r      <= 4'b0011;

            m_axi_wvalid_r       <= 1'b0;
            m_axi_wdata_r        <= {C_M_AXI_DATA_WIDTH{1'b0}};
            m_axi_wstrb_r        <= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
            m_axi_wlast_r        <= 1'b0;
            m_axi_bready_r       <= 1'b0;

            // BRAM signals
            bram_we              <= 1'b0;
            bram_addr            <= 10'd0;
            bram_din             <= 8'd0;

            rx_data_reg          <= {C_M_AXI_DATA_WIDTH{1'b0}};
            store_count          <= 7'd0;
            readout_count        <= 7'd0;
            bytes_in_current_burst <= 32'd0;
        end
        else begin
            case (master_state)
                //------------------------------------------------------------------
                // MASTER_IDLE: Wait for start from AXI-Lite register
                //------------------------------------------------------------------
                MASTER_IDLE: begin
                    // Reset some signals
                    m_axi_arvalid_r <= 1'b0;
                    m_axi_rready_r  <= 1'b0;
                    m_axi_awvalid_r <= 1'b0;
                    m_axi_wvalid_r  <= 1'b0;
                    m_axi_bready_r  <= 1'b0;
                    m_axi_wlast_r   <= 1'b0;

                    bram_we         <= 1'b0;
                    bram_addr       <= 10'd0;
                    store_count     <= 7'd0;
                    readout_count   <= 7'd0;
                    transfer_count  <= 32'd0;
                    is_final_burst  <= 1'b0;
                    
                    if (dma_start && !dma_busy) begin
                        dma_busy    <= 1'b1;
                        dma_status  <= 2'b01;  // busy
                        master_state <= MASTER_START;
                    end
                end

                //------------------------------------------------------------------
                // MASTER_START: Setup a read burst if data remains
                //------------------------------------------------------------------
                MASTER_START: begin
                    if (transfer_count < dma_length) begin
                        // Check if this is the final burst
                        is_final_burst <= ((dma_length - transfer_count) <= 
                                          (C_M_AXI_BURST_LEN * (C_M_AXI_DATA_WIDTH/8)));
                        
                        // Decide how many bytes to read in this burst:
                        if ((dma_length - transfer_count) >= 
                           (C_M_AXI_BURST_LEN * (C_M_AXI_DATA_WIDTH/8))) begin
                            m_axi_arlen_r  <= C_M_AXI_BURST_LEN - 1;
                            bytes_in_current_burst <= (C_M_AXI_BURST_LEN * (C_M_AXI_DATA_WIDTH/8));
                            final_byte_count <= 7'd63; // Use all bytes in the final beat
                        end 
                        else begin
                            // Calculate the number of full beats needed (round up)
                            if ((dma_length - transfer_count) % (C_M_AXI_DATA_WIDTH/8) == 0) begin
                                beats_reg = (dma_length - transfer_count) / (C_M_AXI_DATA_WIDTH/8);
                            end
                            else begin
                                beats_reg = ((dma_length - transfer_count) / (C_M_AXI_DATA_WIDTH/8)) + 1;
                            end
                            
                            // Ensure at least one beat
                            if (beats_reg == 0)
                                beats_reg = 1;
                                
                            m_axi_arlen_r <= beats_reg[7:0] - 1;
                            bytes_in_current_burst <= dma_length - transfer_count;
                            
                            // Calculate how many bytes we'll use in the final beat
                            final_byte_count <= ((dma_length - transfer_count) % (C_M_AXI_DATA_WIDTH/8) == 0) ? 
                                                7'd63 : // Use all bytes if perfectly aligned
                                                ((dma_length - transfer_count) % (C_M_AXI_DATA_WIDTH/8) - 1); // Otherwise partial
                        end

                        // Setup read address
                        m_axi_araddr_r  <= dma_source_addr + transfer_count;
                        // For 512 bits = 64 bytes > size = 6 (2^6 = 64)
                        m_axi_arsize_r  <= 3'b110;
                        m_axi_arvalid_r <= 1'b1;
                        m_axi_rready_r  <= 1'b1;
                        master_state    <= MASTER_AR;
                    end
                    else begin
                        // No more data to process
                        dma_busy      <= 1'b0;
                        dma_status    <= 2'b10; // complete
                        master_state  <= MASTER_IDLE;
                    end
                end

                //------------------------------------------------------------------
                // MASTER_AR: Wait for AR handshake
                //------------------------------------------------------------------
                MASTER_AR: begin
                    if (m_axi_arready && m_axi_arvalid_r) begin
                        m_axi_arvalid_r <= 1'b0;
                        // Move to read data phase
                        master_state    <= MASTER_RDATA;
                    end
                end

                //------------------------------------------------------------------
                // MASTER_RDATA: Collect each 512-bit read data
                //------------------------------------------------------------------
                MASTER_RDATA: begin
                    if (m_axi_rvalid && m_axi_rready_r) begin
                        // Latch the AXI read data
                        rx_data_reg <= m_axi_rdata;

                        // If it's the last beat in this burst, then we'll store
                        if (m_axi_rlast) begin
                            m_axi_rready_r <= 1'b0;  
                            master_state   <= MASTER_STORE;
                            store_count    <= 7'd0;
                            // We'll store 64 bytes from rx_data_reg next cycle
                        end
                        else begin
                          // In multi-beat scenario, for simplicity, we do it beat by beat.
                          // If you want to store each beat as we go, you'd add logic here.
                        end
                    end
                end

                //------------------------------------------------------------------
                // MASTER_STORE: store 64 bytes into the single-port BRAM over 64 cycles
                //------------------------------------------------------------------
                MASTER_STORE: begin
                    // Single-port means we do 1 byte per cycle
                    bram_addr <= store_count;  // store_count from 0..63
                    
                    // Add 1 to each byte (memset + 1 operation)
                    bram_din  <= rx_data_reg[8*store_count +: 8] + 8'h01;
                    bram_we   <= 1'b1;  // write enable

                    store_count <= store_count + 1'b1;

                    if (store_count == 63) begin
                        // Done storing this 512-bit beat
                        bram_we       <= 1'b0;
                        master_state  <= MASTER_INC_DONE;
                    end
                end

                //------------------------------------------------------------------
                // MASTER_INC_DONE: finalize increment; setup write address phase
                //------------------------------------------------------------------
                MASTER_INC_DONE: begin
                    // Next, set up write address
                    m_axi_awvalid_r <= 1'b1;
                    m_axi_awaddr_r  <= dma_target_addr + transfer_count;
                    // Use same burst length/size as read
                    m_axi_awlen_r   <= m_axi_arlen_r; 
                    m_axi_awsize_r  <= 3'b110;
                    master_state    <= MASTER_AW;
                    readout_count   <= 7'd0;
                    burst_beat_count <= 8'd0;
                    
                    // Initialize wdata to 0 for cleaner partial updates
                    m_axi_wdata_r <= {C_M_AXI_DATA_WIDTH{1'b0}};
                    
                    // Calculate write strobes for final beat if this is final burst
                    if (is_final_burst && m_axi_arlen_r == 0) begin
                        // For the final burst with a single beat, we need to set strobes correctly
                        // for partial bytes
                        for (i = 0; i < (C_M_AXI_DATA_WIDTH/8); i = i + 1) begin
                            m_axi_wstrb_r[i] <= (i <= final_byte_count) ? 1'b1 : 1'b0;
                        end
                    end
                    else begin
                        // Full beat - all bytes valid
                        m_axi_wstrb_r <= {(C_M_AXI_DATA_WIDTH/8){1'b1}};
                    end
                end
                
                //------------------------------------------------------------------
                // MASTER_AW: Wait for AW handshake
                //------------------------------------------------------------------
                MASTER_AW: begin
                    if (m_axi_awready && m_axi_awvalid_r) begin
                        m_axi_awvalid_r <= 1'b0;
                        master_state <= MASTER_READOUT;
                        readout_count <= 7'd0;
                    end
                end
                
                //------------------------------------------------------------------
                // MASTER_READOUT: Start reading from BRAM for write data
                //------------------------------------------------------------------
                MASTER_READOUT: begin
                    bram_we <= 1'b0;
                    bram_addr <= 7'd0;
                    master_state <= MASTER_READOUT1;
                end
                
                //------------------------------------------------------------------
                // MASTER_READOUT1: Wait one cycle for first byte, start collecting data
                //------------------------------------------------------------------
                MASTER_READOUT1: begin
                    m_axi_wdata_r[7:0] <= bram_dout;
                    bram_addr <= 7'd1;
                    readout_count <= 7'd1;
                    master_state <= MASTER_READOUT2;
                end
                
                //------------------------------------------------------------------
                // MASTER_READOUT2: Read and collect bytes from BRAM into AXI data word
                //------------------------------------------------------------------
                MASTER_READOUT2: begin
                    m_axi_wdata_r[8*readout_count +: 8] <= bram_dout;
                    
                    if (readout_count < 7'd63) begin
                        bram_addr <= readout_count + 7'd1;
                        readout_count <= readout_count + 7'd1;
                    end
                    else begin
                        // All 64 bytes collected, prepare for write
                        master_state <= MASTER_READOUT3;
                        m_axi_wvalid_r <= 1'b1;
                        
                        // Set wlast if this is the last beat in burst (or only beat)
                        if (burst_beat_count == m_axi_awlen_r) begin
                            m_axi_wlast_r <= 1'b1;
                        end
                    end
                end
                
                //------------------------------------------------------------------
                // MASTER_READOUT3: Send AXI write data and handle response
                //------------------------------------------------------------------
                MASTER_READOUT3: begin
                    if (m_axi_wready && m_axi_wvalid_r) begin
                        // Data accepted by slave
                        if (m_axi_wlast_r) begin
                            // This was the final beat, move to response
                            m_axi_wvalid_r <= 1'b0;
                            m_axi_wlast_r <= 1'b0;
                            m_axi_bready_r <= 1'b1;
                            
                            // Wait for write response
                            if (m_axi_bvalid && m_axi_bready_r) begin
                                m_axi_bready_r <= 1'b0;
                                
                                // Update transfer count and continue
                                transfer_count <= transfer_count + bytes_in_current_burst;
                                master_state <= MASTER_START;
                            end
                        end
                        else begin
                            // More beats to send in burst
                            m_axi_wvalid_r <= 1'b0;
                            burst_beat_count <= burst_beat_count + 8'd1;
                            
                            // Check if next beat is the last in burst
                            if (burst_beat_count + 8'd1 == m_axi_awlen_r) begin
                                is_last_beat <= 1'b1;
                            end
                            
                            // Reset for next beat
                            readout_count <= 7'd0;
                            master_state <= MASTER_READOUT;
                        end
                    end
                end
            endcase
        end
    end
endmodule