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

// Testbench signals
reg clk;
reg rstn;
reg start;
wire done;
wire error;
reg [31:0] vector_len;
wire [31:0] result; // Output result of dot product computation

// Instantiate the design under test (DUT)
design_1_wrapper uut (
    .clk(clk),
    .done(done),
    .error(error),
    .rstn(rstn),
    .start(start),
    .vector_len(vector_len),
    .result(result) // Assuming result is an output from the module
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
    start = 0;
    vector_len = 256;

    // Apply reset sequence
    #20 rstn = 1;  // Release reset after 20 ns
    #10 rstn = 0;  // Reassert reset for 10 ns
    #10 rstn = 1;  // Release reset

    // Apply start signal to begin transaction
    #50 start = 1;  // Start the transaction after 50 ns
    #20 start = 0;  // Stop the transaction after 20 ns
    
    // Wait for computation to complete
    wait (done);

    // Check the computed result against the expected value
    if (result == 1398144) 
        $display("Test Passed: Expected accumulated sum = 1398144, Actual accumulated sum = %d ", result);
    else
        $display("Test Failed: Expected 1398144, but got %d", result);
    
    // End simulation after some time
    $finish;
end

//------------------------------------------------------------------------------
// Monitor outputs
// This block continuously monitors key signals and prints their state
//------------------------------------------------------------------------------
initial begin
    $monitor("Time = %0t, clk = %b, rstn = %b, start = %b, done = %b, error = %b, result = %d", 
             $time, clk, rstn, start, done, error, result);
end

endmodule
