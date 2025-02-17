`timescale 1 ns / 1 ps

//------------------------------------------------------------------------------
// Title: Testbench for AXI Master Interface and Dot Product Module
// Author: Malik Umar Sharif
// Date: 14-Feb-2025
// Version: 1.0
// Description: 
// This testbench provides test vectors to the AXI Master interface, which then
// forwards the data to the dot product module. The output of the module is monitored,
// and the accumulated sum result is verified to match the expected value of 1398144.
//------------------------------------------------------------------------------

module testbench;

    // Parameters
    parameter clk_period = 10; // Clock period for 100 MHz (100 MHz = 10 ns period)
    
    parameter REG0_ADDR = 5'd0;     // Control Register
    parameter REG1_ADDR = 5'd4;     // Vector A Base Address
    parameter REG2_ADDR = 5'd8;     // Vector B Base Address
    parameter REG3_ADDR = 5'd12;    // Vector Length
    parameter REG4_ADDR = 5'd16;    // Output Address  
    parameter REG5_ADDR = 5'd20;    // Status Register
    
    parameter EXPECTED_RESULT = 32'd1398144;  // Use case for 256 values for vector A an B, starting from 0 to 255
    
    // Testbench signals
    reg clk;
    reg rstn;
    wire done;
    wire error;
    wire [31:0] result; // Output result of dot product computation

    // AXI-Lite signals
    reg [4:0] S00_AXI_araddr;
    reg [2:0] S00_AXI_arprot;
    reg S00_AXI_arvalid;
    wire S00_AXI_arready;
    reg [4:0] S00_AXI_awaddr;
    reg [2:0] S00_AXI_awprot;
    reg S00_AXI_awvalid;
    wire S00_AXI_awready;
    reg S00_AXI_bready;
    wire [1:0] S00_AXI_bresp;
    wire S00_AXI_bvalid;
    wire [31:0] S00_AXI_rdata;
    reg S00_AXI_rready;
    wire [1:0] S00_AXI_rresp;
    wire S00_AXI_rvalid;
    reg [31:0] S00_AXI_wdata;
    wire S00_AXI_wready;
    reg [3:0] S00_AXI_wstrb;
    reg S00_AXI_wvalid;

    // Instantiate the DUT (Device Under Test)
    design_1_wrapper dut (
        .clk(clk),
        .done(done),
        .error(error),
        .rstn(rstn),
        .result(result), 
        // AXI-lite signals
        .S00_AXI_araddr(S00_AXI_araddr),
        .S00_AXI_arprot(S00_AXI_arprot),
        .S00_AXI_arready(S00_AXI_arready),
        .S00_AXI_arvalid(S00_AXI_arvalid),
        .S00_AXI_awaddr(S00_AXI_awaddr),
        .S00_AXI_awprot(S00_AXI_awprot),
        .S00_AXI_awready(S00_AXI_awready),
        .S00_AXI_awvalid(S00_AXI_awvalid),
        .S00_AXI_bready(S00_AXI_bready),
        .S00_AXI_bresp(S00_AXI_bresp),
        .S00_AXI_bvalid(S00_AXI_bvalid),
        .S00_AXI_rdata(S00_AXI_rdata),
        .S00_AXI_rready(S00_AXI_rready),
        .S00_AXI_rresp(S00_AXI_rresp),
        .S00_AXI_rvalid(S00_AXI_rvalid),
        .S00_AXI_wdata(S00_AXI_wdata),
        .S00_AXI_wready(S00_AXI_wready),
        .S00_AXI_wstrb(S00_AXI_wstrb),
        .S00_AXI_wvalid(S00_AXI_wvalid)
    );

    //------------------------------------------------------------------------------
    // Clock generation
    // This always block generates a 100 MHz clock by toggling every 5 ns (half-period)
    //------------------------------------------------------------------------------
    always #(clk_period / 2) clk = ~clk;
    
    //------------------------------------------------------------------------------
    // Stimulus generation
    // This block initializes the signals, applies reset, and starts the transaction
    //------------------------------------------------------------------------------
    initial begin
        // Initialize signals
        clk = 0;
        rstn = 0;
        // Reset AXI-lite signals
        S00_AXI_araddr = 0;
        S00_AXI_arprot = 0;
        S00_AXI_arvalid = 0;
        S00_AXI_awaddr = 0;
        S00_AXI_awprot = 0;
        S00_AXI_awvalid = 0;
        S00_AXI_wdata = 0;
        S00_AXI_wstrb = 0;
        S00_AXI_wvalid = 0;
        S00_AXI_rready = 0;
        S00_AXI_bready = 0;
    
        // Apply reset sequence
        #20 rstn = 1;  // Release reset after 20 ns
        #10 rstn = 0;  // Reassert reset for 10 ns
        #10 rstn = 1;  // Release reset
        
        // Write to AXI Lite Registers
        #10;
        S00_AXI_awaddr = REG0_ADDR;  // Start register
        S00_AXI_wdata = 32'd1;
        S00_AXI_wstrb = 4'b1111;
        S00_AXI_awvalid = 1;
        S00_AXI_wvalid = 1;
        #20;
        S00_AXI_awvalid = 0;
        S00_AXI_wvalid = 0;

        #10;
        S00_AXI_awaddr = REG1_ADDR;  // vec_a_base_addr
        S00_AXI_wdata = 32'hC000_0000;
        S00_AXI_awvalid = 1;
        S00_AXI_wvalid = 1;
        #20;
        S00_AXI_awvalid = 0;
        S00_AXI_wvalid = 0;

        #10;
        S00_AXI_awaddr = REG2_ADDR;  // vec_b_base_addr
        S00_AXI_wdata = 32'hD000_0000;
        S00_AXI_awvalid = 1;
        S00_AXI_wvalid = 1;
        #20;
        S00_AXI_awvalid = 0;
        S00_AXI_wvalid = 0;
        
        #10;
        S00_AXI_awaddr = REG3_ADDR; // vector_len
        S00_AXI_wdata = 32'd256;
        S00_AXI_awvalid = 1;
        S00_AXI_wvalid = 1;
        #20;
        S00_AXI_awvalid = 0;
        S00_AXI_wvalid = 0;       
        
        // Read Back Values
        #10;
        S00_AXI_araddr = REG1_ADDR;  // vec_a_base_addr read back
        S00_AXI_arvalid = 1;
        #20;
        S00_AXI_arvalid = 0;
        $display("Read vec_a_base_addr: %h", S00_AXI_rdata);
        
        #10;
        S00_AXI_araddr = REG2_ADDR;  // vec_b_base_addr read back
        S00_AXI_arvalid = 1;
        #20;
        S00_AXI_arvalid = 0;
        $display("Read vec_a_base_addr: %h", S00_AXI_rdata);        

        #10;
        S00_AXI_araddr = REG3_ADDR;  // vector length read back
        S00_AXI_arvalid = 1;
        #10;
        S00_AXI_arvalid = 0;
        
        // Wait for computation to complete
        wait (done);
        
        #10
        S00_AXI_araddr = REG4_ADDR;  // result read back
        S00_AXI_arvalid = 1;
        #10;
        S00_AXI_arvalid = 0;
    
        # 50
        // Check the computed result against the expected value (Use case for 256 values, starting from 0 to 255)
        if (result == EXPECTED_RESULT) 
            $display("Test Passed: Expected accumulated sum = %d, Actual accumulated sum = %d ", EXPECTED_RESULT, signed'(S00_AXI_rdata));
        else
            $display("Test Failed: Expected %d, but got %d", EXPECTED_RESULT, result);
        
        // End simulation after some time
        $finish;
    end

endmodule
