module regn #(parameter N = 16) (
    input logic clk,                  // Clock input
    input logic rst,                  // Reset input
    input logic clr,                  // clear 
    input logic en,                   // enable
    input logic [N-1:0] d,            // Data input (N-bit vector)
    output logic [N-1:0] q            // Output (N-bit vector)
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
