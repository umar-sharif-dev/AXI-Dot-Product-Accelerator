`timescale 1ns/1ps
module top_dot_product_engine (
    input  logic         clk,
    input  logic         rst,
    input  logic         rstn,
    input  logic [2:0]   data_type,
    input  logic         A_valid,
    input  logic [255:0] A_data,
    input  logic [4095:0] x_vector,

    output logic [31:0]  y_out,
    output logic         done,

    // Debug ports for ILA
    output logic [31:0]  A_debug,
    output logic         A_valid_debug,
    output logic [31:0]  prod_debug,
    output logic         prod_valid_debug,
    output logic [31:0]  sum_stage0_debug,
    output logic         valid_stage0_debug,
    output logic [31:0]  sum_stage1_debug,
    output logic         valid_stage1_debug,
    output logic [31:0]  sum_stage2_debug,
    output logic         valid_stage2_debug,
    output logic [31:0]  sum_stage3_debug,
    output logic         valid_stage3_debug,
    output logic [31:0]  sum_stage4_debug,
    output logic         valid_stage4_debug,
    output logic [31:0]  sum_stage5_debug,
    output logic         valid_stage5_debug,
    output logic [31:0]  sum_stage6_debug,
    output logic         valid_stage6_debug
);

    localparam MAX_N = 128;

    // BRAMs for x_vector
    logic [31:0] x_vector_unpacked [0:MAX_N-1];
    
    genvar i;
    generate
        for (i = 0; i < MAX_N; i++) begin : GEN_X_BRAMS
            block_ram #(
                .ADDR_WIDTH(4),
                .DATA_WIDTH(32)
            ) bram_inst (
                .clk   (clk),
                .addr  (x_wr_addr),
                .wr_en (1'b1),  
                .din   (x_vector[(i+1)*32-1 -: 32]),
                .dout  (x_vector_unpacked[i])
            );
        end
    endgenerate

   
    // Dot Product Engine
    dot_product_engine #(
        //.MAX_N(MAX_N),
        .DATA_WIDTH(32)
    ) dpe_inst (
        .clk         (clk),
        .rstn        (rstn),
        .data_type   (data_type),
        .start       (A_valid),
        .A_data      (A_data),
        .x_vector    (x_vector_unpacked),
        .y_out       (y_out),
        .done        (done),

        // Debug outputs
        .A_debug            (A_debug),
        .A_valid_debug      (A_valid_debug),
        .prod_debug         (prod_debug),
        .prod_valid_debug   (prod_valid_debug),
        .sum_stage0_debug   (sum_stage0_debug),
        .valid_stage0_debug (valid_stage0_debug),
        .sum_stage1_debug   (sum_stage1_debug),
        .valid_stage1_debug (valid_stage1_debug),
        .sum_stage2_debug   (sum_stage2_debug),
        .valid_stage2_debug (valid_stage2_debug),
        .sum_stage3_debug   (sum_stage3_debug),
        .valid_stage3_debug (valid_stage3_debug),
        .sum_stage4_debug   (sum_stage4_debug),
        .valid_stage4_debug (valid_stage4_debug),
        .sum_stage5_debug   (sum_stage5_debug),
        .valid_stage5_debug (valid_stage5_debug),
        .sum_stage6_debug  (sum_stage6_debug),
        .valid_stage6_debug(valid_stage6_debug)
        
);

endmodule
