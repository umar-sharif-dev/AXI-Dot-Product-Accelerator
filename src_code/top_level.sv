`timescale 1 ns / 1 ps

module dot_prod (
    input logic clk,                       // Clock signal
    input logic rstn,                      // Active low reset
    input logic writes_done,               
    input logic reads_done, 
    input logic vector_valid,              
    input logic signed [7:0] vector_a_in,  // Single element of Vector A
    input logic signed [7:0] vector_b_in,  // Single element of Vector B
    input logic [31:0] vector_len,         // Total number of elements (N)
    output logic signed [31:0] result,     // Final dot product result
    output logic done                      // Completion flag
);

    // Internal wires for communication between dot_product_accel and controller
    logic writes_done_ff1;
    logic start;
    logic en_sum;
    logic compute;                         // Compute signal from controller
    logic ldi;
    logic zi;                              // Done signal from dot_product_accel
    logic reset;
    
    assign reset = !rstn;

    // Instantiate the controller module
    controller u_controller (
        .clk(clk), 
        .reset(reset),
        .vector_valid(vector_valid),
        .en_sum(en_sum), 
        .start(start), 
        .zi(zi), 
        .ldi(ldi),
        .compute(compute), 
        .done(done)
    );

    // Instantiate the dot_product_accel module
    dot_product_accel u_dot_product_accel (
        .clk(clk), 
        .reset(reset), 
        .ldi(ldi),
        .compute(compute), 
        .en_sum(en_sum),
        .vector_a_in(vector_a_in), 
        .vector_b_in(vector_b_in), 
        .vector_len(vector_len), 
        .result(result), 
        .zi(zi)
    );

    regn #(1) writes_done_ff1_inst (.clk(clk), .rst(reset), .clr(1'b0), .en(1'b1), .d(writes_done), .q(writes_done_ff1));

    assign start = (writes_done && !writes_done_ff1); 
        

endmodule
