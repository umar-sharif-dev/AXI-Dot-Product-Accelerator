module d_ff (
    input logic clk,      // Clock input
    input logic rst,      // Reset input
    input logic clr,      // Clear input
    input logic en,       // Enable input
    input logic d,        // Data input
    output logic q        // Output
);

    always_ff @(posedge clk) begin
        if (rst) 
            q <= 0;     // Reset the register (set output to zero)
        else if (clr)
            q <= 0;     // clear output 
        else if (en)    
            q <= d;     // take in input 
    end

endmodule
