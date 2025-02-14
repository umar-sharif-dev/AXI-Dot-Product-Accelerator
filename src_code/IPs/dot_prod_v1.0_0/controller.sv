`timescale 1 ns / 1 ps

module controller (
    input logic clk,                // Clock signal
    input logic reset,              // Reset signal
    input logic start,              // Start signal to initiate computation
    input logic zi,                 // Done signal from dot_product_accel
    input logic vector_valid,       // Signal to identify when data is valid
    output logic en_sum,            // Enable Sum output
    output logic ldi,               // Load counter i
    output reg compute,             // Compute signal to trigger dot product computation
    output reg done                 // Done signal to indicate completion
);

    // FSM states
    typedef enum logic [1:0] {
        IDLE = 2'b00,       // Idle state
        COMPUTE = 2'b01,    // Compute dot product
        DONE = 2'b10        // Done state
    } state_t;

    // FSM state
    state_t state; // Only use one state

    // FSM logic to transition between states
    always_ff @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE; // Reset to IDLE state
        end else begin
            case (state)
                IDLE: begin
                    if (start) state <= COMPUTE;  // Transition to COMPUTE state on start signal
                    else state <= IDLE;           // Stay in IDLE if no start
                end

                COMPUTE: begin
                    if (zi) state <= DONE;       // Transition to DONE state when zi is asserted
                    else state <= COMPUTE;       // Stay in COMPUTE if zi is not asserted
                end

                DONE: begin
                    state <= IDLE;               // Transition to IDLE state after computation is done
                end

                default: state <= IDLE;          // Default case to avoid unknown states
            endcase
        end
    end

    // Output logic based on state
    assign ldi = (state == IDLE) || (state == DONE);
    assign en_sum = ((state == COMPUTE) && vector_valid);
    assign compute = ((state == COMPUTE) && vector_valid);
    assign done = (state == DONE);

endmodule
