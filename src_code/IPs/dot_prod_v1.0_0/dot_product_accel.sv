`timescale 1 ns / 1 ps

module dot_product_accel (
    input logic clk,                         // Clock signal
    input logic reset,                       // Reset signal
    input logic ldi,                         // Load counter i signal
    input logic compute,                     // Compute start signal
    input logic en_sum,                      // Enable Sum register
    input logic signed [7:0] vector_a_in,    // Single element of Vector A
    input logic signed [7:0] vector_b_in,    // Single element of Vector B
    input logic [31:0] vector_len,           // Total number of elements (N)
    output reg signed [31:0] result,        // Final dot product result
    output reg zi                           // completion flag
);

    // Internal signals
    logic [31:0] cntr_i;                   // Counter output for indexing
    logic signed [15:0] product;           // Intermediate multiplication result
    logic signed [31:0] sum_out;           // Register output for sum accumulation
    logic signed [31:0] sum_in;             // Register input for sum accumulation

    // Counter instance to track vector element processing
    counter #(32) index_counter (.clk(clk), .rst(reset), .ld(ldi), .en(compute), .d(0), .q(cntr_i));
    assign zi = (cntr_i == (vector_len-1)); 
    
    // Signed multiplication
    assign product = vector_a_in * vector_b_in;  // 8-bit x 8-bit = 16-bit multiplication
    
    // Register instance for sum accumulation
    regn #(32) sum_register (.clk(clk), .rst(reset), .clr(1'b0), .en(en_sum), .d(sum_in), .q(sum_out) );
    assign sum_in = sum_out + product;

    regn #(32) result_register (.clk(clk), .rst(reset), .clr(1'b0), .en(zi), .d(sum_out), .q(result));
    
endmodule
