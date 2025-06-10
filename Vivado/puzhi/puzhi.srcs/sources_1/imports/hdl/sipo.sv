module sipo #(
    parameter int N = 8,    // Input word width (fixed to 8 bits)
    parameter int M = 64    // Number of shifts (N * M = 512 bits)
)(
    input  logic              clk,
    input  logic              rst,
    input  logic              en,
    input  logic [N-1:0]      din,
    output logic [N*M-1:0]    dout
);

    logic [N*M-1:0] shift_reg;

    always_ff @(posedge clk or posedge rst) begin
        if (rst) begin
            shift_reg <= '0;
        end else if (en) begin
            shift_reg <= {shift_reg[N*M-N-1:0], din};
        end
    end

    assign dout = shift_reg;

endmodule

