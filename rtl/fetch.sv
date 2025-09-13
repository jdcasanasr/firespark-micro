module fetch
#(
    // ToDo: Look for a better name for this in the RISC-V spec.
    parameter INSTRUCTION_SIZE          = 32,
    parameter INSTRUCTION_CACHE_DEPTH   = 32
)
(
    input   logic clock_i,
    input   logic reset_ni,

    output  logic [INSTRUCTION_SIZE - 1:0] instruction_o
);

    logic [$clog2(INSTRUCTION_CACHE_DEPTH) - 1:0] program_counter_r;
    logic [INSTRUCTION_SIZE - 1:0] instruction_cache_r [INSTRUCTION_CACHE_DEPTH - 1:0];

    // Note: Simulation only.
    `ifdef SIMULATION
    initial
        $readmemh("instruction_cache_32.hex", instruction_cache_r);
    `endif

    // ToDo: How and why PC counts in fours?
    // Handle program_counter_r logic (in reality, it counts in fours).
    always_ff @ (posedge clock_i, negedge reset_ni)
        if (!reset_ni)
            program_counter_r <= '0;

        else
            program_counter_r <= program_counter_r + 'd1;

    // Reads are handled combinationally.
    // Can I actually connect a FF directly into instruction_cache_r's read port?
    always_comb
        instruction_o = instruction_cache_r [program_counter_r];

endmodule