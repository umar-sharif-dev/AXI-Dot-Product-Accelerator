module counter #(parameter N = 2) (
    input logic clk,            // Clock input
    input logic rst,            // Reset input
    input logic ld,             // Load input
    input logic en,             // Enable input
    input logic [N-1:0] d,      // Data input (N-bit vector)
    output logic [N-1:0] q      // Output (N-bit vector)
);

    // Internal signal for the count register
    logic [N-1:0] count;

    always_ff @(posedge clk) begin
        if (rst) begin
            count <= 0;  // Reset the counter
        end else if (ld) begin
            count <= 0;    // Load value from d into count
        end else if (en) begin
            count <= count + 1;  // Increment counter if enabled
        end
    end

    // Output the current count value
    assign q = count;

endmodule
